package com.eventManage.servlets;



import com.eventManage.model.Booking;
import com.example.service.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/bookTicket")
public class BookTicketServlet extends HttpServlet {
    private BookingService bookingService;

    @Override
    public void init() {
        bookingService = BookingService.getInstance(getServletContext());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("BookTicketServlet: Processing booking request...");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
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

        Booking booking = new Booking(
                bookingService.getNextBookingId(),
                fullName,
                email,
                phoneNumber,
                event,
                eventDateTime,
                seatNumbers,
                ticketPrice,
                "Active"
        );

        try {
            bookingService.bookTicket(booking);
            System.out.println("BookTicketServlet: Booking successful, redirecting to viewTickets.jsp");
            response.sendRedirect(request.getContextPath() + "/viewTickets?success=true");
        } catch (IllegalStateException e) {
            System.out.println("BookTicketServlet: Booking failed - " + e.getMessage());
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/bookTicket.jsp").forward(request, response);
        }
    }
}
