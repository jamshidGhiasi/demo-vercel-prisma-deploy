/*
  Warnings:

  - A unique constraint covering the columns `[areaId]` on the table `Antique` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Antique" DROP CONSTRAINT "Antique_id_fkey";

-- AlterTable
ALTER TABLE "Antique" ADD COLUMN     "areaId" INTEGER;

-- CreateIndex
CREATE UNIQUE INDEX "Antique_areaId_key" ON "Antique"("areaId");

-- AddForeignKey
ALTER TABLE "Antique" ADD CONSTRAINT "Antique_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "Area"("id") ON DELETE SET NULL ON UPDATE CASCADE;
