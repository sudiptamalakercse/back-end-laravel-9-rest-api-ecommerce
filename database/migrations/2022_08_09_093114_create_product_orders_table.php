<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_orders', function (Blueprint $table) {
            $table->id();
            $table->longText('order_detail');
            $table->unsignedBigInteger('billing_detail_id');
            $table->foreign('billing_detail_id')->references('id')->on('billing_details');
            $table->string('payment_type');
            $table->boolean('payment_status')->default(0);
            $table->text('transaction_id');
            $table->boolean('product_coming')->default(0);
            $table->boolean('product_receiving')->default(0);
            $table->boolean('product_received')->default(0);
            $table->boolean('is_canceled')->default(0);
            $table->unsignedBigInteger('admin_id')->nullable();
            $table->foreign('admin_id')->references('id')->on('admins');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_orders');
    }
};
