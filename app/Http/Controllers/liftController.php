<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Lift;

class liftController extends Controller
{
    //
    public function index()
    {
        $posts = Lift::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Lift',
            'data' => $posts
        ], 200);
    }

    public function store(Request $request)
    {
            $post = Lift::create([
                'kdLift'     => $request->input('kdLift'),
                'noLift'     => $request->input('noLift'),
                'mekanikLift'   => '-',
                'statusLift'   => 0,
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
        $post = Lift::where('id', $id)->first();

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
            $post = Lift::where('kdLift', $request->input('kdLift'))->update([
                'noLift'     => $request->input('noLift'),
                'mekanikLift'   => $request->input('mekanikLift'),
                'statusLift'   => $request->input('statusLift'),
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
        $post = Lift::findOrFail($id);
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
