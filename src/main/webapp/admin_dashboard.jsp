<!-- ✅ Admin Dashboard with Product Actions + Orders -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.ecommerce.dao.ProductDAO, com.ecommerce.dao.OrderDAO, com.ecommerce.model.Product, com.ecommerce.model.Order" %>
<%
  if (session.getAttribute("admin") == null) {
    response.sendRedirect("admin_login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h3>Welcome, Admin</h3>
    <a href="admin_logout.jsp" class="btn btn-danger">Logout</a>
  </div>
  <hr>

  <!-- ✅ Stats Summary -->
  <div class="row mb-4">
    <div class="col-md-6">
      <div class="card p-3 shadow-sm">
        <h5>Total Orders: <%= new OrderDAO().getAllOrders().size() %></h5>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card p-3 shadow-sm">
        <h5>
          Total Revenue: ₹
          <%
            double total = 0;
            for (Order o : new OrderDAO().getAllOrders()) {
              total += o.getPrice() * o.getQuantity();
            }
            out.print(new DecimalFormat("#.##").format(total));
          %>
        </h5>
      </div>
    </div>
  </div>

  <!-- ✅ Product Table -->
  <div class="d-flex justify-content-between align-items-center">
    <h4>All Products</h4>
    <a href="add_product.jsp" class="btn btn-success">Add Product</a>
  </div>
  <table class="table table-bordered table-hover mt-2">
    <thead class="table-light">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Image</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <%
        ProductDAO pdao = new ProductDAO();
        List<Product> products = pdao.getAllProducts();
        for (Product p : products) {
      %>
      <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td>₹<%= p.getPrice() %></td>
        <td><%= p.getImage() %></td>
        <td>
          <a href="edit_product.jsp?id=<%= p.getId() %>" class="btn btn-sm btn-warning">Edit</a>
          <a href="delete-product?id=<%= p.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>

  <!-- ✅ Orders Table -->
  <h4 class="mt-5">All Orders</h4>
  <table class="table table-striped">
    <thead class="table-dark">
      <tr>
        <th>User ID</th>
        <th>Product</th>
        <th>Qty</th>
        <th>Price</th>
        <th>Date</th>
      </tr>
    </thead>
    <tbody>
      <%
        OrderDAO odao = new OrderDAO();
        List<Order> orders = odao.getAllOrders();
        for (Order o : orders) {
      %>
      <tr>
        <td><%= o.getUserId() %></td>
        <td><%= o.getProductName() %></td>
        <td><%= o.getQuantity() %></td>
        <td>₹<%= o.getPrice() %></td>
        <td><%= o.getOrderDate() %></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>
</body>
</html>

