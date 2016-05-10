<%
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") == "")) {
        response.sendRedirect("login.jsp");
    }
    
    else {
        response.sendRedirect("dashboard.jsp");
    }
%>