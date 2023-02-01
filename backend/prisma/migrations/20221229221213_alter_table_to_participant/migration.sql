/*
  Warnings:

  - You are about to drop the column `praticipantId` on the `guess` table. All the data in the column will be lost.
  - You are about to drop the `praticipant` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `participantId` to the `Guess` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `guess` DROP FOREIGN KEY `Guess_praticipantId_fkey`;

-- DropForeignKey
ALTER TABLE `praticipant` DROP FOREIGN KEY `Praticipant_poolId_fkey`;

-- DropForeignKey
ALTER TABLE `praticipant` DROP FOREIGN KEY `Praticipant_userId_fkey`;

-- AlterTable
ALTER TABLE `guess` DROP COLUMN `praticipantId`,
    ADD COLUMN `participantId` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `praticipant`;

-- CreateTable
CREATE TABLE `Participant` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `poolId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Participant_userId_poolId_key`(`userId`, `poolId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Participant` ADD CONSTRAINT `Participant_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Participant` ADD CONSTRAINT `Participant_poolId_fkey` FOREIGN KEY (`poolId`) REFERENCES `Pool`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Guess` ADD CONSTRAINT `Guess_participantId_fkey` FOREIGN KEY (`participantId`) REFERENCES `Participant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
