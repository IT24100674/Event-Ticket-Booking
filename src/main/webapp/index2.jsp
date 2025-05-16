<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TicketWaves - Event Ticket Booking</title>
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="container">
  <div class="welcome">
    <h1>Welcome to TicketWaves</h1>
    <p class="subtitle">Your one-stop solution for event ticket booking</p>
  </div>
  <div class="button-container">
    <a href="bookTicket.jsp" class="btn btn-primary book-btn">
      <i class="fas fa-ticket-alt"></i> Book a Ticket
    </a>
    <a href="viewTickets" class="btn btn-secondary view-btn">
      <i class="fas fa-eye"></i> View Tickets
    </a>
  </div>
  <div class="features">
    <div class="feature">
      <i class="fas fa-ticket-alt icon"></i>
      <h3>Easy Booking</h3>
      <p>Book your event tickets in just a few clicks.</p>
    </div>
    <div class="feature">
      <i class="fas fa-chair icon"></i>
      <h3>Seat Selection</h3>
      <p>Choose your preferred seats with ease.</p>
    </div>
    <div class="feature">
      <i class="fas fa-calendar-check icon"></i>
      <h3>Manage Tickets</h3>
      <p>View, update, or cancel your bookings anytime.</p>
    </div>
  </div>
  <footer>
    <p>© 2025 TicketWaves | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a> | <a href="#">Contact Us</a></p>
  </footer>
</div>
</body>
</html>