<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Motor extends Model
{
    //
    protected $table = 'tblMotor';

    protected $fillable = [
        'kdMotor', 'platMotor', 'namaMotor', 'pemilikMotor'

    ];
}
