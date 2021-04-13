<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class GrandJualDetail extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblGrandJualDetail', function (Blueprint $table) {
            $table->id();
            $table->string('kdGrandJual');
            $table->string('tglGrandJual');
            $table->string('noNotaPenjualan');
            $table->string('totalGrandJual');
            $table->string('pembayaranGrandJual');
            $table->string('userGrandJual');
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
        Schema::dropIfExists('tblGrandJualDetail');
    }
}
