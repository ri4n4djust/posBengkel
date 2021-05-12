<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Jasa extends Model
{
    //
    protected $table = 'tblJasa';
    protected $fillable = [
        'kdJasa', 'namaJasa', 'desJasa', 'biayaJasa'
        
    ];
}
