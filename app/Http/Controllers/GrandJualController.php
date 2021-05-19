<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\GrandJualDetail;
use App\Penjualan;
use App\GrandJual;

class GrandJualController extends Controller
{
    //
    public function insert(Request $request){
        GrandJualDetail::create(['kdGrandJual'      => $request->input('kdGrandJual'),
                            'tglGrandJual'   => $request->input('tglNota'),
                            'noNotaPenjualan'      => $request->input('noNota'),
                            'totalGrandJual'       => $request->input('bayar'),
                            'pembayaranGrandJual'       => $request->input('typeBayarGrandJual'),
                            'userGrandJual'       => $request->input('user'),
        ]);
        $DPenjualan = Penjualan::where('noNota', $request->input('noNota'))->first();
        $piutang = $DPenjualan->piutangNota;

        Penjualan::where('noNota', $request->input('noNota'))->update([
            'piutangNota'     => $piutang - $request->input('bayar'),
        ]);

    
    }

    public function saveGrandJual(Request $request){

        GrandJual::create([
            'kdGrandJual'   => $request->input('kdGrandJual'),
            'tglGrandJual'   => $request->input('tglGrandJual'),
            'kodePelanggan'   => $request->input('kodePelanggan'),
            'pembayaranGrandJual'   => $request->input('typeBayarGrandJual'),
            'totalGrandJual'   => $request->input('totalGrandJual'),
            'userGrandJual'       => $request->input('user'),

        ]);
    
    
    }
}
