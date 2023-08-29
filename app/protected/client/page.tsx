'use client'

import { signOut, useSession } from "next-auth/react"
import { redirect } from "next/navigation"
import { signIn } from 'next-auth/react'


const ClientProtectedPage = () => {
    const { data: session } = useSession({
        required: true
    });
    return (
        <div>
            <h2>THIS IS A PROTECTED PAGE</h2>
            <button onClick={() => signOut({ callbackUrl: 'http://localhost:3000/' })}>Sign Out</button>
        </div>
    )
}

export default ClientProtectedPage;