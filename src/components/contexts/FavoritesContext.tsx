import { createContext, useCallback, useContext, useEffect, useRef, useState, type ReactNode } from 'react'
import { listFavorites, setFavorite } from '@/services/api'
import { useAuth } from './AuthContext'

interface Favorites {
    favorites: Set<string>
    loading: boolean
    error: string | null
    add: (id: string) => void
    remove: (id: string) => void
}

const FavoritesContext = createContext<Favorites | null>(null)

export function FavoritesProvider({ children }: { children: ReactNode }) {
    const { user } = useAuth()
    return (
        <AccountFavorites key={user?.id ?? 'guest'} userId={user?.id}>
            {children}
        </AccountFavorites>
    )
}

function AccountFavorites({ userId, children }: { userId?: string; children: ReactNode }) {
    const [favorites, setFavorites] = useState<Set<string>>(() => new Set())
    const [loading, setLoading] = useState(Boolean(userId))
    const [error, setError] = useState<string | null>(null)
    const pending = useRef(new Set<string>())

    useEffect(() => {
        if (!userId) return
        const request = new AbortController()
        listFavorites(userId, request.signal).then(
            (ids) => {
                if (request.signal.aborted) return
                setFavorites(ids)
                setLoading(false)
            },
            (error: Error) => {
                if (request.signal.aborted) return
                setError(error.message)
                setLoading(false)
            },
        )
        return () => request.abort()
    }, [userId])

    const change = useCallback(async (id: string, value: boolean) => {
        if (!userId || loading || pending.current.has(id)) return
        pending.current.add(id)
        setError(null)
        try {
            await setFavorite(userId, id, value)
            setFavorites((previous) => {
                const next = new Set(previous)
                if (value) next.add(id)
                else next.delete(id)
                return next
            })
        } catch (error) {
            setError(error instanceof Error ? error.message : 'Не удалось обновить избранное.')
        } finally {
            pending.current.delete(id)
        }
    }, [userId, loading])

    return (
        <FavoritesContext.Provider value={{
            favorites, loading, error,
            add: (id) => void change(id, true),
            remove: (id) => void change(id, false),
        }}>
            {children}
        </FavoritesContext.Provider>
    )
}

export function useFavorites() {
    const context = useContext(FavoritesContext)
    if (!context) throw new Error('useFavorites must be used inside <FavoritesProvider>')
    return context
}
