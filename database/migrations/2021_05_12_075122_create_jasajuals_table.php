<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJasajualsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblDetailJasaJual', function (Blueprint $table) {
            $table->id();
            $table->string('noNotaPenjualan');
            $table->string('kdJasa');
            $table->string('namaJasa');
            $table->string('biayaJasa');
            $table->string('qtyJasa');
            $table->string('totalJasa');
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
        Schema::dropIfExists('tblDetailJasaJual');
    }
}
