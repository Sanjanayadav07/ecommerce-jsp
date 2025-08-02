<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecommerce.dao.ProductDAO, com.ecommerce.model.Product" %>
<%
    // Validate and get product ID
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);
    ProductDAO dao = new ProductDAO();
    Product product = dao.getProductById(id);

    if (product == null) {
        response.getWriter().println("<h3>Product not found.</h3>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%= product.getName() %></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="card p-4 shadow-sm">
      <h2><%= product.getName() %></h2>
      <p><strong>Price:</strong> ₹<%= product.getPrice() %></p>
      <p><%= product.getDescription() %></p>
      <a href="add-to-cart?id=<%= product.getId() %>" class="btn btn-primary">Add to Cart</a>
      <a href="index.jsp" class="btn btn-secondary">Back to Products</a>
    </div>
  </div>
</body>
</html>
