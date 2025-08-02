package com.ecommerce.servlet;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String name = request.getParameter("name");
    double price = Double.parseDouble(request.getParameter("price"));
    String image = request.getParameter("image");
    String description = request.getParameter("description");

    Product product = new Product(0, name, price, image, description);
    ProductDAO dao = new ProductDAO();

    boolean added = dao.addProduct(product);
    if (added) {
      response.sendRedirect("admin_dashboard.jsp");
    } else {
      response.getWriter().println("Failed to add product.");
    }
  }
}


