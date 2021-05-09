<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pelanggan extends Model
{
    //
    protected $table = 'tblPelanggan';

    protected $fillable = [
        'kodePelanggan', 'namaPelanggan', 'alamatPelanggan', 'noTlp', 'diskonPelanggan'
    ];
}
