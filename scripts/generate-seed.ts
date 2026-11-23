import { writeFile } from 'node:fs/promises'
import { recipes } from '../src/data/recipes'
import { getRecipeSteps } from '../src/data/recipeSteps'

const catalog = recipes.map((recipe) => ({
    ...recipe,
    steps: recipe.id === '1' ? getRecipeSteps(recipe) : recipe.steps ?? [],
}))

const sql = `-- Сгенерировано командой npm run seed:generate.
begin;

create temporary table catalog_seed on commit drop as
select item as recipe
from jsonb_array_elements($cookify_seed$${JSON.stringify(catalog, null, 2)}$cookify_seed$::jsonb) as seed(item);

insert into public.recipes (
    id, title, description, image_url, calories, protein, fat, carbs,
    cook_minutes, display_tags, filters, rating, rating_count, fingerprint, created_at
)
select recipe->>'id', recipe->>'title', recipe->>'description', recipe->>'image',
    (recipe->>'calories')::numeric, (recipe->>'protein')::numeric,
    (recipe->>'fat')::numeric, (recipe->>'carbs')::numeric, (recipe->>'cookTime')::integer,
    array(select jsonb_array_elements_text(recipe->'displayTags')), recipe->'filters',
    (recipe->>'rating')::numeric, (recipe->>'ratingCount')::integer,
    public.recipe_fingerprint(recipe->>'title', recipe->'ingredients', recipe->'filters'),
    '2026-05-19T00:00:00Z'::timestamptz - (recipe->>'id')::integer * interval '1 second'
from catalog_seed
on conflict (id) do nothing;

insert into public.recipe_ingredients (recipe_id, position, name, amount, unit)
select recipe->>'id', position, item->>'name', item->>'amount', item->>'unit'
from catalog_seed
cross join lateral jsonb_array_elements(recipe->'ingredients') with ordinality as ingredient(item, position)
on conflict (recipe_id, position) do nothing;

insert into public.recipe_steps (recipe_id, position, instruction, timer_seconds, tip, warning, image_url)
select recipe->>'id', position, item->>'text', (item->>'timerSeconds')::integer,
    item->>'tip', item->>'warning', item->>'image'
from catalog_seed
cross join lateral jsonb_array_elements(recipe->'steps') with ordinality as step(item, position)
on conflict (recipe_id, position) do nothing;

commit;
`

await writeFile(new URL('../supabase/migrations/20261115000200_seed.sql', import.meta.url), sql)
