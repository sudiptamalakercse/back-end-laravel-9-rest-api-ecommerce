<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductInformation extends Model
{
    use HasFactory;

    protected $table = 'product_information';

    protected $fillable = [
        'name',
        'detail',
        'information',
        'category_id',
    ];

}
