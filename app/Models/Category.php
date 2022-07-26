<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $table = 'categories';

    protected $fillable = [
        'name',
        'img',
        'is_size_available',
        'is_color_available',
    ];

    public function productInformations()
    {
        return $this->hasMany(ProductInformation::class);
    }
}
