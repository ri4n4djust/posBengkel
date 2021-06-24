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
            $table->string('kdDetail');
            $table->string('kdDetailMotor');
            $table->string('kdKatSp');
            $table->string('nmKatSp');
            $table->string('gbrKatSp');
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
