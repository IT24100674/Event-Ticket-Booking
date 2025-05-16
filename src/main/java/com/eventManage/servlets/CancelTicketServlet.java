package com.eventManage.servlets;

import com.eventManage.servlets.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cancelTicket")
public class CancelTicketServlet extends HttpServlet {
    private BookingService bookingService;

    @Override
    public void init() {
        bookingService = BookingService.getInstance(getServletContext());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        bookingService.cancelBooking(bookingId);
        response.sendRedirect(request.getContextPath() + "/viewTickets?canceled=true");
    }
}
