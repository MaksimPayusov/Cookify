begin;

create table public.recipes (
    id text primary key,
    author_id uuid references auth.users(id) on delete set null,
    title text not null check (char_length(btrim(title)) between 1 and 120),
    description text not null check (char_length(btrim(description)) between 1 and 500),
    image_url text,
    cover_path text,
    calories numeric not null check (calories between 0 and 100000),
    protein numeric not null check (protein between 0 and 100000),
    fat numeric not null check (fat between 0 and 100000),
    carbs numeric not null check (carbs between 0 and 100000),
    cook_minutes integer not null check (cook_minutes between 1 and 1499),
    display_tags text[] not null,
    filters jsonb not null check (jsonb_typeof(filters) = 'object'),
    rating numeric not null default 0 check (rating between 0 and 5),
    rating_count integer not null default 0 check (rating_count >= 0),
    fingerprint text not null unique,
    created_at timestamptz not null default now(),
    check (num_nonnulls(image_url, cover_path) = 1)
);

create index recipes_created_idx on public.recipes (created_at desc, id);
create index recipes_author_idx on public.recipes (author_id);

create table public.recipe_ingredients (
    recipe_id text not null references public.recipes(id) on delete cascade,
    position integer not null check (position > 0),
    name text not null check (char_length(btrim(name)) between 1 and 120),
    amount text check (char_length(amount) <= 40),
    unit text check (char_length(unit) <= 40),
    primary key (recipe_id, position)
);

create table public.recipe_steps (
    recipe_id text not null references public.recipes(id) on delete cascade,
    position integer not null check (position > 0),
    instruction text not null check (char_length(btrim(instruction)) between 1 and 2500),
    timer_seconds integer not null check (timer_seconds between 0 and 86400),
    tip text check (char_length(tip) <= 1000),
    warning text check (char_length(warning) <= 1000),
    image_url text,
    primary key (recipe_id, position)
);

create table public.favorites (
    user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
    recipe_id text not null references public.recipes(id) on delete cascade,
    created_at timestamptz not null default now(),
    primary key (user_id, recipe_id)
);

create index favorites_recipe_idx on public.favorites (recipe_id);

alter table public.recipes enable row level security;
alter table public.recipe_ingredients enable row level security;
alter table public.recipe_steps enable row level security;
alter table public.favorites enable row level security;

revoke all on public.recipes, public.recipe_ingredients, public.recipe_steps, public.favorites
    from public, anon, authenticated;
grant select on public.recipes, public.recipe_ingredients, public.recipe_steps to anon, authenticated;
grant select, insert, delete on public.favorites to authenticated;

create policy "Read published recipes" on public.recipes for select to anon, authenticated using (true);
create policy "Read recipe ingredients" on public.recipe_ingredients for select to anon, authenticated using (true);
create policy "Read recipe steps" on public.recipe_steps for select to anon, authenticated using (true);
create policy "Read own favorites" on public.favorites for select to authenticated using ((select auth.uid()) = user_id);
create policy "Add own favorites" on public.favorites for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Remove own favorites" on public.favorites for delete to authenticated using ((select auth.uid()) = user_id);

create function public.recipe_fingerprint(title text, ingredients jsonb, filters jsonb)
returns text
language sql
immutable
set search_path = ''
as $$
    select pg_catalog.md5(pg_catalog.jsonb_build_array(
        lower(btrim(title)),
        (select array_agg(distinct lower(btrim(item->>'name')) order by lower(btrim(item->>'name')))
            from pg_catalog.jsonb_array_elements(ingredients) as ingredient(item)),
        (select array_agg(distinct tag order by tag)
            from pg_catalog.jsonb_each(filters) as category
            cross join lateral pg_catalog.jsonb_array_elements_text(category.value) as tags(tag))
    )::text);
$$;

revoke all on function public.recipe_fingerprint(text, jsonb, jsonb) from public, anon, authenticated;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('cookify-images', 'cookify-images', true, 4194304, array['image/png', 'image/jpeg', 'image/webp', 'image/gif']);

create policy "Read own Cookify image metadata" on storage.objects for select to authenticated
    using (bucket_id = 'cookify-images' and (storage.foldername(name))[1] = (select auth.uid())::text);
