package com.eventManage.servlets;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/submitReview")
public class ReviewServlet extends HttpServlet {
    private final String FILE_PATH = "C:\\Users\\chanu\\OneDrive\\Desktop\\back\\src\\main\\database\\data.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("name");
        String text = request.getParameter("text");
        System.out.println("name: " + name + " text: " + text);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(name + "::" + text);
            writer.newLine();
        }

        response.sendRedirect("submitReview.jsp");
    }
}


