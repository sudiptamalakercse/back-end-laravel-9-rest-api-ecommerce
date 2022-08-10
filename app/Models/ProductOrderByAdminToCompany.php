<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductOrderByAdminToCompany extends Model
{
    use HasFactory;

    protected $fillable = [
        'quantity',
        'is_received',
        'product_id',
    ];
}
