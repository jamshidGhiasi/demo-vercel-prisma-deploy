import prisma from '@/lib/prisma'
import { timeAgo } from '@/lib/utils'
import Image from 'next/image'
import RefreshButton from './refresh-button'

export default async function Table() {
  const startTime = Date.now()
  const antiques = await prisma.antique.findMany({
    include: {
      area: true
    }
  })
  const duration = Date.now() - startTime

  return (
    <div className="bg-white/30 p-12 shadow-xl ring-1 ring-gray-900/5 rounded-lg backdrop-blur-lg max-w-xl mx-auto w-full">
      <div className="flex justify-between items-center mb-4">
        <div className="space-y-1">
          <h2 className="text-xl font-semibold">Recent Users</h2>
          <p className="text-sm text-gray-500">
            Fetched {antiques.length} antiques in {duration}ms
          </p>
        </div>
        <RefreshButton />
      </div>
      <div className="divide-y divide-gray-900/5">
        {antiques.map((antique) => (
          <div
            key={antique.id}
            className="flex items-center justify-between py-3"
          >
            <div className="flex items-center space-x-4">
              ITEM: { antique.itemNo }
              <br />
              { antique?.area?.slug }
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
