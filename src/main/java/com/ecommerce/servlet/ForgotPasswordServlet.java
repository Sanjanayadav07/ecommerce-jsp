
package com.ecommerce.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);

        if (user != null) {
            request.setAttribute("message", "Your password is: " + user.getPassword());
        } else {
            request.setAttribute("error", "No user found with that email.");
        }

        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
    }
}
