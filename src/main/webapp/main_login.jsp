<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Main Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-box {
      max-width: 500px;
      margin: 80px auto;
      padding: 30px;
      background: white;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
  <div class="login-box">
    <h3 class="text-center mb-4">Login Portal</h3>

    <!-- User Login Form -->
    <form action="login" method="post">
      <h5>User Login</h5>
      <div class="mb-3">
        <input type="email" name="email" class="form-control" placeholder="User Email" required>
      </div>
      <div class="mb-3">
        <input type="password" name="password" class="form-control" placeholder="User Password" required>
      </div>
      <button type="submit" class="btn btn-primary w-100 mb-3">Login as User</button>
    </form>

    <hr>

    <!-- Admin Login Form -->
    <form action="admin-login" method="post">
      <h5>Admin Login</h5>
      <div class="mb-3">
        <input type="text" name="username" class="form-control" placeholder="Admin Username" required>
      </div>
      <div class="mb-3">
        <input type="password" name="password" class="form-control" placeholder="Admin Password" required>
      </div>
      <button type="submit" class="btn btn-dark w-100">Login as Admin</button>
    </form>

    <hr>
    <div class="text-center">
      <a href="register.jsp">Create User Account</a> | <a href="forgot_password.jsp">Forgot Password?</a>
    </div>

    <% if ("admin".equals(request.getParameter("error"))) { %>
      <div class="alert alert-danger mt-3">Invalid admin credentials.</div>
    <% } else if ("user".equals(request.getParameter("error"))) { %>
      <div class="alert alert-danger mt-3">Invalid user credentials.</div>
    <% } %>
  </div>
  <div class="text-center mt-3">
  <a href="forgot_password.jsp">Forgot Password?</a>
</div>
  
</body>
</html>

