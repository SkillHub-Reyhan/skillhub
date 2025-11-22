<!DOCTYPE html>
<html lang="id" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dokumentasi SkillHub</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: #09090b; }
        ::-webkit-scrollbar-thumb { background: #27272a; border-radius: 3px; }
    </style>
</head>
<body class="bg-zinc-950 text-zinc-300 antialiased min-h-screen flex flex-col md:flex-row">

    <!-- Sidebar (Menu) -->
    <aside class="w-full md:w-64 bg-zinc-900 border-r border-zinc-800 flex-shrink-0 fixed md:sticky top-0 h-auto md:h-screen overflow-y-auto z-20">
        <div class="p-6">
            <a href="/" class="flex items-center gap-2 mb-8 text-white font-bold text-xl tracking-tight">
                <div class="w-3 h-3 bg-indigo-500 rounded-full"></div>
                SkillHub Docs.
            </a>

            <nav class="space-y-1">
                @foreach($menu as $key => $label)
                    <a href="{{ route('docs.show', $key) }}" 
                       class="block px-3 py-2 rounded-lg text-sm font-medium transition-colors {{ $file === $key ? 'bg-indigo-500/10 text-indigo-400 border border-indigo-500/20' : 'text-zinc-400 hover:text-white hover:bg-zinc-800' }}">
                        {{ $label }}
                    </a>
                @endforeach
            </nav>

            <div class="mt-8 pt-8 border-t border-zinc-800">
                <a href="/" class="text-xs text-zinc-500 hover:text-white flex items-center gap-2 transition-colors">
                    &larr; Kembali ke Aplikasi
                </a>
            </div>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 min-w-0 overflow-hidden">
        <div class="max-w-4xl mx-auto px-6 py-12">
            
            <!-- Markdown Content Area -->
            <!-- Class 'prose' dan 'prose-invert' (untuk dark mode) adalah magic dari @tailwindcss/typography -->
            <article class="prose prose-invert prose-zinc max-w-none 
                prose-headings:font-bold prose-headings:tracking-tight prose-a:text-indigo-400 
                prose-img:rounded-2xl prose-pre:bg-zinc-900 prose-pre:border prose-pre:border-zinc-800">
                
                {!! $htmlContent !!}
            
            </article>

        </div>
    </main>

</body>
</html>