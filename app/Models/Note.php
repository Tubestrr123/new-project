<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Note extends Model
{
    use HasFactory, SoftDeletes;

    public $table = 'note';

    protected $dates = ['deleted_at'];

    protected $fillable = ['id_user', 'nama', 'tanggal_masuk', 'tanggal_keluar', 'tanggal_dipakai', 'tanggal_selesai_dipakai', 'nominal', 'jenis', 'deskripsi'];

    public function user() {
        return $this->belongsTo(User::class, 'id_user');
    }
}
