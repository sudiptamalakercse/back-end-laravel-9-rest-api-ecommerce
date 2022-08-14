<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ContactUs>
 */
class ContactUsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {

        $img = "Img " . fake()->unique()->numberBetween(1, 200);

        $open_time = '10.00 AM to 8.00 PM. Friday is Off Day';

        return [
            'address' => fake()->address(),
            'phone' => fake()->e164PhoneNumber(),
            'email' => fake()->safeEmail(),
            'open_time' => $open_time,
            'img' => $img,
        ];
    }
}
