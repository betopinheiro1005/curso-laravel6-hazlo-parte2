@extends('layouts.app')

@section('content')

<div class="row">
  <div class="col-sm-6">

     <h2>Editar usuário: {{ $user->name }}</h2>

      @if($errors->any())
        <div class="alert alert-danger">
          <ul>
            @foreach($errors->all() as $error)
              <li>{{ $error }}</li>
            @endforeach
          </ul>
        </div>
      @endif
  </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <form action="{{ route('usuarios.update', $user->id) }}" method="POST" enctype="multipart/form-data" >
                @method('PATCH')
                @csrf

                <div class="row">
                  <div class="form-group col-md-6">
                    <label>Nome</label>
                    <input type="text" name="name" class="form-control" placeholder="Nome" value="{{$user->name}}">
                  </div>
                  <div class="form-group col-md-6">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Email" value="{{$user->email}}">
                  </div>
                </div>                
      
                <div class="row">
                  <div class="form-group col-md-6">
                    <label>Senha <span class="small">(Opcional)</span></label>
                    <input type="password" name="password" class="form-control" placeholder="Senha">
                  </div> 
                  <div class="form-group col-md-6">
                    <label>Confirmar Senha <span class="small">(Opcional)</span></label>
                    <input type="password" name="password_confirmation" class="form-control" placeholder="Confirme Senha">
                  </div> 
                </div>
      
                <div class="row">
                  <div class="form-group col-md-6">
                    <label for="rol">Rol</label>
                    <select name="rol" class="form-control">
                      <option selected disabled>Selecione um rol para o usuário</option>
                      @foreach ($roles as $role)
                        @if($role->name == str_replace(array('["', '"]'), '', $user->tieneRol())));
                          <option value="{{ $role -> id }}" selected>{{ $role -> name}}</option>    
                        @else  
                          <option value="{{ $role -> id }}">{{ $role -> name}}</option>    
                        @endif  
                      @endforeach
                    </select>
                  </div> 
                  <div class="form-group col-md-6">
                    <label>Imagem</label>
                    <input type="file" name="image" class="form-control">
                    @if ($user->image != "")
                      <img src="{{ asset('images/' . $user->image) }}" alt="{{ $user->image }}" height="50px" width="50px">
                    @endif
                  </div> 
                </div>
      
                <button type="submit" class="btn btn-primary">Salvar</button>
                <button type="reset" class="btn btn-danger">Cancelar</button>

              </form>
        </div>
    </div>
</div>

@endsection