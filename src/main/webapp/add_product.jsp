<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add New Product</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .box {
      max-width: 500px;
      margin: 60px auto;
      padding: 30px;
      background: #fff;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body class="bg-light">
  <div class="box">
    <h4 class="text-center mb-4">Add Product</h4>
    <form method="post" action="add-product">
      <div class="mb-3">
        <label>Product Name</label>
        <input type="text" name="name" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>Price</label>
        <input type="number" step="0.01" name="price" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>Image File Name (e.g. product1.jpg)</label>
        <input type="text" name="image" class="form-control" required>
      </div>
      <div class="mb-3">
        <label>Description</label>
        <textarea name="description" class="form-control" rows="4"></textarea>
      </div>
      <button type="submit" class="btn btn-success w-100">Add Product</button>
    </form>
    <div class="text-center mt-3">
      <a href="admin_dashboard.jsp">← Back to Dashboard</a>
    </div>
  </div>
</body>
</html>
