/*
  Warnings:

  - A unique constraint covering the columns `[roomId]` on the table `Antique` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Antique" DROP CONSTRAINT "Antique_areaId_fkey";

-- AlterTable
ALTER TABLE "Antique" ADD COLUMN     "roomId" TEXT,
ALTER COLUMN "areaId" SET DATA TYPE TEXT;

-- CreateTable
CREATE TABLE "Room" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Room_title_key" ON "Room"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Room_slug_key" ON "Room"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Antique_roomId_key" ON "Antique"("roomId");

-- AddForeignKey
ALTER TABLE "Antique" ADD CONSTRAINT "Antique_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "Area"("slug") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Antique" ADD CONSTRAINT "Antique_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("slug") ON DELETE SET NULL ON UPDATE CASCADE;
