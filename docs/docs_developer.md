# Developer Documentation

Dokumen ini memberikan panduan teknis lengkap bagi developer untuk mengembangkan proyek **SkillHub**, mencakup struktur folder, penjelasan controller, model, alur data, hingga konfigurasi database.

---

## Struktur Proyek (MVC Architecture)

SkillHub dibangun menggunakan **Laravel 12** dengan struktur folder standar MVC.

### 1. **Controllers** (`app/Http/Controllers/`)

Tempat logika bisnis utama berada.

| File                         | Deskripsi                                       |
| ---------------------------- | ----------------------------------------------- |
| **DashboardController.php**  | Menyediakan data statistik untuk halaman utama. |
| **StudentController.php**    | CRUD data Peserta.                              |
| **CourseController.php**     | CRUD data Kelas.                                |
| **EnrollmentController.php** | Logika Many-to-Many untuk pendaftaran kelas.    |

---

### 2. **Models** (`app/Models/`)

Representasi tabel database & relasi.

| File            | Deskripsi                                               |
| --------------- | ------------------------------------------------------- |
| **Student.php** | Model tabel `students`, memakai HasUuids & SoftDeletes. |
| **Course.php**  | Model tabel `courses`, memakai HasUuids & SoftDeletes.  |
| **User.php**    | Model bawaan Laravel untuk otentikasi.                  |

---

### 3. **Views** (`resources/views/`)

Menggunakan **Blade Template** sebagai UI.

* `layout.blade.php` → Master Layout (Navbar, Footer, Wrapper)
* `dashboard.blade.php` → Halaman statistik & ringkasan
* `students/` → Folder CRUD view Siswa
* `courses/` → Folder CRUD view Kelas
* `enrollments/` → Form pendaftaran siswa ke kelas

---

## Penjelasan Detail Fungsi (Code Reference)

## A. **EnrollmentController.php**

Controller ini menangani relasi Many-to-Many & validasi.

<details>
<summary><strong>Lihat Detail Fungsi</strong></summary>

### **1. store(Request $request)**

Menangani pendaftaran siswa ke kelas.

**Validasi** memastikan bahwa `student_id` dan `course_id` valid.

**Cek Duplikasi**:

```php
// Mencegah siswa mendaftar dua kali
if (!$student->courses()->where('course_id', $request->course_id)->exists()) {
    ...
}
```

**Insert Data ke Pivot**:

```php
$student->courses()->attach($request->course_id, [
    'id' => (string) Str::uuid7(),
]);
```

### **2. destroy(Request $request)**

Membatalkan pendaftaran siswa.

```php
$student->courses()->detach($request->course_id);
```

</details>

---

## B. **DashboardController.php**

Digunakan untuk menampilkan statistik pada halaman utama.

<details>
<summary><strong>Lihat Detail Fungsi</strong></summary>

### **index()**

Mengambil data:

* **Simple Count** → total siswa & total kelas
* **Pivot Count** → total pendaftaran
* **Popular Courses** → 3 kelas terfavorit

```php
Course::withCount('students')
      ->orderBy('students_count', 'desc')
      ->take(3)
      ->get();
```

</details>

---

## C. **Models (Student & Course)**

Model menggunakan UUID v7 untuk primary key.

<details>
<summary><strong>Lihat Detail Model</strong></summary>

### **newUniqueId()**

Override untuk memaksa UUID v7:

```php
public function newUniqueId()
{
    return (string) Str::uuid7();
}
```

### **Relasi Many-to-Many**

```php
// Student.php
return $this->belongsToMany(Course::class);

// Course.php
return $this->belongsToMany(Student::class);
```

</details>

---

## Routes (`routes/web.php`)

Daftar endpoint URL utama.

| Method   | URI          | Action                       | Nama Route          | Deskripsi         |
| -------- | ------------ | ---------------------------- | ------------------- | ----------------- |
| GET      | /            | DashboardController@index    | dashboard           | Dashboard utama   |
| RESOURCE | /students    | StudentController            | students.*          | CRUD Siswa        |
| RESOURCE | /courses     | CourseController             | courses.*           | CRUD Kelas        |
| POST     | /enrollments | EnrollmentController@store   | enrollments.store   | Pendaftaran kelas |
| DELETE   | /enrollments | EnrollmentController@destroy | enrollments.destroy | Batal kelas       |

---

## Konfigurasi Database & Seeder

### **Migrasi Database (Migrations)**

Urutan penting:

1. `create_students_table`
2. `create_courses_table`
3. `create_course_student_table` (Pivot)

### **DatabaseSeeder.php**

Menggunakan **Faker Locale: id_ID**.

**Logic Seeder:**

* Membuat 8 kelas default
* Membuat 20 siswa acak
* Setiap siswa terdaftar ke 1–3 kelas secara random




