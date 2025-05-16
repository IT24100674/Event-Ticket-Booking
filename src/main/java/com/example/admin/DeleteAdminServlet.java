package com.example.admin;

import jakarta.servlet.http.*;
import java.io.*;

public class DeleteAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        FileUtil.deleteAdmin(username, getServletContext());
        response.sendRedirect("admin");
    }
}
