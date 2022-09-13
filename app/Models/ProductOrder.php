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
        'payment_intent_id_for_refund',
        'product_coming',
        'product_receiving',
        'product_received',
        'is_canceled',
        'admin_id',
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
