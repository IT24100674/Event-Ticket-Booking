<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>User Dashboard - TicketWave.lk</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background: #f0f2f5;
    }
    .dashboard-card {
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.2);
      background: white;
      max-width: 500px;
      width: 100%;
      text-align: center;
    }
    .dashboard-header {
      background: linear-gradient(135deg, #0033A0, #4169E1);
      color: white;
      padding: 20px;
      font-size: 1.75rem;
      border-top-left-radius: 15px;
      border-top-right-radius: 15px;
    }
    .dashboard-body {
      padding: 30px;
      font-size: 1.125rem;
    }
    .btn-logout {
      margin-top: 20px;
      border-radius: 10px;
      font-size: 1rem;
      padding: 10px 20px;
      background-color: #4169E1;
      border: none;
      color: white;
      transition: background 0.3s;
    }
    .btn-logout:hover {
      background-color: #0033A0;
    }
  </style>
</head>
<body>

<div class="dashboard-card">
  <div class="dashboard-header">
    User Dashboard
  </div>
  <div class="dashboard-body">
    <p>Login successful as <strong>User!</strong></p>
    <form action="logout" method="post">
      <a href="index1.jsp" class="btn btn-outline-primary">log out</a>
      <a href="update.jsp" class="btn btn-outline-primary">Update</a>
      <a href="delete.jsp" class="btn btn-outline-primary">Delete</a>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
