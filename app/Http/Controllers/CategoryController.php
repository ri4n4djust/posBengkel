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
         // $realname = $image->getClientOriginalName();
          \Image::make($request->get('image'))->save(public_path('images/').$name );

          //$path = public_path('uploads/profile_images')."/".$name;
          //\Image::make($image->getRealPath())->resize(150,150)->save($path);
        

       $image= new DetailPartMotor();
       $image->image_name = $name;
       $image->save();


       return response()->json([
           'success' => 'You have successfully uploaded an image',
           'data'   => $name,
       ], 200);
       
     }

}
