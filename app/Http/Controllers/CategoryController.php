<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{
    //
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
