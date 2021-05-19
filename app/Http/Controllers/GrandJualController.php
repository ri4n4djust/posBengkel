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
