<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PenjualanDetail extends Model
{
    //
    protected $table = 'tblPenjualanDetail';

    protected $fillable = [
        'noNotaPenjualan', 'kdBarang', 'hrgJual', 'qtyJual', 'totalJual', 'satuanJual', 
        'tglPenjualan', 'nmBarangJual'
    ];
}
