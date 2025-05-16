<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - TicketWave.lk</title>
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
    .card {
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      max-width: 500px;
      width: 100%;
    }
    .card-header {
      background: linear-gradient(135deg, #0033A0, #4169E1);
      color: white;
      font-size: 1.5rem;
      font-weight: bold;
      text-align: center;
      padding: 20px;
      border-radius: 15px 15px 0 0;
    }
    .card-body {
      padding: 20px;
    }
    .form-label {
      font-weight: 500;
    }
    .btn {
      border-radius: 10px;
      font-size: 1rem;
      padding: 12px 20px;
      width: 100%;
      background-color: #4169E1;
      border: none;
      color: white;
      transition: background 0.3s;
    }
    .btn:hover {
      background-color: #0033A0;
    }
  </style>
</head>
<body>

<div class="card">
  <div class="card-header">
    Register - TicketWave.lk
  </div>
  <div class="card-body">
    <form action="register" method="post">
      <div class="mb-3">
        <label for="username" class="form-label">Username:</label>
        <input type="text" class="form-control" id="username" name="username" required>
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password:</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>

      <div class="mb-4">
        <label for="role" class="form-label">Role:</label>
        <select class="form-select" id="role" name="role" required>
          <option value="regular">Regular User</option>
          <option value="admin">Admin User</option>
        </select>
      </div>

      <button type="submit" class="btn">Register</button>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
