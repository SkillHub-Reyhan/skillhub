# 📖 Panduan Pengguna (User Manual) — SkillHub

Selamat datang di **SkillHub**! Sistem manajemen kursus modern untuk mengelola data **peserta**, **kelas**, dan **pendaftaran pelatihan** dengan cepat dan efisien.

Dokumen ini akan memandu Anda memahami dan menggunakan seluruh fitur aplikasi SkillHub.

---

## 🏠 1. Halaman Utama (Dashboard)

Dashboard adalah halaman pertama yang muncul saat Anda membuka aplikasi.

### 📊 Apa yang ditampilkan?

* **Kartu Statistik** — Menunjukkan total:

  * Peserta Aktif
  * Kelas Tersedia
  * Total Pendaftaran
* **Tombol Cepat (Quick Actions)**

  * `+ Peserta Baru`
  * `+ Kelas Baru`
* **Kelas Terpopuler** — Daftar 3 kelas dengan jumlah siswa terbanyak.
* **Siswa Terbaru** — Menampilkan 5 peserta yang baru terdaftar.

> **Tips:** Gunakan dashboard untuk memantau perkembangan peserta dan kelas favorit secara real-time.

---

## 👥 2. Manajemen Peserta (Students)

Digunakan untuk mengelola seluruh data peserta pelatihan.

### a. **Menambah Peserta Baru**

1. Buka menu **Peserta**.
2. Isi formulir di panel kiri:

   * **Nama Lengkap** (Wajib)
   * **Email** (Wajib & Unik)
   * **No. WhatsApp** (Opsional)
3. Klik **Simpan Peserta**.

Peserta baru akan muncul di daftar sebelah kanan.

### b. **Melihat & Mencari Peserta**

* Daftar peserta ditampilkan dalam bentuk kartu.
* Arahkan kursor ke kartu untuk memunculkan opsi **Detail**, **Edit**, dan **Hapus**.

### c. **Mengubah Data (Edit)**

1. Arahkan kursor ke peserta.
2. Klik ikon **Pensil**.
3. Ubah data yang diperlukan.
4. Klik **Simpan Perubahan**.

### d. **Menghapus Peserta**

1. Klik ikon **Sampah**.
2. Konfirmasi tindakan di pop-up browser.

> Data dihapus dengan **Soft Delete**, masih aman di database dan dapat dipulihkan oleh admin/IT.

---

## 📚 3. Manajemen Kelas (Courses)

Menu ini digunakan untuk mengelola katalog pelatihan.

### a. **Membuat Kelas Baru**

1. Buka menu **Kelas**.
2. Isi formulir:

   * Nama Kelas
   * Instruktur
   * Deskripsi
3. Klik **Simpan Kelas**.

### b. **Detail Kelas & Pesertanya**

* Klik **Lihat Detail** pada kartu kelas.
* Anda akan melihat daftar peserta yang mengikuti kelas tersebut.
* Untuk mengeluarkan siswa dari kelas, klik ikon **Sampah** di samping nama peserta.

---

## 📝 4. Pendaftaran (Enrollment)

Fitur untuk menghubungkan Peserta dengan Kelas.

### a. **Mendaftarkan Siswa ke Kelas**

1. Buka **Menu Pendaftaran**.
2. Pilih peserta dari dropdown.
3. Pilih kelas yang ingin diambil.
4. Klik **Daftarkan Sekarang**.

Jika berhasil, akan muncul notifikasi **hijau**.

> Jika siswa sudah terdaftar di kelas yang sama, sistem akan menolak dan menampilkan notifikasi **merah**.

### b. **Membatalkan Pendaftaran**

1. Masuk menu **Peserta**.
2. Klik **Detail** pada siswa.
3. Pada bagian *Kelas yang Diikuti*, klik **Batalkan Kelas** di samping nama kelas.

---

## 💡 Pertanyaan Umum (FAQ)

### **Q: Apakah data yang dihapus bisa dikembalikan?**

**A:** Ya. Sistem menggunakan **Soft Delete**, sehingga data dapat dipulihkan oleh tim IT.

### **Q: Apakah satu email bisa dipakai dua siswa?**

**A:** Tidak. Email bersifat **unik** sebagai identitas utama.

### **Q: Berapa maksimal kelas yang boleh diambil satu siswa?**

**A:** Tidak ada batasan. Siswa boleh mengambil semua kelas yang tersedia.

---

**Dokumentasi diperbarui terakhir pada:** 2025-11-22
