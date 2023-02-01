import { createContext, ReactNode } from "react";

type UserProps = {
    name: string
    avatarUrl: string
}

export type AuthContextDataProps = {
    user: UserProps
    signIn: () => Promise<void>
}

type AuthProviderProps = {
    children: ReactNode
}

export const AuthContext = createContext({} as AuthContextDataProps)

export function AuthContextProvider({ children }: AuthProviderProps) {

    async function signIn() {
        console.log('Vamos Logar')
    }

    return (
        <AuthContext.Provider value={{
            signIn,
            user: {
                name: 'Aaron',
                avatarUrl: 'https://github.com/Naanon.png'
            }
        }}>
            {children}
        </AuthContext.Provider>
    )
}