<%-- 
    Document   : DelResp
    Created on : 25 nov. 2017, 19:33:59
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
            try{
                String nom = request.getParameter("nom_mar");
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement stmt=conn.createStatement();
                String sql="delete from marche where nom_mar='"+nom+"';";
               
                int rs= stmt.executeUpdate(sql);

                if(rs>0){
                    
                        response.sendRedirect("idSupp3.jsp");
        }
         } catch(Exception e){out.print(e);}%>
    </body>
</html>
