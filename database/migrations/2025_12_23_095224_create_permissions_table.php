<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */

    //mi serve come lista per tutto ciò che può essere abilitato e non (cioè quali permessi esistone)
    public function up(): void
    {
        Schema::create('permissions', function (Blueprint $table) {
            $table->id();
            //la key è il valore per capire il permesso (es. view_logs)
            $table->string('key')->unique();
            //header della tabella con il permesso
            $table->string('label');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('permissions');
    }
};
