<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.ecommerce.model.Order, com.ecommerce.model.User" %>

<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Your Orders</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <style>
  body {
    background-image: url('images/bg.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
  }
</style>
  
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Your Order History</h2>
    <div>
      <span class="me-2">👋 Welcome, <strong><%= user.getName() %></strong></span>
      <a href="index.jsp" class="btn btn-outline-primary btn-sm">← Back to Home</a>
    </div>
  </div>

  <table class="table table-bordered table-striped">
    <thead>
      <tr class="table-primary">
        <th>Product</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Date</th>
      </tr>
    </thead>
    <tbody>
      <%
        if (orders == null || orders.isEmpty()) {
      %>
        <tr>
          <td colspan="4" class="text-center">No orders found.</td>
        </tr>
      <%
        } else {
          for (Order o : orders) {
      %>
        <tr>
          <td><%= o.getProductName() %></td>
          <td>₹<%= o.getPrice() %></td>
          <td><%= o.getQuantity() %></td>
          <td><%= o.getOrderDate() %></td>
        </tr>
      <%
          }
        }
      %>
    </tbody>
  </table>
</div>

</body>
</html>

