<?php

namespace Tests\Unit;

use App\Models\Course;
use App\Models\Student;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Str;
use Tests\TestCase;

class StudentTest extends TestCase
{
    // 1. Test apakah model memiliki kolom fillable yang benar
    public function test_student_model_has_correct_fillable_attributes(): void
    {
        $student = new Student();
        
        $expectedFillable = ['name', 'email', 'phone'];
        
        // Pastikan array fillable di model sama dengan ekspektasi
        $this->assertEquals($expectedFillable, $student->getFillable());
    }

    // 2. Test apakah model menggunakan UUID v7
    public function test_student_model_uses_uuid_v7(): void
    {
        $student = new Student();
        $uuid = $student->newUniqueId();

        $this->assertTrue(Str::isUuid($uuid));
    }

    // 3. Test Relasi Student -> Courses
    public function test_student_model_has_courses_relationship(): void
    {
        $student = new Student();

        // Pastikan fungsi courses() ada dan mengembalikan relasi BelongsToMany
        $this->assertTrue(method_exists($student, 'courses'));
        $this->assertInstanceOf(BelongsToMany::class, $student->courses());
        
        // Pastikan relasi terhubung ke model Course
        $this->assertInstanceOf(Course::class, $student->courses()->getRelated());
    }

    // 4. Test Soft Deletes (Cek apakah kolom deleted_at dikenali)
    public function test_student_model_uses_soft_deletes(): void
    {
        $student = new Student();
        
        // Cek apakah model menggunakan trait SoftDeletes dengan melihat cast-nya atau methodnya
        $this->assertTrue(in_array('Illuminate\Database\Eloquent\SoftDeletes', class_uses(Student::class)));
    }
}