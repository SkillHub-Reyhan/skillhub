<?php

namespace Tests\Unit;

use App\Models\Student;
use Tests\TestCase; // Menggunakan TestCase utama agar bisa boot framework
use Illuminate\Support\Str;

class ModelUuidTest extends TestCase
{
    // Test apakah Student ID otomatis tergenerate sebagai UUID
    public function test_student_uses_uuid_v7(): void
    {
        $student = new Student();
        $uuid = $student->newUniqueId();

        // Cek apakah string valid UUID
        $this->assertTrue(Str::isUuid($uuid));
    }
}