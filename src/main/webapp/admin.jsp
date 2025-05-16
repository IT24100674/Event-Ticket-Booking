<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Manager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            50: '#f0f9ff',
                            100: '#e0f2fe',
                            200: '#bae6fd',
                            300: '#7dd3fc',
                            400: '#38bdf8',
                            500: '#0ea5e9',
                            600: '#0284c7',
                            700: '#0369a1',
                            800: '#075985',
                            900: '#0c4a6e',
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-primary-50 min-h-screen">
<div class="max-w-4xl mx-auto px-4 py-12">
    <!-- Header -->
    <header class="mb-12 text-center">
        <h1 class="text-4xl font-bold text-primary-800 mb-4">Admin Manager</h1>
        <p class="text-primary-600">Manage your administration panel with ease</p>
    </header>

    <!-- Main Content -->
    <main class="bg-white rounded-xl shadow-md overflow-hidden">
        <div class="p-8">
            <div class="flex flex-col items-center justify-center py-12">
                <div class="mb-8">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-24 w-24 text-primary-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11c0 3.517-1.009 6.799-2.753 9.571m-3.44-2.04l.054-.09A13.916 13.916 0 008 11a4 4 0 118 0c0 1.017-.07 2.019-.203 3m-2.118 6.844A21.88 21.88 0 0015.171 17m3.839 1.132c.645-2.266.99-4.659.99-7.132A8 8 0 008 4.07M3 15.364c.64-1.319 1-2.8 1-4.364 0-1.457.39-2.823 1.07-4" />
                    </svg>
                </div>
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Welcome to Admin Dashboard</h2>
                <p class="text-gray-600 mb-8 text-center max-w-md">
                    You can manage all administrative tasks from this central dashboard.
                </p>
                <a href="admin" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors duration-200">
                    Admin Directory
                    <svg xmlns="http://www.w3.org/2000/svg" class="ml-2 -mr-1 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                    </svg>
                </a>
            </div>
        </div>

        <!-- Footer -->
        <div class="bg-primary-50 px-8 py-4 border-t border-primary-100">
            <p class="text-center text-primary-600 text-sm">
                &copy; TicketWaves 2025 | All rights reserved.
            </p>
        </div>
    </main>
</div>
</body>
</html>