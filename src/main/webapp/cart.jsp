<%@ page import="java.util.*, com.ecommerce.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
  }

    List<Product> cart = (List<Product>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Your Cart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-3">Your Cart</h2>

  <p>Cart size: <%= (cart != null) ? cart.size() : 0 %></p>

  <%
    double total = 0;
    if (cart != null && !cart.isEmpty()) {
  %>
    <table class="table table-bordered">
      <thead>
        <tr><th>Product</th><th>Price</th></tr>
      </thead>
      <tbody>
        <% for(Product p : cart) {
             total += p.getPrice(); %>
        <tr>
          <td><%= p.getName() %></td>
          <td>₹<%= p.getPrice() %></td>
        </tr>
        <% } %>
        <tr>
          <td><strong>Total</strong></td>
          <td><strong>₹<%= total %></strong></td>
        </tr>
      </tbody>
    </table>
    <a href="checkout.jsp" class="btn btn-success">Checkout</a>
  <% } else { %>
    <div class="alert alert-warning">Your cart is empty.</div>
  <% } %>
</div>
</body>
</html>
