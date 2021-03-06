<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Penjualan;
use App\PenjualanDetail;
use App\KartuStok;
use App\Pembayara;
use App\Jasajual;
use Carbon\Carbon;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class penjualanController extends Controller
{
    //
    public function index()
    {
        $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                ->join('users', 'tblPenjualan.userNota', 'users.id')
                ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan', 'users.name')
                ->orderBy('tblPenjualan.id', 'DESC')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'data' => $posts
        ], 200);
    }

    public function laporanPiutang()
    {
        $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                ->join('users', 'tblPenjualan.userNota', 'users.id')
                ->where('tblPenjualan.piutangNota', '!=', '0' )
                ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan', 'users.name')
                ->orderBy('tblPenjualan.id', 'DESC')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'data' => $posts
        ], 200);
    }


    public function LaporanJasa()
    {
        $posts = DB::table('tblDetailJasaJual as j')
                ->select(array(DB::Raw('sum(j.totalJasa) as totalJasa'),DB::Raw('j.tglPenjualan')) )
                ->groupBy('j.tglPenjualan')
                ->orderBy('j.tglPenjualan')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua jual jasa',
            'data' => $posts
        ], 200);
    }

    public function piutangPelanggan(Request $request)
    {
        $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                ->join('users', 'tblPenjualan.userNota', 'users.id')
                ->where('tblPenjualan.piutangNota', '!=', '0' )
                ->where('tblPenjualan.pelangganNota', $request->input('pelanggan'))
                ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan', 'users.name')
                ->get();
        return response([
            'success' => true,
            'message' => 'List Semua SPenjualan',
            'data' => $posts
        ], 200);
    }
    public function sorting(Request $request)
    {
        //$from = date('2021/02/01');
        //$to = date('2021/02/02');
        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');
        
        $typeNota = $request->input('typeNota');
        $typeBayarNota = $request->input('typeBayarNota');

        if($typeNota == 0 && $typeBayarNota == 0){

            $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                                ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan')
                                ->whereBetween('tblPenjualan.tglNota', [$startDate, $endDate])->get();
            $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('totalNota');
            $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('taxNota');
            $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('diskonNota');
            $bayarSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('bayarNota');

            //$posts = Penjualan::latest()->get();
            return response([
                'success' => true,
                'message' => 'List Semua SPenjualan',
                'startDate' => $startDate,
                'endDate' => $endDate,
                'notaSum' => $NotalTOtal,
                'pajakSum' => $pajakSum,
                'diskonSum' => $diskonSum,
                'bayarSum' => $bayarSum,
                'data' => $posts
            ], 200);
        
        }elseif($typeNota != 0 && $typeBayarNota == 0){
            $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                            ->where('tblPenjualan.typeNota', $typeNota)
                            ->whereBetween('tblPenjualan.tglNota', [$startDate, $endDate])
                            ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan')
                            ->get();
            $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)
                                ->sum('totalNota');
            $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)
                                ->sum('taxNota');
            $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)    
                                ->sum('diskonNota');
            $bayarSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)    
                                ->sum('bayarNota');
        
            //$posts = Penjualan::latest()->get();
            return response([
                'success' => true,
                'message' => 'List Semua SPenjualan',
                'startDate' => $startDate,
                'endDate' => $endDate,
                'notaSum' => $NotalTOtal,
                'pajakSum' => $pajakSum,
                'diskonSum' => $diskonSum,
                'bayarSum' => $bayarSum,
                'data' => $posts
            ], 200);
        }elseif($typeBayarNota != 0 && $typeNota == 0){

            $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                            ->where('tblPenjualan.typeBayarNota', $typeBayarNota)
                            ->whereBetween('tblPenjualan.tglNota', [$startDate, $endDate])
                            ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan')
                            ->get();
            $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeBayarNota', $typeBayarNota)
                                ->sum('totalNota');
            $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeBayarNota', $typeBayarNota)
                                ->sum('taxNota');
            $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeBayarNota', $typeBayarNota)    
                                ->sum('diskonNota');
            $bayarSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeBayarNota', $typeBayarNota)    
                                ->sum('bayarNota');
        
            //$posts = Penjualan::latest()->get();
            return response([
                'success' => true,
                'message' => 'List Semua SPenjualan',
                'startDate' => $startDate,
                'endDate' => $endDate,
                'notaSum' => $NotalTOtal,
                'pajakSum' => $pajakSum,
                'diskonSum' => $diskonSum,
                'bayarSum' => $bayarSum,
                'data' => $posts
            ], 200);
        }elseif($typeBayarNota != 0 && $typeNota != 0){
            $posts = Penjualan::join('tblPelanggan', 'tblPenjualan.pelangganNota', 'tblPelanggan.kodePelanggan')
                            ->whereBetween('tblPenjualan.tglNota', [$startDate, $endDate])
                            ->where('tblPenjualan.typeNota', $typeNota)
                            ->where('tblPenjualan.typeBayarNota', $typeBayarNota)
                            ->select('tblPenjualan.*', 'tblPelanggan.namaPelanggan')
                            ->get();
            $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)
                                ->where('typeBayarNota', $typeBayarNota)
                                ->sum('totalNota');
            $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)
                                ->where('typeBayarNota', $typeBayarNota)
                                ->sum('taxNota');
            $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)
                                ->where('typeBayarNota', $typeBayarNota)    
                                ->sum('diskonNota');
            $bayarSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])
                                ->where('typeNota', $typeNota)
                                ->where('typeBayarNota', $typeBayarNota)    
                                ->sum('bayarNota');
        
            //$posts = Penjualan::latest()->get();
            return response([
                'success' => true,
                'message' => 'List Semua SPenjualan',
                'startDate' => $startDate,
                'endDate' => $endDate,
                'notaSum' => $NotalTOtal,
                'pajakSum' => $pajakSum,
                'diskonSum' => $diskonSum,
                'bayarSum' => $bayarSum,
                'data' => $posts
            ], 200);
        }

        

        

    }
    public function laporanBulanan()
    {

        $bulan = DB::table('tblPenjualan as w')
                ->select(array(DB::Raw('sum(w.totalNota) as total'),DB::Raw('sum(w.taxNota) as ppn'),DB::Raw('sum(w.diskonNota) as diskon'),DB::Raw('sum(w.chargeNota) as charge'),DB::Raw('w.tglNota')))
                ->groupBy('w.tglNota')
                ->orderBy('w.tglNota')
                ->get();
        return response([
                    'success' => true,
                    'message' => 'List Semua SPenjualan',
                    'data' => $bulan
                ], 200);
    }

    
    public function laporanBulananSorting(Request $request)
    {

        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');

        $bulan = DB::table('tblPenjualan as w')
                ->select(array(DB::Raw('sum(w.totalNota) as total'),DB::Raw('sum(w.taxNota) as ppn'),DB::Raw('sum(w.diskonNota) as diskon'),DB::Raw('sum(w.chargeNota) as charge'),DB::Raw('w.tglNota')))
                ->groupBy('w.tglNota')
                ->orderBy('w.tglNota')
                ->whereBetween('w.tglNota', [$startDate, $endDate])
                ->get();
                $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('totalNota');
                $pajakSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('taxNota');
                $diskonSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('diskonNota');
                $chargeSum = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('chargeNota');

        return response([
                    'success' => true,
                    'message' => 'List Semua SPenjualan',
                    'startDate' => $startDate,
                    'endDate' => $endDate,
                    'notaSum' => $NotalTOtal,
                    'pajakSum' => $pajakSum,
                    'diskonSum' => $diskonSum,
                    'chargeSum' => $chargeSum,
                    'data' => $bulan
                ], 200);
    }

    public function laporanLabaSorting(Request $request)
    {

        $startDate = $request->input('startDate');
        $endDate = $request->input('endDate');

        $bulan = DB::table('tblPenjualan as w')
                ->select(array(DB::Raw('sum(w.totalNota) as total'),DB::Raw('sum(w.totalPokok) as totalPokok'),DB::Raw('sum(w.taxNota) as ppn'),DB::Raw('sum(w.diskonNota) as diskon'),DB::Raw('sum(w.chargeNota) as charge'),DB::Raw('w.tglNota')))
                ->groupBy('w.tglNota')
                ->orderBy('w.tglNota')
                ->whereBetween('w.tglNota', [$startDate, $endDate])
                ->get();
                $NotalTOtal = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('totalNota');
                $pokok = Penjualan::whereBetween('tglNota', [$startDate, $endDate])->sum('totalPokok');
               $laba = $NotalTOtal - $pokok ;
        return response([
                    'success' => true,
                    'message' => 'List Semua Laba',
                    'startDate' => $startDate,
                    'endDate' => $endDate,
                    'notaSum' => $NotalTOtal,
                    'pokokSum' => $pokok,
                    'labas' => $laba,
                    'data' => $bulan
                ], 200);
    }

    public function listDetailPenjualan($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPenjualanDetail')
                    ->join('tblBarang', 'tblPenjualandetail.kdBarang', 'tblBarang.kdBarang' )
                    ->select('tblPenjualanDetail.*', 'tblBarang.nmBarang')
                    ->where('tblPenjualanDetail.noNotaPenjualan', $id)->get();

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

    public function listDetailPenjualanJasa($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblDetailJasaJual')
                    ->join('tblJasa', 'tblDetailJasaJual.kdJasa', 'tblJasa.kdJasa' )
                    ->select('tblDetailJasaJual.*', 'tblJasa.namaJasa')
                    ->where('tblDetailJasaJual.noNotaPenjualan', $id)->get();

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

    public function listTransaksiPenjualan($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblPenjualanDetail')
                    ->join('tblBarang', 'tblBarang.kdBarang', '=', 'tblPenjualanDetail.kdBarang')
                    ->select('tblPenjualanDetail.*', 'tblBarang.nmBarang')
                    ->where('noNotaPenjualan', $id)
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

    public function listTransaksiJasaPenjualan($id)
    {
        //$post = TransaksiDetail::whereId($id)->first();
        $post = DB::table('tblDetailJasaJual')
                    ->join('tblJasa', 'tblJasa.kdJasa', '=', 'tblDetailJasaJual.kdJasa')
                    ->select('tblDetailJasaJual.*', 'tblJasa.namaJasa')
                    ->where('noNotaPenjualan', $id)
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

    public function addItemPenjualan(Request $request)
    {
        $brg = DB::table('tblPenjualanDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPenjualan', $request->input('noNotaPenjualan'))
                ->first();
        if ($brg == null ){

            $post = PenjualanDetail::create([
                'noNotaPenjualan'     => $request->input('noNotaPenjualan'),
                'kdBarang'     => $request->input('kdBarang'),
                'hrgJual'     => $request->input('hrgJual'),
                'qtyJual'     => $request->input('qtyJual'),
                'totalJual'     => $request->input('totalJual'),
                'totalPokokJual'     => $request->input('totalPokokJual'),
                'satuanJual'  => $request->input('satuanJual'),
                'tglPenjualan' => $request->input('tglPenjualan'),
                'nmBarangJual'  => $request->input('nmBarangJual'),
            ]);
            
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
            $satuanKartu = $barang->satuanBarang;

            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
                'stkBarang'     => $stokLama - $request->input('qtyJual'),
                'hrgJual'     => $request->input('hrgJual'),
            ]);


                        
            KartuStok::create([
                'kdBarang'     => $request->input('kdBarang'),
                'tglKartu'     => $request->input('tglPenjualan'),
                'qtyMasuk'     => '0',
                'qtyKeluar'     => $request->input('qtyJual'),
                'noTransaksi'     => $request->input('noNotaPenjualan'),
                'keteranganKartu'     => 'Penjualan',
                'satuanKartu' => $satuanKartu,
            ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);

        } else {

            //=========PenjualanDetail
            $brng = DB::table('tblPenjualanDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPenjualan', $request->input('noNotaPenjualan'))
                ->first();
            $qtyB = $brng->qtyJual ;
            $totalB = $brng->totalJual ;
            $totalP = $brng->totalPokokJual ;
            
            
            DB::table('tblPenjualanDetail')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noNotaPenjualan', $request->input('noNotaPenjualan'))
                ->update([
                    'qtyJual' => $qtyB + $request->input('qtyJual'),
                    'totalJual' => $totalB + $request->input('totalJual'),
                    'totalPokokJual' => $totalP + $request->input('totalPokokJual'),
                    ]);
            //=======Update stok tabel barang
            $barang = DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->first();
            $stokLama = $barang->stkBarang;
            DB::table('tblBarang')->where('kdBarang', $request->input('kdBarang'))->update([
            'stkBarang'     => $stokLama - $request->input('qtyJual')
            ]);
            //======================
            //=========Update Kartu Stok
            $brngstok = DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noNotaPenjualan'))
                ->first();
            $qtyS = $brngstok->qtyKeluar ;
            DB::table('tblKartuStok')
                ->where('kdBarang', $request->input('kdBarang'))
                ->where('noTransaksi', $request->input('noNotaPenjualan'))
                ->update([
                    'qtyKeluar' => $qtyS + $request->input('qtyJual'),
                    ]);
            //=========endKartu stok

            

                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);

            
        }
    }

    public function addJasaPenjualan(Request $request)
    {
        $brg = DB::table('tblDetailJasaJual')
                ->where('kdJasa', $request->input('kdJasa'))
                ->where('noNotaPenjualan', $request->input('noNotaPenjualan'))
                ->first();
            //$qtyB = $brg->qtyJasa;
            //$totalB = $brg->totalJasa;
        if ($brg == null ){

            $post = Jasajual::create([
                'noNotaPenjualan'     => $request->input('noNotaPenjualan'),
                'kdJasa'     => $request->input('kdJasa'),
                'namaJasa'  => $request->input('namaJasa'),
                'biayaJasa'     => $request->input('biayaJasa'),
                'qtyJasa'     => $request->input('qtyJasa'),
                'totalJasa'     => $request->input('totalJasa'),
                'tglPenjualan'  => $request->input('tglPenjualan'),
            ]);
            

                return response()->json([
                    'success' => true,
                    'message' => 'Post Berhasil Disimpan!',
                ], 200);

        } else {
            $jasa = DB::table('tblDetailJasaJual')
                ->where('kdJasa', $request->input('kdJasa'))
                ->where('noNotaPenjualan', $request->input('noNotaPenjualan'))
                ->first();
            $qtyJ = $jasa->qtyJasa ;
            $totalJ = $jasa->totalJasa ;
            
            DB::table('tblDetailJasaJual')
                ->where('kdJasa', $request->input('kdJasa'))
                ->where('noNotaPenjualan', $request->input('noNotaPenjualan'))
                ->update([
                    'qtyJasa' => $qtyJ + $request->input('qtyJualJasa'),
                    'totalJasa' => $totalJ + $request->input('totalJasa'),
                    ]);
            //======================
            

                    return response()->json([
                        'success' => true,
                        'message' => 'Post Berhasil Disimpan!',
                    ], 200);

            
        }
    }

    public function totalTrxPenjualan(Request $request)
    {
        $totalNota = DB::table('tblPenjualanDetail')
            ->where('noNotaPenjualan', '=', $request->input('ntp'))
            ->sum('totalJual');
        $totalNotaPokok = DB::table('tblPenjualanDetail')
            ->where('noNotaPenjualan', '=', $request->input('ntp'))
            ->sum('totalPokokJual');      
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'subTotalJual'    => $totalNota,
                'subTotalPokokJual'    => $totalNotaPokok
            ], 200);
       
    }
    public function totalTrxJasaPenjualan(Request $request)
    {
        $totalNota = DB::table('tblDetailJasaJual')
            ->where('noNotaPenjualan', '=', $request->input('ntp'))
            ->sum('totalJasa');      
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'subTotalJual'    => $totalNota
            ], 200);
       
    }

    public function addTransaksiPenjualan(Request $request)
    {
        if($request->input('typeNota') == '2' && $request->input('piutangNota') < 0 ){
            $sisaPiutang = abs($request->input('piutangNota'));
        }else{
            $sisaPiutang = '0';
        }
        $post = Penjualan::create([
            'noNota'     => $request->input('noNota'),
            'liftNo'     => $request->input('liftNo'),
            'tglNota'     => $request->input('tglNota'),
            'totalNota'     => $request->input('totalNota'),
            'totalPokok'     => $request->input('totalPokok'),
            'taxNota'     => $request->input('taxNota'),
            'diskonNota'     => $request->input('diskonNota'),
            'chargeNota'     => $request->input('chargeNota'),
            'bayarNota'     => $request->input('bayarNota'),
            'kembalianNota'     => $request->input('kembalianNota'),
            'pelangganNota'     => $request->input('pelanggan'),
            'userNota'     => $request->input('userNota'),
            'mekanikNota'     => $request->input('mekanikNota'),
            'typeNota'      =>$request->input('typeNota'),
            'typeBayarNota'      =>$request->input('typeBayarNota'),
            'termNota'      =>$request->input('termNota'),
            'piutangNota'   =>$sisaPiutang,
            'jthTempoNota'     => Carbon::parse($request->input('tglNota'))->addDays($request->input('termNota'))->format('Y/m/d'),
        ]);

        Pembayara::insert([
            'notaPembayaran'     => $request->input('noNota'),
            'diskonPembayaran'     => $request->input('diskonPembayaran'),
            'pajakPembayaran'     => $request->input('pajakPembayaran'),
            'typePembayaran'     => $request->input('typeNota'),
            'chargePembayaran'     => $request->input('chargePembayaran'),
            'noKartuPembayaran'     => $request->input('noKartuPembayaran'),
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

    public function deleteBrgTransaksi($id)
    {
        

        $post = PenjualanDetail::findOrFail($id);

        $kodebarang = $post->kdBarang;
        $qtybarang = $post->qtyJual;
        $noNotaPenjualan = $post->noNotaPenjualan;
        //$satuanJual = $post->satuanJual;

        $barang = DB::table('tblBarang')->where('kdBarang', $kodebarang)->first();
        $stokLama = $barang->stkBarang;
        DB::table('tblBarang')->where('kdBarang', $kodebarang)->update([
                'stkBarang'     => $stokLama + $qtybarang
        ]);

        DB::table('tblKartuStok')
            ->where('kdBarang', $kodebarang)
            ->where('noTransaksi', $noNotaPenjualan)
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
    

    public function destroy1($id)
    {
        

        $post = Penjualan::findOrFail($id);

        $noNotaPenjualan = $post->noNota;

        $post1 = PenjualanDetail::where('noNotaPenjualan', $noNotaPenjualan)->first();
        $kodebarang = $post1->kdBarang;
        $qtybarang = $post1->qtyJual;
        //$satuanJual = $post->satuanJual;

        $barang = DB::table('tblBarang')->where('kdBarang', $kodebarang)->first();
        $stokLama = $barang->stkBarang;
        DB::table('tblBarang')->where('kdBarang', $kodebarang)->update([
                'stkBarang'     => $stokLama + $qtybarang
        ]);
        PenjualanDetail::where('noNotaPenjualan', $noNotaPenjualan)->delete();
        Jasajual::where('noNotaPenjualan', $noNotaPenjualan)->delete();


        DB::table('tblKartuStok')
            ->where('kdBarang', $kodebarang)
            ->where('noTransaksi', $noNotaPenjualan)
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

    public function deleteTransaksiJasa($id)
    {
        $post = JasaJual::findOrFail($id);
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
