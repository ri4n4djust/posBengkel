<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', 'loginController@login');

//======barang
Route::get('/posts', 'salesController@index');
Route::get('/semuabarang', 'salesController@semua');
Route::get('/mentah', 'salesController@mentah');
Route::post('/posts/store', 'salesController@store');
Route::get('/posts/{id?}', 'salesController@show');
Route::post('/posts/update/{id?}', 'salesController@update');
Route::delete('/posts/{id?}', 'salesController@destroy');

//=======kategori
Route::get('/kategori', 'kategoriController@index');
Route::post('/kategori/store', 'kategoriController@store');
Route::get('/kategori/{id?}', 'kategoriController@show');
Route::post('/kategori/update/{id?}', 'kategoriController@update');
Route::delete('/kategori/{id?}', 'kategoriController@destroy');

//=======Motor
Route::get('/motor', 'motorController@index');
Route::post('/motor/store', 'motorController@store');
Route::get('/motor/{id?}', 'motorController@show');
Route::post('/motor/update/{id?}', 'motorController@update');
Route::delete('/motor/{id?}', 'motorController@destroy');

//========supplier
Route::get('/supplier', 'supplierController@index');
Route::post('/supplier/store', 'supplierController@store');
Route::get('/supplier/{id?}', 'supplierController@show');
Route::post('/supplier/update/{id?}', 'supplierController@update');
Route::delete('/supplier/{id?}', 'supplierController@destroy');

//========Pelanggan
Route::get('/pelanggan', 'pelangganController@index');
Route::post('/pelanggan/store', 'pelangganController@store');
Route::get('/pelanggan/{id?}', 'pelangganController@show');
Route::post('/pelanggan/update/{id?}', 'pelangganController@update');
Route::delete('/pelanggan/{id?}', 'pelangganController@destroy');

//========Mekanik
Route::get('/mekanik', 'mekanikController@index');
Route::post('/mekanik/store', 'mekanikController@store');
Route::get('/mekanik/{id?}', 'mekanikController@show');
Route::post('/mekanik/update/{id?}', 'mekanikController@update');
Route::delete('/mekanik/{id?}', 'mekanikController@destroy');

//========Jasa
Route::get('/jasa', 'jasaController@index');
Route::post('/jasa/store', 'jasaController@store');
Route::get('/jasa/{id?}', 'jasaController@show');
Route::post('/jasa/update/{id?}', 'jasaController@update');
Route::delete('/jasa/{id?}', 'jasaController@destroy');

//========Lift
Route::get('/lift', 'liftController@index');
Route::post('/lift/store', 'liftController@store');
Route::get('/lift/{id?}', 'liftController@show');
Route::post('/lift/update/{id?}', 'liftController@update');
Route::delete('/lift/{id?}', 'liftController@destroy');


//===========transaksi
Route::post('/transaksi/{id}', 'mejaController@listTransaksi');
Route::delete('/orderDelete/{id?}', 'mejaController@destroy1');
Route::post('/addTransaksi/store', 'mejaController@addTransaksi');

//=========total
Route::post('/totalTrx/{id}', 'mejaController@totalTrx');



//=======penomeran
Route::post('/noNota/{id}', 'nomorController@noNota');
Route::get('/kodeBarang', 'nomorController@kodeBarang');
Route::get('/kodeKategori', 'nomorController@kodeKategori');
Route::get('/notaGrandJual', 'nomorController@noNotaGrandJual');
Route::get('/kodePembelian', 'nomorController@kodePembelian');
Route::get('/kodePenjualan', 'nomorController@noNota');
Route::get('/kodeSupplier', 'nomorController@kodeSupplier');
Route::get('/kodeSupplier', 'nomorController@kodeSupplier');
Route::get('/kodePelanggan', 'nomorController@kodePelanggan');
Route::get('/kodeStokOpname', 'nomorController@kodeStokOpname');
Route::get('/kodeMotor', 'nomorController@kodeMotor');
Route::get('/kodeMekanik', 'nomorController@kodeMekanik');
Route::get('/kodeJasa', 'nomorController@kodeJasa');
Route::get('/kodeLift', 'nomorController@kodeLift');
Route::get('/username', 'nomorController@kodeUsername');


