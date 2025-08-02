package com.ecommerce.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

import com.ecommerce.model.Product;
import com.ecommerce.dao.ProductDAO;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Step 1: Get product ID from request
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        int id = Integer.parseInt(idParam);
        ProductDAO dao = new ProductDAO();
        Product product = null;

        try {
            product = dao.getProductById(id);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
            return;
        }

        if (product != null) {
            // ✅ Step 2: Get or create the session cart
            HttpSession session = request.getSession();
            List<Product> cart = (List<Product>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            // ✅ Step 4: Prevent duplicate products
            boolean alreadyInCart = false;
            for (Product p : cart) {
                if (p.getId() == product.getId()) {
                    alreadyInCart = true;
                    break;
                }
            }

            if (!alreadyInCart) {
                cart.add(product); // ✅ Add only if not already in cart
            }

            session.setAttribute("cart", cart); // ✅ Always update session
        }

        // ✅ Step 5: Redirect to cart page
        response.sendRedirect("cart.jsp");
    }
}

