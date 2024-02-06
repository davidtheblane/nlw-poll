/*
  Warnings:

  - You are about to drop the column `pollOptionsId` on the `Vote` table. All the data in the column will be lost.
  - You are about to drop the `PollOptions` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `pollOptionId` to the `Vote` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "PollOptions" DROP CONSTRAINT "PollOptions_pollId_fkey";

-- DropForeignKey
ALTER TABLE "Vote" DROP CONSTRAINT "Vote_pollOptionsId_fkey";

-- AlterTable
ALTER TABLE "Vote" DROP COLUMN "pollOptionsId",
ADD COLUMN     "pollOptionId" TEXT NOT NULL;

-- DropTable
DROP TABLE "PollOptions";

-- CreateTable
CREATE TABLE "PollOption" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "pollId" TEXT NOT NULL,

    CONSTRAINT "PollOption_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PollOption" ADD CONSTRAINT "PollOption_pollId_fkey" FOREIGN KEY ("pollId") REFERENCES "Poll"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vote" ADD CONSTRAINT "Vote_pollOptionId_fkey" FOREIGN KEY ("pollOptionId") REFERENCES "PollOption"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
