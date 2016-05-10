<%
    session.setAttribute("id", null);
    session.invalidate();
    response.sendRedirect("login.jsp");
%>