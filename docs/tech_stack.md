# 💻 Tech Stack (Spesifikasi Teknis) — SkillHub

Dokumen ini mendeskripsikan teknologi utama yang digunakan untuk membangun aplikasi **SkillHub**, mencakup Backend, Frontend, serta Tools pendukung selama pengembangan.

---

## 🗺️ Technology Overview

> **Catatan:** Ganti placeholder di bawah dengan screenshot Tech Stack Diagram Anda.

![Tech Stack Placeholder](https://placehold.co/800x400?text=Tech+Stack+Diagram+Here)

---

## 🗂️ Dependencies Configuration

<details>
<summary><strong>🔍 Klik untuk melihat konfigurasi <code>composer.json</code></strong></summary>

```json
{
    "require": {
        "php": "^8.2",
        "laravel/framework": "^12.0",
        "laravel/tinker": "^2.10.1"
    },
    "devDependencies": {
        "@tailwindcss/postcss": "^4.1.17",
        "@tailwindcss/vite": "^4.0.0",
        "autoprefixer": "^10.4.22",
        "axios": "^1.11.0",
        "concurrently": "^9.0.1",
        "laravel-vite-plugin": "^2.0.0",
        "postcss": "^8.5.6",
        "tailwindcss": "^4.1.17",
        "vite": "^7.0.7"
    }
}
```

</details>

---

## 📝 Penjelasan Detail Teknologi

### 1. **Backend (Server-Side)**

Teknologi inti yang menggerakkan logika dan alur bisnis aplikasi SkillHub:

* **Laravel Framework v12**
  Dipilih karena struktur MVC yang kuat, keamanan yang matang, dan dukungan ekosistem yang luas.

* **PHP 8.2+**
  Memanfaatkan fitur modern seperti type hinting, readonly properties, dan peningkatan performa.

* **MySQL**
  Database relasional yang stabil dan terintegrasi baik dengan Eloquent ORM.

* **Ramsey UUID v4.9**
  Standar industri untuk pembuatan **UUID v7**, memastikan ID unik, aman, dan time-ordered.

---

### 2. **Frontend (Client-Side)**

Teknologi antarmuka pengguna yang modern dan cepat:

* **Tailwind CSS v4.1**
  Framework CSS utility-first generasi baru dengan engine performa tinggi (Oxide Engine).

* **Vite v7.2**
  Build tool modern dengan kecepatan tinggi dan dukungan Hot Module Replacement (HMR).

* **Blade Template Engine**
  Template bawaan Laravel untuk rendering UI server-side secara efisien dan aman.

---

### 3. **Development & QA Tools**

Alat bantu untuk memastikan proses development lancar dan kualitas terjaga:

#### ✔ FakerPHP

Digunakan untuk pembuatan data dummy realistis, termasuk:

* Nama Indonesia
* Email
* Nomor HP

Fungsional saat pembuatan demo dan pengujian.

#### ✔ PHPUnit v11.5

Framework testing untuk:

* Unit test
* Integration test
* Regression test

Memastikan fitur berjalan sesuai standar sebelum rilis.

---

## 📦 Ringkasan Versi

| Teknologi        | Versi | Kegunaan                   |
| ---------------- | ----- | -------------------------- |
| **Laravel**      | 12.x  | Core Framework             |
| **Tailwind CSS** | 4.1.x | Styling UI                 |
| **Vite**         | 7.2.x | Build Tool Frontend        |
| **PHP**          | 8.2+  | Bahasa pemrograman backend |