//=========Pembelian
Route::post('/addItemPembelian/store', 'pembelianController@addItemPembelian');
Route::post('/dataPembelian/{id}', 'pembelianController@listTransaksiPembelian');
Route::post('/totalTrxPembelian', 'pembelianController@totalTrxPembelian');
Route::delete('/pembelianDelete/{id?}', 'pembelianController@destroy1');
Route::post('/addPembelian/store', 'pembelianController@addTransaksiPembelian');
Route::delete('/hapuspembelian/{id?}', 'pembelianController@hapusPembelian');

//=========Penjualan
Route::post('/addItemPenjualan/store', 'penjualanController@addItemPenjualan');
Route::post('/addJasaPenjualan/store', 'penjualanController@addJasaPenjualan');
Route::get('/dataPenjualan/{id}', 'penjualanController@listTransaksiPenjualan');
Route::post('/totalTrxPenjualan', 'penjualanController@totalTrxPenjualan');

Route::delete('/hapusbarang/{id?}', 'penjualanController@deleteBrgTransaksi');
Route::post('/addPenjualan/store', 'penjualanController@addTransaksiPenjualan');

//=======live Order
Route::get('/orderlist', 'mejaController@listOrder');

//========menu
Route::get('/menu', 'menuController@index');
Route::post('/menu/store', 'menuController@store');
Route::get('/menu/{id?}', 'menuController@show');
Route::get('/detailMenu/{id?}', 'menuController@detail');
Route::post('/menu/update/{id?}', 'menuController@update');
Route::delete('/menu/{id?}', 'menuController@destroy');

//========User
Route::get('/user', 'loginController@index');
Route::post('/user/store', 'loginController@store');
Route::get('/user/{id?}', 'loginController@show');
Route::post('/user/update/{id?}', 'loginController@update');
Route::delete('/user/{id?}', 'loginController@destroy');

//========komposisi
Route::get('/komposisi', 'komposisiController@index');
Route::get('/itemKomposisi', 'komposisiController@allInventori');
Route::post('/komposisi/detail/{id}', 'komposisiController@detail');
Route::post('/komposisi/store', 'komposisiController@store');
Route::delete('/komposisi/{id?}', 'komposisiController@destroy');

//=====Laporan Penjualan
Route::get('/penjualan', 'penjualanController@index');
Route::get('/penjualanbulanan', 'penjualanController@laporanBulanan');
Route::post('/lapPenjualanBulanan', 'penjualanController@laporanBulananSorting');
Route::post('/dataPiutang', 'penjualanController@piutangPelanggan');
Route::post('/lapPenjualan', 'penjualanController@sorting');
Route::post('/detailpenjualan/{id}', 'penjualanController@listDetailPenjualan');
Route::delete('/hapuspenjualan/{id?}', 'penjualanController@destroy1');

//=====Laporan Pembelian
Route::get('/pembelian', 'pembelianController@index');
Route::post('/lapPembelian', 'pembelianController@sorting');
Route::post('/detailpembelian/{id}', 'pembelianController@listDetailPembelian');

//=========Stok
Route::post('/detailstok/{id}', 'stokController@DetailStok');
Route::post('/detailstokopname/{id}', 'stokController@DetailStokOpname');
Route::get('/stokopname', 'stokController@allOpname');
Route::post('/addItemOpname/store', 'stokController@addItemOpname');
Route::post('/dataStokOpname/{id}', 'stokController@listTransaksiOpname');
Route::delete('/opnameDelete/{id?}', 'stokController@destroy1');
Route::post('/totalTrxOpname', 'stokController@totalTrxOpname');
Route::post('/addOpname/store', 'stokController@addTransaksiOpname');

//=========Inventori
Route::get('/inventori', 'stokController@indexInventori');
