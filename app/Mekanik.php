<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mekanik extends Model
{
    //
    protected $table = 'tblMekanik';

    protected $fillable = [
        'kdMekanik', 'namaMekanik', 'alamatMekanik', 'noTlpMekanik', 'jabatanMekanik'

    ];
}
