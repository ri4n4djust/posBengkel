<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailCatalog extends Model
{
    //
    protected $table = 'tblDetailKatalog';

    protected $fillable = [
        'kdKatSp', 'barcode', 'noBarang', 'nmBarang', 'qty'

    ];
}
