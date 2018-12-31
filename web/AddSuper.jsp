<%-- 
    Document   : AddResp
    Created on : 25 nov. 2017, 14:39:04
    Author     : f
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        String nom = request.getParameter("nom_mar");
        String adresse = request.getParameter("adresse");
        String num = request.getParameter("num_mar");
        String type = request.getParameter("type");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
        Statement  st=conn.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate("insert into marche(nom_mar, adresse, num_mar) values ('" + nom + "','" + adresse + "','" + num + "');");
            
            if (i > 0) {
        //session.setAttribute("userid", user);
       
                response.sendRedirect("admin.jsp");
            }
        
           
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
         
            
            else {
            response.sendRedirect("index.jsp");
        }
%>
    </body>
</html>
