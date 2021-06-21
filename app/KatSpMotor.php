<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KatSpMotor extends Model
{
    //
    protected $table = 'tblKatSpMotor';

    protected $fillable = [
        'kdMerek', 'kdJenis', 'kdType', 'kdTahun', 'kdKatSp', 'nmKatSp'

    ];
}
