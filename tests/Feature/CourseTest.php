<?php

namespace Tests\Feature;

use App\Models\Course;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CourseTest extends TestCase
{
    use RefreshDatabase;

    public function test_new_course_can_be_created(): void
    {
        $response = $this->post(route('courses.store'), [
            'name' => 'Master Laravel 12',
            'instructor' => 'Kevin',
            'description' => 'Belajar Laravel dari nol'
        ]);

        $response->assertRedirect();
        $this->assertDatabaseHas('courses', [
            'name' => 'Master Laravel 12'
        ]);
    }

    public function test_course_can_be_updated(): void
    {
        $course = Course::create([
            'name' => 'Old Course',
            'instructor' => 'Old Instructor'
        ]);

        $response = $this->put(route('courses.update', $course->id), [
            'name' => 'New Course Name',
            'instructor' => 'New Instructor',
            'description' => 'Updated desc'
        ]);

        $response->assertRedirect(route('courses.index'));
        
        $this->assertDatabaseHas('courses', [
            'id' => $course->id,
            'name' => 'New Course Name'
        ]);
    }
}