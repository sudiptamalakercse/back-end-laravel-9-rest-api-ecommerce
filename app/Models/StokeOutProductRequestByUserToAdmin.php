<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StokeOutProductRequestByUserToAdmin extends Model
{
    use HasFactory;

    protected $fillable = [
        'quantity',
        'product_id',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
