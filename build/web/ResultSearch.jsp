<%-- 
    Document   : ResultSearch
    Created on : 8 déc. 2017, 22:27:43
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
        
    String nom = request.getParameter("nom_prod");    
    Class.forName("com.mysql.jdbc.Driver").newInstance();;
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from produit where nom_prod='" + nom + "';");
    
    if(rs.next()) {%>
    <center>
        <font color="Blue" size="6">Liste des produits</font>
    </center><br>
    <h1>Selectionner le produit désirer !</h1>
    <table width="100%" bgcolor="silver" border="1">
        <tr align="center">
            <th width="25%">Nom Produit</th>
            <th width="25%">Prix</th>
            
        </tr>
        <tr align="center">
            <td><%= rs.getString("nom_prod")%></td>
            <td><%= rs.getString("prix_prod")%></td>
        </tr>
        </table>
        <%}
    else{%>
    <h2><center>Produit inexistant !!</center></h2>
    
        <%}} catch(Exception e){out.print(e);}%>
        <h2>Si vous voulez chercher un autre produit click <a href="search.jsp">ici</a></h2>
    </body>
</html>
