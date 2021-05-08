<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Motor;

class motorController extends Controller
{
    //
  //
  public function index()
  {
      $data = Motor::join('tblPelanggan', 'tblMotor.pemilikMotor', 'tblPelanggan.kodePelanggan')
                    ->select('tblMotor.*', 'tblPelanggan.namaPelanggan', 'tblPelanggan.kodePelanggan')
                    ->get();
      return response([
          'success' => true,
          'message' => 'List Semua Motor',
          'data' => $data
      ], 200);
  }

  public function store(Request $request)
  {
      

          $post = Motor::create([
              'kdMotor'     => $request->input('kdMotor'),
              'platMotor'     => $request->input('platMotor'),
              'namaMotor'   => $request->input('namaMotor'),
              'pemilikMotor'    => $request->input('pemilikMotor'),
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


  public function show($id)
  {
      $post = Motor::whereId($id)->first();

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

  public function update(Request $request)
  {

          $post = Motor::whereId($request->input('id'))->update([
              'platMotor'   => $request->input('platMotor'),
              'namaMotor'   => $request->input('jenisMotor'),
              'pemilikMotor'   => $request->input('pemilikMotor'),
          ]);
          if ($post) {
              return response()->json([
                  'success' => true,
                  'message' => 'Post Berhasil Diupdate!',
              ], 200);
          } else {
              return response()->json([
                  'success' => false,
                  'message' => 'Post Gagal Diupdate!',
              ], 500);
          }

      

  }

  public function destroy($id)
  {
      $post = Motor::findOrFail($id);
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
