<?php

namespace App\Support;


use Illuminate\Support\Facades\DB;

//creato classe per controllare chi ha i permessi,in pratica questo ruolo ha questo permesso?
//mi ritorna un booleano true se ha il permesso, false altrimenti.



class CheckPermission
{
    //la chiamata prende due cose,il ruolo e la key del permesso
    public static function hasPermissions(string $role, string $key): bool
    {
        //per evitare problemi di spazi bianchi o maiuscole/minuscole tolgo spazi e metto tutto minuscolo
        $role = strtolower(trim($role));

        //parto dalla tabella role_permissions che è quella che mi dice che sales ha permissions_id5 per esempio

        return DB::table('role_permission')
            //faccio una join tra due tabelle perchè in role permissions ho solo l'id del permesso
            //ma a me serve le key tipo 'logs'
            ->join('permissions', 'permissions.id', '=', 'role_permission.permission_id')
            //mi prende il ruolo e la key del permesso
            ->where('role_permission.role', $role)
            ->where('permissions.key', $key)
            //verifica se c'è una riga che rispetta queste condizioni
            ->exists();
    }
}
