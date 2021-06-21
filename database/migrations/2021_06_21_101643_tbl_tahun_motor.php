<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TblTahunMotor extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tblTahunMotor', function (Blueprint $table) {
            $table->id();
            $table->string('kdMerek');
            $table->string('kdType');
            $table->string('kdJenis');
            $table->string('kdTahun');
            $table->string('nmTahun');
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
