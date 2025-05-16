package com.example.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class UpdateAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originalUsername = request.getParameter("originalUsername");
        String newUsername = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        List<Admin> admins = FileUtil.readAdmins(getServletContext());

        for (Admin admin : admins) {
            if (admin.getUsername().equals(originalUsername)) {
                admin.setUsername(newUsername);
                admin.setEmail(email);
                admin.setPassword(password);
                admin.setRole(role);
                break;
            }
        }

        FileUtil.writeAdmins(admins, getServletContext());
        response.sendRedirect("admin");
    }
}
