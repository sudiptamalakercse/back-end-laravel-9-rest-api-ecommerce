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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_information_id');
            $table->foreign('product_information_id')->references('id')->on('product_informations');
            $table->integer('minimum_quantity');
            $table->float('minimum_quantity_buying_price', 8, 2);
            $table->float('minimum_quantity_selling_price', 8, 2);
            $table->unsignedBigInteger('unit_id');
            $table->foreign('unit_id')->references('id')->on('units');
            $table->integer('discount_in_percent')->default(0);
            $table->integer('stock');
            $table->boolean('is_shipping_free')->default(0);
            $table->unsignedBigInteger('shipping_id');
            $table->foreign('shipping_id')->references('id')->on('shippings');
            $table->unsignedBigInteger('product_size_id')->nullable();
            $table->foreign('product_size_id')->references('id')->on('product_sizes');
            $table->unsignedBigInteger('product_color_id')->nullable();
            $table->foreign('product_color_id')->references('id')->on('product_colors');
            $table->unsignedBigInteger('admin_id');
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
        Schema::dropIfExists('products');
    }
};
