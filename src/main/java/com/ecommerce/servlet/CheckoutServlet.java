package com.ecommerce.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import com.ecommerce.dao.OrderDAO;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;


@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        @SuppressWarnings("unchecked")
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.getWriter().println("Cart is empty!");
            return;
        }

        // Debug info (optional)
        System.out.println("Checkout initiated by userId = " + userId);
        System.out.println("Shipping name = " + name + ", address = " + address);
        System.out.println("Cart contains " + cart.size() + " items");

        OrderDAO dao = new OrderDAO();

        try {
            boolean placed = dao.placeOrder(userId, name, address, cart);

            if (placed) {
                session.removeAttribute("cart"); // Clear cart after order
                response.sendRedirect("thankyou.jsp");
            } else {
                response.getWriter().println("⚠️ Failed to place order. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error while placing order: " + e.getMessage());
        }
    }
}

