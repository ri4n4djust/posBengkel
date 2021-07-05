<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBarangsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblBarang', function (Blueprint $table) {
            $table->id();
            $table->string('kdBarang');
            $table->string('barcode')->nullable();
            $table->string('nmBarang');
            $table->double('hrgPokok');
            $table->double('hrgJual');
            $table->char('ktgBarang');
            $table->char('satuanBarang');
            $table->char('merek');
            $table->char('stkBarang')->nullable();
            $table->char('stkSatuan')->nullable();
            $table->char('qtyMin');
            $table->char('qtyMax');
            $table->text('deskripsi')->nullable();
            $table->char('gmbrBarang')->nullable();
            $table->char('kategoriSp')->nullable();
            $table->char('noSp')->nullable();
            $table->char('cPokok')->nullable();
            $table->char('cJual')->nullable();
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
        Schema::dropIfExists('tblBarang');
    }
}
