/*
  Warnings:

  - A unique constraint covering the columns `[categoryId]` on the table `Antique` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[areaId]` on the table `Room` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Antique" ADD COLUMN     "categoryId" TEXT;

-- AlterTable
ALTER TABLE "Room" ADD COLUMN     "areaId" TEXT,
ADD COLUMN     "roomNo" TEXT;

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_AreaToCategory" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CategoryToRoom" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_title_key" ON "Category"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Category_slug_key" ON "Category"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "_AreaToCategory_AB_unique" ON "_AreaToCategory"("A", "B");

-- CreateIndex
CREATE INDEX "_AreaToCategory_B_index" ON "_AreaToCategory"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToRoom_AB_unique" ON "_CategoryToRoom"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToRoom_B_index" ON "_CategoryToRoom"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Antique_categoryId_key" ON "Antique"("categoryId");

-- CreateIndex
CREATE UNIQUE INDEX "Room_areaId_key" ON "Room"("areaId");

-- AddForeignKey
ALTER TABLE "Antique" ADD CONSTRAINT "Antique_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("slug") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "Area"("slug") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AreaToCategory" ADD CONSTRAINT "_AreaToCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Area"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AreaToCategory" ADD CONSTRAINT "_AreaToCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToRoom" ADD CONSTRAINT "_CategoryToRoom_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToRoom" ADD CONSTRAINT "_CategoryToRoom_B_fkey" FOREIGN KEY ("B") REFERENCES "Room"("id") ON DELETE CASCADE ON UPDATE CASCADE;
