<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GrandJualDetail extends Model
{
    //
    protected $table = 'tblGrandJualDetail';
    protected $fillable = [
        'kdGrandJual', 'tglGrandJual', 'noNotaPenjualan', 'totalGrandJual', 'pembayaranGrandJual',
        'userGrandJual'
    ];
}
