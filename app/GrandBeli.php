<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GrandBeli extends Model
{
    //
    protected $table = 'tblGrandBeli';
    protected $fillable = [
        'kdGrandBeli', 'tglGrandBeli', 'kdSupplier', 'totalGrandBeli', 'pembayaranGrandBeli',
        'userGrandBeli'
        
    ];
}
