package com.eventManage.servlets;

import com.eventManage.model.Review;
import com.eventManage.model.Review;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import java.io.*;
import java.util.*;

@WebServlet("/displayReview")
public class DisplayServlet extends HttpServlet {
    private final String FILE_PATH = "C:\\Users\\chanu\\OneDrive\\Desktop\\back\\src\\main\\database\\data.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Review> reviews = new ArrayList<>();

        File file = new File(FILE_PATH);
        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    System.out.println(line);
                    String[] parts = line.split("::");
                    if (parts.length == 2) {
                        reviews.add(new Review(parts[0], parts[1]));
                    }
                }
            }
        }

        request.setAttribute("reviews", reviews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("displayReview.jsp");
        dispatcher.forward(request, response);
    }
}

