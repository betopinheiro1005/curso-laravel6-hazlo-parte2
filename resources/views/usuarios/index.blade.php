@extends('layouts.app')

@section('content')

    <div class="container">
        <h2>Lista de usuários registrados <a href="{{route('usuarios.create')}}"><button class="btn btn-success float-right">Cadastrar usuário</button></a> </h2>

        <h6>
            @if ($search)
                <div class="alert alert-primary" role="alert">
                    Os resultados da busca '{{ $search }}' são:
                </div>
            @endif
        </h6>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Nome</th>
                <th scope="col">Email</th>
                <th scope="col">Rol</th>
                <th scope="col">Imagem</th>
                <th scope="col" width="100px">Opções</th>
            </tr>
            </thead>
            <tbody>

                @foreach ($users as $user)
                    <tr>
                        <th scope="row">{{  $user->id }}</th>
                        <td>{{  $user->name }}</td>
                        <td>{{  $user->email }}</td>
                        <td>
                            @foreach ($user->roles as $role)
                                {{  $role->name }}         
                            @endforeach
                        </td>
                        <td>
                            <img src="{{ asset('images/' . $user->image) }}" alt="{{ $user->image }}" height="50px" width="50px">
                        </td>
                        <td>

                        </td>
                    </tr>
                @endforeach

            </tbody>
        </table>    

        <div class="row">
            <div class="mx-auto">
                {{ $users -> links() }}
            </div>
        </div>

    </div>

@endsection

