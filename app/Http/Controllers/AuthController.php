<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function registrasi(Request $request) {
        
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal mendaftar',
                'data' => $validator->errors()
            ]);
        }

        $user = User::create([
            'id_member' => (string) Str::uuid(),
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil mendaftar',
            'data' => $request->all(),
        ]);
    }

    public function login(Request $request) {

        
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|max:255',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Login gagal',
                'data' => $validator->errors()
            ]);
        }

        $user = User::where('email', $request->email)->first();

        // dd($user);
        
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'is_success' => false,
                'message' => 'User tidak ada',
                'data' => ''
            ]);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'is_success' => true,
            'token' => $token,
            'message' => 'Login berhasil',
            'data' => $user
        ]);
    }

    public function logout(Request $request) {
        $request->user()->currentAccesToken()->delete();
        
        return response()->json([
            'is_success' => true,
            'message' => 'Logout berhasil',
        ]);
    }

    public function update(Request $request) {

        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal memperbarui data',
                'data' => $validator->errors()
            ]);
        }

        $data = User::where('id', $request->id)->first();

        $data->update($request->all());

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil memperbarui data',
            'data' => $request->all(),
        ]);
    }

    public function destroy(Request $request) {

        $validate = Validator::make($request->all(), [
            'id' => 'required'
        ]);

        if ($validate->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal menghapus data',
            ]);
        }

        $data = User::find($request->id);
        $data->delete();

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil menghapus data',
        ]);
    }
}
