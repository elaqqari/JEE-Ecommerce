<%-- 
    Document   : DelCom
    Created on : 7 févr. 2018, 00:02:21
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
                int id = Integer.parseInt(request.getParameter("id"));
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement stmt=conn.createStatement();
                String sql1="delete from commande where id_com="+id+";";
                String sql="delete from ligne_com where id_com="+id +";";
                int rs1= stmt.executeUpdate(sql1);
                int rs=stmt.executeUpdate(sql);
                
                if(rs>0){
                   if(rs1>0){
                        response.sendRedirect("inter5.jsp");
                    }
        
        
                   
        }
         } catch(Exception e){out.print(e);}%>
    </body>
</html>
