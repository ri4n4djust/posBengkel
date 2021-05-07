<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lift extends Model
{
    //
    protected $table = 'tblLift';

    protected $fillable = [
        'kdLift', 'noLift', 'mekanikLift', 'statusLift'

    ];
}
