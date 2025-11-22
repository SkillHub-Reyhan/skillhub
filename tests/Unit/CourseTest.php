<?php

namespace Tests\Unit;

use App\Models\Course;
use App\Models\Student;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Str;
use Tests\TestCase;

class CourseTest extends TestCase
{
    // 1. Test Fillable
    public function test_course_model_has_correct_fillable_attributes(): void
    {
        $course = new Course();
        
        $expectedFillable = ['name', 'description', 'instructor'];
        
        $this->assertEquals($expectedFillable, $course->getFillable());
    }

    // 2. Test UUID
    public function test_course_model_uses_uuid_v7(): void
    {
        $course = new Course();
        $uuid = $course->newUniqueId();

        $this->assertTrue(Str::isUuid($uuid));
    }

    // 3. Test Relasi Course -> Students
    public function test_course_model_has_students_relationship(): void
    {
        $course = new Course();

        // Pastikan fungsi students() ada
        $this->assertTrue(method_exists($course, 'students'));
        
        // Pastikan tipe relasinya BelongsToMany
        $this->assertInstanceOf(BelongsToMany::class, $course->students());
        
        // Pastikan model targetnya adalah Student
        $this->assertInstanceOf(Student::class, $course->students()->getRelated());
    }

    // 4. Test Soft Deletes
    public function test_course_model_uses_soft_deletes(): void
    {
        $this->assertTrue(in_array('Illuminate\Database\Eloquent\SoftDeletes', class_uses(Course::class)));
    }
}