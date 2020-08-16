@extends('layouts.app')

@section('content')

    <div class="container">

        <div class="row">
            <div class="col-md-6 mx-auto">
                <h2>Roles de usuários
                    @include('roles.modal')
                </h2>

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nome</th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach ($roles as $role)
                            <tr>
                                <th scope="row">{{  $role->id }}</th>
                                <td>{{  $role->name }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>    
            </div>
   
        </div>
    </div>

@endsection

