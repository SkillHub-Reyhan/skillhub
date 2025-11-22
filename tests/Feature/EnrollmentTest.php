<?php

namespace Tests\Feature;

use App\Models\Course;
use App\Models\Student;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class EnrollmentTest extends TestCase
{
    use RefreshDatabase;

    // Test Siswa Mendaftar Kelas (Attach)
    public function test_student_can_enroll_in_course(): void
    {
        $student = Student::factory()->create();
        $course = Course::create(['name' => 'PHP Basics', 'instructor' => 'John']);

        $response = $this->post(route('enrollments.store'), [
            'student_id' => $student->id,
            'course_id' => $course->id,
        ]);

        $response->assertRedirect();
        $response->assertSessionHas('success');

        // Cek Tabel Pivot
        $this->assertDatabaseHas('course_student', [
            'student_id' => $student->id,
            'course_id' => $course->id,
        ]);
    }

    // Test Mencegah Pendaftaran Ganda
    public function test_student_cannot_enroll_twice_in_same_course(): void
    {
        $student = Student::factory()->create();
        $course = Course::create(['name' => 'PHP Basics', 'instructor' => 'John']);

        // Daftar pertama kali
        $student->courses()->attach($course->id, ['id' => (string) \Illuminate\Support\Str::uuid7()]);

        // Coba daftar lagi
        $response = $this->post(route('enrollments.store'), [
            'student_id' => $student->id,
            'course_id' => $course->id,
        ]);

        // Harusnya error / gagal
        $response->assertSessionHas('error', 'Peserta sudah terdaftar di kelas ini.');
        
        // Pastikan data di pivot tetap 1, bukan 2
        $this->assertCount(1, $student->courses);
    }

    // Test Batalkan Pendaftaran (Detach)
    public function test_student_can_cancel_enrollment(): void
    {
        $student = Student::factory()->create();
        $course = Course::create(['name' => 'Java', 'instructor' => 'Jane']);

        // Attach dulu
        $student->courses()->attach($course->id, ['id' => (string) \Illuminate\Support\Str::uuid7()]);

        // Lakukan Detach via route
        $response = $this->delete(route('enrollments.destroy'), [
            'student_id' => $student->id,
            'course_id' => $course->id,
        ]);

        $response->assertSessionHas('success');

        // Cek database pivot harus kosong
        $this->assertDatabaseMissing('course_student', [
            'student_id' => $student->id,
            'course_id' => $course->id,
        ]);
    }
}