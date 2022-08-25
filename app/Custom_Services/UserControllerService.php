<?php

namespace App\Custom_Services;

use App\Http\Controllers\UserController;
use App\Http\Resources\Both\ProductResource;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class UserControllerService
{
    public static function get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table()
    {

        $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table = DB::table('reviews')
            ->select(DB::raw('product_id, count(product_id) as occurrences'))
            ->groupBy('product_id')
            ->orderBy('occurrences', 'DESC')
            ->get();

        return $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table;
    }

    public static function get_popular_products_of_all_categories_or_specific_category($category_name = null)
    {
        $product_not_found = false;
        $products = null;

        $user_controller = new UserController();

        $unique_popular_categories_ids_array = $user_controller->get_catagories_of_popular_products(get_popular_unique_catagories_ids_array:true);

        $unique_product_ids_and_occurrences = UserControllerService::get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table();

        if (count($unique_product_ids_and_occurrences) > 0) {

            $maximum_popular_products_show_in_all_category_section = 8;

            $product_shows_per_category = floor($maximum_popular_products_show_in_all_category_section / count($unique_popular_categories_ids_array));

            //this array may contain duplicate categories ids
            $categories_ids = [];

            //this array will contain unique products ids
            $unique_products_ids = [];

            foreach ($unique_product_ids_and_occurrences as $unique_product_id_and_occurrence) {

                $number_of_occurrence_in_categories_ids_array = null;

                $product_id = $unique_product_id_and_occurrence->product_id;

                $category_id = Product::find($product_id)->productInformation->category->id;

                if (in_array($category_id, $unique_popular_categories_ids_array)) {

                    $array_count_values = array_count_values($categories_ids);

                    if (array_key_exists($category_id, $array_count_values)) {
                        $number_of_occurrence_in_categories_ids_array = $array_count_values[$category_id];
                    }

                    if ($number_of_occurrence_in_categories_ids_array == null) {
                        $number_of_occurrence_in_categories_ids_array = 0;
                    }

                    if ($number_of_occurrence_in_categories_ids_array < $product_shows_per_category) {
                        array_push($categories_ids, $category_id);
                        array_push($unique_products_ids, $product_id);
                    }
                }
            }

            //convert unique products ids array in string with coma
            $unique_products_ids_in_string_with_coma = implode(',', $unique_products_ids);

            $products = Product::whereIn('id', $unique_products_ids)
                ->orderByRaw(DB::raw("FIELD(id, $unique_products_ids_in_string_with_coma)")); // order by given array of unique products ids

            if ($category_name != null) {
                $products->whereRelation('productInformation', function ($query) use ($category_name) {
                    $query->whereRelation('category', 'name', $category_name);
                });
            }

            $products = $products->get();

            $products = ProductResource::collection($products);

            if ($products->count() == 0) {
                $product_not_found = true;
            }

        } else {
            $product_not_found = true;
        }

        if ($product_not_found == true) {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Record!',
            ], 404);

        } else {
            return response([
                'all_ok' => 'yes',
                'products' => $products,
            ], 200);
        }

    }

}
