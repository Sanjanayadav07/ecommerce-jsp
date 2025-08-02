<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <h2 class="mb-4">Create an Account</h2>
    <form action="register" method="post" class="row g-3">
      <div class="col-md-6">
        <input type="text" name="name" class="form-control" placeholder="Full Name" required />
      </div>
      <div class="col-md-6">
        <input type="email" name="email" class="form-control" placeholder="Email" required />
      </div>
      <div class="col-12">
        <input type="password" name="password" class="form-control" placeholder="Password" required />
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Register</button>
        <a href="login.jsp" class="btn btn-link">Already have an account? Login</a>
      </div>
    </form>
  </div>
</body>
</html>
