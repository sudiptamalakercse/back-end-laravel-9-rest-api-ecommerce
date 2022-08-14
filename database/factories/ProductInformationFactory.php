<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductInformation>
 */
class ProductInformationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $product = 'Product ' . fake()->unique()->numberBetween(1, 200);

        return [
            'name' => $product,
            'detail' => fake()->text(100),
            'information' => fake()->text(100),
            'category_id' => Category::inRandomOrder()->first()->id,
        ];
    }
}
