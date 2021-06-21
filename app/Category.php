<?php

namespace App;

//use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //
    protected $table = 'categories';

    protected $fillable = [
         'parent_id', 'name'
    ];

    //use HasFactory;

    public function children() 
    {
        return $this->hasMany(Category::class, 'parent_id');
    }
}
