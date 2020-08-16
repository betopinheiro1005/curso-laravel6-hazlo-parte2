<?php

namespace App\Http\Controllers;

use App\Notas;
use Illuminate\Http\Request;

class NotasController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
        $this->middleware('verified');
    }

    public function index(){
        $notas = Notas::all()->where('user_id', auth()->id());        
        return view('notas.todas.index', ['notas' => $notas]);
    }

    public function store(Request $request){
        $nota = new Notas();

        $nota -> titulo = $request -> titulo;
        $nota -> texto = $request -> texto;
        $nota -> user_id = auth() -> id();

        $nota -> save();

        // return redirect('notas/todas');
        return redirect()->route('todas.index');
    }

    public function edit($id){
        $nota = Notas::findOrFail($id);
        return view('notas.todas.edit', ['nota' => $nota]);
    }

    public function update(Request $request, $id){
        $nota = Notas::findOrFail($id);

        // $nota -> titulo = $request -> get('titulo');
        // $nota -> texto = $request -> get('texto');

        $nota -> titulo = $request -> titulo;
        $nota -> texto = $request -> texto;

        $nota -> update();

        return redirect()->route('todas.index');

    }

    public function destroy($id){
        $nota = Notas::findOrFail($id);
        $nota -> delete();

        return redirect()->route('todas.index');
    }


    public function favoritas(){
        return view('notas.favoritas');
    }

    public function archivadas(){
        return view('notas.archivadas');
    }
}
