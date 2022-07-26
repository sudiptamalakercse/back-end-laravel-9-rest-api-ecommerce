<?php

namespace App\Http\Resources\Both;

use App\Custom_Services\Service1;
use App\Http\Resources\Both\ProductColorResource;
use App\Http\Resources\Both\ProductImgResource;
use App\Http\Resources\Both\ProductInformationResource;
use App\Http\Resources\Both\ReviewResource;
use App\Models\Review;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     *
     */
    private $total_product_reviews = 0;

    private function is_stock_available()
    {
        if ($this->stock > 0) {
            return "Yes";
        } else {
            return "No";
        }
    }

    private function product_imgs()
    {
        $current_route_name = Route::currentRouteName();

        if (Auth::guard('admin')->check()) {

            return ProductImgResource::collection($this->productImgs);

        } elseif ($current_route_name == 'both.product.detail') {

            return ProductImgResource::collection($this->productImgs()->limit(4)->get());

        } else {

            return ProductImgResource::collection($this->productImgs()->limit(1)->get());

        }
    }

    private function product_reviews()
    {
        $current_route_name = Route::currentRouteName();

        $review_collection = ReviewResource::collection($this->reviews()->where('review', '!=', null)->orderBy('id', 'DESC')->get());

        $this->total_product_reviews = $review_collection->count();

        if (Auth::guard('admin')->check()) {

            return $review_collection;

        } elseif ($current_route_name == 'both.product.detail') {

            return ReviewResource::collection($this->reviews()->where('review', '!=', null)->orderBy('id', 'DESC')->limit(Service1::$last_n_records_of_reviews_table)->get());

        } else {

            return $review_empty_collection = collect(new Review);

        }
    }

    private function product_average_stars($reviews)
    {
        $total_stars = $reviews->sum('star');
        $total_records = $reviews->count();
        if ($total_records > 0) {
            return $average_stars = ceil($total_stars / $total_records);
        } else {
            return $average_stars = 0;
        }
    }

    public function toArray($request)
    {
        $reviews = $this->reviews();

        $product_imgs_collection = $this->product_imgs();

        $product_reviews_collection = $this->product_reviews();

        $product_average_stars = $this->product_average_stars($reviews);

        return [
            'id' => $this->id,
            'product_information' => new ProductInformationResource($this->productInformation),
            'minimum_quantity' => $this->minimum_quantity,
            'unit' => $this->unit,
            'minimum_quantity_buying_price' => $this->when(Auth::guard('admin')->check(), $this->minimum_quantity_buying_price),
            'minimum_quantity_selling_price' => $this->minimum_quantity_selling_price,
            'discount_in_percent' => $this->discount_in_percent,
            'minimum_quantity_selling_price_after_discount' => $minimum_quantity_selling_price_after_discount = Service1::get_minimum_quantity_selling_price_after_discount(minimum_quantity_selling_price:$this->minimum_quantity_selling_price, discount_in_percent:$this->discount_in_percent),
            'stock' => $this->when(Auth::guard('admin')->check(), $this->stock),
            'is_stock_available' => $this->is_stock_available(),
            'is_shipping_free' => Service1::yes_or_no($this->is_shipping_free),
            'shipping' => $this->shipping,
            'product_size' => $this->whenNotNull($this->productSize),
            'product_color' => $this->when($this->product_color_id != null, new ProductColorResource($this->productColor)),
            'admin' => $this->when(Auth::guard('admin')->check(), $this->admin),
            'product_imgs' => $this->when(Service1::show_collection_or_not($product_imgs_collection), $product_imgs_collection),
            'product_reviews' => $this->when(Service1::show_collection_or_not($product_reviews_collection), $product_reviews_collection),
            'total_product_reviews' => $this->total_product_reviews,
            'product_average_stars' => $product_average_stars,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,

        ];
    }
}
