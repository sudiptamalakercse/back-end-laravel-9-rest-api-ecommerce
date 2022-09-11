<?php

namespace App\Http\Controllers;

use App\Custom_Services\AuthenticationService;
use App\Custom_Services\Service1;
use App\Custom_Services\UserControllerService;
use App\Http\Resources\Both\CategoryResource;
use App\Http\Resources\Both\ProductResource;
use App\Mail\EmailSend;
use App\Models\Category;
use App\Models\NewsLetter;
use App\Models\PasswordReset;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductSize;
use App\Models\User;
use App\Models\UserVerify;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    private $email_verification_code_expiration_time = 5;
    private $password_reset_code_expiration_time = 5;

    public function get_email_verification_code_expiration_time()
    {
        return $this->email_verification_code_expiration_time;
    }

    public function get_password_reset_code_expiration_time()
    {
        return $this->password_reset_code_expiration_time;
    }

    public function register(Request $request)
    {
        $email_verification_code_expiration_time = $this->email_verification_code_expiration_time;

        return AuthenticationService::register(password_class:Password::class, user_type_model_class:User::class, hash_class:Hash::class, user_type_verify_model_class:UserVerify::class, mail_class:Mail::class, email_send_class:EmailSend::class, request:$request, user_type_:'user', email_verification_code_expiration_time:$email_verification_code_expiration_time);
    }

    public function logout()
    {
        return AuthenticationService::logout(user_type_:'user');
    }

    public function login(Request $request)
    {
        return AuthenticationService::login(user_type_model_class:User::class, hash_class:Hash::class, request:$request, user_type_:'user');
    }

    public function verify_account(Request $request)
    {
        $email_verification_code_expiration_time = $this->email_verification_code_expiration_time;

        return AuthenticationService::verify_account(user_type_verify_model_class:UserVerify::class, hash_class:Hash::class, carbon_class:Carbon::class, request:$request, email_verification_code_expiration_time:$email_verification_code_expiration_time, user_type_:'user');
    }

    public function verify_account_email_resend(Request $request)
    {
        $email_verification_code_expiration_time = $this->email_verification_code_expiration_time;

        return AuthenticationService::verify_account_email_resend(user_type_verify_model_class:UserVerify::class, hash_class:Hash::class, mail_class:Mail::class, email_send_class:EmailSend::class, request:$request, user_type_:'user', email_verification_code_expiration_time:$email_verification_code_expiration_time);
    }

    public function forgot_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::forgot_password_handle(user_type_model_class:User::class, password_reset_model_class:PasswordReset::class, hash_class:Hash::class, mail_class:Mail::class, email_send_class:EmailSend::class, request:$request, user_type_:'user', password_reset_code_expiration_time:$password_reset_code_expiration_time);
    }

    public function password_reset_code_check_for_reset_password(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::password_reset_code_check_for_reset_password(password_reset_model_class:PasswordReset::class, hash_class:Hash::class, carbon_class:Carbon::class, request:$request, password_reset_code_expiration_time:$password_reset_code_expiration_time);
    }

    public function reset_password_handle(Request $request)
    {
        $password_reset_code_expiration_time = $this->password_reset_code_expiration_time;

        return AuthenticationService::reset_password_handle(password_reset_model_class:PasswordReset::class, hash_class:Hash::class, carbon_class:Carbon::class, user_type_model_class:User::class, request:$request, password_reset_code_expiration_time:$password_reset_code_expiration_time, user_type_:'user');
    }

    public function get_category_in_which_has_maximum_discount_for_product()
    {
        $product = Product::orderBy('discount_in_percent', 'desc')->first();

        $category = null;

        if ($product) {
            $category = $product->productInformation->category;
        }

        if ($category) {

            $category = new CategoryResource($category);
            $maximum_discount_in_percent = $product->discount_in_percent;

            return response([
                'all_ok' => 'yes',
                'category' => $category,
                'maximum_discount_in_percent' => $maximum_discount_in_percent,
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'No Record!',
            ], 404);
        }
    }

    public function get_catagories_of_popular_products($get_popular_unique_catagories_ids_array = false)
    {
        $unique_product_ids_and_occurrences = UserControllerService::get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table();

        if (count($unique_product_ids_and_occurrences) > 0) {

            //this array may contain duplicate category ids
            $categories_ids = [];

            foreach ($unique_product_ids_and_occurrences as $unique_product_id_and_occurrence) {
                $category = Product::find($unique_product_id_and_occurrence->product_id)->productInformation->category;
                array_push($categories_ids, $category->id);
            }

            //this array will contain single category ids
            $unique_categories_ids = array_unique($categories_ids);

            if ($get_popular_unique_catagories_ids_array == true) {
                return $unique_categories_ids;
            }

            //convert categories ids array in string with coma
            $unique_categories_ids_in_string_with_coma = implode(',', $unique_categories_ids);

            //find unique 4 or less categories from unique categories ids array
            $categories = Category::whereIn('id', $unique_categories_ids)
                ->orderByRaw(DB::raw("FIELD(id, $unique_categories_ids_in_string_with_coma)")) // order by given array of unique categories ids
                ->limit(4)
                ->get();

            $categories = CategoryResource::collection($categories);

            return response([
                'all_ok' => 'yes',
                'categories' => $categories,
            ], 200);

        } else {

            if ($get_popular_unique_catagories_ids_array == true) {
                return null;
            }

            return response([
                'all_ok' => 'no',
                'message' => 'No Category Record!',
            ], 404);
        }
    }

    public function get_popular_products_of_all_categories()
    {
        return UserControllerService::get_popular_products_of_all_categories_or_specific_category();
    }

    public function get_popular_products_of_specific_category($category_name)
    {
        return UserControllerService::get_popular_products_of_all_categories_or_specific_category(category_name:$category_name);
    }

    public function get_random_category()
    {
        $product = Product::inRandomOrder()->first();

        $category = null;

        if ($product) {
            $category = $product->productInformation->category;
        }

        if ($category) {

            $category = new CategoryResource($category);

            return response([
                'all_ok' => 'yes',
                'category' => $category,
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'No Category!',
            ], 404);
        }
    }

    public function get_category_in_which_has_second_maximum_discount_for_product()
    {
        $product = Product::orderBy('discount_in_percent', 'desc')
            ->offset(1)
            ->first();

        $category = null;

        if ($product) {
            $category = $product->productInformation->category;
        }

        if ($category) {

            $category = new CategoryResource($category);
            $second_maximum_discount_in_percent = $product->discount_in_percent;

            return response([
                'all_ok' => 'yes',
                'category' => $category,
                'second_maximum_discount_in_percent' => $second_maximum_discount_in_percent,
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'No Record!',
            ], 404);
        }
    }

    public function get_latest_products()
    {

        $products_show_per_category_in_latest_and_top_rated_and_review_products_section = 2;
        $categories_ids = [];
        $products_ids = [];

        $products = Product::orderBy('id', 'desc')
            ->get();

        if ($products->count() > 0) {

            foreach ($products as $product) {

                $result_in_array = UserControllerService::codes_1_get_number_of_occurrence_in_categories_ids_array_and_category_id(product:$product, categories_ids:$categories_ids);

                $number_of_occurrence_in_categories_ids_array = $result_in_array['number_of_occurrence_in_categories_ids_array'];
                $category_id = $result_in_array['category_id'];

                if ($number_of_occurrence_in_categories_ids_array < $products_show_per_category_in_latest_and_top_rated_and_review_products_section) {
                    array_push($categories_ids, $category_id);
                    array_push($products_ids, $product->id);
                }

            }

            $products = UserControllerService::codes_2_get_product_resource_collection(products_ids:$products_ids);

            return response([
                'all_ok' => 'yes',
                'products' => $products,
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'No Product Record!',
            ], 404);
        }
    }

    public function get_top_rated_products()
    {
        $products_show_per_category_in_latest_and_top_rated_and_review_products_section = 2;
        $categories_ids = [];
        $products_ids = [];

        $unique_product_ids_and_product_average_stars_by_maximum_product_average_stars_ordering_from_reviews_table = DB::table('reviews')
            ->select(DB::raw('product_id, ceil(AVG(star)) as product_average_stars'))
            ->groupBy('product_id')
            ->orderBy('product_average_stars', 'DESC')
            ->get();

        if ($unique_product_ids_and_product_average_stars_by_maximum_product_average_stars_ordering_from_reviews_table->count() > 0) {

            foreach ($unique_product_ids_and_product_average_stars_by_maximum_product_average_stars_ordering_from_reviews_table as $unique_product_id_and_product_average_star) {

                $product_id = $unique_product_id_and_product_average_star->product_id;

                $product = Product::find($product_id);

                $result_in_array = UserControllerService::codes_1_get_number_of_occurrence_in_categories_ids_array_and_category_id(product:$product, categories_ids:$categories_ids);

                $number_of_occurrence_in_categories_ids_array = $result_in_array['number_of_occurrence_in_categories_ids_array'];
                $category_id = $result_in_array['category_id'];

                if ($number_of_occurrence_in_categories_ids_array < $products_show_per_category_in_latest_and_top_rated_and_review_products_section) {
                    array_push($categories_ids, $category_id);
                    array_push($products_ids, $product->id);
                }

            }

            $products = UserControllerService::codes_2_get_product_resource_collection(products_ids:$products_ids);

            return response([
                'all_ok' => 'yes',
                'products' => $products,
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'No Product Record!',
            ], 404);
        }
    }

    public function get_review_products()
    {
        $products_show_per_category_in_latest_and_top_rated_and_review_products_section = 2;
        $categories_ids = [];
        $products_ids = [];

        $unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_where_review_not_equal_to_null_from_reviews_table = UserControllerService::get_unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_from_reviews_table(review_colum_null_check:true);

        if ($unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_where_review_not_equal_to_null_from_reviews_table->count() > 0) {

            foreach ($unique_product_ids_and_occurrences_by_maximum_occurrences_ordering_where_review_not_equal_to_null_from_reviews_table as $unique_product_id_and_occurrence) {

                $product_id = $unique_product_id_and_occurrence->product_id;

                $product = Product::find($product_id);

                $result_in_array = UserControllerService::codes_1_get_number_of_occurrence_in_categories_ids_array_and_category_id(product:$product, categories_ids:$categories_ids);

                $number_of_occurrence_in_categories_ids_array = $result_in_array['number_of_occurrence_in_categories_ids_array'];
                $category_id = $result_in_array['category_id'];

                if ($number_of_occurrence_in_categories_ids_array < $products_show_per_category_in_latest_and_top_rated_and_review_products_section) {
                    array_push($categories_ids, $category_id);
                    array_push($products_ids, $product->id);
                }

            }

            $products = UserControllerService::codes_2_get_product_resource_collection(products_ids:$products_ids);

            return response([
                'all_ok' => 'yes',
                'products' => $products,
            ], 200);

        } else {
            return response([
                'all_ok' => 'no',
                'message' => 'No Product Record!',
            ], 404);
        }
    }

    public function collect_email_for_newsletter(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email', 'max:255', 'unique:news_letters'],
        ]);

        $news_letter = NewsLetter::create([
            'email' => $request->email,
        ]);

        if ($news_letter) {

            return response([
                'all_ok' => 'yes',
                'messes' => 'Your Subscription is Done!',
            ], 201);

        } else {

            return response([
                'all_ok' => 'no',
                'messes' => 'Not Possible to Subscribe!',
            ], 403);

        }

    }

    public function get_sale_off_products($product_name, $product_category, $product_price_minimum, $product_price_maximum, $product_color, $product_size)
    {
        return UserControllerService::get_sale_off_products_or_products_or_latest_products(product_name:$product_name, product_category:$product_category, product_price_minimum:$product_price_minimum, product_price_maximum:$product_price_maximum, product_color:$product_color, product_size:$product_size);
    }

    public function get_products($product_name, $product_category, $product_price_minimum, $product_price_maximum, $product_color, $product_size, $sort_type)
    {
        return UserControllerService::get_sale_off_products_or_products_or_latest_products(product_name:$product_name, product_category:$product_category, product_price_minimum:$product_price_minimum, product_price_maximum:$product_price_maximum, product_color:$product_color, product_size:$product_size, sort_type:$sort_type);
    }

    public function get_latest_products2($product_name, $product_category, $product_price_minimum, $product_price_maximum, $product_color, $product_size)
    {
        return UserControllerService::get_sale_off_products_or_products_or_latest_products(product_name:$product_name, product_category:$product_category, product_price_minimum:$product_price_minimum, product_price_maximum:$product_price_maximum, product_color:$product_color, product_size:$product_size);
    }

    public function get_minimum_and_maximum_prices_from_session_unique_categories_ids_array()
    {
        $no_minimum_and_maximum_prices = false;

        $unique_categories_ids_for_highlighting_categories_session = session()->get('unique_categories_ids_for_highlighting_categories');

        if ($unique_categories_ids_for_highlighting_categories_session != null && count($unique_categories_ids_for_highlighting_categories_session) > 0) {

            $products = Product::whereRelation('productInformation', function ($query) use ($unique_categories_ids_for_highlighting_categories_session) {
                $query->whereRelation('category', function ($query) use ($unique_categories_ids_for_highlighting_categories_session) {

                    return $query->whereIn('id', $unique_categories_ids_for_highlighting_categories_session);

                });

            })->get();

            $price_list = [];

            foreach ($products as $product) {

                $minimum_quantity_selling_price_after_discount = Service1::get_minimum_quantity_selling_price_after_discount(minimum_quantity_selling_price:$product->minimum_quantity_selling_price, discount_in_percent:$product->discount_in_percent);

                array_push($price_list, $minimum_quantity_selling_price_after_discount);
            }

            if (count($price_list) > 0) {

                $minimum_product_price = min($price_list);
                $maximum_product_price = max($price_list);

            } else {
                $no_minimum_and_maximum_prices = true;
            }

        } else {
            $no_minimum_and_maximum_prices = true;

        }

        if ($no_minimum_and_maximum_prices == false) {

            return response([
                'all_ok' => 'yes',
                'minimum_product_price' => $minimum_product_price,
                'maximum_product_price' => $maximum_product_price,
            ], 200);

        } elseif ($no_minimum_and_maximum_prices == true) {

            return response([
                'all_ok' => 'no',
                'messes' => 'No Minimum and Maximum Prices!',
            ], 404);

        }
    }

    public function get_unique_product_colors_from_session_unique_categories_ids_array()
    {
        return UserControllerService::get_unique_product_colors_or_unique_product_sizes_from_session_unique_categories_ids_array(type:'color', product_color_or_product_size_model_class:ProductColor::class);
    }

    public function get_unique_product_sizes_from_session_unique_categories_ids_array()
    {
        return UserControllerService::get_unique_product_colors_or_unique_product_sizes_from_session_unique_categories_ids_array(type:'size', product_color_or_product_size_model_class:ProductSize::class);
    }

    public function add_product_to_cart($product_id, $product_quantity_want_to_order, $is_product_available_in_chart)
    {
        $product_id = intval($product_id);
        $product_quantity_want_to_order = intval($product_quantity_want_to_order);

        $product = Product::find($product_id);

        if (isset($product)) {

            $stock = $product->stock;

            $result = $stock - $product_quantity_want_to_order;

            $minimum_quantity_selling_price_after_discount = Service1::get_minimum_quantity_selling_price_after_discount(minimum_quantity_selling_price:$product->minimum_quantity_selling_price, discount_in_percent:$product->discount_in_percent);

            $product = new ProductResource($product);

            if ($result < 0) {

                $set_product_quantity_want_to_order = $stock;

                $set_total_product_price_want_to_order = UserControllerService::get_total_product_price_want_to_order(set_product_quantity_want_to_order:$set_product_quantity_want_to_order, minimum_quantity_selling_price_after_discount:$minimum_quantity_selling_price_after_discount);

                return response([
                    'all_ok' => 'no',
                    'product' => $product,
                    'set_product_quantity_want_to_order' => $set_product_quantity_want_to_order,
                    'set_total_product_price_want_to_order' => $set_total_product_price_want_to_order,
                    'is_product_available_in_chart' => $is_product_available_in_chart,
                    'messes' => 'Product is Limited or Stock Out!',
                ], 422);

            } else {

                $set_product_quantity_want_to_order = $product_quantity_want_to_order;

                $set_total_product_price_want_to_order = UserControllerService::get_total_product_price_want_to_order(set_product_quantity_want_to_order:$set_product_quantity_want_to_order, minimum_quantity_selling_price_after_discount:$minimum_quantity_selling_price_after_discount);

                return response([
                    'all_ok' => 'yes',
                    'product' => $product,
                    'set_product_quantity_want_to_order' => $set_product_quantity_want_to_order,
                    'set_total_product_price_want_to_order' => $set_total_product_price_want_to_order,
                    'is_product_available_in_chart' => $is_product_available_in_chart,
                    'messes' => 'Product will be Added to Cart!',
                ], 200);

            }

        } else {

            return response([
                'all_ok' => 'no',
                'product_id' => $product_id,
                'is_product_available_in_chart' => $is_product_available_in_chart,
                'messes' => 'Product is Not Found!',
            ], 404);

        }
    }

    public function add_product_to_favorite($product_id, $is_product_available_in_favorite)
    {
        $product_id = intval($product_id);

        $product = Product::find($product_id);

        if (isset($product)) {

            $product = new ProductResource($product);

            return response([
                'all_ok' => 'yes',
                'product' => $product,
                'is_product_available_in_favorite' => $is_product_available_in_favorite,
                'messes' => 'Product will be Added to Favorite!',
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'product_id' => $product_id,
                'is_product_available_in_favorite' => $is_product_available_in_favorite,
                'messes' => 'Product is Not Found!',
            ], 404);

        }
    }

    public function get_related_products($product_id)
    {
        $product = Product::find($product_id);

        if (isset($product)) {

            $category_id = $product->productInformation->category->id;

            $products = Product::whereRelation('productInformation', function ($query) use ($category_id) {
                $query->whereRelation('category', function ($query) use ($category_id) {

                    return $query->where('id', $category_id);

                });

            })->where('id', '!=', $product_id)
                ->inRandomOrder()
                ->limit(4)
                ->get();
        }

        if (isset($products) && count($products) > 0) {

            $products = ProductResource::collection($products);

            return response([
                'all_ok' => 'yes',
                'products' => $products,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'messes' => 'Products Not Found!',
            ], 404);

        }

    }

    public function get_discount_on_products_for_coupon_code($coupon_code)
    {
        $discount = Discount::where('code', $coupon_code)->first();

        if (isset($discount)) {

            $discount_in_percent = $discount->amount_in_percent;

            return response([
                'all_ok' => 'yes',
                'coupon_code' => $coupon_code,
                'discount_in_percent' => $discount_in_percent,
            ], 200);

        } else {

            return response([
                'all_ok' => 'no',
                'messes' => 'Coupon Code Not Found!',
            ], 404);

        }

    }

    public function place_order(Request $request)
    {
        $order_detail_in_json_string = $request->order_detail;

        $order_detail_in_associative_array = json_decode($order_detail_in_json_string, true);

        if ($order_detail_in_associative_array != null && gettype($order_detail_in_associative_array) == 'array') {

            if ($order_detail_in_associative_array['total_product_selling_price'] == 0) {

                return response([
                    'all_ok' => 'no',
                    'messes' => 'Add Product Item to Cart with Minimum Quantity 1!',
                ], 422);
            }

            $all_correct = UserControllerService::cart_validation($order_detail_in_associative_array);

            if ($all_correct == false) {

                return response([
                    'all_ok' => 'no',
                    'messes' => 'Clear Cart!',
                ], 422);

            } else {

                //start

                $result_in_associative_array = UserControllerService::product_quantity_want_to_order_stock_availability_check($order_detail_in_associative_array);

                $all_correct = $result_in_associative_array['all_correct'];

                if ($all_correct == false) {

                    $new_order_detail_in_associative_array = $result_in_associative_array['new_order_detail_in_associative_array'];

                    return response([
                        'all_ok' => 'no',
                        'cart' => $new_order_detail_in_associative_array,
                        'messes' => 'Cart is Reseted Because Product Stock is Limited or Stock Out!',
                    ], 422);

                } else {

                    return 'Ok';
                }

            }
        } else {
            return response([
                'all_ok' => 'no',
                'messes' => 'Order Detail is Required!',
            ], 422);
        }

        // $order_detail_in_json_string = json_encode($order_detail_in_associative_array);

    }

}
