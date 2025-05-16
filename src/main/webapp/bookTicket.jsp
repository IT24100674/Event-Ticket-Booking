<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ticket</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <div class="welcome">
        <h1>Book a Ticket</h1>
        <p class="subtitle">Fill in the details to book your ticket</p>
    </div>
    <c:if test="${not empty error}">
    <p class="message error">⚠️ ${error}</p>
    </c:if>
    <form action="${pageContext.request.contextPath}/bookTicket" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required>
        </div>
        <div class="form-group">
            <label for="event">Event:</label>
            <select id="event" name="event" required>
                <option value="">Select an Event</option>
                <option value="Concert">Concert</option>
                <option value="Movie">Movie</option>
                <option value="Sports">Sports Event</option>
            </select>
        </div>
        <div class="form-group">
            <label for="eventDateTime">Event Date & Time:</label>
            <input type="datetime-local" id="eventDateTime" name="eventDateTime" required>
        </div>
        <div class="form-group">
            <label>Select Seats:</label>
            <div class="seating-map" id="seatingMap">
                <% for (int i = 1; i <= 50; i++) { %>
                <input type="checkbox" id="seat<%=i%>" name="seatNumbers" value="<%=i%>">
                <label for="seat<%=i%>"><%=i%></label>
                <% } %>
            </div>
        </div>
        <div class="form-group">
            <label for="ticketPrice">Ticket Price ($):</label>
            <input type="number" id="ticketPrice" name="ticketPrice" step="0.01" required>
        </div>
        <div class="button-container">
            <button type="submit" class="btn btn-primary">Book Ticket</button>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Back to Home</a>
        </div>
    </form>
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
</body>
</html>
