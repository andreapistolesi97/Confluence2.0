<?php

use App\Models\User;

test('la pagina di login si carica correttamente', function () {
    $response = $this->get('/');

    $response->assertStatus(200);
});

test('un utente può fare login con credenziali corrette', function () {
    $user = User::factory()->create([
        'email' => 'test@example.com',
        'password' => bcrypt('password123'),
    ]);

    $response = $this->post('/', [
        'email' => 'test@example.com',
        'password' => 'password123',
        'terms' => true,
    ]);

    $response->assertRedirect('/homepage');
    $this->assertAuthenticatedAs($user);
});

test('un utente non può fare login con password sbagliata', function () {
    $user = User::factory()->create([
        'email' => 'test@example.com',
        'password' => bcrypt('password123'),
    ]);

    $response = $this->post('/', [
        'email' => 'test@example.com',
        'password' => 'password_sbagliata',
        'terms' => true,
    ]);

    $response->assertSessionHasErrors('email');
    $this->assertGuest();
});

test('un utente non può fare login senza accettare i termini', function () {
    $user = User::factory()->create([
        'email' => 'test@example.com',
        'password' => bcrypt('password123'),
    ]);

    $response = $this->post('/', [
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('terms');
    $this->assertGuest();
});

test('un utente autenticato può fare logout', function () {
    $user = User::factory()->create();

    $response = $this->actingAs($user)->get('/logout');

    $this->assertGuest();
});
