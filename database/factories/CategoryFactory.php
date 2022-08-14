<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {

        $category = 'Category ' . fake()->unique()->numberBetween(1, 200);

        $img = "Img of " . $category;

        return [
            'name' => $category,
            'img' => $img,
            'is_size_available' => fake()->boolean(),
            'is_color_available' => fake()->boolean(),
        ];

    }
}
