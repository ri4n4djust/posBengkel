<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePelanggansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblPelanggan', function (Blueprint $table) {
            $table->id();
            $table->char('kodePelanggan');
            $table->char('namaPelanggan');
            $table->char('alamatPelanggan');
            $table->char('noTlp');
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
        Schema::dropIfExists('tblPelanggan');
    }
}
