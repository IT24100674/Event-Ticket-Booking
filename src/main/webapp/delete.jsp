<%@ page import="com.eventManage.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TicketWave.lk - Delete Account</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    body {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background: #f4f6f9;
    }
    .card {
      border-radius: 15px;
      box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
      background: rgba(255, 255, 255, 0.95);
    }
    .card-header {
      background: linear-gradient(to right, #007bff, #6610f2);
      color: white;
      font-size: 1.5rem;
      font-weight: bold;
      text-align: center;
      border-radius: 15px 15px 0 0;
      padding: 20px;
    }
    .form-control {
      border-radius: 10px;
    }
    .btn-blue {
      background: linear-gradient(to right, #007bff, #6610f2);
      border: none;
      border-radius: 10px;
      padding: 10px;
      font-size: 1rem;
      color: white;
    }
    .btn-blue:hover {
      background: linear-gradient(to right, #0056b3, #520dc2);
    }
    .cancel-link {
      display: block;
      margin-top: 15px;
      text-align: center;
      text-decoration: none;
      color: #015197;
      font-weight: bold;
    }
    .cancel-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">Delete My Account</div>
        <div class="card-body p-4">
          <p class="text-center text-muted fw-medium">Please confirm your username and password to permanently delete your account!</p>
          <form action="#" method="POST">
            <div class="mb-3">
              <label class="form-label">Username</label>
              <input type="text" class="form-control" name="username" placeholder="Enter your username" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Password</label>
              <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-blue w-100">Delete Account</button>
          </form>
          <div class="text-center mt-3">
            <%
              User user = (User) session.getAttribute("user");
              if (user != null) {
                String role = user.getRole();
                if ("Admin".equals(role)) {
            %>
            <a href="admin_dashboard.jsp">Back</a>
            <%
            } else if ("Regular User".equals(role)) {
            %>
            <a href="user_dashboard.jsp">Back</a>
            <%
                }
              }
            %>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>