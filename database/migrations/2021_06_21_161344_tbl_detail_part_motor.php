<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TblDetailPartMotor extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblDetailPartMotor', function (Blueprint $table) {
            $table->id();
            $table->string('kdDetail');
            $table->string('kdDetailMotor');
            $table->string('kdType');
            $table->string('kdTahun');
            $table->string('nmDetail');
            $table->string('warnaDetail');
            $table->string('gbrDetail');
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
