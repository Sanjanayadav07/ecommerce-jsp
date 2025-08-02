<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .box {
      max-width: 400px;
      margin: 100px auto;
      padding: 30px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body class="bg-light">
  <div class="box">
    <h2 class="text-center mb-4">Admin Login</h2>
    <form action="admin-login" method="post">
      <div class="mb-3">
        <label>Username</label>
        <input type="text" name="username" class="form-control" required />
      </div>
      <div class="mb-3">
        <label>Password</label>
        <input type="password" name="password" class="form-control" required />
      </div>
      <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <% if ("1".equals(request.getParameter("error"))) { %>
      <div class="alert alert-danger mt-3">Invalid admin credentials!</div>
    <% } %>

    <div class="text-center mt-3">
      <a href="main_login.jsp">User Login</a>
    </div>
  </div>
</body>
</html>
