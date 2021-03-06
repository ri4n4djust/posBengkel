<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/tesprint', function () {
    return view('welcome');
});
Route::get('/sparepart', function () {
    return view('pages.sparepart');
});
Route::get('/master', function () {
    return view('pages.master');
});

Route::get('{any}', function () { 
    return view('pages.bengkel'); 
})->where('any', '.*'); 


