import {
    createContext, useCallback, useContext, useEffect, useMemo, useState,
    type ReactNode,
} from 'react'
import { AuthError, authApi, toUser } from '@/services/auth'
import { supabase } from '@/services/supabase'
import type { User } from '@/types'

interface AuthContextValue {
    user: User | null
    isAuthenticated: boolean
    isReady: boolean
    login: typeof authApi.login
    logout: typeof authApi.logout
    register: typeof authApi.register
    resendCode: typeof authApi.resendCode
    verifyCode: typeof authApi.verifyCode
    updateProfile: (updates: Partial<Pick<User, 'username' | 'email' | 'avatar'>>) => Promise<void>
    changePassword: (currentPassword: string, newPassword: string) => Promise<void>
}

const AuthContext = createContext<AuthContextValue | null>(null)

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<User | null>(null)
    const [isReady, setIsReady] = useState(!supabase)

    useEffect(() => {
        if (!supabase) return
        const { data } = supabase.auth.onAuthStateChange((_event, session) => {
            setUser(session ? toUser(session.user) : null)
            setIsReady(true)
        })
        return () => data.subscription.unsubscribe()
    }, [])

    const updateProfile = useCallback<AuthContextValue['updateProfile']>(async (updates) => {
        if (!user) throw new AuthError('Войдите в свой аккаунт.')
        await authApi.updateProfile(user, updates)
    }, [user])

    const changePassword = useCallback<AuthContextValue['changePassword']>(async (current, next) => {
        if (!user) throw new AuthError('Войдите в свой аккаунт.')
        await authApi.changePassword(user, current, next)
    }, [user])

    const value = useMemo(() => ({
        user,
        isAuthenticated: Boolean(user),
        isReady,
        login: authApi.login,
        logout: authApi.logout,
        register: authApi.register,
        resendCode: authApi.resendCode,
        verifyCode: authApi.verifyCode,
        updateProfile,
        changePassword,
    }), [user, isReady, updateProfile, changePassword])

    return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth(): AuthContextValue {
    const context = useContext(AuthContext)
    if (!context) throw new Error('useAuth must be used inside <AuthProvider>')
    return context
}
