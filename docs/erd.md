# 📘 Entity Relationship Diagram (ERD) — SkillHub

Dokumen ini berisi skema database aplikasi **SkillHub** dalam format Markdown, lengkap dengan desain, struktur tabel, relasi, dan penjelasan detail. Seluruh code snippet dibuat menggunakan **fold/hideable sections**.

---

## 🗺️ ERD Overview

<!-- > **Catatan:** Silakan ganti placeholder gambar di bawah dengan screenshot ERD dari dbdiagram.io. -->

![ERD Placeholder](/docs/erd_skillhub.png)

---

## 🗂️ **DBML Source Code**

<details>
<summary><strong>🔍 Klik untuk melihat Source Code DBML</strong></summary>

```dbml
// --- SkillHub Core Logic ---

Table "students" {
  "id" UUID [pk, not null, note: "UUID v7"]
  "name" VARCHAR(255) [not null]
  "email" VARCHAR(255) [unique, not null]
  "phone" VARCHAR(255) [null]
  "created_at" TIMESTAMP [null]
  "updated_at" TIMESTAMP [null]
  "deleted_at" TIMESTAMP [null, note: "Soft Delete"]
}

Table "courses" {
  "id" UUID [pk, not null, note: "UUID v7"]
  "name" VARCHAR(255) [not null]
  "description" TEXT [null]
  "instructor" VARCHAR(255) [not null]
  "created_at" TIMESTAMP [null]
  "updated_at" TIMESTAMP [null]
  "deleted_at" TIMESTAMP [null, note: "Soft Delete"]
}

// Tabel Pivot (Many-to-Many)
Table "course_student" {
  "id" UUID [pk, not null, note: "UUID v7"]
  "student_id" UUID [not null]
  "course_id" UUID [not null]
  "created_at" TIMESTAMP [null, note: "Enrollment Date"]
  "updated_at" TIMESTAMP [null]
}

// --- Relationships ---

// Relasi Many-to-Many: Student enrolls in Course
Ref "student_enrollment":"students"."id" < "course_student"."student_id" [delete: cascade]

Ref "course_enrollment":"courses"."id" < "course_student"."course_id" [delete: cascade]

// Relasi User Session (Optional visualisation)
Ref "user_session":"users"."id" < "sessions"."user_id"
```

</details>

---

## 📝 Penjelasan Detail Struktur Database

### 1. **Identifikasi Unik Modern (UUID v7)**

SkillHub menggunakan **UUID v7** sebagai Primary Key untuk tabel:

* `students`
* `courses`
* `course_student`

Keunggulan UUID v7:

* **Time-ordered** → menjaga efisiensi indexing di storage modern.
* **Lebih aman** dari enumeration attack karena tidak berurutan.

---

### 2. **Relasi Many-to-Many (N:M)**

Hubungan antara **Peserta** dan **Kelas** bersifat dua arah dan fleksibel:

* Seorang **Student** dapat mengambil banyak **Course**.
* Sebuah **Course** dapat memiliki banyak **Student**.

Untuk itu digunakan **Pivot Table (`course_student`)**, yang juga menyimpan timestamp pendaftaran.

Diagram konsep sederhana:

```
Students ⟷ Course_Student ⟷ Courses
```

---

### 3. **Integritas dan Keamanan Data**

#### ✔ Soft Deletes

Tabel `students` dan `courses` memiliki kolom `deleted_at`. Tujuannya:

* Menghapus data **tanpa benar-benar menghilangkannya**.
* Memudahkan **recovery** dan **audit trail**.

#### ✔ Referential Integrity (Cascade)

Relasi di pivot menggunakan `ON DELETE CASCADE`:

* Jika student dihapus permanen, otomatis riwayat enrollment di pivot ikut terhapus.
* Menghindari **orphan records**.

---

## 📦 Ringkasan Struktur

| Tabel              | Deskripsi                           |
| ------------------ | ----------------------------------- |
| **users**          | Default Laravel auth system         |
| **students**       | Data peserta SkillHub               |
| **courses**        | Data kelas atau pelatihan           |
| **course_student** | Pivot enrollment Students ↔ Courses |

---

Jika Anda ingin saya buatkan versi **PDF**, **DOCX**, atau **di-export ke Notion**, cukup beri tahu! 🚀
