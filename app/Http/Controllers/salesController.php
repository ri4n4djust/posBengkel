<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Cookie;
use Tracker;
use Session;
use Auth;


use App\Barang;
use App\Inventori;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class salesController extends Controller
{
    //
    public function index()
    {
        $posts = Barang::join('tblKategori', 'tblBarang.ktgBarang', '=', 'tblKategori.kodeKtg')
                //->where('tblBarang.stsBarang', '1')
                ->orderBy('id', 'DESC')
                ->get(['tblBarang.*', 'tblKategori.namaKtg']);
        //$posts = Barang::latest()->get();
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Posts',
            'data' => $posts
        ], 200);
    }

    public function cariBarang(Request $request){
        $barangs = Barang::where('barcode','LIKE',''.$request->brg.'%')
                        ->take(5)
                        ->get();
        return response([
            'data' => $barangs
        ]);
    }

    public function cariBarcode($id){
        $barangs = Barang::where('barcode', $id)->get();
        return response([
            'data' => $barangs
        ]);
    }

    public function semua()
    {
        $posts = Barang::join('tblKategori', 'tblBarang.ktgBarang', '=', 'tblKategori.kodeKtg')
                ->get(['tblBarang.*', 'tblKategori.namaKtg']);
        //$posts = Barang::latest()->get();
        $count = Barang::count();
        return response([
            'success' => true,
            'message' => 'List Semua Posts',
            'kdBarang' => $count + 1,
            'data' => $posts
        ], 200);
    }



    public function store(Request $request)
    {
        //validate data
        $validator = Validator::make($request->all(), [
            'nmBarang'     => 'required',
            'hrgJual'   => 'required',
        ],
            [
                'nmBarang.required' => 'Masukkan Nama Barang !',
                'hrgJual.required' => 'Masukkan Harga !',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {
            //$file = $request->file('gbrBarang');

            //$imageName = time().'.'.$request->name->getClientOriginalExtension();
            //$request->image->move(public_path('images'), $imageName);

            $post = Barang::create([
                'kdBarang'     => $request->input('kdBarang'),
                'nmBarang'     => $request->input('nmBarang'),
                'hrgPokok'   => $request->input('hrgPokok'),
                'hrgJual'   => $request->input('hrgJual'),
                'barcode'   => $request->input('barcode'),
                'deskripsi'   => $request->input('deskripsi'),
                'ktgBarang' => $request->input('ktgBarang'),
                'satuanBarang' => $request->input('satuanBarang'),
                'merek' => $request->input('merek'),
                'qtyMin' => $request->input('qtyMin'),
                'qtyMax' => $request->input('qtyMax'),
                'cPokok' => $request->input('cPokok'),
                'cJual' => $request->input('cJual'),
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
        $post = Barang::whereId($id)->first();

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
            'nmBarang'     => 'required',
            'hrgJual'   => 'required',
        ],
            [
                'nmBarang.required' => 'Masukkan Title Post !',
                'hrgJual.required' => 'Masukkan Harga Jual !',
            ]
        );

        if($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ],400);

        } else {

            $post = Barang::whereId($request->input('id'))->update([
                'kdBarang'     => $request->input('kdBarang'),
                'nmBarang'     => $request->input('nmBarang'),
                'hrgPokok'   => $request->input('hrgPokok'),
                'hrgJual'   => $request->input('hrgJual'),
                'stkBarang'   => $request->input('stkBarang'),
                'deskripsi'   => $request->input('deskripsi'),
                'ktgBarang' => $request->input('ktgBarang'),
                'satuanBarang' => $request->input('satuanBarang'),
                'merek' => $request->input('merek'),
                'qtyMin' => $request->input('qtyMin'),
                'qtyMax' => $request->input('qtyMax'),
                'barcode' => $request->input('barcode'),
                'cPokok' => $request->input('cPokok'),
                'cJual' => $request->input('cJual'),
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

    }

    public function destroy($id)
    {
        $post = Barang::findOrFail($id);
        $kodebarang = $post->kdBarang;

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


    public function search(Request $request)
    {
        $categories = Barang::where('nmBarang','LIKE',$request->search.'%')->get();

        return response()->json($categories);
    }
}
