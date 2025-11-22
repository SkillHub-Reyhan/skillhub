<?php

namespace Tests\Feature;

use App\Models\Student;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class StudentTest extends TestCase
{
    use RefreshDatabase; // Membersihkan database setiap kali test jalan

    // Test Halaman Index Bisa Dibuka
    public function test_student_index_screen_can_be_rendered(): void
    {
        $response = $this->get(route('students.index'));
        $response->assertStatus(200);
    }

    // Test Tambah Peserta Baru
    public function test_new_student_can_be_created(): void
    {
        $response = $this->post(route('students.store'), [
            'name' => 'Budi Santoso',
            'email' => 'budi@example.com',
            'phone' => '08123456789'
        ]);

        // Pastikan redirect kembali (sesuai controller)
        $response->assertRedirect();
        $response->assertSessionHas('success');

        // Pastikan data masuk database
        $this->assertDatabaseHas('students', [
            'email' => 'budi@example.com',
        ]);
    }

    // Test Validasi Email Unik
    public function test_student_email_must_be_unique(): void
    {
        Student::factory()->create(['email' => 'duplicate@example.com']);

        $response = $this->post(route('students.store'), [
            'name' => 'User Kedua',
            'email' => 'duplicate@example.com', // Email sama
        ]);

        $response->assertSessionHasErrors('email');
    }

    // Test Update Data
    public function test_student_can_be_updated(): void
    {
        $student = Student::factory()->create();

        $response = $this->put(route('students.update', $student->id), [
            'name' => 'Updated Name',
            'email' => $student->email, // Email sama seharusnya boleh (ignore id sendiri)
            'phone' => '000000'
        ]);

        $response->assertRedirect(route('students.index'));
        
        $this->assertDatabaseHas('students', [
            'id' => $student->id,
            'name' => 'Updated Name'
        ]);
    }

    // Test Soft Delete
    public function test_student_can_be_deleted(): void
    {
        $student = Student::factory()->create();

        $response = $this->delete(route('students.destroy', $student->id));

        $response->assertRedirect();
        
        // Cek di database bahwa deleted_at TIDAK NULL (Soft Delete)
        $this->assertSoftDeleted('students', [
            'id' => $student->id
        ]);
    }
}