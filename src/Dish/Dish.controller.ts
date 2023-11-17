import { Body, Controller, Delete, Param, Patch, Post, Req } from "@nestjs/common";
import { DishService } from "./Dish.service";
import { AddDishDto, EditDishDto } from "./dto";

@Controller("dish")
export class DishController {
    constructor(private dishService: DishService) {}

    @Post("createDish")
    createDish(@Body() dto: AddDishDto) {
        return this.dishService.createDish(dto);
    }

    @Delete('deleteDish/:dishId')
    deleteDish(@Param('dishId') dishId: string) {
        return this.dishService.deleteDish(dishId);
    }

    @Patch("editDish/:dishId")
    editDish(
        @Param('dishId') dishId: string,
        @Body() dto: EditDishDto
    ) { 
        return this.dishService.editDish(dishId, dto);
    }
}