import type { Recipe } from '@/types'
import { database, rasterImage } from './supabase'

const imageBucket = 'cookify-images'
const catalogColumns = `
    id, author_id, title, description, image_url, cover_path, calories, protein, fat, carbs,
    cook_minutes, display_tags, filters, rating, rating_count, created_at,
    recipe_ingredients(position, name, amount, unit),
    recipe_steps(position, instruction, timer_seconds, tip, warning, image_url)
`

interface RecipeRow {
    id: string
    author_id: string | null
    title: string
    description: string
    image_url: string | null
    cover_path: string | null
    calories: number
    protein: number
    fat: number
    carbs: number
    cook_minutes: number
    display_tags: string[]
    filters: Partial<Recipe['filters']>
    rating: number
    rating_count: number
    created_at: string
    recipe_ingredients: {
        position: number
        name: string
        amount: string | null
        unit: string | null
    }[]
    recipe_steps: {
        position: number
        instruction: string
        timer_seconds: number
        tip: string | null
        warning: string | null
        image_url: string | null
    }[]
}

function fromRow(row: RecipeRow): Recipe {
    return {
        id: row.id,
        authorId: row.author_id ?? undefined,
        createdAt: row.created_at,
        title: row.title,
        description: row.description,
        image: row.cover_path
            ? database().storage.from(imageBucket).getPublicUrl(row.cover_path).data.publicUrl
            : row.image_url ?? '',
        calories: row.calories,
        protein: row.protein,
        fat: row.fat,
        carbs: row.carbs,
        cookTime: row.cook_minutes,
        displayTags: row.display_tags,
        filters: { mealType: [], occasions: [], health: [], cuisine: [], taste: [], ...row.filters },
        rating: row.rating,
        ratingCount: row.rating_count,
        ingredients: row.recipe_ingredients.sort((a, b) => a.position - b.position).map((ingredient) => ({
            name: ingredient.name,
            amount: ingredient.amount ?? undefined,
            unit: ingredient.unit ?? undefined,
        })),
        steps: row.recipe_steps.sort((a, b) => a.position - b.position).map((step) => ({
            text: step.instruction,
            timerSeconds: step.timer_seconds,
            tip: step.tip ?? undefined,
            warning: step.warning ?? undefined,
            image: step.image_url ?? undefined,
        })),
    }
}

const pageSize = 200

export async function listRecipes(signal: AbortSignal): Promise<Recipe[]> {
    const client = database()
    const result: Recipe[] = []
    for (let start = 0; ; start += pageSize) {
        const { data, error } = await client.from('recipes')
            .select(catalogColumns)
            .order('created_at', { ascending: false }).order('id')
            .range(start, start + pageSize - 1)
            .abortSignal(signal).returns<RecipeRow[]>()
        if (error) throw new Error('Не удалось загрузить каталог. Проверьте подключение к базе.')
        result.push(...data.map(fromRow))
        if (data.length < pageSize) return result
    }
}

type RecipeInput = Omit<Recipe, 'id' | 'authorId' | 'createdAt' | 'rating' | 'ratingCount'>

export async function createRecipe(id: string, userId: string, draft: RecipeInput): Promise<string> {
    const client = database()
    const { data: existing, error: readError } = await client.from('recipes')
        .select('id, author_id').eq('id', id).maybeSingle()
    if (readError) throw new Error('Не удалось проверить рецепт. Попробуйте ещё раз.')
    if (existing?.author_id === userId) return id
    if (existing) throw new Error('Этот идентификатор рецепта уже используется.')

    const { image, ...payload } = draft
    const storage = client.storage.from(imageBucket)
    const { error: coverError } = await storage.upload(`${userId}/${id}`, rasterImage(image), { upsert: true })
    if (coverError) throw new Error('Не удалось загрузить обложку. Проверьте размер файла и подключение.')

    const { data, error } = await client.rpc('publish_recipe', { recipe_id: id, payload })
    if (error?.code === '23505') throw new Error('В каталоге уже есть рецепт с таким названием, ингредиентами и тегами.')
    if (error?.code.startsWith('22') || error?.code === '23514' || error?.code === '23502') {
        throw new Error('Проверьте длину полей, время и количество ингредиентов и шагов.')
    }
    if (error || typeof data !== 'string') throw new Error('Не удалось опубликовать рецепт. Попробуйте ещё раз.')
    return data
}

export async function listFavorites(userId: string, signal: AbortSignal) {
    const client = database()
    const ids = new Set<string>()
    for (let start = 0; ; start += pageSize) {
        const { data, error } = await client.from('favorites').select('recipe_id')
            .eq('user_id', userId).order('recipe_id').range(start, start + pageSize - 1).abortSignal(signal)
        if (error) throw new Error('Не удалось загрузить избранное.')
        for (const row of data) ids.add(row.recipe_id)
        if (data.length < pageSize) return ids
    }
}

export async function setFavorite(userId: string, recipeId: string, value: boolean) {
    const favorites = database().from('favorites')
    const { error } = value
        ? await favorites.upsert({ user_id: userId, recipe_id: recipeId }, {
            onConflict: 'user_id,recipe_id', ignoreDuplicates: true,
        })
        : await favorites.delete().eq('user_id', userId).eq('recipe_id', recipeId)
    if (error) throw new Error('Не удалось обновить избранное. Попробуйте ещё раз.')
}
