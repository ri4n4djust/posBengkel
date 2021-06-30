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
Route::get('/caribarang', 'salesController@cariBarang');
Route::get('/caribarcode/{id}', 'salesController@cariBarcode');

//=======kategori
Route::get('/kategori', 'kategoriController@index');
Route::post('/kategori/store', 'kategoriController@store');
Route::get('/kategori/{id?}', 'kategoriController@show');
Route::post('/kategori/update/{id?}', 'kategoriController@update');
Route::delete('/kategori/{id?}', 'kategoriController@destroy');

Route::post('category/create', 'CategoryController@create');
Route::get('category/allCategories', 'CategoryController@allCategories');

Route::get('merek', 'CategoryController@Semua');
Route::post('/merek/create', 'CategoryController@createMerek');
Route::get('jenis/{id}', 'CategoryController@Jenis');
Route::post('/jenis/create', 'CategoryController@createJenis');
Route::get('type/{id}', 'CategoryController@Type');
Route::post('/type/create', 'CategoryController@createType');
Route::get('tahun/{id}', 'CategoryController@Tahun');
Route::get('pilihtahun/{id}', 'CategoryController@pilihTahun');
Route::post('/tahun/create', 'CategoryController@createTahun');

Route::get('detailmotor/{id}', 'CategoryController@DetailMotor');
Route::post('/motor/create', 'CategoryController@storeMotor');
Route::delete('/motor/{id}', 'CategoryController@delMotor');
Route::get('/motor/{id}', 'CategoryController@DetailSPMotor');
Route::post('/katspmotor/create', 'CategoryController@storeSpMotor');
Route::get('/listspmotor/{id}', 'CategoryController@listSpMotor');
Route::delete('/listspmotor/{id}', 'CategoryController@delSpMotor');

Route::get('/listdetspmotor/{id}', 'CategoryController@listDetSpMotor');

Route::get('/listkatalog/{id}', 'CategoryController@SemuaKatalog');
Route::post('/katalog/create', 'CategoryController@storeKatalog');
Route::delete('/katalog/{id}', 'CategoryController@delKatalog');


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
Route::get('/notaGrandBeli', 'nomorController@noNotaGrandBeli');
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

Route::get('/kodemerek', 'nomorController@kodeMerekMotor');
Route::get('/kodejenis', 'nomorController@kodeJenisMotor');
Route::get('/kodetype', 'nomorController@kodeTypeMotor');
Route::get('/kodetahun', 'nomorController@kodeTahunMotor');
Route::get('/kodedetmotor', 'nomorController@kodeDetailMotor');
Route::get('/kodespmotor', 'nomorController@kodeDetailSpMotor');


//=========Pembelian
Route::post('/addItemPembelian/store', 'pembelianController@addItemPembelian');
Route::post('/dataPembelian/{id}', 'pembelianController@listTransaksiPembelian');
Route::post('/dataHutang', 'pembelianController@hutangSupplier');
Route::post('/totalTrxPembelian', 'pembelianController@totalTrxPembelian');
Route::delete('/pembelianDelete/{id?}', 'pembelianController@destroy1');
Route::post('/addPembelian/store', 'pembelianController@addTransaksiPembelian');
Route::delete('/hapuspembelian/{id?}', 'pembelianController@hapusPembelian');

//=========GrandBeli
Route::post('/insertgrandbeli', 'GrandBeliController@insert');
Route::post('/grandBeli/store', 'GrandBeliController@saveGrandBeli');
Route::delete('/hapusgrandbeli/{id?}', 'GrandBeliController@destroy1');
Route::post('/detailgrandbeli/{id}', 'GrandBeliController@detailGrandBeli');

//=========Penjualan
Route::post('/addItemPenjualan/store', 'penjualanController@addItemPenjualan');
Route::post('/addJasaPenjualan/store', 'penjualanController@addJasaPenjualan');
Route::get('/dataPenjualan/{id}', 'penjualanController@listTransaksiPenjualan');
Route::get('/dataJasaPenjualan/{id}', 'penjualanController@listTransaksiJasaPenjualan');
Route::post('/totalTrxPenjualan', 'penjualanController@totalTrxPenjualan');
Route::post('/totalTrxJasaPenjualan', 'penjualanController@totalTrxJasaPenjualan');
Route::delete('/hapusjasa/{id?}', 'penjualanController@deleteTransaksiJasa');
Route::delete('/hapusbarang/{id?}', 'penjualanController@deleteBrgTransaksi');
Route::post('/addPenjualan/store', 'penjualanController@addTransaksiPenjualan');

//=========GrandJual
Route::post('/insertgrandjual', 'GrandJualController@insert');
Route::post('/grandJual/store', 'GrandJualController@saveGrandJual');
Route::delete('/hapusgrandjual/{id?}', 'GrandJualController@destroy1');
Route::post('/detailgrandjual/{id}', 'GrandJualController@detailGrandJual');

//======LaporanGrandJual
Route::get('/laporangrandjual', 'GrandJualController@laporanGrandJual');

//======LaporanGrandBeli
Route::get('/laporangrandbeli', 'GrandBeliController@laporanGrandBeli');

//=======live Order
Route::get('/orderlist', 'mejaController@listOrder');
//=======Setup
Route::get('/setup', 'setupController@index');
Route::get('/setup/{id}', 'setupController@codeharga');
Route::post('/updatesetup', 'setupController@Update');

//========User
Route::get('/user', 'loginController@index');
Route::post('/user/store', 'loginController@store');
Route::get('/user/{id?}', 'loginController@show');
Route::post('/user/update/{id?}', 'loginController@update');
Route::delete('/user/{id?}', 'loginController@destroy');


//=====Laporan Penjualan
Route::get('/penjualan', 'penjualanController@index');
Route::get('/penjualanjasa', 'penjualanController@LaporanJasa');
Route::get('/laporanpiutang', 'penjualanController@laporanPiutang');

Route::get('/penjualanbulanan', 'penjualanController@laporanBulanan');
Route::post('/lapPenjualanBulanan', 'penjualanController@laporanBulananSorting');
Route::post('/dataPiutang', 'penjualanController@piutangPelanggan');
Route::post('/lapPenjualan', 'penjualanController@sorting');
Route::post('/detailpenjualan/{id}', 'penjualanController@listDetailPenjualan');
Route::post('/detailpenjualanjasa/{id}', 'penjualanController@listDetailPenjualanJasa');
Route::delete('/hapuspenjualan/{id?}', 'penjualanController@destroy1');

Route::post('/laplaba', 'penjualanController@laporanLabaSorting');

//=====Laporan Pembelian
Route::get('/pembelian', 'pembelianController@index');
Route::post('/lapPembelian', 'pembelianController@sorting');
Route::post('/detailpembelian/{id}', 'pembelianController@listDetailPembelian');
Route::get('/laporanhutang', 'pembelianController@laporanHutang');

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
