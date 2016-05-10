<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    String url = "jdbc:mysql://localhost/okbus";
    Connection connection = DriverManager.getConnection(url, "root", "1234");
    Statement statement = connection.createStatement();
    
    String query = "SELECT id, nama FROM po WHERE username ='" + username + "' AND password='" + password + "';";
    ResultSet resultSet = statement.executeQuery(query);
    
    if(resultSet.next()) {
        session.setAttribute("id", resultSet.getString("id"));
        session.setAttribute("nama", resultSet.getString("nama"));
        response.sendRedirect("index.jsp");
    }
    
    else {
        out.print("ERRORRRR!!");
    }
%>
