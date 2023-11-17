import { IsNotEmpty, IsOptional } from "class-validator";

export class AddDishDto {
    @IsNotEmpty()
    name: string

    @IsOptional()
    description?: string 

    @IsNotEmpty()
    price: number
    
    @IsNotEmpty()
    categoryId: number
}