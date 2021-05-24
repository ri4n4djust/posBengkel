<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GrandBeliDetail extends Model
{
    //
    protected $table = 'tblGrandBeliDetail';
    protected $fillable = [
        'kdGrandBeli', 'tglGrandBeli', 'noNotaPembelian', 'totalGrandBeli', 'pembayaranGrandBeli',
        'userGrandBeli'
    ];
}
