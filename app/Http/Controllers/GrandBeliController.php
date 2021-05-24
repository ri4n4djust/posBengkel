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

    public function laporanGrandJual(){
        $post = GrandJual::join('tblPelanggan', 'tblGrandJual.kodePelanggan', 'tblPelanggan.kodePelanggan')
                            ->select('tblGrandJual.*', 'tblPelanggan.namaPelanggan')
                            ->get();
        return response()->json([
            'success' => true,
            'message' => 'Detail Post!',
            'data'    => $post
        ], 200);
    }

    public function detailGrandJual($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = GrandJualDetail::where('kdGrandJual', $id)
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
        
        $post = GrandJual::findOrFail($id);

        $noGrandJual = $post->kdGrandJual;

        $post1 = GrandJualDetail::where('kdGrandJual', $noGrandJual)->first();
        $noGJ = $post1->kdGrandJual;
        $totalGJ = $post1->totalGrandJual;
        //$satuanJual = $post->satuanJual;

        $pjl = DB::table('tblPenjualan')->where('noNota', $noGJ)->first();
        $PiutangLama = $pjl->piutangNota;
        DB::table('tblPenjualan')->where('noNota', $noGJ)->update([
                'piutangNota'     => $piutangLama + $totalGJ
        ]);
        GrandJualDetail::where('kdGrandJual', $noGJ)->delete();
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
