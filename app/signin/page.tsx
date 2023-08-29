'use client'

import { useSearchParams } from 'next/navigation'
import { signIn } from 'next-auth/react'
import GoogleSignInButton from '@/components/google-sign-in-button'

export const SignIn = () =>  {
    return<GoogleSignInButton />
}

export default SignIn