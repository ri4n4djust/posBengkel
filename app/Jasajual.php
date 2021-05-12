<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Jasajual extends Model
{
    //
    protected $table = 'tblDetailJasaJual';
    protected $fillable = [
        'noNotaPenjualan', 'kdJasa', 'namaJasa', 'biayaJasa', 
        'qtyJasa', 'totalJasa', 'tglPenjualan'
        
    ];
}
