<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Jasa;

class jasaController extends Controller
{
    //
    public function index()
    {
        $posts = Jasa::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Pelanggan',
            'data' => $posts
        ], 200);
    }

    public function store(Request $request)
    {
            $post = Jasa::create([
                'kdJasa'     => $request->input('kdJasa'),
                'namaJasa'     => $request->input('namaJasa'),
                'biayaJasa'   => $request->input('biayaJasa'),
                'desJasa'   => $request->input('desJasa'),
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
        $post = Jasa::where('id', $id)->first();

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
            $post = Jasa::where('kdJasa', $request->input('kdJasa'))->update([
                'namaJasa'     => $request->input('namaJasa'),
                'biayaJasa'   => $request->input('biayaJasa'),
                'desJasa'   => $request->input('desJasa'),
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
        $post = Jasa::findOrFail($id);
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
