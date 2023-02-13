<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCorporateWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('corporate_wallets', function (Blueprint $table) {
            $table->id();
            $table->integer('corporate_id')->unsigned();
            $table->foreign('corporate_id')->references('id')->on('corporates');
            $table->decimal('amount', 7, 2);
            $table->string('currency_code',10);
            $table->foreign('currency_code')->references('code')->on('currency');
            $table->text('paykey')->nullable();
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
        Schema::dropIfExists('corporate_wallets');
    }
}
