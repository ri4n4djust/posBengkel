<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setup;

class setupController extends Controller
{
    //
    public function index()
    {
        $posts = Setup::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
    }

    public function codeharga($id)
    {
        $posts = Setup::where('noHrg', $id)->first();
        return response([
            'success' => true,
            'message' => 'List Semua Supplier',
            'data' => $posts
        ], 200);
    }

    public function Update(Request $request){
        Setup::whereId($request->input('id'))->update([
                    'noHrg'      => $request->input('noHrg'),
                    'codeHrg'   => $request->input('codeHrg'),
                    ]);
    }
}
