package com.ecommerce.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);

        if (user != null) {
            boolean updated = dao.updatePassword(email, newPassword);
            if (updated) {
                request.setAttribute("message", "Password updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update password.");
            }
        } else {
            request.setAttribute("error", "Email not found.");
        }

        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
    }
}
