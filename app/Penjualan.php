<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Penjualan extends Model
{
    //
    protected $table = 'tblPenjualan';

    protected $fillable = [
        'noNota','userNota', 'liftNo', 'tglNota', 'totalNota', 'totalPokok', 'bayarNota', 'kembalianNota', 'pelangganNota', 'taxNota', 'diskonNota', 'mekanikNota', 
        'piutangNota', 'typeNota', 'termNota', 'jthTempoNota', 'chargeNota', 'typeBayarNota'
    ];
}
