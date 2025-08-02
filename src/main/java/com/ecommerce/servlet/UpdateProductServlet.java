package com.ecommerce.servlet;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/update-product")
public class UpdateProductServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String image_url = request.getParameter("image_url"); // ✅ match with form and DB
	        String description = request.getParameter("description");

	        Product product = new Product(id, name, price, image_url, description);
	        ProductDAO dao = new ProductDAO();

	        boolean updated = dao.updateProduct(product);
	        if (updated) {
	            response.sendRedirect("admin_dashboard.jsp");
	        } else {
	            response.getWriter().println("Product update failed.");
	        }
	    }
	
}