<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PembelianDetail;
use App\Pembelian;
use App\KartuStok;
use App\KartuStokInventori;
use App\Inventori;
use Carbon\Carbon;

use Illuminate\Support\Facades\DB;

class pembelianController extends Controller
{
    //
    public function index()
    {
        $posts = Pembelian::join('tblSupplier', 'tblPembelian.idSupplier', '=', 'tblSupplier.kdSupplier')
                            ->select('tblPembelian.*', 'tblSupplier.nmSupplier')
                            ->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'data' => $posts
        ], 200);
    }

    public function laporanHutang()
    {
        $posts = Pembelian::join('tblSupplier', 'tblPembelian.idSupplier', 'tblSupplier.kdSupplier')
                ->join('users', 'tblPembelian.userPembelian', 'users.id')
                ->where('tblPembelian.hutangPembelian', '!=', '0' )
                ->select('tblPembelian.*', 'tblSupplier.nmSupplier', 'users.name')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'data' => $posts
        ], 200);
    }

    public function hutangSupplier(Request $request)
    {
        $posts = Pembelian::join('tblSupplier', 'tblPembelian.idSupplier', 'tblSupplier.kdSupplier')
                ->join('users', 'tblPembelian.userPembelian', 'users.id')
                ->where('tblPembelian.hutangPembelian', '!=', '0' )
                ->where('tblPembelian.idSupplier', $request->input('supplier'))
                ->select('tblPembelian.*', 'tblSupplier.nmSupplier', 'users.name')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua Hutang',
            'data' => $posts
        ], 200);
    }

    public function sorting(Request $request)
    {
        //$from = date('2021/02/01');
        //$to = date('2021/02/02');
        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');

        $posts = Pembelian::join('tblSupplier', 'tblPembelian.idSupplier', '=', 'tblSupplier.kdSupplier')
                            ->whereBetween('tblPembelian.tglNotaPembelian', [$startDate, $endDate])
                            ->get();
        $NotalTOtal = Pembelian::join('tblSupplier', 'tblPembelian.idSupplier', '=', 'tblSupplier.kdSupplier')
                            ->whereBetween('tblPembelian.tglNotaPembelian', [$startDate, $endDate])
                            ->sum('totalNotaPembelian');

        //$posts = Penjualan::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Pembelian',
            'startDate' => $startDate,
            'endDate' => $endDate,
            'notaSum' => $NotalTOtal,
            'data' => $posts
        ], 200);

    }
    public function listDetailPembelian($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPembelianDetail')
                    ->join('tblBarang', 'tblPembelianDetail.kdBarang', 'tblBarang.kdBarang')
                    ->where('tblPembelianDetail.noNotaPembelian', $id)->get();

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

    public function addItemPembelian(Request $request)
    {
        $brg = DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->first();
        if ($brg == null ){

            $post = PembelianDetail::create([
                'noNotaPembelian'     => $request->input('noNotaPembelian'),
                'kdBarang'     => $request->input('kdBarang'),
                'hrgPokok'     => $request->input('hrgBeli'),
                'qtyBeli'     => $request->input('qtyBeli'),
                'totalBeli'     => $request->input('totalBeli'),
                
            ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
            $satuanKartu = $barang->satuanBarang;

            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                'stkBarang'     => $stokLama + $request->input('qtyBeli'),
                'hrgPokok'     => $request->input('hrgBeli'),
            ]);

                        
            KartuStok::create([
                'kdBarang'     => $request->input('kdBarang'),
                'tglKartu'     => $request->input('tglNotaPembelian'),
                'qtyMasuk'     => $request->input('qtyBeli'),
                'qtyKeluar'     => '0',
                'noTransaksi'     => $request->input('noNotaPembelian'),
                'keteranganKartu'     => 'Pembelian',
                'satuanKartu' => $satuanKartu,
            ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);

        } else {

            //=========PembelianDetail
            $brng = DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->first();
            $qtyB = $brng->qtyBeli ;
            $totalB = $brng->totalBeli ;
            
            
            DB::table('tblPembelianDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPembelian', $request->input('noNotaPembelian'))
                ->update([
                    'qtyBeli' => $qtyB + $request->input('qtyBeli'),
                    'totalBeli' => $totalB + $request->input('totalBeli'),
                    ]);
            //=======Update stok tabel barang
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
            'stkBarang'     => $stokLama + $request->input('qtyBeli')
            ]);
            //======================
            
            //=========Update Kartu Stok
            $brngstok = DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noNotaPembelian'))
                ->first();
            $qtyS = $brngstok->qtyMasuk ;
            DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noNotaPembelian'))
                ->update([
                    'qtyMasuk' => $qtyS + $request->input('qtyBeli'),
                    ]);
            //=========endKartu stok

            

                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);

            
        }
    }

    public function listTransaksiPembelian($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPembelianDetail')
                    ->join('tblBarang', 'tblBarang.kdBarang', '=', 'tblPembelianDetail.kdBarang')
                    ->select('tblPembelianDetail.*', 'tblBarang.nmBarang')
                    ->where('noNotaPembelian', $id)->get();

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

    public function totalTrxPembelian(Request $request)
    {
        $totalNota = DB::table('tblPembelianDetail')
            ->where('noNotaPembelian', '=', $request->input('ntp'))
            ->sum('totalBeli');

        if ($totalNota) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'subTotalBeli'    => $totalNota
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Post Tidak Ditemukan!',
                'subTotalBeli'    => ''
            ], 404);
        }
    }

    public function addTransaksiPembelian(Request $request)
    {
        $post = Pembelian::create([
            'noNotaPembelian'     => $request->input('noNotaPembelian'),
            'idSupplier'     => $request->input('idSupplier'),
            'tglNotaPembelian'     => $request->input('tglNotaPembelian'),
            'totalNotaPembelian'     => $request->input('totalNotaPembelian'),
            'userPembelian'     => $request->input('userPembelian'),
            'typePembelian'     => $request->input('typePembelian'),
            'termPembelian'     => $request->input('termPembelian'),
            'hutangPembelian'   => $request->input('hutangPembelian'),
            'bayarNotaPembelian'       => $request->input('totalBayar'),
            'jthTempoPembelian'     => Carbon::parse($request->input('tglNotaPembelian'))->addDays($request->input('termPembelian'))->format('Y/m/d'),
        ]);

        DB::table('tblKartuStok')
                ->where('noTransaksi', $request->input('noNotaPembelian'))
                ->update([
                    'tglKartu' => $request->input('tglNotaPembelian'),
                    ]);

            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Post Gagal Disimpan!',
                ], 400);
            }
        
    }

    public function destroy1($id)
    {
        

        $post = PembelianDetail::findOrFail($id);

        $noNotaPembelian = $post->noNotaPembelian;
        $kodebarang = $post->kdBarang;
        $qtybarang = $post->qtyBeli;
        $qtySatuan = $post->qtySatuan;

        $barang = DB::table('tblBarang')->where('kdBarang', $kodebarang)->first();
        $stokLama = $barang->stkBarang;
        DB::table('tblBarang')->where('kdBarang', $kodebarang)->update([
                'stkBarang'     => $stokLama - $qtybarang
        ]);


        DB::table('tblKartuStok')
            ->where('kdBarang', $kodebarang)
            ->where('noTransaksi', $noNotaPembelian)
            ->delete();
        
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

    public function hapusPembelian($id)
    {
        $post = Pembelian::findOrFail($id);
        $kdPembelian = $post->noNotaPembelian;

        PembelianDetail::where('noNotaPembelian', $kdPembelian)->delete();

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
