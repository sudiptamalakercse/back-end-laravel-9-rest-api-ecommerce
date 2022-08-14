<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductImg>
 */
class ProductImgFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $img = 'Product Img ' . fake()->unique()->numberBetween(1, 200);

        return [
            'img' => $img,
            'product_id' => Product::inRandomOrder()->first()->id,
        ];
    }
}
