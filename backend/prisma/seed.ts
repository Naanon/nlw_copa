import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

async function main() {
    const user = await prisma.user.create({
        data: {
            name: "Slade Wilson",
            email: "deathstroke.email.com",
            avatarUrl: "https://atualinerd.com.br/wp-content/uploads/2022/02/Deathstroke-1.png"
        }
    })

    const pool = await prisma.pool.create({
        data: {
            title: "Example Pool",
            code: "BOL123",
            ownerId: user.id,

            participants: {
                create: {
                    userId: user.id
                }
            }
        }
    })

    await prisma.game.create({
        data: {
            date: '2022-12-29T12:00:00.433Z',
            firstTeamCountryCode: "DE",
            secondTeamCountryCode: "BR"
        }
    })

    await prisma.game.create({
        data: {
            date: '2022-12-31T12:00:00.433Z',
            firstTeamCountryCode: "BR",
            secondTeamCountryCode: "AR",

            guesses: {
                create: {
                    firstTeamPoints: 2,
                    secondTeamPoints: 1,

                    participant: {
                        connect: {
                            userId_poolId: {
                                userId: user.id,
                                poolId: pool.id
                            }
                        }
                    }
                }
            }
        }
    })
}

main()