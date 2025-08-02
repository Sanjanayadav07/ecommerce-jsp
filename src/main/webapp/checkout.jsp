<%@ page contentType="text/html;charset=UTF-8" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Checkout</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4">Checkout</h2>
  <form action="checkout" method="post">
    <div class="mb-3">
      <label>Name</label>
      <input type="text" name="name" class="form-control" required />
    </div>
    <div class="mb-3">
      <label>Address</label>
      <textarea name="address" class="form-control" required></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Place Order</button>
  </form>
</div>
</body>
</html>

