-- CreateTable
CREATE TABLE "Antique" (
    "id" SERIAL NOT NULL,
    "itemNo" INTEGER NOT NULL,

    CONSTRAINT "Antique_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Area" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "Area_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Antique_itemNo_key" ON "Antique"("itemNo");

-- CreateIndex
CREATE INDEX "Antique_itemNo_idx" ON "Antique"("itemNo");

-- CreateIndex
CREATE UNIQUE INDEX "Area_title_key" ON "Area"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Area_slug_key" ON "Area"("slug");

-- AddForeignKey
ALTER TABLE "Antique" ADD CONSTRAINT "Antique_id_fkey" FOREIGN KEY ("id") REFERENCES "Area"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
