<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TblKatSpMotor extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblKatSpMotor', function (Blueprint $table) {
            $table->id();
            $table->string('kdMerek');
            $table->string('kdJenis');
            $table->string('kdType');
            $table->string('kdTahun');
            $table->string('kdKatSp');
            $table->string('nmKatSp');
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
    }
}
