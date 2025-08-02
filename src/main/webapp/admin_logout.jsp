<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Invalidate the session
    session.invalidate();

    // Redirect to admin login page
    response.sendRedirect("admin_login.jsp");
%>
