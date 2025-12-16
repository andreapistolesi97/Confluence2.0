<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use Illuminate\Support\Facades\Auth;



class User extends Authenticatable
{
    use HasFactory, Notifiable, LogsActivity;

    protected static $logAttributes = ['name', 'email', 'password'];

    protected $table = 'User';
    protected $primaryKey = 'ID';

    public $incrementing = true;
    protected $keyType = 'int';

    protected $fillable = [
        'name',
        'surname',
        'email',
        'password',
        'role',
        'username',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'email', 'password'])
            ->setDescriptionForEvent(function (string $eventName) {
                $userName = Auth::user()?->name ?? 'Unknown user';
                return "{$userName} has {$eventName} a user";
            })
            ->useLogName('User');
    }
}
