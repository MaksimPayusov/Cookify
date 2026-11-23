import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL?.trim()
const key = import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY?.trim()

export const supabase = url && key ? createClient(url, key) : null

export function database() {
    if (!supabase) {
        throw new Error('Подключение к Supabase не настроено. Проверьте .env по инструкции проекта.')
    }
    return supabase
}

export function rasterImage(source: string) {
    const match = /^data:(image\/(?:png|jpeg|webp|gif));base64,([A-Za-z0-9+/]+={0,2})$/.exec(source)
    if (!match) throw new Error('Выберите изображение в формате PNG, JPEG, WebP или GIF.')

    const bytes = Uint8Array.from(atob(match[2]), (char) => char.charCodeAt(0))
    return new Blob([bytes], { type: match[1] })
}
