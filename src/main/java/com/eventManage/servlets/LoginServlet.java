package com.eventManage.servlets;

import com.eventManage.model.User;
import com.eventManage.utils.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    //form submissions handling
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String filePath = "C:\\Users\\MSI\\Desktop\\final project\\Users.txt";

        User user = new UserService().authenticate(username, password, filePath);

        if (user != null) {
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
