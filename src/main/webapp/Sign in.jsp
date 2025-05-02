<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/22/2025
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TicketWave.lk</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    .card-header {
      background: linear-gradient(135deg, #0033A0, #4169E1);
      color: white;
      padding: 40px 20px;
      text-align: center;
      border-radius: 15px 15px 0 0;
    }
    .card-header h3 {
      font-size: 36px;
      font-weight: bold;
      letter-spacing: 2px;
    }
    .card-header .welcome-text {
      font-size: 28px;
      font-weight: 600;
      color: #FFFFFF;
    }
    .card-header .text-primary {
      color: #FFD700 !important;
    }
    .card {
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    .card-body {
      padding: 30px;
    }
    .btn-primary {
      background-color: #4169E1;
      border: none;
      border-radius: 20px;
      padding: 10px 20px;
      font-size: 16px;
    }
    .signup-link {
      text-align: center;
      margin-top: 20px;
    }
    .signup-link a {
      color: #0033A0;
      text-decoration: none;
      font-weight: bold;
    }
    .signup-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          <div class="welcome-text">
            Welcome to <span class="text-primary">TicketWave.lk</span>
          </div>
          <h3>Sign In</h3>
        </div>
        <div class="card-body">
          <form action="#" method="POST">
            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign In</button>
          </form>
        </div>
        <div class="signup-link">
          <p>Don't have an account? <a href="Register.jsp">Sign Up Here</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>






