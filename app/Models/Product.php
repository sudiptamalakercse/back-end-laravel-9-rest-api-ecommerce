<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_information_id',
        'minimum_quantity',
        'unit_id',
        'minimum_quantity_buying_price',
        'minimum_quantity_selling_price',
        'discount_in_percent',
        'stock',
        'is_shipping_free',
        'shipping_id',
        'product_size_id',
        'product_color_id',
        'admin_id',
    ];

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function shipping()
    {
        return $this->belongsTo(Shipping::class);
    }

    public function productSize()
    {
        return $this->belongsTo(ProductSize::class);
    }

    public function productColor()
    {
        return $this->belongsTo(ProductColor::class);
    }

}
