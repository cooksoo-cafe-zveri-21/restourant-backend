-- CreateTable
CREATE TABLE "Ingridients" (
    "id" SERIAL NOT NULL,
    "product" TEXT NOT NULL,

    CONSTRAINT "Ingridients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "typeOrder" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "typeOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branch" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,

    CONSTRAINT "Branch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Promocode" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "discount" INTEGER NOT NULL,

    CONSTRAINT "Promocode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Curier" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "age" INTEGER NOT NULL,

    CONSTRAINT "Curier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dish" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "Dish_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chef" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "branchId" INTEGER NOT NULL,

    CONSTRAINT "Chef_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "connectionIngridientsDishes" (
    "id" SERIAL NOT NULL,
    "ingridientId" INTEGER NOT NULL,
    "dishId" INTEGER NOT NULL,

    CONSTRAINT "connectionIngridientsDishes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "typeOrderId" INTEGER NOT NULL,
    "branchId" INTEGER NOT NULL,
    "promocodeId" INTEGER NOT NULL,
    "chefId" INTEGER NOT NULL,
    "curierId" INTEGER NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DishOrderConnection" (
    "id" SERIAL NOT NULL,
    "dishId" INTEGER NOT NULL,
    "orderId" INTEGER NOT NULL,

    CONSTRAINT "DishOrderConnection_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Dish" ADD CONSTRAINT "Dish_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chef" ADD CONSTRAINT "Chef_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "connectionIngridientsDishes" ADD CONSTRAINT "connectionIngridientsDishes_ingridientId_fkey" FOREIGN KEY ("ingridientId") REFERENCES "Ingridients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "connectionIngridientsDishes" ADD CONSTRAINT "connectionIngridientsDishes_dishId_fkey" FOREIGN KEY ("dishId") REFERENCES "Dish"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_typeOrderId_fkey" FOREIGN KEY ("typeOrderId") REFERENCES "typeOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_promocodeId_fkey" FOREIGN KEY ("promocodeId") REFERENCES "Promocode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_chefId_fkey" FOREIGN KEY ("chefId") REFERENCES "Chef"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_curierId_fkey" FOREIGN KEY ("curierId") REFERENCES "Curier"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DishOrderConnection" ADD CONSTRAINT "DishOrderConnection_dishId_fkey" FOREIGN KEY ("dishId") REFERENCES "Dish"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DishOrderConnection" ADD CONSTRAINT "DishOrderConnection_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
