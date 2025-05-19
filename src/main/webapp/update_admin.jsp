<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Update Admin</title>
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
    // Header
    <header class="mb-8 text-center">
        <h1 class="text-3xl font-bold text-primary-800 mb-2">Update Admin</h1>
        <p class="text-primary-600">Edit the admin details below</p>
    </header>

    // Form Container
    <main class="bg-white rounded-xl shadow-md overflow-hidden">
        <form action="update-admin" method="post" class="p-8">
            <input type="hidden" name="originalUsername" value="${param.username}">

            // Username Field
            <div class="mb-6">
                <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
                <input type="text" id="username" name="username" value="${param.username}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
                       placeholder="Enter username">
            </div>

            // Email Field
            <div class="mb-6">
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <input type="email" id="email" name="email" value="${param.email}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
                       placeholder="Enter email address">
            </div>

            // Password Field
            <div class="mb-6">
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" id="password" name="password" value="${param.password}" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
                       placeholder="Enter password">
            </div>

            // Role Field
            <div class="mb-8">
                <label for="role" class="block text-sm font-medium text-gray-700 mb-1">Role</label>
                <select id="role" name="role" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500">
                    <option value="">Select role</option>
                    <option value="Event Manager">Event Manager</option>
                    <option value="Booking Manager">Booking Manager</option>
                    <option value="Finance/Admin Accountant">Finance/Admin Accountant</option>
                    <option value="Customer Support Admin">Customer Support Admin</option>
                    <option value="Content Editor">Content Editor</option>
                    <option value="Super Admin">Super Admin</option>
                </select>
            </div>


            // Submit Button
            <div class="flex justify-end">
                <button type="submit"
                        class="px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors duration-200">
                    Update Admin
                    <svg xmlns="http://www.w3.org/2000/svg" class="inline ml-2 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                    </svg>
                </button>
            </div>
        </form>

        // Footer
        <div class="bg-primary-50 px-8 py-4 border-t border-primary-100">
            <p class="text-center text-primary-600 text-sm">
                &copy; TicketWaves 2025 | All rights reserved.
            </p>
        </div>
    </main>
</div>
</body>
</html>