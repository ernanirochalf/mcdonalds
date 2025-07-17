/*
  Warnings:

  - You are about to drop the column `updadeAt` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `updadeAt` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `updadeAt` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `menuCategoryId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updadeAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updadeAt` on the `Restaurant` table. All the data in the column will be lost.
  - Added the required column `customerCpf` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `customerName` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `menuCategoryId` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_menuCategoryId_fkey";

-- AlterTable
ALTER TABLE "MenuCategory" DROP COLUMN "updadeAt",
ALTER COLUMN "updatedAt" DROP DEFAULT,
ALTER COLUMN "updatedAt" SET DATA TYPE TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "updadeAt",
ADD COLUMN     "customerCpf" TEXT NOT NULL,
ADD COLUMN     "customerName" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "OrderProduct" DROP COLUMN "updadeAt",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "menuCategoryId",
DROP COLUMN "updadeAt",
ADD COLUMN     "menuCategoryId" TEXT NOT NULL,
ALTER COLUMN "updatedAt" DROP DEFAULT,
ALTER COLUMN "updatedAt" SET DATA TYPE TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "updadeAt",
ALTER COLUMN "updatedAt" DROP DEFAULT,
ALTER COLUMN "updatedAt" SET DATA TYPE TIMESTAMP(3);

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_menuCategoryId_fkey" FOREIGN KEY ("menuCategoryId") REFERENCES "MenuCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;
