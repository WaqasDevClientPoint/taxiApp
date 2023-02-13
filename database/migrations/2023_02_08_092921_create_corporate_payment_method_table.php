<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCorporatePaymentMethodTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('corporate_payment_method', function (Blueprint $table) {
            $table->id();
            $table->integer('corporate_id')->unsigned();
            $table->foreign('corporate_id')->references('id')->on('corporates');
            $table->string('customer_id', 100)->nullable();
            $table->string('intent_id', 100)->nullable();
            $table->string('payment_method_id', 100)->nullable();
            $table->string('brand',20)->nullable();
            $table->string('last4',5)->nullable();
            $table->nullableTimestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('corporate_payment_method');
    }
}
