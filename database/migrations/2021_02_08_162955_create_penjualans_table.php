<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenjualansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblPenjualan', function (Blueprint $table) {
            $table->id();
            $table->string('noNota');
            $table->string('liftNo')->nullable();
            $table->string('pelangganNota');
            $table->string('tglNota');
            $table->string('totalNota');
            $table->string('totalPokok');
            $table->string('taxNota');
            $table->string('diskonNota');
            $table->string('bayarNota');
            $table->string('chargeNota');
            $table->string('kembalianNota');
            $table->string('userNota');
            $table->string('typeBayarNota');
            $table->string('mekanikNota')->nullable();
            $table->string('typeNota')->nullable();
            $table->string('termNota')->nullable();
            $table->integer('piutangNota')->nullable();
            $table->string('jthTempoNota')->nullable();
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
        Schema::dropIfExists('tblPenjualan');
    }
}
