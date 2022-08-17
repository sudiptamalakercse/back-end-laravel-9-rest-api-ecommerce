<?php

namespace App\Http\Controllers;

use App\Http\Resources\Both\CategoryResource;
use App\Http\Resources\Both\ContactUsResource;
use App\Models\Category;
use App\Models\ContactUs;

class BothController extends Controller
{
    public static function get_contact_us_single_record()
    {

        $contact_us = ContactUs::first();

        if ($contact_us) {

            $contact_us = new ContactUsResource($contact_us);

            return response([
                'all_ok' => 'yes',
                'contact_us' => $contact_us,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Contact Us Record!',
            ], 404);
        }
    }

    public static function get_categories_records()
    {

        $categories = Category::get();

        if (count($categories) > 0) {

            $categories = CategoryResource::collection($categories);

            return response([
                'all_ok' => 'yes',
                'categories' => $categories,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Category Record!',
            ], 404);

        }
    }
}
