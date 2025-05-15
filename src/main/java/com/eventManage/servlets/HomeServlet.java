
package com.eventManage.servlets;

import com.eventManage.model.Event;
import com.eventManage.utils.FileParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> events = FileParser.readAndParseFile("D:\\SLIIT\\2nd SEM\\OOP\\project\\pro\\src\\main\\database\\evenPost.txt");

        request.setAttribute("events", events);

        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
