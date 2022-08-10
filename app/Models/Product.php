<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'detail',
        'information',
        'minimum_quantity',
        'unit_id',
        'minimum_quantity_price',
        'discount_in_percent',
        'stock',
        'is_shipping_free',
        'shipping_id',
        'category_id',
        'product_size_id',
        'product_color_id',
        'admin_id',
    ];

}
