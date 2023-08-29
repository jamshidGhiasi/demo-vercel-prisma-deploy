import prisma from '../lib/prisma'

async function main() {
  const response = await Promise.all([
    await prisma.area.upsert({
      where: {
        title: 'Villa Ground'
      }, 
      update: {},
      create: {
        title: 'Villa Ground',
        slug: 'villa-ground',
       
      },
    }),
    await prisma.area.upsert({
      where: {
        title: 'Villa 1st Floor'
      }, 
      update: {},
      create: {
        title: 'Villa 1st Floor',
        slug: 'villa-1st-floor',
       
      },
    }),
    await prisma.area.upsert({
      where: {
        title: 'Villa 2nd Floor'
      }, 
      update: {},
      create: {
        title: 'Villa 2nd Floor',
        slug: 'villa-2nd-floor',
       
      },
    }),
    await prisma.area.upsert({
      where: {
        title: 'Colonica'
      }, 
      update: {},
      create: {
        title: 'Colonica',
        slug: 'colonica',
        
      },
    }),
    await prisma.area.upsert({
      where: {
        title: 'Other Rooms'
      }, 
      update: {},
      create: {
        title: 'Other Rooms',
        slug: 'other-rooms',
       
      },
    }),
    await prisma.antique.upsert({
      where: {
        itemNo: 1
      }, 
      update: {
        areaId: 'villa-ground'
      },
      create: {
        itemNo: 1,
        areaId: 'villa-ground',
      },
    }),
    await prisma.antique.upsert({
      where: {
        itemNo: 2
      }, 
      update: {
        areaId: 'villa-1st-floor'
      },
      create: {
        itemNo: 2,
        areaId: 'villa-1st-floor'
      },
    }),
  ])
  console.log(response)
}
main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
