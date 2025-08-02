<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Forgot Password</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .box {
      max-width: 500px;
      margin: 80px auto;
      padding: 30px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body class="bg-light">
  <div class="box">
    <h4 class="text-center mb-4">Reset Password</h4>

    <% if (request.getAttribute("message") != null) { %>
      <div class="alert alert-success"><%= request.getAttribute("message") %></div>
    <% } else if (request.getAttribute("error") != null) { %>
      <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
    <% } %>

    <form method="post" action="reset-password">
      <div class="mb-3">
        <label>Email address</label>
        <input type="email" name="email" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>New Password</label>
        <input type="password" name="newPassword" class="form-control" required>
      </div>
      <button type="submit" class="btn btn-primary w-100">Reset Password</button>
    </form>

    <div class="text-center mt-3">
      <a href="main_login.jsp">Back to Login</a>
    </div>
  </div>
</body>
</html>




