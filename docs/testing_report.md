# Laporan Unit & Feature Testing

Dokumen ini berisi laporan hasil pengujian otomatis (**Automated Testing**) yang dilakukan pada backend aplikasi SkillHub. Pengujian mencakup **Unit Test** (Logika Model & Database) serta **Feature Test** (Alur CRUD & Bisnis).

---

## Ringkasan Eksekutif

Pengujian dilakukan menggunakan framework **PHPUnit** bawaan Laravel. Berikut adalah ringkasan hasil eksekusi terakhir:

| Metrik | Hasil |
| :--- | :--- |
| **Status** | ✅ **PASSED** (Lulus Semua) |
| **Total Tests** | 19 Pengujian |
| **Total Assertions** | 36 Pengecekan |
| **Waktu Eksekusi** | ~0.25 detik |
| **Tanggal Pengujian** | Minggu, 23 Nov 2025 |

---

## Bukti Hasil Testing (Screenshot)

Berikut adalah tangkapan layar terminal setelah menjalankan perintah `php artisan test`.

![Hasil Testing SkillHub](/docs/skillhub-test.png)

---

## Detail Skenario Pengujian

### A. Unit Testing (Model & Database Logic)

Unit test difokuskan untuk memastikan integritas skema database, konfigurasi Model Eloquent, dan fitur otomatisasi.

| Komponen | Skenario / Apa yang di-test? | Tujuan |
| :--- | :--- | :--- |
| **Model Student** | `has correct fillable attributes` | Memastikan kolom `name`, `email`, `phone` aman untuk Mass Assignment. |
| | `uses uuid v7` | Memastikan ID yang digenerate otomatis berformat **UUID v7**. |
| | `has courses relationship` | Memastikan relasi `belongsToMany` ke model Course terdefinisi. |
| | `uses soft deletes` | Memastikan fitur penghapusan sementara (Soft Delete) aktif. |
| **Model Course** | `has correct fillable attributes` | Memastikan atribut Course aman diisi. |
| | `uses uuid v7` | Validasi format Primary Key UUID v7. |
| | `has students relationship` | Memastikan relasi ke Student terdefinisi. |
| | `uses soft deletes` | Validasi fitur Soft Delete pada Course. |

---

### B. Feature Testing (CRUD & Business Logic)

Feature test mensimulasikan permintaan HTTP (Request) ke aplikasi untuk memastikan fitur berjalan sesuai harapan pengguna.

#### 1. Manajemen Peserta (StudentController)
* ✅ **Halaman Index:** Memastikan daftar peserta bisa diakses (HTTP 200).
* ✅ **Create Student:** Memastikan data peserta baru berhasil masuk ke database.
* ✅ **Validasi Email:** Mencegah input email duplikat (harus unik).
* ✅ **Update Student:** Memastikan data peserta bisa diperbarui.
* ✅ **Delete Student:** Memastikan peserta bisa dihapus (Soft Delete).

#### 2. Manajemen Kelas (CourseController)
* ✅ **Create Course:** Memastikan admin bisa membuat kelas baru.
* ✅ **Update Course:** Memastikan informasi kelas (nama/instruktur) bisa diedit.

#### 3. Pendaftaran / Enrollment (EnrollmentController)
* ✅ **Pendaftaran Sukses:** Memastikan siswa bisa mendaftar ke kelas (Data masuk ke tabel pivot).
* ✅ **Cegah Duplikasi:** Memastikan sistem **menolak** jika siswa mendaftar ke kelas yang sama dua kali.
* ✅ **Batalkan Kelas:** Memastikan siswa bisa membatalkan/keluar dari kelas (Hapus data pivot).

---

## Cara Menjalankan Testing

Untuk mereproduksi hasil testing di atas, jalankan perintah berikut pada terminal:

```bash
# Menjalankan seluruh test suite
php artisan test

# Menjalankan test spesifik (opsional)
php artisan test tests/Feature/EnrollmentTest.php