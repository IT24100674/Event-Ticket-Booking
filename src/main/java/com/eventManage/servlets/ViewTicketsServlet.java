package com.eventManage.servlets;

import com.example.service.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/viewTickets")
public class ViewTicketsServlet extends HttpServlet {
    private BookingService bookingService;

    @Override
    public void init() {
        bookingService = BookingService.getInstance(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ViewTicketsServlet: Fetching bookings...");
        var bookings = bookingService.getAllBookings();
        System.out.println("ViewTicketsServlet: Retrieved " + bookings.size() + " bookings.");
        request.setAttribute("bookings", bookings);
        System.out.println("ViewTicketsServlet: Forwarding to viewTickets.jsp with " + bookings.size() + " bookings.");
        request.getRequestDispatcher("/viewTickets.jsp").forward(request, response);
    }
}