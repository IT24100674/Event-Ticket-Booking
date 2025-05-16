package com.example.admin;

import jakarta.servlet.http.*;
import java.io.*;

public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Admin admin = new Admin(username, email, password, role);
        FileUtil.addAdmin(admin, getServletContext());

        response.sendRedirect("admin");
    }
}
