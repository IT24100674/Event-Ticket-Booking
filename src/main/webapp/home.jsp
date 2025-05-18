
<%@ page import="java.util.List" %>
<%@ page import="com.eventManage.model.Event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TicketWave.lk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .hero-section {
            background-color: #0033A0;
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        .search-box {
            max-width: 600px;
            margin: 20px auto;
        }
        .event-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .navbar .nav-link {
            color: black;
        }
        .navbar .btn-primary {
            border-radius: 20px;
            padding: 5px 15px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold"><span class="text-primary">Ticket</span>Wave<span class="small">.lk</span></a>
        <div class="d-flex">

            <a href="createPost.jsp">
                <button class="btn btn-outline-primary ms-3">Create Post</button>
            </a>
        </div>
    </div>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">

            <li class="nav-item">
                <a href="index1.jsp">
                    <button class="btn btn-primary"><i class="bi bi-person-circle"></i> Sign In</button>
                </a>
            </li>
        </ul>
    </div>
</nav>

<section class="hero-section">
    <div class="container">
        <h1 class="fw-bold">Let's Book Your Ticket</h1>
        <p>Enjoy a seamless booking experience with fast checkout and secure payments.</p>
        <div class="search-box input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" class="form-control" placeholder="Search by Events.">
            <button class="btn btn-primary">Search</button>
        </div>
    </div>
</section>

<div class="container mt-4">
    <div class="row">
        <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events != null) {
                for (Event event : events) {
        %>
        <div class="col-md-3">
            <div class="card event-card shadow-sm">
                <img src="images/<%= event.getImageName() %>" alt="<%= event.getName() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= event.getName() %></h5>
                    <p><i class="bi bi-calendar"></i> <%= event.getDate() %></p>
                    <p><i class="bi bi-geo-alt"></i> <%= event.getLocation() %></p>
                    <p><strong><%= event.getTicketPrice() %> LKR</strong></p>
                    <button class="btn btn-primary w-100" >Buy Now</button>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center">
            <p>No events available.</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<p>&nbsp;&nbsp;&nbsp;</p>
<div class="container-fluid bg-dark text-white py-4">
    <div class="container">
        <h3>Contact Us</h3>
        <p>WhatsApp (Text-only service)</p>
        <p>support@TicketWave.lk</p>
    </div>
</div>
</body>
</html>
