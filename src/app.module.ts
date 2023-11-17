import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';
import { DishModule } from './Dish/Dish.module';

@Module({
  imports: [PrismaModule, DishModule],
})
export class AppModule {}
