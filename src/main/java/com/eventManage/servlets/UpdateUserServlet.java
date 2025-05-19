package com.eventManage.servlets;


import com.eventManage.model.User;
import com.eventManage.utils.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/update")
public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String submittedUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null) {
            response.sendRedirect("login.jsp?error=1");
            return;
        }

        String sessionUsername = currentUser.getUsername();

        if (!sessionUsername.equals(submittedUsername)) {
            response.sendRedirect("update.jsp?usernameMismatch=1");
            return;
        }
        if (newEmail == null || newEmail.isBlank()) {
            newEmail = currentUser.getEmail();
        }

        String usersFile = "C:\\Users\\MSI\\Desktop\\final project\\Users.txt";

        boolean ok = new UserService().updateUser(sessionUsername, newEmail, newPassword, usersFile);

        if (ok) {
            currentUser.setEmail(newEmail);
            currentUser.setPassword(newPassword);
            session.setAttribute("user", currentUser);
            response.sendRedirect("update.jsp?success=1");
        } else {
            response.sendRedirect("update.jsp?error=1");
        }
    }
}

