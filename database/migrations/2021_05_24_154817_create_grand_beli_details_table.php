<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGrandBeliDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblGrandBeliDetail', function (Blueprint $table) {
            $table->id();
            $table->string('kdGrandBeli');
            $table->string('tglGrandBeli');
            $table->string('noNotaPembelian');
            $table->string('totalGrandBeli');
            $table->string('pembayaranGrandBeli');
            $table->string('userGrandBeli');
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
        Schema::dropIfExists('tblGrandBeli');
    }
}
