<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateTokenAccess extends Migration
{
    public function up()
    {
        Schema::table('personal_access_tokens', function (Blueprint $table) {
            // Ubah tipe data tokenable_id menjadi UUID
            $table->uuid('tokenable_id')->change();
        });
    }

    public function down()
    {
        Schema::table('personal_access_tokens', function (Blueprint $table) {
            // Kembalikan tipe data tokenable_id ke integer jika diperlukan
            $table->unsignedBigInteger('tokenable_id')->change();
        });
    }
}
