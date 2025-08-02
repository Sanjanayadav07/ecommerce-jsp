  <%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.ecommerce.model.User" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <h2 class="mb-4">Login</h2>
    <% if (request.getParameter("error") != null) { %>
      <div class="alert alert-danger">Invalid email or password</div>
    <% } %>
    <form action="login" method="post" class="row g-3">
      <div class="col-12">
        <input type="email" name="email" class="form-control" placeholder="Email" required />
      </div>
      <div class="col-12">
        <input type="password" name="password" class="form-control" placeholder="Password" required />
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-success">Login</button>
        <a href="register.jsp" class="btn btn-link">Don't have an account? Register</a>
      </div>
    </form>
  </div>
</body>
</html>
  
