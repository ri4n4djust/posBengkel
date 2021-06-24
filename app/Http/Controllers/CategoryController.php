<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\MerekMotor;
use App\JenisMotor;
use App\TypeMotor;
use App\TahunMotor;
use App\KatSpMotor;
use App\DetailPartMotor;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Image;
use App\FileUpload;

class CategoryController extends Controller
{
    public function Semua()
    {
        $categories = MerekMotor::all();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Merek',
            'data' => $categories
        ], 200);
    }
    public function Jenis($id)
    {
        $Jenis = JenisMotor::where('kdMerek', $id)->get();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Jenis',
            'data' => $Jenis
        ], 200);
    }

    public function Type($id)
    {
        $type = TypeMotor::where('kdJenis', $id)->get();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Type',
            'data' => $type
        ], 200);
    }

    public function Tahun($id)
    {
        $tahun = TahunMotor::where('kdType', $id)->get();
        $nmType = TypeMotor::where('kdType', $id)->first();
        //$nmTahun = TahunMotor::where('kdType', $id)->first();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Type',
            'data' => $tahun,
            'nmType' => $nmType,
        ], 200);
    }

    public function pilihTahun($id)
    {
        //$tahun = TahunMotor::where('kdType', $id)->get();
        $nmTahun = TahunMotor::where('kdTahun', $id)->first();
        //$nmTahun = TahunMotor::where('kdType', $id)->first();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Tahun',
            //'data' => $tahun,
            'nmTahun' => $nmTahun,
        ], 200);
    }

    public function DetailMotor($id)
    {
        $tahun = DetailPartMotor::where('kdDetail', $id)->get();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Detail',
            'data' => $tahun
        ], 200);
    }

    public function DetailSPMotor($id)
    {
        $tahun = DetailPartMotor::where('kdDetailMotor', $id)->first();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Detail',
            'data' => $tahun
        ], 200);
    }

    public function ListSPMotor($id)
    {
        $tahun = KatSpMotor::where('kdDetailMotor', $id)->get();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Detail',
            'data' => $tahun
        ], 200);
    }


    public function ListDetSPMotor($id)
    {
        $tahun = KatSpMotor::where('kdKatSp', $id)->first();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Detail',
            'data' => $tahun
        ], 200);
    }

    public function createMerek(Request $request){
        $insert = MerekMotor::create([
            'kdMerek'   => $request->input('kdMerek'),
            'nmMerek'   => $request->input('nmMerek'),
        ]);
        if ($insert) {
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

    public function createJenis(Request $request){
        $insert = JenisMotor::create([
            'kdMerek'   => $request->input('kdMerek'),
            'kdJenis'   => $request->input('kdJenis'),
            'nmJenis'   => $request->input('nmJenis'),
        ]);
        if ($insert) {
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

    public function createType(Request $request){
        $insert = TypeMotor::create([
            'kdMerek'   => $request->input('kdMerek'),
            'kdJenis'   => $request->input('kdJenis'),
            'kdType'   => $request->input('kdType'),
            'nmType'   => $request->input('nmType'),
        ]);
        if ($insert) {
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

    public function createTahun(Request $request){
        $insert = TahunMotor::create([
            'kdMerek'   => $request->input('kdMerek'),
            'kdJenis'   => $request->input('kdJenis'),
            'kdType'   => $request->input('kdType'),
            'kdTahun'   => $request->input('kdTahun'),
            'nmTahun'   => $request->input('nmTahun'),
        ]);
        if ($insert) {
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

    public function storeMotor(Request $request)
    {
        
          $image = $request->get('image');
          $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
         $path = 'image/foto/';
         if (!file_exists($path)) {
            File::makeDirectory($path, 0755, true);
          }
          \Image::make($request->get('image'))->save($path.$name);
          
          $insert = DetailPartMotor::create([
            'kdDetail'   => $request->input('newKode'),
            'kdDetailMotor'   => $request->input('kdDetailMotor'),
            'kdType'   => $request->input('nama'),
            'kdTahun'   => $request->input('tahun'),
            'nmDetail'   => $request->input('nmDetail'),
            'warnaDetail'   => $request->input('warnaDetail'),
            'gbrDetail'   => $name,
        ]);
       return response()->json([
           'success' => 'You have successfully uploaded an image',
           'data'   => $name,
       ], 200);
       
     }

     public function storeSpMotor(Request $request)
    {
        
          $image = $request->get('image');
          $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
         $path = 'image/foto/katsp/';
         if (!file_exists($path)) {
            File::makeDirectory($path, 0755, true);
          }
          \Image::make($request->get('image'))->save($path.$name);
          
          $insert = KatSpMotor::create([
            'kdDetail'   => $request->input('kdDetail'),
            'kdDetailMotor'   => $request->input('kdDetailMotor'),
            'kdKatSp'   => $request->input('kdKatSp'),
            'nmKatSp'   => $request->input('nmKatSp'),
            'gbrKatSp'   => $name,
        ]);
       return response()->json([
           'success' => 'You have successfully uploaded an image',
           'data'   => $name,
       ], 200);
       
     }

     public function delMotor($id)
    {
        $post = DetailPartMotor::findOrFail($id);
        $gbr = $post->gbrDetail ;
        if (File::exists('image/foto/'.$gbr)) {
            File::delete('image/foto/'.$gbr);
        }
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

    public function delSpMotor($id)
    {
        $post = KatSpMotor::findOrFail($id);
        $gbr = $post->gbrKatSp ;
        if (File::exists('image/foto/katsp/'.$gbr)) {
            File::delete('image/foto/katsp/'.$gbr);
        }
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
