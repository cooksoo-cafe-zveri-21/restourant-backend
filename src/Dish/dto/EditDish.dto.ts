import { IsOptional } from "class-validator";

export class EditDishDto {
    @IsOptional()
    name?: string

    @IsOptional()
    description?: string

    @IsOptional()
    price?: number

    @IsOptional()
    categoryId?: number
}