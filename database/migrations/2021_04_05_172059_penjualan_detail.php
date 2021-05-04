<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class PenjualanDetail extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblPenjualanDetail', function (Blueprint $table) {
            $table->id();
            $table->string('noNotaPenjualan');
            $table->string('kdBarang');
            $table->string('hrgJual');
            $table->string('qtyJual');
            $table->string('satuanJual');
            $table->string('totalJual');
            $table->string('tglPenjualan');
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
        //
        Schema::dropIfExists('tblPenjualanDetail');
    }
}
