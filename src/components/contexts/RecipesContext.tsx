import { createContext, useCallback, useContext, useEffect, useState, type ReactNode } from 'react'
import { listRecipes } from '@/services/api'
import type { Recipe } from '@/types'

const emptyCatalog: Recipe[] = []

interface Catalog {
    recipes: Recipe[]
    loading: boolean
    error: string | null
    reload: () => void
}

const RecipesContext = createContext<Catalog | null>(null)

export function RecipesProvider({ children }: { children: ReactNode }) {
    const [version, setVersion] = useState(0)
    const [catalog, setCatalog] = useState<{
        version: number
        recipes: Recipe[]
        error: string | null
    }>({ version: -1, recipes: emptyCatalog, error: null })

    const reload = useCallback(() => setVersion((previous) => previous + 1), [])

    useEffect(() => {
        const request = new AbortController()
        listRecipes(request.signal).then(
            (recipes) => {
                if (!request.signal.aborted) setCatalog({ version, recipes, error: null })
            },
            (error: Error) => {
                if (!request.signal.aborted) {
                    setCatalog((previous) => ({ ...previous, version, error: error.message }))
                }
            },
        )
        return () => request.abort()
    }, [version])

    return (
        <RecipesContext.Provider value={{
            recipes: catalog.recipes,
            loading: version !== catalog.version,
            error: version === catalog.version ? catalog.error : null,
            reload,
        }}>
            {children}
        </RecipesContext.Provider>
    )
}

export function useRecipes() {
    const context = useContext(RecipesContext)
    if (!context) throw new Error('useRecipes must be used inside <RecipesProvider>')
    return context
}
