# 🚀 SkillHub — Modern Course Management System

SkillHub adalah aplikasi manajemen kursus berbasis web yang dirancang untuk mengelola **data siswa**, **kelas**, dan **pendaftaran pelatihan** dengan cepat, aman, dan efisien. Dibangun menggunakan **Laravel 12** dan **Tailwind CSS v4**, SkillHub menawarkan performa tinggi dan antarmuka modern dengan **Dark Mode**.

---

## ✨ Fitur Utama

### 1. 📊 **Dashboard Statistik Real-time**

Menyajikan informasi sistem secara instan:

* Total Peserta Aktif & Total Kelas.
* Grafik pendaftaran & aktivitas terbaru.
* 3 Kelas Terpopuler.
* 5 Siswa Terbaru.

---

### 2. 👥 **Manajemen Peserta (Students)**

* CRUD lengkap (Tambah, Edit, Hapus Soft Delete).
* Validasi email unik & format nomor telepon.
* Menggunakan **UUID v7** sebagai ID siswa.

---

### 3. 📚 **Manajemen Kelas (Courses)**

* Katalog pelatihan lengkap (nama, instruktur, deskripsi).
* Menampilkan daftar siswa pada sebuah kelas.

---

### 4. 📝 **Sistem Pendaftaran (Enrollment)**

* Relasi **Many-to-Many**: 1 siswa → banyak kelas.
* Validasi cerdas untuk mencegah pendaftaran ganda.
* Pembatalan pendaftaran cukup satu klik.

---

### 5. 🎨 **Modern UI/UX**

* Dark Mode
* Desain responsive (Desktop, Tablet, Mobile).
* Efek **Glassmorphism** pada navigasi & kartu.

---

## 🛠️ Teknologi (Tech Stack)

* **Backend:** Laravel Framework v12.x
* **Frontend:** Blade Template + Tailwind CSS v4
* **Build Tool:** Vite
* **Database:** MySQL 12.1+
* **UUID Generator:** Ramsey UUID v4.9 (UUID v7)
* **Testing:** PHPUnit v11.5

---

## ⚙️ Instalasi & Konfigurasi

Ikuti langkah berikut untuk menjalankan proyek secara lokal.

### **Prasyarat**

Pastikan Anda sudah menginstal:

* PHP >= 8.2
* Composer
* Node.js & NPM
* MySQL

---

## 🔧 Langkah Instalasi

### **Langkah 1: Clone Repositori**

```bash
git clone https://github.com/SkillHub-Reyhan/skillhub.git
cd skillhub
```

### **Langkah 2: Install Dependencies**

```bash
# Dependensi PHP
composer install

# Dependensi Frontend
npm install
```

### **Langkah 3: Konfigurasi Environment**

Salin file .env:

```bash
cp .env.example .env
php artisan key:generate
```

Sesuaikan konfigurasi database di `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=[ipAddress/domainDatabase]
DB_PORT=[port]
DB_DATABASE=skillhub
DB_USERNAME=[username]
DB_PASSWORD=[password]
```

---

### **Langkah 4: Migrasi & Seeding Database**

```bash
php artisan migrate:fresh --seed
```

Seeder otomatis membuat:

* 20 Siswa
* 8 Kelas
* Relasi pendaftaran acak

---

### **Langkah 5: Jalankan Aplikasi**

Gunakan dua terminal:

**Terminal 1 — Laravel Server**

```bash
php artisan serve
```

**Terminal 2 — Vite Dev Server**

```bash
npm run dev
```

Akses aplikasi melalui: **[http://127.0.0.1:8000](http://127.0.0.1:8000)**

---

## 📸 Tangkapan Layar (Screenshots)

<!-- > Tambahkan screenshot sesuai kebutuhan Anda. -->

* Dashboard
![Dashboard](/docs/skillhub-screenshot-01.png)
* Daftar Siswa
![Daftar Siswa](/docs/skillhub-screenshot-02.png)
* Detail Siswa
![Detail Siswa](/docs/skillhub-screenshot-05.png)
* Daftar Kelas
![Daftar Kelas](/docs/skillhub-screenshot-03.png)
* Detail Kelas
![Detail Kelas](/docs/skillhub-screenshot-06.png)
* Pendaftaran Kelas
![Pendaftaran Kelas](/docs/skillhub-screenshot-04.png)

---

## 🧪 Menjalankan Testing

```bash
php artisan test
```

Menguji endpoint dan fitur utama secara otomatis.

---

## 🤝 Kontribusi

Kontribusi sangat diterima! Ikuti langkah berikut:

1. Fork repositori.
2. Buat branch fitur baru:

```bash
git checkout -b fitur-keren
```

3. Commit perubahan:

```bash
git commit -m "Menambahkan fitur keren"
```

4. Push branch Anda:

```bash
git push origin fitur-keren
```

5. Buat Pull Request.


