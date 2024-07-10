<?php

namespace App\Http\Controllers;

use App\Models\Note;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $note_list = Note::all();

        $kiriman = ([
            'id_member' => 'required|max:255'
        ]);

        $validate = Validator::make($request->all(), $kiriman);
        
        if ($validate->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal mendapatkan data',
                'data' => $validate->errors()
            ]);
        }

        // dd($request->id_member);

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil mendapatkan data',
            'data' => $note_list->where('id_user', $request->id_member)
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validate = Validator::make($request->all(), [
            'id_user' => 'required|exists:users,id',
            'nama' => 'required|string',
            'nominal' => 'required',
            'jenis' => 'required|string',
            'deskripsi' => 'required|string',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal menambahkan data',
                'data' => $validate->errors(),
            ]);
        }

        $data = Note::create($request->all());

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil menambahkan data',
            'data' => $request->all(),
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'id' => 'required',
            'nama' => 'required|string',
            'nominal' => 'required',
            'jenis' => 'required|string',
            'deskripsi' => 'required|string',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal mengubah data',
                'data' => $validate->errors(),
            ]);
        }

        $data = Note::where('id', $request->id)->first();

        $data->update($request->all());

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil mengubah data',
            'data' => $request->all(),
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'id' => 'required'
        ]);
        
        if ($validate->fails()) {
            return response()->json([
                'is_success' => false,
                'message' => 'Gagal menghapus data',
                'data' => $validate->errors()
            ]);
        }

        $data = Note::find($request->id);

        $data->delete();

        return response()->json([
            'is_success' => true,
            'message' => 'Berhasil menghapus data',
        ]);
    }
}
