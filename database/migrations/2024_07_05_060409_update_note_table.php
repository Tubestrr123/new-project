<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateNoteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('note', function (Blueprint $table) {
            $table->string('tanggal_masuk')->nullable()->change();
            $table->string('tanggal_keluar')->nullable()->change();
            $table->string('tanggal_dipakai')->nullable()->change();
            $table->string('tanggal_selesai_dipakai')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('note', function (Blueprint $table) {
            $table->string('tanggal_masuk')->change();
            $table->string('tanggal_keluar')->change();
            $table->string('tanggal_dipakai')->change();
            $table->string('tanggal_selesai_dipakai')->change();
        });
    }
}
