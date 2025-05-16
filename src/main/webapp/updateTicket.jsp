<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Ticket</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
  <div class="welcome">
    <h1>Update Ticket</h1>
    <p class="subtitle">Update the details of your ticket</p>
  </div>
  <c:if test="${not empty error}">
    <p class="message error">⚠️ ${error}</p>
  </c:if>
  <%
    String bookingIdStr = request.getParameter("bookingId");
    com.example.model.Booking booking = null;
    try {
      int bookingId = Integer.parseInt(bookingIdStr);
      com.example.service.BookingService bookingService = com.example.service.BookingService.getInstance(application); // Use application instead of getServletConfig().getServletContext()
      booking = bookingService.findBookingById(bookingId);
      if (booking == null) {
        request.setAttribute("error", "Booking not found for ID: " + bookingId);
      }
    } catch (NumberFormatException e) {
      request.setAttribute("error", "Invalid Booking ID format.");
    } catch (Exception e) {
      request.setAttribute("error", "Error fetching booking: " + e.getMessage());
    }
    pageContext.setAttribute("booking", booking);
  %>
  <c:if test="${empty booking}">
    <p class="message error">${error}</p>
    <div class="button-container">
      <a href="${pageContext.request.contextPath}/viewTickets" class="btn btn-secondary">Back to Tickets</a>
    </div>
  </c:if>
  <c:if test="${not empty booking}">
    <form action="${pageContext.request.contextPath}/updateTicket" method="post" onsubmit="return validateForm()">
      <input type="hidden" name="bookingId" value="${param.bookingId}">
      <div class="form-group">
        <label for="event">Event:</label>
        <select id="event" name="event" required>
          <option value="">Select an Event</option>
          <option value="Concert" ${booking.event == 'Concert' ? 'selected' : ''}>Concert</option>
          <option value="Movie" ${booking.event == 'Movie' ? 'selected' : ''}>Movie</option>
          <option value="Sports" ${booking.event == 'Sports' ? 'selected' : ''}>Sports Event</option>
        </select>
      </div>
      <div class="form-group">
        <label for="eventDateTime">Event Date & Time:</label>
        <input type="datetime-local" id="eventDateTime" name="eventDateTime" value="${booking.eventDateTime}" required>
      </div>
      <div class="form-group">
        <label>Select Seats:</label>
        <div class="seating-map">
          <% for (int i = 1; i <= 50; i++) { %>
          <input type="checkbox" id="seat<%=i%>" name="seatNumbers" value="<%=i%>"
            ${booking.seatNumbers.contains(i) ? 'checked' : ''}>
          <label for="seat<%=i%>"><%=i%></label>
          <% } %>
        </div>
      </div>
      <div class="form-group">
        <label for="ticketPrice">Ticket Price ($):</label>
        <input type="number" id="ticketPrice" name="ticketPrice" step="0.01" value="${booking.ticketPrice}" required>
      </div>
      <div class="button-container">
        <button type="submit" class="btn btn-primary">Update Ticket</button>
        <a href="${pageContext.request.contextPath}/viewTickets" class="btn btn-secondary">Cancel</a>
      </div>
    </form>
  </c:if>
  <script>
    function validateForm() {
      const seats = document.querySelectorAll('input[name="seatNumbers"]:checked');
      if (seats.length === 0) {
        alert("Please select at least one seat.");
        return false;
      }
      return true;
    }
  </script>
</div>
</body>
</html>