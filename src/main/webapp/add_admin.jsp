<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Admin</title>
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
  <script>
    function validatePassword() {
      const password = document.getElementById('password').value;
      const confirmPassword = document.getElementById('confirmPassword').value;
      const errorElement = document.getElementById('passwordError');

      if (password !== confirmPassword) {
        errorElement.textContent = "Passwords do not match!";
        errorElement.classList.remove('hidden');
        return false;
      } else {
        errorElement.classList.add('hidden');
        return true;
      }
    }

    function setupFormValidation() {
      const form = document.querySelector('form');
      form.addEventListener('submit', function(event) {
        if (!validatePassword()) {
          event.preventDefault();
        }
      });
    }

    // Initialize when page loads
    document.addEventListener('DOMContentLoaded', setupFormValidation);
  </script>
</head>
<body class="bg-primary-50 min-h-screen">
<div class="max-w-4xl mx-auto px-4 py-12">
  <!-- Header -->
  <header class="mb-8 text-center">
    <h1 class="text-3xl font-bold text-primary-800 mb-2">Add New Admin</h1>
    <p class="text-primary-600">Fill in the details to create a new admin account</p>
  </header>

  // Form Container
  <main class="bg-white rounded-xl shadow-md overflow-hidden">
    <form method="POST" action="add" class="p-8" onsubmit="return validatePassword()">
      <!-- Username Field -->
      <div class="mb-6">
        <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Username</label>
        <input type="text" id="username" name="username" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
               placeholder="Enter username">
      </div>

      // Email Field
      <div class="mb-6">
        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
        <input type="email" id="email" name="email" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
               placeholder="Enter email address">
      </div>

      // Password Field
      <div class="mb-6">
        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
        <input type="password" id="password" name="password" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
               placeholder="Enter password">
      </div>

      // Confirm Password Field
      <div class="mb-2">
        <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-1">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-primary-500 focus:border-primary-500"
               placeholder="Re-enter password">
      </div>

      // Error Message
      <div id="passwordError" class="mb-6 text-sm text-red-600 hidden"></div>

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
          Save
          <svg xmlns="http://www.w3.org/2000/svg" class="inline ml-2 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
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