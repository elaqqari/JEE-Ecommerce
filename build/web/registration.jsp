<%-- 
    Document   : registration
    Created on : 22 nov. 2017, 10:45:40
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
        String prenom = request.getParameter("prenom_util");
        String nom = request.getParameter("nom_util");
        String email = request.getParameter("email_util");
        String adr = request.getParameter("adresse_util");
        String num = request.getParameter("num_util");
        String date = request.getParameter("date_util");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
        Statement  st=conn.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate("insert into utilisateur(nom_util, prenom_util, email_util, adresse_util, num_util, date_util) values ('" + nom + "','" + prenom + "','" + email + "','" + adr+ " ','"+num+"','"+date+"');",Statement.RETURN_GENERATED_KEYS);
            
            if (i > 0) {
        //session.setAttribute("userid", user);
        ResultSet rs = st.getGeneratedKeys();
        if (rs.next()){
            int risultato=rs.getInt(1);
            int iscompte = st.executeUpdate("insert into compte(login, pass, type, id) values ('" + login + "','" + pass + "','utilisateur','" + risultato+ "');");
            if(iscompte>0){
                response.sendRedirect("index.jsp");
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
