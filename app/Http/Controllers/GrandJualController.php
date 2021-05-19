<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\GrandJualDetail;

class GrandJualController extends Controller
{
    //
    public function insert(Request $request){
        //$dataSet = $request->input('datas');
        
        //GrandJualDetail::insert($dataSet);
    //$array = $request->all();
    //foreach($array["datas"] as $row)
    //{
        GrandJualDetail::create(['kdGrandJual'      => $request->input('kdGrandJual'),
                            'tglGrandJual'   => $request->input('tglNota'),
                            'noNotaPenjualan'      => $request->input('noNota'),
                            'totalGrandJual'       => $request->input('bayar'),
                            'pembayaranGrandJual'       => $request->input('bayar'),
        ]);

    //}
    }
}
