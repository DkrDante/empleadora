-- DropIndex
DROP INDEX "Client_profilePicLink_key";

-- AlterTable
ALTER TABLE "Client" ALTER COLUMN "profilePicLink" SET DEFAULT 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

-- AlterTable
ALTER TABLE "FreeLancer" ALTER COLUMN "earnedTillDate" SET DEFAULT 0;
