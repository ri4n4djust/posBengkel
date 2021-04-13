<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GrandJual extends Model
{
    //
    protected $table = 'tblGrandJual';
    protected $fillable = [
        'kdGrandJual', 'tglGrandJual', 'kodePelanggan', 'totalGrandJual', 'pembayaranGrandJual',
        'userGrandJual'
        
    ];
}
