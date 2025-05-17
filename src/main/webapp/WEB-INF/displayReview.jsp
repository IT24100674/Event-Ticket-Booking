<%--
  Created by IntelliJ IDEA.
  User: chanu
  Date: 5/17/2025
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eventManage.model.Review" %>
<%
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --bs-primary: #1E40AF;
        }
        .navbar-custom {
            background-color: var(--bs-primary);
        }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="#">Feedback Portal</a>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-lg">
                <div class="card-header text-white" style="background-color: var(--bs-primary);">
                    <h4 class="mb-0">User Reviews</h4>
                </div>
                <div class="card-body">
                    <%
                        if (reviews != null && !reviews.isEmpty()) {
                            for (Review r : reviews) {
                    %>
                    <div class="mb-4 p-3 border rounded bg-light">
                        <p class="mb-1"><%= r.getName() %>:</p>
                        <p class="fw-bold mb-0"><%= r.getText() %></p>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="text-muted">No reviews yet.</p>
                    <%
                        }
                    %>
                    <a href="submitReview.jsp" class="btn btn-secondary mt-3">Submit Another Review</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


