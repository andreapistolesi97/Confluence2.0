<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LogSource extends Model
{
    protected $table ="log_sources";


    protected $fillable = [
        'type',
        'label',
        'table_name'
    ];

      public $timestamps = false;
}
