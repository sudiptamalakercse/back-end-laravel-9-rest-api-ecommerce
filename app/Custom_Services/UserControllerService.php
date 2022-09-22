<?php

namespace App\Custom_Services;

use App\Custom_Services\Service1;
use App\Http\Controllers\UserController;
use App\Http\Resources\Both\ProductResource;
use App\Models\BillingDetail;
use App\Models\Discount;
use App\Models\Product;
use App\Models\ProductOrder;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

class UserControllerService
{

    public static $delivery_charge_per_product_item = 200;

    public static function get_authenticate_user_id()
    {
        $user = auth('user')->user();
        return $user_id = $user->id;
    }

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

        } elseif ($current_route_name == 'user.latest.products2') {

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

    public static function get_sale_off_products_or_products_or_latest_products($product_name, $product_category, $product_price_minimum, $product_price_maximum, $product_color, $product_size, $sort_type = "''")
    {
        $product_ids_list = [];

        //this may contain duplicate values
        $categories_ids_for_highlighting_categories = [];

        if ($product_price_minimum == "''") {
            $product_price_minimum = 0.0;
        } else {
            $product_price_minimum = floatval($product_price_minimum);
        }

        if ($product_price_maximum == "''") {
            $product_price_maximum = Product::max('minimum_quantity_selling_price');
        } else {
            $product_price_maximum = floatval($product_price_maximum);
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

            $products = $products->get();

            foreach ($products as $product) {

                $minimum_quantity_selling_price_after_discount = Service1::get_minimum_quantity_selling_price_after_discount(minimum_quantity_selling_price:$product->minimum_quantity_selling_price, discount_in_percent:$product->discount_in_percent);

                if (($minimum_quantity_selling_price_after_discount >= $product_price_minimum) && ($minimum_quantity_selling_price_after_discount <= $product_price_maximum)) {

                    array_push($product_ids_list, $product->id);

                }

            }

            $products = Product::whereIn('id', $product_ids_list);

            if ($current_route_name != 'user.latest.products2') {

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

            } elseif ($current_route_name == 'user.latest.products2') {

                $products = $products->orderBy('id', 'DESC')->limit(6);

            }

            $products_ = $products->get();

            foreach ($products_ as $product) {
                array_push($categories_ids_for_highlighting_categories, $product->productInformation->category->id);
            }

            if ($current_route_name == 'user.sale.off.products' || $current_route_name == 'user.latest.products2') {

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

            } elseif ($current_route_name == 'user.sale.off.products' || $current_route_name == 'user.latest.products2') {

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

    public static function get_unique_product_colors_or_unique_product_sizes_from_session_unique_categories_ids_array($type, $product_color_or_product_size_model_class)
    {

        ${'no_unique_' . $type} = false;

        ${'unique_' . $type . '_ids'} = [];

        $upper_type = ucfirst($type);

        $unique_categories_ids_for_highlighting_categories_session = session()->get('unique_categories_ids_for_highlighting_categories');

        if ($unique_categories_ids_for_highlighting_categories_session != null && count($unique_categories_ids_for_highlighting_categories_session) > 0) {

            $products = Product::whereRelation('productInformation', function ($query) use ($unique_categories_ids_for_highlighting_categories_session) {
                $query->whereRelation('category', function ($query) use ($unique_categories_ids_for_highlighting_categories_session) {

                    return $query->whereIn('id', $unique_categories_ids_for_highlighting_categories_session);

                });

            })
                ->select('product_' . $type . '_id')->distinct()
                ->get();

            foreach ($products as $product) {
                array_push(${'unique_' . $type . '_ids'}, $product->{'product_' . $type . '_id'});
            }

            ${'product_' . $type . 's'} = $product_color_or_product_size_model_class::whereIn('id', ${'unique_' . $type . '_ids'})
                ->orderByRaw('LENGTH(name), name')
                ->get();

            if (count(${'product_' . $type . 's'}) > 0) {

            } else {
                ${'no_unique_' . $type} = true;
            }
        } else {
            ${'no_unique_' . $type} = true;
        }

        if (${'no_unique_' . $type} == false) {

            return response([
                'all_ok' => 'yes',
                'product_' . $type . 's' => ${'product_' . $type . 's'},

            ], 200);

        } elseif (${'no_unique_' . $type} == true) {

            return response([
                'all_ok' => 'no',
                'message' => 'No Unique' . $upper_type . '!',
            ], 404);

        }
    }

    public static function get_total_product_price_want_to_order($set_product_quantity_want_to_order, $minimum_quantity_selling_price_after_discount)
    {
        $set_total_product_price_want_to_order = $set_product_quantity_want_to_order * $minimum_quantity_selling_price_after_discount;
        return $set_total_product_price_want_to_order;
    }

    public static function cart_validation($order_detail_in_associative_array)
    {

        $product_list_want_to_order = $order_detail_in_associative_array['product_list'];

        $subtotal_product_price = 0;

        $discount_in_percent_on_subtotal_product_price_for_coupon_code = 0;

        $price_reduced_from_subtotal_product_price_for_coupon_code = 0;

        $product_delivery_charge = 0;

        $total_price_will_be_charged_from_card = 0;

        $total_product_selling_price = 0;

        $all_correct = true;

        foreach ($product_list_want_to_order as $product_want_to_order) {

            $product = Product::find($product_want_to_order['product_id']);

            if (!isset($product)) {
                $all_correct = false;
                break;
            }

            $product_img = $product->productImgs()->first();

            if (isset($product_img)) {

                $product_img = $product_img->img;
                $product_img = url('') . $product_img;

            }

            if ($product_img != $product_want_to_order['product_img']) {
                $all_correct = false;
                break;
            }

            $product_name = $product->productInformation->name;

            if ($product_name != $product_want_to_order['product_name']) {
                $all_correct = false;
                break;
            }

            if ($product->productSize != null) {
                $product_size = $product->productSize->name;
            } else {
                $product_size = null;
            }

            $is_product_size_exist = array_key_exists('product_size', $product_want_to_order);

            if ($is_product_size_exist == true) {

                $product_size_in_product_want_to_order = $product_want_to_order['product_size'];

            } elseif ($is_product_size_exist == false) {

                $product_size_in_product_want_to_order = null;

            }

            if ($product_size != $product_size_in_product_want_to_order) {
                $all_correct = false;
                break;
            }

            if ($product->productColor != null) {
                $product_color = $product->productColor->name;
                $product_color_img = url('') . $product->productColor->img;
            } else {
                $product_color = null;
                $product_color_img = null;
            }

            $is_product_color_exist = array_key_exists('product_color', $product_want_to_order);

            if ($is_product_color_exist == true) {

                $product_color_in_product_want_to_order = $product_want_to_order['product_color'];

            } elseif ($is_product_color_exist == false) {

                $product_color_in_product_want_to_order = null;

            }

            $is_product_color_img_exist = array_key_exists('product_color_img', $product_want_to_order);

            if ($is_product_color_img_exist == true) {

                $product_color_img_in_product_want_to_order = $product_want_to_order['product_color_img'];

            } elseif ($is_product_color_img_exist == false) {

                $product_color_img_in_product_want_to_order = null;

            }

            if ($product_color != $product_color_in_product_want_to_order) {
                $all_correct = false;
                break;
            }

            if ($product_color_img != $product_color_img_in_product_want_to_order) {
                $all_correct = false;
                break;
            }

            $is_shipping_free = Service1::yes_or_no($product->is_shipping_free);

            if ($is_shipping_free != $product_want_to_order['is_product_shipping_free']) {
                $all_correct = false;
                break;
            } else {

                $delivery_charge_per_product_item = self::$delivery_charge_per_product_item;

                if ($is_shipping_free == 'No') {
                    $product_delivery_charge = $product_delivery_charge + $delivery_charge_per_product_item;
                }
            }

            $minimum_quantity = $product->minimum_quantity;

            if ($minimum_quantity != $product_want_to_order['product_minimum_quantity']) {
                $all_correct = false;
                break;
            }

            $unit = $product->unit->type;

            if ($unit != $product_want_to_order['product_unit']) {
                $all_correct = false;
                break;
            }

            $minimum_quantity_selling_price = $product->minimum_quantity_selling_price;

            if ($minimum_quantity_selling_price != $product_want_to_order['product_minimum_quantity_selling_price']) {
                $all_correct = false;
                break;
            }

            $discount_in_percent = $product->discount_in_percent;

            if ($discount_in_percent != $product_want_to_order['product_discount_in_percent']) {
                $all_correct = false;
                break;
            }

            $minimum_quantity_selling_price_after_discount = Service1::get_minimum_quantity_selling_price_after_discount(minimum_quantity_selling_price:$minimum_quantity_selling_price, discount_in_percent:$discount_in_percent);

            if ($minimum_quantity_selling_price_after_discount != $product_want_to_order['product_minimum_quantity_selling_price_after_discount']) {
                $all_correct = false;
                break;
            }

            $total_product_price_want_to_order = ceil($minimum_quantity_selling_price_after_discount * $product_want_to_order['product_quantity_want_to_order']);

            if ($total_product_price_want_to_order != $product_want_to_order['total_product_price_want_to_order']) {
                $all_correct = false;
                break;
            }

            $subtotal_product_price = $subtotal_product_price + $total_product_price_want_to_order;

        }

        if ($all_correct == false) {
            $product_delivery_charge = 0;
            $subtotal_product_price = 0;
        }

        if ($subtotal_product_price != $order_detail_in_associative_array['subtotal_product_price']) {
            $all_correct = false;
        }

        if ($all_correct == false) {
            $subtotal_product_price = 0;
        }

        if ($order_detail_in_associative_array['coupon_code'] != null) {
            $discount = Discount::where('code', $order_detail_in_associative_array['coupon_code'])->first();
            if (!isset($discount)) {
                $all_correct = false;
            } else {
                $discount_in_percent_on_subtotal_product_price_for_coupon_code = $discount->amount_in_percent;
                if ($discount_in_percent_on_subtotal_product_price_for_coupon_code != $order_detail_in_associative_array['discount_in_percent_on_subtotal_product_price_for_coupon_code']) {
                    $all_correct = false;
                }
            }
        }

        if ($all_correct == false) {
            $discount_in_percent_on_subtotal_product_price_for_coupon_code = 0;
        } else {
            $price_reduced_from_subtotal_product_price_for_coupon_code = ceil(($discount_in_percent_on_subtotal_product_price_for_coupon_code / 100) * $subtotal_product_price);

            if ($price_reduced_from_subtotal_product_price_for_coupon_code != $order_detail_in_associative_array['price_reduced_from_subtotal_product_price_for_coupon_code']) {
                $all_correct = false;
            }
        }

        if ($all_correct == false) {
            $price_reduced_from_subtotal_product_price_for_coupon_code = 0;
        }

        $subtotal_product_price_after_coupon_code_discount = $subtotal_product_price - $price_reduced_from_subtotal_product_price_for_coupon_code;

        if ($subtotal_product_price_after_coupon_code_discount != $order_detail_in_associative_array['subtotal_product_price_after_coupon_code_discount']) {
            $all_correct = false;
        }

        if ($all_correct == false) {
            $subtotal_product_price_after_coupon_code_discount = 0;
        }

        if ($product_delivery_charge != $order_detail_in_associative_array['product_delivery_charge']) {
            $all_correct = false;
        }

        if ($all_correct == false) {
            $product_delivery_charge = 0;
        }

        $total_price_will_be_charged_from_card = $subtotal_product_price_after_coupon_code_discount + $product_delivery_charge;

        if ($total_price_will_be_charged_from_card != $order_detail_in_associative_array['total_price_will_be_charged_from_card']) {
            $all_correct = false;
        }

        if ($all_correct == false) {
            $total_price_will_be_charged_from_card = 0;
        }

        $total_product_selling_price = $subtotal_product_price_after_coupon_code_discount;

        if ($total_product_selling_price != $order_detail_in_associative_array['total_product_selling_price']) {
            $all_correct = false;
        }

        if ($all_correct == false) {
            $total_product_selling_price = 0;
        }

        return $all_correct;
    }

    public static function product_quantity_want_to_order_stock_availability_check($order_detail_in_associative_array)
    {

        $product_list_want_to_order = $order_detail_in_associative_array['product_list'];

        $new_order_detail_in_associative_array = $order_detail_in_associative_array;

        $subtotal_product_price = 0;

        $price_reduced_from_subtotal_product_price_for_coupon_code = 0;

        $subtotal_product_price_after_coupon_code_discount = 0;

        $product_delivery_charge = 0;

        $total_price_will_be_charged_from_card = 0;

        $total_product_selling_price = 0;

        foreach ($product_list_want_to_order as $key => $product_want_to_order) {

            $product = Product::find($product_want_to_order['product_id']);

            $stock = $product->stock;
            $product_quantity_want_to_order = $product_want_to_order['product_quantity_want_to_order'];

            $result = $stock - $product_quantity_want_to_order;

            if ($result < 0) {

                $product_quantity_want_to_order = $stock;

            }

            if ($product_quantity_want_to_order == 0) {
                unset($new_order_detail_in_associative_array['product_list'][$key]);
            } else {
                $new_order_detail_in_associative_array['product_list'][$key]['product_quantity_want_to_order'] = $product_quantity_want_to_order;
                $total_product_price_want_to_order = $product_quantity_want_to_order * $new_order_detail_in_associative_array['product_list'][$key]['product_minimum_quantity_selling_price_after_discount'];
                $new_order_detail_in_associative_array['product_list'][$key]['total_product_price_want_to_order'] = $total_product_price_want_to_order;
                $subtotal_product_price = $subtotal_product_price + $total_product_price_want_to_order;

                $delivery_charge_per_product_item = self::$delivery_charge_per_product_item;

                if ($product_want_to_order['is_product_shipping_free'] == 'No') {
                    $product_delivery_charge = $product_delivery_charge + $delivery_charge_per_product_item;
                }

            }

        }

        $new_order_detail_in_associative_array['subtotal_product_price'] = $subtotal_product_price;

        $price_reduced_from_subtotal_product_price_for_coupon_code = ceil(($new_order_detail_in_associative_array['discount_in_percent_on_subtotal_product_price_for_coupon_code'] / 100) * $subtotal_product_price);

        $new_order_detail_in_associative_array['price_reduced_from_subtotal_product_price_for_coupon_code'] = $price_reduced_from_subtotal_product_price_for_coupon_code;

        $subtotal_product_price_after_coupon_code_discount = $subtotal_product_price - $price_reduced_from_subtotal_product_price_for_coupon_code;

        $new_order_detail_in_associative_array['subtotal_product_price_after_coupon_code_discount'] = $subtotal_product_price_after_coupon_code_discount;

        $new_order_detail_in_associative_array['product_delivery_charge'] = $product_delivery_charge;

        $total_price_will_be_charged_from_card = $subtotal_product_price_after_coupon_code_discount + $product_delivery_charge;

        $new_order_detail_in_associative_array['total_price_will_be_charged_from_card'] = $total_price_will_be_charged_from_card;

        $total_product_selling_price = $subtotal_product_price_after_coupon_code_discount;

        $new_order_detail_in_associative_array['total_product_selling_price'] = $total_product_selling_price;

        $all_correct = $order_detail_in_associative_array == $new_order_detail_in_associative_array;

        return [
            'all_correct' => $all_correct,
            'new_order_detail_in_associative_array' => $new_order_detail_in_associative_array,
        ];
    }

    public static function payment_by_card($is_payment_complete, $user, $order_detail_in_associative_array, $payment_method_id)
    {
        try {
            $total_price_will_be_charged_from_card = $order_detail_in_associative_array['total_price_will_be_charged_from_card'] * 100;

            $customer = $user->createOrGetStripeCustomer();

            $payment = $user->charge(
                $total_price_will_be_charged_from_card,
                $payment_method_id
            );

            $payment_intent = $payment->asStripePaymentIntent();

            $payment_intent_id = $payment_intent->id;

            $transaction_id = $payment_intent->charges->data[0]->id;

            $total_payment_from_cart = $payment_intent->charges->data[0]->amount;

            $last_4_card_digits = $payment_intent->charges->data[0]->payment_method_details->card->last4;

            if ($total_payment_from_cart == $total_price_will_be_charged_from_card) {

                $is_payment_complete = true;
                $user->deletePaymentMethods();

            }

        } catch (Exception $e) {

            return $exception_message = $e->getMessage();

        }

        return [
            'total_payment_from_cart' => $total_payment_from_cart,
            'is_payment_complete' => $is_payment_complete,
            'transaction_id' => $transaction_id,
            'payment_intent_id' => $payment_intent_id,
            'last_4_card_digits' => $last_4_card_digits,
        ];
    }

    public static function get_order_detail_in_json_string_for_storting_in_order_table($order_detail_in_associative_array)
    {
        $product_list_want_to_order = $order_detail_in_associative_array['product_list'];

        $new_order_detail_in_associative_array = $order_detail_in_associative_array;

        $total_product_buying_price = 0;

        foreach ($product_list_want_to_order as $key => $product_want_to_order) {

            $product = Product::find($product_want_to_order['product_id']);

            $minimum_quantity_buying_price = $product->minimum_quantity_buying_price;

            $new_order_detail_in_associative_array['product_list'][$key]['product_minimum_quantity_buying_price'] = $minimum_quantity_buying_price;

            $new_order_detail_in_associative_array['product_list'][$key]['total_product_buying_price_want_to_order'] = $new_order_detail_in_associative_array['product_list'][$key]['product_minimum_quantity_buying_price'] * $new_order_detail_in_associative_array['product_list'][$key]['product_quantity_want_to_order'];

            $total_product_buying_price = $total_product_buying_price + $new_order_detail_in_associative_array['product_list'][$key]['total_product_buying_price_want_to_order'];

        }

        $new_order_detail_in_associative_array['total_product_buying_price'] = $total_product_buying_price;

        $new_order_detail_in_associative_array['total_profit_without_profit_from_delivery_charge'] = $new_order_detail_in_associative_array['total_product_selling_price'] - $new_order_detail_in_associative_array['total_product_buying_price'];

        $new_order_detail_in_associative_array['actual_product_delivery_charge'] = $new_order_detail_in_associative_array['product_delivery_charge'];

        $new_order_detail_in_associative_array['profit_from_delivery_charge'] = $new_order_detail_in_associative_array['product_delivery_charge'] - $new_order_detail_in_associative_array['actual_product_delivery_charge'];

        $new_order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge'] = $new_order_detail_in_associative_array['total_profit_without_profit_from_delivery_charge'] + $new_order_detail_in_associative_array['profit_from_delivery_charge'];

        $new_order_detail_in_associative_array['total_expense'] = $new_order_detail_in_associative_array['total_product_buying_price'] + $new_order_detail_in_associative_array['actual_product_delivery_charge'];

        $new_order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge_in_percentage'] = floor(($new_order_detail_in_associative_array['finally_total_profit_with_profit_from_delivery_charge'] / $new_order_detail_in_associative_array['total_expense']) * 100);

        $order_detail_in_json_string_for_storting_in_order_table = json_encode($new_order_detail_in_associative_array);

        return $order_detail_in_json_string_for_storting_in_order_table;

    }

    public static function store_data_in_billing_detail_and_order_table($user, $billing_details, $order_detail_in_associative_array, $payment_type, $payment_status, $transaction_id, $payment_intent_id_for_refund)
    {

        $billing_detail = new BillingDetail($billing_details);

        $user->billingDetails()->save($billing_detail);

        $order_detail_in_json_string_for_storting_in_order_table = self::get_order_detail_in_json_string_for_storting_in_order_table($order_detail_in_associative_array);

        $product_order = new ProductOrder([
            'order_detail' => $order_detail_in_json_string_for_storting_in_order_table,
            'payment_type' => $payment_type,
            'payment_status' => $payment_status,
            'transaction_id' => $transaction_id,
            'payment_intent_id_for_refund' => $payment_intent_id_for_refund,
        ]);

        $billing_detail->productOrder()->save($product_order);

        return $product_order;

    }
}
