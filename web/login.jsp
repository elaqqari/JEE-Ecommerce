<%-- 
    Document   : login
    Created on : 20 nov. 2017, 20:43:41
    Author     : f
--%>
<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    
    String login = request.getParameter("login");    
    String pass = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver").newInstance();;
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from compte where login='" + login + "' and pass='" + pass + "';");
    
    if (rs.next()) {
        String type=rs.getString("type");
        int id=rs.getInt("id");
        session.setAttribute("login", login);
        session.setAttribute("type", type);
        session.setAttribute("id", id);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        System.out.println("type : "+type);
        
        if(type.trim().equals("utilisateur")){
            response.sendRedirect("PageUtil.jsp");
        }
        if(type.trim().equals("gerant")){
            
            response.sendRedirect("admin.jsp");
        }
        if(type.trim().equals("responsable")){
            
            response.sendRedirect("PageResp.jsp");
        }
        if(type.trim().equals("livreur")){
            response.sendRedirect("PageLiv.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>
    </body>
</html>
