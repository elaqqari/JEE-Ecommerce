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
        String login = request.getParameter("login");    
        String pass = request.getParameter("password");
        String prenom = request.getParameter("prenom_resp");
        String nom = request.getParameter("nom_resp");
        String email = request.getParameter("email_resp");
        String num = request.getParameter("num_resp");
        String type = request.getParameter("type");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
        Statement  st=conn.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate("insert into resp(nom_resp, prenom_resp, email_resp, num_resp, nom_mar) values ('" + nom + "','" + prenom + "','" + email + " ','"+num+"','"+type+"');",Statement.RETURN_GENERATED_KEYS);
            
            if (i > 0) {
        //session.setAttribute("userid", user);
        ResultSet rs = st.getGeneratedKeys();
        if (rs.next()){
            int risultato=rs.getInt(1);
            int iscompte = st.executeUpdate("insert into compte(login, pass, type, id) values ('" + login + "','" + pass + "','responsable','" + risultato+ "');");
            if(iscompte>0){
                response.sendRedirect("admin.jsp");
            }
        }
           
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } 
            
            else {
            response.sendRedirect("index.jsp");
        }
%>
    </body>
</html>
