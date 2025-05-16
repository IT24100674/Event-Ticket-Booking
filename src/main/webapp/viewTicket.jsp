<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Tickets</title>
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="container">
  <div class="welcome">
    <h1>Your Tickets</h1>
    <p class="subtitle">Manage all your event bookings in one place</p>
  </div>
  <c:set var="totalBookings" value="${fn:length(bookings)}" />
  <c:set var="activeBookings" value="${fn:length(bookings)}" />
  <c:set var="cancelledBookings" value="0" />
  <c:forEach var="booking" items="${bookings}">
    <c:if test="${booking.status == 'Cancelled'}">
      <c:set var="cancelledBookings" value="${cancelledBookings + 1}" />
      <c:set var="activeBookings" value="${activeBookings - 1}" />
    </c:if>
  </c:forEach>
  <div class="stats">
    <div class="stat-card">TOTAL TICKETS<br><span>${totalBookings}</span></div>
    <div class="stat-card">ACTIVE TICKETS<br><span>${activeBookings}</span></div>
    <div class="stat-card">CANCELLED TICKETS<br><span>${cancelledBookings}</span></div>
  </div>
  <c:if test="${param.success}">
    <p class="message success">🎉 Ticket booked successfully!</p>
  </c:if>
  <c:if test="${param.updated}">
    <p class="message success">✅ Ticket updated successfully!</p>
  </c:if>
  <c:if test="${param.canceled}">
    <p class="message success">❌ Ticket canceled successfully!</p>
  </c:if>
  <c:if test="${empty bookings}">
    <p class="message error">📪 No bookings found.</p>
  </c:if>
  <c:if test="${not empty bookings}">
    <p class="message info">📋 Found ${fn:length(bookings)} bookings.</p>
  </c:if>
  <div class="table-wrapper">
    <table>
      <thead>
      <tr>
        <th>Ticket ID</th>
        <th>Customer</th>
        <th>Event</th>
        <th>Date & Time</th>
        <th>Seats</th>
        <th>Price</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="booking" items="${bookings}">
        <tr>
          <td>${booking.bookingId}</td>
          <td>${booking.fullName}</td>
          <td>${booking.event}</td>
          <td>${booking.eventDateTime}</td>
          <td>
            <c:if test="${not empty booking.seatNumbers}">
              <c:forEach var="seat" items="${booking.seatNumbers}" varStatus="loop">
                ${seat}<c:if test="${not loop.last}">,</c:if>
              </c:forEach>
            </c:if>
            <c:if test="${empty booking.seatNumbers}">
              N/A
            </c:if>
          </td>
          <td>$${booking.ticketPrice}</td>
          <td style="color: ${booking.status == 'Cancelled' ? '#EF4444' : '#10B981'}">${booking.status}</td>
          <td>
            <c:if test="${booking.status == 'Active'}">
              <a href="updateTicket.jsp?bookingId=${booking.bookingId}" class="action-btn update-btn">
                <i class="fas fa-edit"></i> Update
              </a>
              <a href="cancelTicket.jsp?bookingId=${booking.bookingId}" class="action-btn cancel-btn">
                <i class="fas fa-trash-alt"></i> Cancel
              </a>
            </c:if>
            <c:if test="${booking.status == 'Cancelled'}">
              <span style="color: #6B7280;">No actions available</span>
            </c:if>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
  <div class="button-container">
    <a href="${pageContext.request.contextPath}/bookTicket.jsp" class="btn btn-primary">
      <i class="fas fa-ticket-alt"></i> + Book New Ticket
    </a>
  </div>
  <footer>
    <p>© 2025 TicketWaves | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a> | <a href="#">Contact Us</a></p>
  </footer>
</div>
</body>
</html>
