<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGrandJualsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblGrandJual', function (Blueprint $table) {
            $table->id();
            $table->string('kdGrandJual');
            $table->string('tglGrandJual');
            $table->string('kodePelanggan');
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
        Schema::dropIfExists('tblGrandJual');
    }
}
