-- CreateTable
CREATE TABLE "FreeLancer" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "earnedTillDate" BIGINT NOT NULL,
    "profilePicLink" TEXT,
    "workLink" TEXT,
    "aboutMe" TEXT,
    "isAvailable" BOOLEAN NOT NULL DEFAULT true,
    "email" TEXT NOT NULL,
    "isVerrfied" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FreeLancer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "lancerId" TEXT NOT NULL,

    CONSTRAINT "Skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Client" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "isOrganization" BOOLEAN NOT NULL DEFAULT false,
    "profilePicLink" TEXT,
    "email" TEXT NOT NULL,
    "isVerrfied" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,
    "lancerId" TEXT NOT NULL,
    "price" BIGINT NOT NULL,
    "isOpen" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModIssue" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "raisedBy" TEXT NOT NULL,
    "price" BIGINT NOT NULL,
    "picked" BOOLEAN NOT NULL DEFAULT false,
    "modId" TEXT,

    CONSTRAINT "ModIssue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Moderator" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profilePicLink" TEXT,
    "email" TEXT NOT NULL,
    "isVerrfied" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Moderator_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "FreeLancer_username_key" ON "FreeLancer"("username");

-- CreateIndex
CREATE UNIQUE INDEX "FreeLancer_profilePicLink_key" ON "FreeLancer"("profilePicLink");

-- CreateIndex
CREATE UNIQUE INDEX "FreeLancer_workLink_key" ON "FreeLancer"("workLink");

-- CreateIndex
CREATE UNIQUE INDEX "FreeLancer_email_key" ON "FreeLancer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Client_username_key" ON "Client"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Client_profilePicLink_key" ON "Client"("profilePicLink");

-- CreateIndex
CREATE UNIQUE INDEX "Client_email_key" ON "Client"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ModIssue_orderId_key" ON "ModIssue"("orderId");

-- CreateIndex
CREATE UNIQUE INDEX "Moderator_username_key" ON "Moderator"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Moderator_profilePicLink_key" ON "Moderator"("profilePicLink");

-- CreateIndex
CREATE UNIQUE INDEX "Moderator_email_key" ON "Moderator"("email");

-- AddForeignKey
ALTER TABLE "Skill" ADD CONSTRAINT "Skill_lancerId_fkey" FOREIGN KEY ("lancerId") REFERENCES "FreeLancer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_lancerId_fkey" FOREIGN KEY ("lancerId") REFERENCES "FreeLancer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModIssue" ADD CONSTRAINT "ModIssue_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModIssue" ADD CONSTRAINT "ModIssue_modId_fkey" FOREIGN KEY ("modId") REFERENCES "Moderator"("id") ON DELETE SET NULL ON UPDATE CASCADE;
