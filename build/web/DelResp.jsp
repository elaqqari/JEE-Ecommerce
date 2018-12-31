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
                int id = Integer.parseInt(request.getParameter("id"));
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement stmt=conn.createStatement();
                String sql="delete from resp where id_resp="+id+";";
                String sql1="delete from compte where type ='responsable' and id="+id +";";
                int rs= stmt.executeUpdate(sql);
                int rs1=stmt.executeUpdate(sql1);
                
                if(rs>0){
                    if(rs1>0){
                        response.sendRedirect("inter1.jsp");
                    }
        
        
                   
        }
         } catch(Exception e){out.print(e);}%>
    </body>
</html>
