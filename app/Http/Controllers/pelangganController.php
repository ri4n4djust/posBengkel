<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pelanggan;

use Illuminate\Support\Facades\Validator;

class pelangganController extends Controller
{
    //
    public function index()
    {
        $posts = Pelanggan::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Pelanggan',
            'data' => $posts
        ], 200);
    }

    public function store(Request $request)
    {
        //validate data
        $validator = Validator::make($request->all(), [
            'namaPelanggan'     => 'required',
            'noTlp'   => 'required',
        ],
            [
                'namPelanggan.required' => 'Masukkan Nama Pelanggan',
                'noTlp.required' => 'Masukkan No Hp Pelanggan !',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {

            $post = Pelanggan::create([
                'kodePelanggan'     => $request->input('kodePelanggan'),
                'namaPelanggan'     => $request->input('namaPelanggan'),
                'alamatPelanggan'   => $request->input('alamatPelanggan'),
                'noTlp'   => $request->input('noTlp'),
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
    }
    public function show($id)
    {
        $post = Pelanggan::where('kodePelanggan', $id)->first();

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
        //validate data
        $validator = Validator::make($request->all(), [
            'namaPelanggan'     => 'required',
            'noTlp'   => 'required',
        ],
            [
                'namaPelanggan.required' => 'Masukkan Nama Pelanggan !',
                'noTlp.required' => 'Masukkan No Hp Pelanggan !',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {

            $post = Pelanggan::where('kodePelanggan', $request->input('kodePelanggan'))->update([
                'namaPelanggan'     => $request->input('namaPelanggan'),
                'alamatPelanggan'   => $request->input('alamatPelanggan'),
                'noTlp'   => $request->input('noTlp'),
            ]);


            if ($post) {
                return response()->json([
                    'success' => true,
                    'message' => 'Data Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Data Gagal Diupdate!',
                ], 500);
            }

        }

    }

    public function destroy($id)
    {
        $post = Pelanggan::findOrFail($id);
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
