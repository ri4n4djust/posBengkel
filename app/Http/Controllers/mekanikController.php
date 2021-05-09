<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Mekanik;

class mekanikController extends Controller
{
    //
    public function index()
    {
        $posts = Mekanik::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Pelanggan',
            'data' => $posts
        ], 200);
    }

    public function store(Request $request)
    {
            $post = Mekanik::create([
                'kdMekanik'     => $request->input('kdMekanik'),
                'namaMekanik'     => $request->input('namaMekanik'),
                'alamatMekanik'   => $request->input('alamatMekanik'),
                'jabatanMekanik'   => $request->input('jabatanMekanik'),
                'noTlpMekanik'   => $request->input('noTlpMekanik'),
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
        $post = Mekanik::where('kdMekanik', $id)->first();

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
            $post = Mekanik::where('kdMekanik', $request->input('kdMekanik'))->update([
                'namaMekanik'     => $request->input('namaMekanik'),
                'alamatMekanik'   => $request->input('alamatMekanik'),
                'jabatanMekanik'   => $request->input('jabatanMekanik'),
                'noTlpMekanik'   => $request->input('noTlpMekanik'),
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

    public function destroy($id)
    {
        $post = Mekanik::findOrFail($id);
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
