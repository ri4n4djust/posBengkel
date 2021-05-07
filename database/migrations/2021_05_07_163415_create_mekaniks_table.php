<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMekaniksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblMekanik', function (Blueprint $table) {
            $table->id();
            $table->string('kdMekanik');
            $table->string('namaMekanik');
            $table->string('alamatMekanik');
            $table->string('noTlpMekanik');
            $table->string('jabatanMekanik');
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
        Schema::dropIfExists('tblMenkanik');
    }
}
