import { Module } from "@nestjs/common";
import { PrismaModule } from "src/prisma/prisma.module";
import { DishService } from "./Dish.service";
import { DishController } from "./Dish.controller";

@Module({
    imports: [PrismaModule],
    providers: [DishService],
    controllers: [DishController]
})
export class DishModule {}