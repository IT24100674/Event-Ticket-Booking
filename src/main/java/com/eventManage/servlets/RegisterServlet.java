package com.eventManage.servlets;


import com.eventManage.model.AdminUser;
import com.eventManage.model.RegularUser;
import com.eventManage.model.User;
import com.eventManage.utils.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    //get user entered data and handle registration
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        //File path in final project folder
        String filePath = "C:\\Users\\MSI\\Desktop\\final project\\Users.txt";

        User user;
        if ("admin".equalsIgnoreCase(role)) {
            user = new AdminUser(username, email, password);
        } else {
            user = new RegularUser(username, email, password);
        }

        UserService service = new UserService();
        service.registerUser(user, filePath);
        response.sendRedirect("login.jsp");
    }
}
