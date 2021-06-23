<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailPartMotor extends Model
{
    //
    protected $table = 'tblDetailPartMotor';

    protected $fillable = [
        'kdDetail', 'kdDetailMotor', 'kdType', 'kdTahun', 'nmDetail', 'warnaDetail', 'gbrDetail'

    ];
}
