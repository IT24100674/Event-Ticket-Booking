package com.example.admin;

import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Admin> admins = FileUtil.readAdmins(getServletContext());
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        System.out.println("<!DOCTYPE html>");
        System.out.println("<html lang='en'>");
        System.out.println("<head>");
        System.out.println("<title>Admin List</title>");
        System.out.println("<script src='https://cdn.tailwindcss.com'></script>");
        System.out.println("<script>");
        System.out.println("tailwind.config = {");
        System.out.println("    theme: {");
        System.out.println("        extend: {");
        System.out.println("            colors: {");
        System.out.println("                primary: {");
        System.out.println("                    50: '#f0f9ff',");
        System.out.println("                    100: '#e0f2fe',");
        System.out.println("                    200: '#bae6fd',");
        System.out.println("                    300: '#7dd3fc',");
        System.out.println("                    400: '#38bdf8',");
        System.out.println("                    500: '#0ea5e9',");
        System.out.println("                    600: '#0284c7',");
        System.out.println("                    700: '#0369a1',");
        System.out.println("                    800: '#075985',");
        System.out.println("                    900: '#0c4a6e',");
        System.out.println("                }");
        System.out.println("            }");
        System.out.println("        }");
        System.out.println("    }");
        System.out.println("}");
        System.out.println("</script>");
        System.out.println("</head>");
        System.out.println("<body class='bg-primary-50 min-h-screen'>");
        System.out.println("<div class='max-w-4xl mx-auto px-4 py-12'>");

        // Header
        System.out.println("<header class='mb-8'>");
        System.out.println("<h1 class='text-3xl font-bold text-primary-800 mb-2'>Admin Directory</h1>");
        System.out.println("<a href='add_admin.jsp' class='inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors duration-200'>");
        System.out.println("Add Admin");
        System.out.println("<svg xmlns='http://www.w3.org/2000/svg' class='ml-2 -mr-1 h-5 w-5' fill='none' viewBox='0 0 24 24' stroke='currentColor'>");
        System.out.println("<path stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 6v6m0 0v6m0-6h6m-6 0H6' />");
        System.out.println("</svg>");
        System.out.println("</a>");
        System.out.println("</header>");

        // Admin Table
        System.out.println("<div class='bg-white shadow overflow-hidden rounded-lg'>");
        System.out.println("<table class='min-w-full divide-y divide-gray-200'>");
        System.out.println("<thead class='bg-primary-50'>");
        System.out.println("<tr>");
        System.out.println("<th class='px-6 py-3 text-left text-xs font-medium text-primary-700 uppercase tracking-wider'>Username</th>");
        System.out.println("<th class='px-6 py-3 text-left text-xs font-medium text-primary-700 uppercase tracking-wider'>Email</th>");
        System.out.println("<th class='px-6 py-3 text-left text-xs font-medium text-primary-700 uppercase tracking-wider'>Role</th>");
        System.out.println("<th class='px-6 py-3 text-left text-xs font-medium text-primary-700 uppercase tracking-wider'>Actions</th>");
        System.out.println("</tr>");
        System.out.println("</thead>");
        System.out.println("<tbody class='bg-white divide-y divide-gray-200'>");

        for (Admin a : admins) {
            out.println("<tr>");
            out.println("<td class='px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900'>" + a.getUsername() + "</td>");
            out.println("<td class='px-6 py-4 whitespace-nowrap text-sm text-gray-500'>" + a.getEmail() + "</td>");
            out.println("<td class='px-6 py-4 whitespace-nowrap text-sm text-gray-500'>" + a.getRole() + "</td>");
            out.println("<td class='px-6 py-4 whitespace-nowrap text-sm font-medium'>");

            // Edit button
            out.println("<a href='update_admin.jsp?username=" + a.getUsername() +
                    "&email=" + a.getEmail() +
                    "&password=" + a.getPassword() +
                    "&role=" + a.getRole() + "' " +
                    "class='text-primary-600 hover:text-primary-900 mr-4'>Edit</a>");

            // Delete button
            out.println("<a href='delete?username=" + a.getUsername() + "' " +
                    "class='text-red-600 hover:text-red-900'>Delete</a>");

            out.println("</td>");
            out.println("</tr>");
        }

        out.println("</tbody>");
        out.println("</table>");
        out.println("</div>");

        // Footer
        out.println("<div class='mt-8 text-center text-sm text-primary-600'>");
        out.println("&copy; TicketWaves 2025 | All rights reserved.");
        out.println("</div>");

        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // Validate password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("add_admin.jsp?error=Passwords+do+not+match");
            return;
        }

        Admin admin = new Admin(username, email, password, role);
        FileUtil.addAdmin(admin, getServletContext());

        response.sendRedirect("admin");
    }
}