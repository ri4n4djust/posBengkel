<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JenisMotor extends Model
{
    //
    protected $table = 'tblJenisMotor';

    protected $fillable = [
        'kdMerek', 'kdJenis', 'nmJenis'

    ];
}
