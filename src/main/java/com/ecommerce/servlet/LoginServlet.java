package com.ecommerce.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        

        User user = null;
		try {
			user = dao.login(email, password);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

        if (user != null) {
           HttpSession session = request.getSession();
          session.setAttribute("user", user);

           response.sendRedirect("index.jsp");  // ✅ This sends to product page
        } else {
            response.sendRedirect("main_login.jsp?error=user");
        }
        
        

    }
}
