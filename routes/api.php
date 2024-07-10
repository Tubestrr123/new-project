<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\NoteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/registrasi', [AuthController::class, 'registrasi']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/note', [NoteController::class, 'index']);

Route::middleware('auth:sanctum')->group(function () {
    // Note
    Route::post('/note/tambah', [NoteController::class, 'store']);
    Route::post('/note/update', [NoteController::class, 'update']);
    Route::post('/note/hapus', [NoteController::class, 'destroy']);

    // User
    Route::post('/user/update', [AuthController::class, 'update']);
    Route::post('/user/hapus', [AuthController::class, 'destroy']);
    Route::post('/logout', [AuthController::class, 'logout']);
});
