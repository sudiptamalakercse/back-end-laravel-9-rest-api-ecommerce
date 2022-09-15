<?php

namespace App\Http\Controllers;

use App\Http\Resources\Both\CategoryResource;
use App\Http\Resources\Both\ContactUsResource;
use App\Http\Resources\Both\ProductResource;
use App\Models\Category;
use App\Models\ContactUs;
use App\Models\Product;

class BothController extends Controller
{
    public function get_contact_us_single_record()
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

    public function get_categories_records()
    {

        $categories = Category::orderByRaw('LENGTH(name), name')->get();

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

    public function get_single_record_of_products_table_by_id($product_id)
    {
        $product = Product::find($product_id);

        if (isset($product)) {

            $product = new ProductResource($product);

            return response([
                'all_ok' => 'yes',
                'product' => $product,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'Product is Not Found!',
            ], 404);

        }

    }
}
