<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.ecommerce.model.User, com.ecommerce.dao.ProductDAO, com.ecommerce.model.Product" %>

<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Products</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .card-img-top {
      height: 200px;
      object-fit: cover;
    }
    .card:hover {
      transform: scale(1.02);
      transition: 0.3s ease;
    }
    body {
      background-image: url('images/bg1.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
  </style>
</head>
<body class="bg-light">
  <div class="container mt-5">

    <div class="alert alert-success d-flex justify-content-between align-items-center">
      <div>Welcome, <%= user.getName() %>!</div>
      <div>
        <a href="order-history" class="btn btn-sm btn-outline-primary me-2">My Orders</a>
        <a href="logout" class="btn btn-sm btn-danger">Logout</a>
      </div>
    </div>

    <h2 class="mb-4">Product List</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <%
        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getAllProducts();
        for(Product p : products) {
      %>
      <div class="col">
        <div class="card h-100 shadow-sm">
          <img src="images/<%= p.getImage() %>" class="card-img-top" alt="<%= p.getName() %>">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><%= p.getName() %></h5>
            <p class="card-text text-muted mb-1">₹<%= p.getPrice() %></p>
            <p class="card-text small flex-grow-1"><%= p.getDescription() %></p>
            <a href="<%= request.getContextPath() %>/add-to-cart?id=<%= p.getId() %>" class="btn btn-sm btn-primary mt-auto">Add to Cart</a>
          </div>
        </div>
      </div>
      <% } %>
    </div>

    <div class="text-center mt-4">
      <a href="cart.jsp" class="btn btn-outline-secondary me-2">View Cart</a>
    </div>

  </div>
</body>
</html>



