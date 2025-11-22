<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class DocumentationController extends Controller
{
    public function show($file = 'docs_user')
    {
        // 1. Tentukan Path
        $path = base_path("docs/{$file}.md");

        // 2. Validasi: Jika file tidak ada, 404
        if (!File::exists($path)) {
            abort(404, 'Dokumentasi tidak ditemukan.');
        }

        // 3. Baca isi file
        $content = File::get($path);

        // 4. Convert Markdown ke HTML
        // Laravel 9+ sudah punya helper str()->markdown()
        $htmlContent = Str::markdown($content);

        // 5. List Menu Sidebar (Manual atau Scan Folder)
        $menu = [
            'docs_user' => 'Panduan Pengguna',
            'docs_developer' => 'Panduan Developer',
            'tech_stack' => 'Tech Stack',
            'erd' => 'ERD Database',
            'class_diagram' => 'Class Diagram',
            'testing_report' => 'Hasil Testing'
        ];

        return view('docs.show', compact('htmlContent', 'menu', 'file'));
    }
}
