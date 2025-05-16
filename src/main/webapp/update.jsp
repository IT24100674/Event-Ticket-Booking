<%@ page import="com.eventManage.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TicketWave.lk - Update Details</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
  />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

    .btn-primary {
      background: linear-gradient(to right, #007bff, #6610f2);
      border: none;
      border-radius: 10px;
      padding: 10px;
      font-size: 1rem;
    }

    .btn-primary:hover {
      background: linear-gradient(to right, #0056b3, #520dc2);
    }
    .error-message {
      color: #dc3545;
      margin-top: 15px;
      text-align: center;
      font-weight: 500;
    }
    .success-message {
      color: #28a745; /* Bootstrap green */
      margin-top: 15px;
      text-align: center;
      font-weight: 500;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">Update Your Details</div>
        <div class="card-body p-4">
          <!-- Display error message if login fails -->
          <% if (request.getParameter("usernameMismatch") != null) { %>
          <p class="error-message">Username mismatch. Please use your current username.</p>
          <% } %>
          <% if (request.getParameter("success") != null) { %>
          <p class="success-message">Your details have been updated successfully.</p>
          <% } %>

          <!-- Update form -->
          <form action="update" method="POST">
            <div class="mb-3">
              <label class="form-label">Username:</label>
              <input
                      type="text"
                      class="form-control"
                      name="username"
                      value="${sessionScope.user.username}"
                      required
              />
            </div>
            <div class="mb-3">
              <label class="form-label">
                New Email (Leave blank to keep current):
              </label>
              <input
                      type="email"
                      class="form-control"
                      name="email"
                      placeholder="Enter new Email or keep blank"

              />
            </div>
            <div class="mb-3">
              <label class="form-label">New Password:</label>
              <input
                      type="password"
                      class="form-control"
                      name="password"
                      placeholder="Enter new password"
                      required
              />
            </div>
            <button type="submit" class="btn btn-primary w-100">
              Update
            </button>
          </form>

          <div class="text-center mt-3">
            <%--                        <%= ((User) session.getAttribute("user")).getRole()%>--%>
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
            } else {
            %>
            <a href="login.jsp">Back to Login</a>
            <%
              }
            %>


          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
