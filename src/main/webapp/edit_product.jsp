<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.ecommerce.dao.ProductDAO, com.ecommerce.model.Product" %>

<%
  String idStr = request.getParameter("id");
  if (idStr == null) {
    response.sendRedirect("admin_dashboard.jsp");
    return;
  }

  int id = Integer.parseInt(idStr);
  ProductDAO dao = new ProductDAO();
  Product product = dao.getProductById(id);
  if (product == null) {
    response.sendRedirect("admin_dashboard.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Edit Product</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .box {
      max-width: 500px;
      margin: 80px auto;
      padding: 30px;
      background: #fff;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body class="bg-light">
  <div class="box">
    <h4 class="text-center mb-4">Edit Product</h4>
    <form method="post" action="update-product">
      <input type="hidden" name="id" value="<%= product.getId() %>">
      <div class="mb-3">
        <label>Product Name</label>
        <input type="text" name="name" class="form-control" value="<%= product.getName() %>" required>
      </div>
      <div class="mb-3">
        <label>Price</label>
        <input type="number" step="0.01" name="price" class="form-control" value="<%= product.getPrice() %>" required>
      </div>
      <div class="mb-3">
        <label>Image File Name</label>
        <input type="text" name="image" class="form-control" value="<%= product.getImage() %>" required>
      </div>
      <div class="mb-3">
        <label>Description</label>
        <textarea name="description" class="form-control" rows="4"><%= product.getDescription() %></textarea>
      </div>
      <button type="submit" class="btn btn-primary w-100">Update Product</button>
    </form>
    <div class="text-center mt-3">
      <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
  </div>
</body>
</html>
