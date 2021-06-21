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
        $tahun = TahunMotor::where('kdJenis', $id)->get();
        //return response()->json($categories, 200);
        return response([
            'success' => true,
            'message' => 'List Semua Type',
            'data' => $tahun
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

    public function create(Request $request){
        $category = new Category;
        $category->name = $request->name;
        $category->parent_id = $request->parent_id; 
        $category->save(); 
        return response()->json($category, 200);
    }

    public function allCategories()
    {
        $categories = Category::with('children')->whereNull('parent_id')->get();
        return response()->json($categories, 200);
    } 


}
