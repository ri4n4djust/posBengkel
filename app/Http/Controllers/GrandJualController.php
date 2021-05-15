<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\GrandJualDetail;

class GrandJualController extends Controller
{
    //
    public function insertGrandJual(Request $request){
        $tmpTrx ='';
        $dataSet = [];
        foreach ($tmpTrx as $s) {
            $dataSet[] = [
                'noNota'  => $request->input('noNota'),
                'noMeja'    => $s->noMejaTmp,
                'kdBarang'       => $s->kdBarangTmp,
                'hrgJual' => $s->hrgJualTmp,
                'qty' => $s->qtyTmp,
                'total' => $s->totalTmp,
                'type' => $s->typeTmp,
                'nmBarang' =>$s->nmBarangTmp, 
            ];
        }
        GrandJualDetail::insert($dataSet);
    }
}
