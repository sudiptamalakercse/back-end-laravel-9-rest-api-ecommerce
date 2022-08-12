<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductOrder extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_detail',
        'billing_detail_id',
        'payment_type',
        'payment_status',
        'transaction_id',
        'product_coming',
        'product_receiving',
        'product_received',
        'admin_id',
        'is_canceled',
    ];

    public function billingDetail()
    {
        return $this->belongsTo(BillingDetail::class);
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class);
    }
}
