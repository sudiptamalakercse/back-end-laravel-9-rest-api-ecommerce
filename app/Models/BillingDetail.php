<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillingDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'phone',
        'apartment',
        'street',
        'zip',
        'city',
        'state',
        'country',
        'order_note',
        'user_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function productOrder()
    {
        return $this->hasOne(ProductOrder::class);
    }
}
