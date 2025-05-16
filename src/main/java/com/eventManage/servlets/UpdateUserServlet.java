package com.ticketwave.controller;

import com.eventManage.model.User;
import com.eventManage.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String filePath = "C:\\Users\\MSI\\Desktop\\final project\\Users.txt";

        // Authenticate the user with file path
        User user = new UserService().authenticate(username, password, filePath);

        if (user != null) {
            request.getSession().setAttribute("user", user);

            // Redirect based on user role
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.sendRedirect("user_dashboard.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
