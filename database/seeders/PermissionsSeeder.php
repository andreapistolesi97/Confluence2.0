<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $perms = [
            ['key' => 'homepage', 'label' => 'Homepage'],
            ['key' => 'autocoupling', 'label' => 'Auto Coupling Overview'],
            ['key' => 'review', 'label' => 'Review'],
            ['key' => 'logs', 'label' => 'Logs'],
            ['key' => 'productionaction', 'label' => 'Production Action'],
            ['key' => 'monitoring', 'label' => 'Monitoring'],
            ['key' => 'searches', 'label' => 'Searches'],
            ['key' => 'documentation', 'label' => 'Documentation'],
            ['key' => 'help', 'label' => 'Help & Support'],
            ['key' => 'adduser', 'label' => 'Add User'],
            ['key' => 'rolepermissions', 'label' => 'Role & Permissions'],
            ['key' => 'performance', 'label' => 'Performance'],

        ];

        foreach ($perms as $p) {
            DB::table('permissions')->updateOrInsert(
                ['key' => $p['key']],
                ['label' => $p['label']]
            );
        }
    }
}
