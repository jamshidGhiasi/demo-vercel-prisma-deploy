import prisma from "@/lib/prisma";
import { NextResponse } from "next/server";

export const GET = async (request: Request) => {
    const users = await prisma.antique.findMany({
        where: {
            area: {
                title: 'Villa Ground'
            }
        },
        include: {
            area: true
        }
        
    })
    return NextResponse.json(users)
}