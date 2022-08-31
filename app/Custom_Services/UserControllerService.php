<?php

namespace App\Custom_Services;

use App\Http\Controllers\UserController;
use App\Http\Resources\Both\ProductResource;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

class UserControllerService
{

    public static function get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table($review_colum_null_check = false)
    {

        $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table = DB::table('reviews')
            ->select(DB::raw('product_id, count(product_id) as occurrences'));

        if ($review_colum_null_check == true) {
            $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table
                ->where('review', '!=', null);
        }

        $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table = $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table->groupBy('product_id')
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

        $unique_product_ids_and_occurrences = self::get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table();

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

    public static function codes_1_get_number_of_occurrence_in_categories_ids_array_and_category_id($product, $categories_ids)
    {
        $category_id = $product->productInformation->category->id;

        $number_of_occurrence_in_categories_ids_array = null;

        $array_count_values = array_count_values($categories_ids);

        if (array_key_exists($category_id, $array_count_values)) {
            $number_of_occurrence_in_categories_ids_array = $array_count_values[$category_id];
        }

        if ($number_of_occurrence_in_categories_ids_array == null) {
            $number_of_occurrence_in_categories_ids_array = 0;
        }
        return [
            'number_of_occurrence_in_categories_ids_array' => $number_of_occurrence_in_categories_ids_array,
            'category_id' => $category_id,
        ];
    }

    public static function codes_2_get_product_resource_collection($products_ids)
    {
        $products_ids_in_string_with_coma = implode(',', $products_ids);

        $products = Product::whereIn('id', $products_ids)
            ->orderByRaw(DB::raw("FIELD(id, $products_ids_in_string_with_coma)")) // order by given array of unique products ids
            ->limit(6)
            ->get();

        return $products = ProductResource::collection($products);
    }

    //This may contain duplicate values
    public static function get_unique_categories_ids_for_highlighting_categories($categories_ids)
    {
        $current_route_name = Route::currentRouteName();

        $categories_ids_from_sale_off_products_session = session()->get('categories_ids_from_sale_off_products');
        $categories_ids_from_products_session = session()->get('categories_ids_from_products');
        $categories_ids_from_latest_products_session = session()->get('categories_ids_from_latest_products');

        if ($categories_ids_from_sale_off_products_session == null) {
            session()->put('categories_ids_from_sale_off_products', []);
        }

        if ($categories_ids_from_products_session == null) {
            session()->put('categories_ids_from_products', []);
        }

        if ($categories_ids_from_latest_products_session == null) {
            session()->put('categories_ids_from_latest_products', []);
        }

        if ($current_route_name == 'user.sale.off.products') {

            session()->put('categories_ids_from_sale_off_products', $categories_ids);

        } elseif ($current_route_name == 'user.products') {

            session()->put('categories_ids_from_products', $categories_ids);

        } elseif ($current_route_name == 'user.latest.products') {

            session()->put('categories_ids_from_latest_products', $categories_ids);

        }

        $categories_ids_from_sale_off_products_session = session()->get('categories_ids_from_sale_off_products');
        $categories_ids_from_products_session = session()->get('categories_ids_from_products');
        $categories_ids_from_latest_products_session = session()->get('categories_ids_from_latest_products');

        //This may contain duplicate values
        $categories_ids_for_highlighting_categories = array(...$categories_ids_from_sale_off_products_session, ...$categories_ids_from_products_session, ...$categories_ids_from_latest_products_session);

        //This will contain unique values
        $unique_categories_ids_for_highlighting_categories = array_unique($categories_ids_for_highlighting_categories);

        // start array element from 0 index
        $unique_categories_ids_for_highlighting_categories = array(...$unique_categories_ids_for_highlighting_categories);

        session()->put('unique_categories_ids_for_highlighting_categories', $unique_categories_ids_for_highlighting_categories);

        return $unique_categories_ids_for_highlighting_categories;

    }

    public static function get_sale_off_products_or_products($product_name, $product_category, $product_price, $product_color, $product_size, $sort_type = "''")
    {

        //this may contain duplicate values
        $categories_ids_for_highlighting_categories = [];

        $product_price = floatval($product_price);

        if ($product_price == 0.0) {
            $product_price = Product::max('minimum_quantity_selling_price');
        }

        if (Product::count() > 0) {

            $current_route_name = Route::currentRouteName();

            $products = Product::where('id', '!=', null);

            if ($product_category != "''") {
                $products = $products->whereRelation('productInformation', function ($query) use ($product_category) {
                    $query->whereRelation('category', 'name', $product_category);
                });
            }

            if ($product_size != "''") {
                $products = $products->whereRelation('productSize', 'name', $product_size);
            }

            if ($product_name != "''") {
                $products = $products->whereRelation('productInformation', 'name', 'like', '%' . $product_name . '%');
            }

            if ($product_color != "''") {
                $products = $products->whereRelation('productColor', 'name', $product_color);
            }

            if ($product_price != "''") {
                $products = $products->where('minimum_quantity_selling_price', '<=', $product_price);
            }

            if ($current_route_name == 'user.sale.off.products') {

                $products = $products->where('discount_in_percent', '>', 0);

                $products = $products->inRandomOrder();

            } elseif ($current_route_name == 'user.products') {

                $products = $products->where('discount_in_percent', 0);

                if ($sort_type == "''") {

                    $products = $products->orderBy('id', 'DESC');
                } else {
                    $products = $products->orderBy('id', $sort_type);
                }

            }

            $products_ = $products->get();

            foreach ($products_ as $product) {
                array_push($categories_ids_for_highlighting_categories, $product->productInformation->category->id);
            }

            if ($current_route_name == 'user.sale.off.products') {

                $products = $products_;

            } elseif ($current_route_name == 'user.products') {

                $products = $products->paginate(12);

            }

            $unique_categories_ids_for_highlighting_categories = self::get_unique_categories_ids_for_highlighting_categories($categories_ids_for_highlighting_categories);

            $products = ProductResource::collection($products);

            if ($current_route_name == 'user.products') {

                $products->additional([
                    'all_ok' => 'yes',
                    'unique_categories_ids_for_highlighting_categories' => $unique_categories_ids_for_highlighting_categories,
                ]);

                return $products;

            } elseif ($current_route_name == 'user.sale.off.products') {

                return response([
                    'all_ok' => 'yes',
                    'products' => $products,
                    'unique_categories_ids_for_highlighting_categories' => $unique_categories_ids_for_highlighting_categories,

                ], 200);

            }

        } else {

            return response([
                'all_ok' => 'no',
                'message' => 'No Product Record!',
            ], 404);

        }

    }

}