create policy "Upload personal Cookify images" on storage.objects for insert to authenticated
    with check (bucket_id = 'cookify-images' and (storage.foldername(name))[1] = (select auth.uid())::text);
create policy "Replace personal Cookify images" on storage.objects for update to authenticated
    using (bucket_id = 'cookify-images' and (storage.foldername(name))[1] = (select auth.uid())::text)
    with check (bucket_id = 'cookify-images' and (storage.foldername(name))[1] = (select auth.uid())::text);

create function public.publish_recipe(recipe_id uuid, payload jsonb)
returns text
language plpgsql
security definer
set search_path = ''
as $$
declare
    author uuid := auth.uid();
    recipe_key text := recipe_id::text;
    ingredient_list jsonb := payload->'ingredients';
    step_list jsonb := payload->'steps';
    recipe_filters jsonb := payload->'filters';
    object_path text := author::text || '/' || recipe_key;
    inserted_id text;
begin
    if author is null then
        raise exception 'Authentication required' using errcode = '42501';
    end if;
    if recipe_key is null then
        raise exception 'Recipe ID is required' using errcode = '22023';
    end if;

    if exists (select 1 from public.recipes r where r.id = recipe_key and r.author_id = author) then
        return recipe_key;
    end if;

    if jsonb_typeof(ingredient_list) is distinct from 'array'
        or jsonb_typeof(step_list) is distinct from 'array'
        or jsonb_typeof(recipe_filters) is distinct from 'object'
        or jsonb_typeof(payload->'displayTags') is distinct from 'array' then
        raise exception 'Invalid recipe structure' using errcode = '22023';
    end if;
    if jsonb_array_length(ingredient_list) not between 3 and 60
        or jsonb_array_length(step_list) not between 3 and 40
        or jsonb_array_length(payload->'displayTags') not between 1 and 20
        or exists (
            select 1 from jsonb_each(recipe_filters) as category
            where category.key not in ('mealType', 'occasions', 'health', 'cuisine', 'taste')
                or jsonb_typeof(category.value) <> 'array'
        ) then
        raise exception 'Invalid ingredients, steps, or tags' using errcode = '22023';
    end if;

    if not exists (select 1 from storage.objects where bucket_id = 'cookify-images' and name = object_path) then
        raise exception 'Upload the recipe cover first' using errcode = '22023';
    end if;

    insert into public.recipes (
        id, author_id, title, description, cover_path, calories, protein, fat, carbs,
        cook_minutes, display_tags, filters, fingerprint
    ) values (
        recipe_key, author, btrim(payload->>'title'), btrim(payload->>'description'), object_path,
        (payload->>'calories')::numeric, (payload->>'protein')::numeric,
        (payload->>'fat')::numeric, (payload->>'carbs')::numeric, (payload->>'cookTime')::integer,
        array(select jsonb_array_elements_text(payload->'displayTags')), recipe_filters,
        public.recipe_fingerprint(payload->>'title', ingredient_list, recipe_filters)
    )
    on conflict (id) do nothing returning id into inserted_id;

    if inserted_id is null then
        if exists (select 1 from public.recipes r where r.id = recipe_key and r.author_id = author) then
            return recipe_key;
        end if;
        raise exception 'Recipe ID is already in use' using errcode = '42501';
    end if;

    insert into public.recipe_ingredients (recipe_id, position, name, amount, unit)
    select recipe_key, position, btrim(item->>'name'), nullif(btrim(item->>'amount'), ''), nullif(btrim(item->>'unit'), '')
    from jsonb_array_elements(ingredient_list) with ordinality as ingredient(item, position);

    insert into public.recipe_steps (recipe_id, position, instruction, timer_seconds, tip, warning)
    select recipe_key, position, btrim(item->>'text'), (item->>'timerSeconds')::integer,
        nullif(btrim(item->>'tip'), ''), nullif(btrim(item->>'warning'), '')
    from jsonb_array_elements(step_list) with ordinality as step(item, position);

    return recipe_key;
end;
$$;

revoke all on function public.publish_recipe(uuid, jsonb) from public, anon, authenticated;
grant execute on function public.publish_recipe(uuid, jsonb) to authenticated;

commit;
