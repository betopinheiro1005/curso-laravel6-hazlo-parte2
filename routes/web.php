<?php

// Auth::routes();
Auth::routes(['verify' => true]);

Route::get('/', 'HomeController@index')->name('home');

// Route::resource('usuarios', 'UserController')->middleware('auth');
Route::resource('usuarios', 'UserController');
Route::resource('roles', 'RoleController');

/* Rotas para a sessão de Notas */

// Route::get('/notas/todas', 'NotasController@todas');
Route::resource('/notas/todas', 'NotasController');
Route::get('/notas/favoritas', 'NotasController@favoritas');
Route::get('/notas/archivadas', 'NotasController@archivadas');

