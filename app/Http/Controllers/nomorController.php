<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Meja;
use App\Menu;
use App\Barang;
use App\TransaksiDetail;
use App\Transaksi;
use App\Penjualan;
use App\Pembelian;
use App\PembelianDetail;
use App\Supplier;
use App\Kategori;
use App\StokOpname;
use App\Pelanggan;
use App\GrandJual;
use App\Motor;
use App\Mekanik;
use App\Lift;
use App\Jasa;
use Illuminate\Support\Facades\DB;

class nomorController extends Controller
{
    //
    public function noNota()
    {
        $count = Penjualan::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $bulan = date('m');
            $post = 'INV'.$tahun.$bulan.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'noNota'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Penjualan::all()->last();
            $terakhir = substr($count->noNota, 9);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $bulan = date('m');
            $post = 'INV'.$tahun.$bulan.$kodeBaru;

            

            if (Penjualan::where('noNota', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'INV'.$tahun.$bulan.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'noNota'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Tidak Ditemukan!',
                    'noNota'    => $post
                ], 200);
            }
        }
    }
    public function noNotaGrandJual()
    {
        $count = GrandJual::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'GJ-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'noNotaGrandJual'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = GrandJual::all()->last();
            $terakhir = substr($count->noNota, -1);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'GJ-'.$tahun.'-'.$kodeBaru;

            

            if (GrandJual::where('noNota', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'GJ-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'noNotaGrandJual'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Post Tidak Ditemukan!',
                    'noNotaGrandJual'    => $post
                ], 200);
            }
        }
    }
    public function kodeBarang()
    {
        $count = Barang::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'DB-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdBarang'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Barang::all()->last();
            //$kodeBaru = $count->kdBarang  ;
            $terakhir = substr($count->kdBarang, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'DB-'.$tahun.'-'.$kodeBaru;

            if (Barang::where('kdBarang', $post)->exists()) {
                // exists
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'DB-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'ada' => 'gggada',
                    'kdBarang'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'ada' => 'tidak ada',
                    'message' => 'Detail Post!',
                    'kdBarang'    => $post
                ], 200);
            }
        }
    }
    

    public function kodePembelian()
    {
        $count = Pembelian::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'PB-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdPembelian'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = Pembelian::all()->last();
            $terakhir = substr($count->noNotaPembelian, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'PB-'.$tahun.'-'.$kodeBaru;

            if (Pembelian::where('noNotaPembelian', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'PB-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPembelian'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdPembelian'    => $post
                ], 200);
            }
        }
    }

    public function kodeSupplier()
    {
        $count = Supplier::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'SP-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kdSupplier'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Supplier::all()->last();
            $terakhir = substr($count->kdSupplier, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'SP-'.$tahun.'-'.$kodeBaru;

            if (Supplier::where('kdSupplier', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'SP-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdSupplier'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kdSupplier'    => $post
                ], 200);
            }
        }
    }

    public function kodePelanggan()
    {
        $count = Pelanggan::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'PL-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodePelanggan'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Pelanggan::all()->last();
            $terakhir = substr($count->kodePelanggan, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'PL-'.$tahun.'-'.$kodeBaru;

            if (Pelanggan::where('kodePelanggan', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'SP-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodePelanggan'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodePelanggan'    => $post
                ], 200);
            }
        }
    }

    public function kodeKategori()
    {
        $count = Kategori::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'KT-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodeKtg'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Kategori::all()->last();
            $terakhir = substr($count->kodeKtg, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'KT-'.$tahun.'-'.$kodeBaru;

            if (Kategori::where('kodeKtg', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'KT-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeKtg'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeKtg'    => $post
                ], 200);
            }
        }
    }

    public function kodeMotor()
    {
        $count = Motor::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'MT-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodeMtr'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Motor::all()->last();
            $terakhir = substr($count->kdMotor, -1);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'MT-'.$tahun.'-'.$kodeBaru;

            if (Motor::where('kdMotor', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'MT-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeMtr'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeMtr'    => $post
                ], 200);
            }
        }
    }

    public function kodeMekanik()
    {
        $count = Mekanik::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'MK-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodeMekanik'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Mekanik::all()->last();
            $terakhir = substr($count->kdMekanik, -1);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'MK-'.$tahun.'-'.$kodeBaru;

            if (Mekanik::where('kdMekanik', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'MK-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeMekanik'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeMekanik'    => $post
                ], 200);
            }
        }
    }

    public function kodeJasa()
    {
        $count = Jasa::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'JS-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodeJasa'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Jasa::all()->last();
            $terakhir = substr($count->kdJasa, -1);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'JS-'.$tahun.'-'.$kodeBaru;

            if (Jasa::where('kdJasa', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'JS-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeJasa'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeJasa'    => $post
                ], 200);
            }
        }
    }

    public function kodeLift()
    {
        $count = Lift::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'LF-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'kodeLift'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = Lift::all()->last();
            $terakhir = substr($count->kdLift, -1);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'LF-'.$tahun.'-'.$kodeBaru;

            if (Lift::where('kdLift', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'LF-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeLift'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'kodeLift'    => $post
                ], 200);
            }
        }
    }

    public function kodeStokOpname()
    {
        $count = StokOpname::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'OP-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'noStokOpname'    => $post
            ], 200);
        }else{

            $no = 0 ;
            $count = StokOpname::all()->last();
            $terakhir = substr($count->noStokOpname, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'OP-'.$tahun.'-'.$kodeBaru;

            if (StokOpname::where('noStokOpname', $post)->exists()) {
                $count = StokOpname::all()->last();
                $terakhir = substr($count->noStokOpname, 8,  20);
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'OP-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'noStokOpname'    => $post
                ], 200);
            } else {
                $tahun = date('Y');
                //$post = 'OP-'.$tahun.'-'.'1';
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'noStokOpname'    => $post
                ], 200);
            }
        }
    }

    public function kodeUsername()
    {
        $count = User::all();
        if($count->isEmpty()){
            $tahun = date('Y');
            $post = 'US-'.$tahun.'-'.'1';
            return response()->json([
                'success' => true,
                'message' => 'Detail Post!',
                'username'    => $post
            ], 200);
        }else{
            $no = 0 ;
            $count = User::all()->last();
            $terakhir = substr($count->username, 8,  20);
            $kodeBaru = $terakhir + 1  ;

            $tahun = date('Y');
            $post = 'US-'.$tahun.'-'.$kodeBaru;

            if (User::where('username', $post)->exists()) {
                $kodeBarulagi = $kodeBaru + 1 ;
                $post = 'US-'.$tahun.'-'.$kodeBarulagi;
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'username'    => $post
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'message' => 'Detail Post!',
                    'username'    => $post
                ], 202);
            }
        }
    }
}
