<?php

namespace App\Http\Controllers;

use App\User;
use App\Role;

use App\Http\Requests\UserFormRequest;
use App\Http\Requests\UserEditFormRequest;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('verified');
    }

    public function index(Request $request)
    {

         if($request) {
            $query = trim($request->get('search'));
            // $users = User::where('name','LIKE','%'. $query . '%')->orderBy('id','asc')->get();
            $users = User::where('name','LIKE','%'. $query . '%')->orderBy('id','asc')->paginate(5);
            // $users = User::where('name','LIKE','%'. $query . '%')->orderBy('id','asc')->simplePaginate(5);
            return view('usuarios.index', ['users' => $users, 'search' => $query]);
        }


        $users = User::all();
        return view('usuarios.index', ['users'=>$users]);
    }

    public function create()
    {
        $roles = Role::all();
        return view('usuarios.create', ['roles' => $roles]);
    }

    public function store(UserFormRequest $request)
    {
        $usuario = new User();
        $usuario->name = $request->name;
        $usuario->email = $request->email;
        $usuario->password = bcrypt($request->password);

        if($request->hasFile('image')){
            $file = $request->image;
            $file->move(public_path() . '/images', $file->getClientOriginalName());
            $usuario->image = $file->getClientOriginalName();
        }

        $usuario->save();

        $usuario->asignarRol($request->rol);

        return redirect()->route('usuarios.index');
    }

    public function show($id)
    {
        $user = User::findOrFail($id);
        return view('usuarios.show', ['user'=>$user]);
    }

    public function edit($id)
    {
        $user = User::findOrFail($id);
        $roles = Role::all();
        return view('usuarios.edit', ['user'=>$user, 'roles'=>$roles]);
    }

    public function update(UserEditFormRequest $request, $id)
    {
        $this->validate(request(), ['email' => ['required', 'email', 'max:255', 'unique:users,email,' . $id]]);

        $usuario = User::findOrFail($id);
        $usuario->name = $request->get('name');
        $usuario->email = $request->get('email');

        if($request->hasFile('image')){
            $file = $request->image;
            $file->move(public_path() . '/images', $file->getClientOriginalName());
            $usuario->image = $file->getClientOriginalName();
        }

        $pass = $request->get('password');

        if($pass != null){
            $usuario->password = bcrypt($request->get('password'));
        } else {
            unset($usuario->password);
        }

        // Modificamos esta parte para que atualize roles de usuários
        // Se tem rol, atualizamos o rol
        // Se não tem rol, atribuimos um rol
        // 

        $role = $usuario->roles;

        if (count($role) > 0){
            $role_id = $role[0]->id;
            User::find($id)->roles()->updateExistingPivot($role_id, ['role_id' => $request->get('rol')]);
        } else {
            $usuario->asignarRol($request->rol);
        }

        $usuario->update();

        return redirect()->route('usuarios.index');

    }

    public function destroy($id)
    {
        $usuario = User::findOrFail($id);
        $usuario->delete();

        return redirect()->route('usuarios.index');
    }
}
