<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingsTimeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings_time', function (Blueprint $table) {
            $table->id();
            $table->integer('policy_id')->unsigned()->nullable();
            $table->foreign('policy_id')->references('id')->on('policies')->onDelete('cascade');
            $table->string('day');
            $table->string('morning');
            $table->string('afternoon');
            $table->string('evening');
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
        Schema::dropIfExists('bookings_time');
    }
}
