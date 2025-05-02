package com.servlets;

import com.utils.FileParser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {




        List<String[]> events = FileParser.readAndParseFile("D:\\SLIIT\\2nd SEM\\OOP\\project\\pro\\src\\main\\database\\evenPost.txt");

        request.setAttribute("events", events);

        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
