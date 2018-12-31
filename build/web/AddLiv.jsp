<%-- 
    Document   : AddLiv
    Created on : 25 nov. 2017, 18:56:54
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
        String prenom = request.getParameter("prenom_liv");
        String nom = request.getParameter("nom_liv");
        String email = request.getParameter("email_liv");
        String num = request.getParameter("num_liv");
        String cin = request.getParameter("cin");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
        Statement  st=conn.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate("insert into livreur(nom_liv, prenom_liv, email_liv, num_liv, cin) values ('" + nom + "','" + prenom + "','" + email + " ','"+num+"','"+cin+"');",Statement.RETURN_GENERATED_KEYS);
            
            if (i > 0) {
        //session.setAttribute("userid", user);
        ResultSet rs = st.getGeneratedKeys();
        if (rs.next()){
            int risultato=rs.getInt(1);
            int iscompte = st.executeUpdate("insert into compte(login, pass, type, id) values ('" + login + "','" + pass + "','livreur','" + risultato+ "');");
            if(iscompte>0){
                response.sendRedirect("admin.jsp");
            }
        }
           
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } 
            
            else {
            response.sendRedirect("inter3.jsp");
        }
%>
    </body>
</html>
