import type { AuthError as SupabaseAuthError, User as SupabaseUser } from '@supabase/supabase-js'
import type { User } from '@/types'
import { database, rasterImage } from './supabase'

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

type AuthErrorField = 'general' | 'email' | 'password' | 'code' | 'username'

export class AuthError extends Error {
    readonly field: AuthErrorField

    constructor(message: string, field: AuthErrorField = 'general') {
        super(message)
        this.name = 'AuthError'
        this.field = field
    }
}

function check(error: SupabaseAuthError | null) {
    if (!error) return
    switch (error.code) {
        case 'invalid_credentials':
            throw new AuthError('Неверный email или пароль.')
        case 'email_not_confirmed':
            throw new AuthError('Подтвердите email по коду из письма.', 'email')
        case 'otp_expired':
            throw new AuthError('Код неверный или истёк. Запросите новый.', 'code')
        case 'user_already_exists':
        case 'email_exists':
            throw new AuthError('Этот email уже используется.', 'email')
        case 'over_email_send_rate_limit':
        case 'over_request_rate_limit':
            throw new AuthError('Слишком много запросов. Попробуйте чуть позже.')
        case 'same_password':
            throw new AuthError('Новый пароль должен отличаться от текущего.', 'password')
        case 'weak_password':
            throw new AuthError('Пароль не соответствует требованиям безопасности.', 'password')
        default:
            throw new AuthError('Не удалось выполнить запрос. Проверьте данные и попробуйте ещё раз.')
    }
}

export function toUser(user: SupabaseUser): User {
    const email = user.email ?? ''
    return {
        id: user.id,
        email,
        username: typeof user.user_metadata.username === 'string'
            ? user.user_metadata.username
            : email.split('@')[0],
        avatar: typeof user.user_metadata.avatar === 'string' ? user.user_metadata.avatar : undefined,
        createdAt: user.created_at,
    }
}

type ProfileUpdates = Partial<Pick<User, 'username' | 'email' | 'avatar'>>

export const authApi = {
    async login(email: string, password: string) {
        const { error } = await database().auth.signInWithPassword({ email: email.trim(), password })
        check(error)
    },

    async logout() {
        const { error } = await database().auth.signOut({ scope: 'local' })
        check(error)
    },

    async register(email: string, password: string) {
        const { data, error } = await database().auth.signUp({ email: email.trim(), password })
        check(error)
        return Boolean(data.session)
    },

    async resendCode(email: string) {
        const { error } = await database().auth.resend({ type: 'signup', email: email.trim() })
        check(error)
    },

    async verifyCode(email: string, token: string) {
        const { error } = await database().auth.verifyOtp({ type: 'email', email: email.trim(), token })
        check(error)
    },

    async updateProfile(user: User, updates: ProfileUpdates) {
        const client = database()
        const metadata: Record<string, string | null> = {}
        if (updates.username !== undefined) metadata.username = updates.username
        if ('avatar' in updates) {
            metadata.avatar = null
            if (updates.avatar) {
                const image = rasterImage(updates.avatar)
                const path = `${user.id}/avatar`
                const storage = client.storage.from('cookify-images')
                const { error } = await storage.upload(path, image, { upsert: true })
                if (error) throw new AuthError('Не удалось загрузить аватар.')
                metadata.avatar = `${storage.getPublicUrl(path).data.publicUrl}?v=${Date.now()}`
            }
        }
        const { error } = await client.auth.updateUser(
            { email: updates.email, data: metadata },
            { emailRedirectTo: window.location.origin },
        )
        check(error)
    },

    async changePassword(user: User, currentPassword: string, newPassword: string) {
        const { error } = await database().auth.signInWithPassword({
            email: user.email,
            password: currentPassword,
        })
        if (error?.code === 'invalid_credentials') {
            throw new AuthError('Текущий пароль неверный.', 'password')
        }
        check(error)
        const { error: updateError } = await database().auth.updateUser({ password: newPassword })
        check(updateError)
    },
}

export function authDestination(value: string | null) {
    return value?.startsWith('/') && !value.startsWith('//') && !value.includes('\\') ? value : '/'
}

export const validators = {
    email(value: string): string | null {
        const v = value.trim()
        if (!v) return 'Введите email'
        if (!EMAIL_RE.test(v)) return 'Некорректный формат email'
        return null
    },
    password(value: string): string | null {
        if (!value) return 'Введите пароль'
        if (value.length < 8) return 'Минимум 8 символов'
        if (!/[a-zA-Zа-яА-Я]/.test(value)) return 'Должен содержать буквы'
        if (!/\d/.test(value)) return 'Должен содержать цифры'
        return null
    },
    confirmPassword(value: string, original: string): string | null {
        if (!value) return 'Повторите пароль'
        if (value !== original) return 'Пароли не совпадают'
        return null
    },
    username(value: string): string | null {
        const v = value.trim()
        if (!v) return 'Введите имя пользователя'
        if (v.length < 2) return 'Минимум 2 символа'
        if (v.length > 32) return 'Максимум 32 символа'
        return null
    },
}
