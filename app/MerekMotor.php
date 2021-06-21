<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MerekMotor extends Model
{
    //
    protected $table = 'tblMerekMotor';

    protected $fillable = [
        'kdMerek', 'nmMerek'

    ];
}
