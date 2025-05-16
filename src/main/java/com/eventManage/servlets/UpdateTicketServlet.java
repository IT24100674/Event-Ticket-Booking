package com.eventManage.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;




import com.example.service.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/updateTicket")
public class UpdateTicketServlet extends HttpServlet {
    private BookingService bookingService;

    @Override
    public void init() {
        bookingService = BookingService.getInstance(getServletContext());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateTicketServlet: Processing update request...");
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String event = request.getParameter("event");
        String eventDateTime = request.getParameter("eventDateTime");
        String[] seatNumbersStr = request.getParameterValues("seatNumbers");
        double ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));

        List<Integer> seatNumbers = new ArrayList<>();
        if (seatNumbersStr != null) {
            for (String seat : seatNumbersStr) {
                seatNumbers.add(Integer.parseInt(seat));
            }
        }

        try {
            bookingService.updateBooking(bookingId, event, eventDateTime, seatNumbers, ticketPrice);
            System.out.println("UpdateTicketServlet: Update successful, redirecting to viewTickets.jsp");
            response.sendRedirect(request.getContextPath() + "/viewTickets?updated=true");
        } catch (IllegalStateException e) {
            System.out.println("UpdateTicketServlet: Update failed - " + e.getMessage());
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/updateTicket.jsp").forward(request, response);
        }
    }
}