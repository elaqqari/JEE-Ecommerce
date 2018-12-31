<%-- 
    Document   : logout
    Created on : 20 nov. 2017, 20:47:32
    Author     : f
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.setAttribute("login", null);
        session.invalidate();
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
