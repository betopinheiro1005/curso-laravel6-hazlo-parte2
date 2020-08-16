<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    public function run()
    {

        User::create([
            'name' => 'Roberto Pinheiro',
            'email' => 'betopinheiro1005@yahoo.com.br',
            'password' => bcrypt('12345678'),
            'email_verified_at' => now(),
        ]);

        factory(User::class, 13)->create();
    }
}
