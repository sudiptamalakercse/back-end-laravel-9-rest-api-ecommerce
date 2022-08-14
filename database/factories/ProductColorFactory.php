<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductColor>
 */
class ProductColorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $color = 'Color ' . fake()->unique()->numberBetween(1, 200);

        $img = "Img of " . $color;

        return [
            'name' => $color,
            'img' => $img,
        ];
    }
}
