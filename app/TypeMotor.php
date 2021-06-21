<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TypeMotor extends Model
{
    //
    protected $table = 'tblTypeMotor';

    protected $fillable = [
        'kdMerek', 'kdJenis', 'kdType', 'nmType'

    ];
}
