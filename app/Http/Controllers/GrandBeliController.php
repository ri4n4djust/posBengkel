<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Pembelian;
use App\GrandBeli;
use App\GrandBeliDetail;

class GrandBeliController extends Controller
{
    //
    //
    public function insert(Request $request){
        GrandBeliDetail::create(['kdGrandBeli'      => $request->input('kdGrandBeli'),
                            'tglGrandBeli'   => $request->input('tglNotaPembelian'),
                            'noNotaPembelian'      => $request->input('noNotaPembelian'),
                            'totalGrandBeli'       => $request->input('bayar'),
                            'pembayaranGrandBeli'       => $request->input('typeBayarGrandBeli'),
                            'userGrandBeli'       => $request->input('user'),
        ]);
        $DPembelian = Pembelian::where('noNotaPembelian', $request->input('noNotaPembelian'))->first();
        $hutang = $DPembelian->hutangPembelian;
        $bayarNotaPembelian = $DPembelian->bayarNotaPembelian;

        Pembelian::where('noNotaPembelian', $request->input('noNotaPembelian'))->update([
            'hutangPembelian'     => $hutang - $request->input('bayar'),
            'bayarNotaPembelian'    => $bayarNotaPembelian + $request->input('bayar'),
        ]);

    
    }

    public function saveGrandBeli(Request $request){

        GrandBeli::create([
            'kdGrandBeli'   => $request->input('kdGrandBeli'),
            'tglGrandBeli'   => $request->input('tglGrandBeli'),
            'kdSupplier'   => $request->input('kdSupplier'),
            'pembayaranGrandBeli'   => $request->input('typeBayarGrandBeli'),
            'totalGrandBeli'   => $request->input('totalGrandBeli'),
            'userGrandBeli'       => $request->input('user'),

        ]);
    
    
    }

    public function laporanGrandBeli(){
        $post = GrandBeli::join('tblSupplier', 'tblGrandBeli.kdSupplier', 'tblSupplier.kdSupplier')
                            ->select('tblGrandBeli.*', 'tblSupplier.nmSupplier')
                            ->get();
        return response()->json([
            'success' => true,
            'message' => 'Detail Post!',
            'data'    => $post
        ], 200);
    }

    public function detailGrandBeli($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = GrandBeliDetail::where('kdGrandBeli', $id)
                    ->get();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'data'    => $post
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'data'    => ''
            ], 404);
        }
    }


    public function destroy1($id)
    {
        
        $post = GrandBeli::findOrFail($id);

        $noGrandBeli = $post->kdGrandJual;

        $post1 = GrandBeliDetail::where('kdGrandBeli', $noGrandBeli)->first();
        $noGB = $post1->kdGrandBeli;
        $totalGB = $post1->totalGrandBeli;
        //$satuanJual = $post->satuanJual;

        $pjl = DB::table('tblPembelian')->where('noNotaPembelian', $noGB)->first();
        $HutangLama = $pjl->hutangPembelian;
        DB::table('tblPembelian')->where('noNotaPembelian', $noGB)->update([
                'hutangPembelian'     => $HutangLama + $totalGB
        ]);
        GrandBeliDetail::where('kdGrandBeli', $noGB)->delete();
        //Jasajual::where('noNotaPenjualan', $noNotaPenjualan)->delete();        

        $post->delete();

        if ($post) {
            return response()->json([
                'success' => true,
                'message' => 'Post Berhasil Dihapus!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Gagal Dihapus!',
            ], 500);
        }
    }
}
