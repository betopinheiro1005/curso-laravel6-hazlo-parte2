@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-sm-6">

            <h2>Criar novo usuário</h2>

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
  
      <form action="{{ route('usuarios.store') }}" method="POST" enctype="multipart/form-data">
          @csrf

          <div class="row">
            <div class="form-group col-md-6">
              <label>Nome</label>
              <input type="text" name="name" class="form-control" placeholder="Nome">
            </div>
            <div class="form-group col-md-6">
              <label>Email</label>
              <input type="email" name="email" class="form-control" placeholder="Email">
            </div>
          </div>                

          <div class="row">
            <div class="form-group col-md-6">
              <label>Senha</label>
              <input type="password" name="password" class="form-control" placeholder="Senha">
            </div> 
            <div class="form-group col-md-6">
              <label>Confirmar Senha</label>
              <input type="password" name="password_confirmation" class="form-control" placeholder="Confirme Senha">
            </div> 
          </div>

          <div class="row">
            <div class="form-group col-md-6">
              <label for="rol">Rol</label>
              <select name="rol" class="form-control">
                <option selected disabled>Selecione um rol para o usuário</option>
                @foreach ($roles as $role)
                  <option value="{{ $role -> id }}">{{ $role -> name}}</option>    
                @endforeach
              </select>
            </div> 
            <div class="form-group col-md-6">
              <label>Imagem</label>
              <input type="file" name="image" class="form-control">
            </div> 
          </div>

          <button type="submit" class="btn btn-primary">Registrar</button>
          <button type="reset" class="btn btn-danger">Cancelar</button>
        </form>
</div>

@endsection