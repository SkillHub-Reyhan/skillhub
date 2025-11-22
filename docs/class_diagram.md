# 🏗️ Class Diagram (Arsitektur Backend) — SkillHub

Dokumen ini menampilkan arsitektur backend aplikasi **SkillHub** menggunakan pendekatan **MVC (Model-View-Controller)**. Diagram ini menjelaskan alur interaksi antar komponen, terutama Controller dan Model.

---

## 🗺️ Architecture Overview

> **Catatan:** Ganti placeholder di bawah ini dengan screenshot Class Diagram dari Mermaid Chart.

![Class Diagram Placeholder](https://placehold.co/800x400?text=Class+Diagram+Here)

---

## 🗂️ **Mermaid Source Code**

<details>
<summary><strong>🔍 Klik untuk melihat Source Code Mermaid</strong></summary>

```mermaid
classDiagram
    %% Inheritance Definitions
    Controller <|-- DashboardController
    Controller <|-- StudentController
    Controller <|-- CourseController
    Controller <|-- EnrollmentController
    Model <|-- Student
    Model <|-- Course

    %% Abstract Classes
    class Controller {
        <<Abstract>>
    }
    class Model {
        <<Eloquent>>
    }

    %% Controllers
    class DashboardController {
        +index() View
    }

    class StudentController {
        +index() View
        +store(Request request) RedirectResponse
        +edit(string id) View
        +update(Request request, string id) RedirectResponse
        +destroy(string id) RedirectResponse
    }

    class CourseController {
        +index() View
        +store(Request request) RedirectResponse
        +edit(string id) View
        +update(Request request, string id) RedirectResponse
        +destroy(string id) RedirectResponse
    }

    class EnrollmentController {
        +index() View
        +store(Request request) RedirectResponse
        +showStudentCourses(string studentId) View
        +showCourseStudents(string courseId) View
        +destroy(Request request) RedirectResponse
    }

    %% Models
    class Student {
        +String name
        +String email
        +String phone
        +newUniqueId() String
        +courses() BelongsToMany
    }

    class Course {
        +String name
        +String description
        +String instructor
        +newUniqueId() String
        +students() BelongsToMany
    }

    %% Relationships
    StudentController ..> Student : uses
    CourseController ..> Course : uses
    EnrollmentController ..> Student : uses
    EnrollmentController ..> Course : uses
    DashboardController ..> Student : reads
    DashboardController ..> Course : reads

    Student "*" -- "*" Course : enrolls
```

</details>

---

## 📝 Penjelasan Detail Komponen

### 1. **Controller Layer (Logika Bisnis)**

Ada empat Controller utama pada arsitektur SkillHub:

* **StudentController** & **CourseController**
  Menangani operasi CRUD (Create, Read, Update, Delete).

* **EnrollmentController**
  Bertugas mengelola proses pendaftaran siswa ke kelas, termasuk:

  * Validasi agar tidak terjadi pendaftaran duplikat
  * Penghapusan relasi Student–Course

* **DashboardController**
  Mengambil data agregat seperti total siswa, total kelas, dan statistik lain untuk ditampilkan pada dashboard.

---

### 2. **Model Layer (Eloquent ORM)**

Model di Laravel berfungsi sebagai representasi tabel database.

#### ✔ Menggunakan Trait `HasUuids`

Model **Student** dan **Course** memiliki mekanisme generator UUID v7 otomatis untuk primary key.

#### ✔ Relasi Many-to-Many

Mengimplementasikan relasi:

* `$student->courses()` → kelas yang diambil siswa
* `$course->students()` → daftar peserta pada kelas tertentu

Relasi ini menggunakan pivot table `course_student` di database.

---

## 📦 Ringkasan Interaksi

| Komponen       | Tipe     | Tanggung Jawab                                       |
| -------------- | -------- | ---------------------------------------------------- |
| **Controller** | Logic    | Menerima request, validasi, memanggil Model          |
| **Model**      | Data     | Representasi tabel + relasi + aturan data            |
| **View**       | Tampilan | Menampilkan hasil akhir ke pengguna (Blade Template) |


