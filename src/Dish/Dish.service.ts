import { Injectable } from "@nestjs/common";
import { PrismaService } from "src/prisma/prisma.service";
import { AddDishDto, EditDishDto } from "./dto";


@Injectable()
export class DishService {
    constructor(private prismaService: PrismaService) {}

    async createDish(dto: AddDishDto) {
        try {
            const dish = await this.prismaService.dish.create({
                data: {
                    name: dto.name,
                    description: dto.description,
                    price: dto.price,
                    categoryId: dto.categoryId
                }
            })
    
            return dish;
        } catch(err) {
            throw new Error(err.message);
        }
    }

    async deleteDish(dishId: string) {
        try {
            const deletedDish = await this.prismaService.dish.delete({
                where: {
                    id: parseInt(dishId)
                }
            })

            return deletedDish
        } catch(err) {
            throw new Error(err.message);
        }
    }

    async editDish(dishId: string, dto: EditDishDto) {
        try {
            const editedDish = await this.prismaService.dish.update({
                where: {
                    id: parseInt(dishId)
                },
                data: {
                    ...dto,
                }
            })

            return editedDish;
        } catch(err){ 
            throw new Error(err.message);
        }
    }
}