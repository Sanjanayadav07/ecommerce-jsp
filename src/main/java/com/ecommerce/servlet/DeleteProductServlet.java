package com.ecommerce.servlet;

import com.ecommerce.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/delete-product")  // <--- VERY IMPORTANT!
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                ProductDAO dao = new ProductDAO();
                boolean deleted = dao.deleteProduct(id);

                if (deleted) {
                    response.sendRedirect("admin_dashboard.jsp");
                } else {
                    response.getWriter().println("Product deletion failed.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error deleting product.");
            }
        } else {
            response.sendRedirect("admin_dashboard.jsp");
        }
    }
}
