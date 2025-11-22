<?php

use App\Http\Controllers\StudentController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\EnrollmentController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DocumentationController;
use Illuminate\Support\Facades\Route;


Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

// Routes untuk Students
Route::resource('students', StudentController::class);

// Routes untuk Courses
Route::resource('courses', CourseController::class);

// Routes untuk Pendaftaran (Enrollment)
Route::get('/enrollments', [EnrollmentController::class, 'index'])->name('enrollments.index');
Route::post('/enrollments', [EnrollmentController::class, 'store'])->name('enrollments.store');
Route::delete('/enrollments', [EnrollmentController::class, 'destroy'])->name('enrollments.destroy');

// Routes Khusus untuk melihat detail relasi
Route::get('/students/{id}/courses', [EnrollmentController::class, 'showStudentCourses'])->name('students.courses');
Route::get('/courses/{id}/students', [EnrollmentController::class, 'showCourseStudents'])->name('courses.students');

Route::get('/docs/{file?}', [DocumentationController::class, 'show'])->name('docs.show');