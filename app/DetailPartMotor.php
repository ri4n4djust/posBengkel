<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailPartMotor extends Model
{
    //
    protected $table = 'tblDetailPartMotor';

    protected $fillable = [
        'kdDetail', 'kdType', 'kdTahun', 'nmDetail', 'warnaDetail', 'gbrDetail'

    ];
}
