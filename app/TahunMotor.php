<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TahunMotor extends Model
{
    //
    protected $table = 'tblTahunMotor';

    protected $fillable = [
        'kdMerek', 'kdJenis', 'kdType', 'kdTahun', 'nmTahun'

    ];
}
