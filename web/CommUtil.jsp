<%-- 
    Document   : CommUtil
    Created on : 2 févr. 2018, 18:09:15
    Author     : f
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Liste de Commande</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
    
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>
    </head>
    <body>
        
        <section id="container" >
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
            
            <a href="PageLiv.jsp" class="logo"><b><%=session.getAttribute("nom")%>  <%=session.getAttribute("prenom")%></b></a>
        
        <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>
        <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="PageLiv.jsp"><img src="assets/img/téléchargement.jpg" class="img-circle" width="60"></a></p>
                  <h5 class="centered">
                    <jsp:useBean id="cal" class="org.projet.jstl.Calendrier"/>
                    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                    <c:set var="heure" value="${cal.heure}" scope="request"/>
                    <c:choose>
                    <c:when test="${heure>=6 && heure<17}">
                    Bonjour 
                    </c:when>
                    <c:otherwise>Bonsoir </c:otherwise>
                    </c:choose>
                    <%=session.getAttribute("nom")%></h5>
              	  	
                  <li class="mt">
                      <a class="active" href="PageLiv.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Menu</span>
                      </a>
                  </li>
                  </ul>
          </div>
      </aside>
                    <%
                        String id= request.getParameter("id");
                        String nom= request.getParameter("nom");
                        String prenom= request.getParameter("prenom");
                        String adresse= request.getParameter("adresse");
                        String date= request.getParameter("date");
                        float total= Float.parseFloat(request.getParameter("total"));
                    %>
                    <section id="main-content">
                        <section class="wrapper">
                            <h3><i class="fa fa-angle-right"></i> Commande de : <%=nom%> <%=prenom%></h3>
                            <h3><i class="fa fa-angle-right"></i> Adresse : <%=adresse%></h3>
                            
                            <div class="row mt">
                                <div class="col-md-12">
                                    <div class="content-panel">
                                        <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Liste des produits</h4>
	                  	  	  <hr>
                                          <thead>
                                              <tr>
                                                  <th><i class="fa fa-bullhorn"></i> Reférence du produit</th>
                                                  <th><i class="fa fa-bullhorn"></i>Supermarché</th>
                                                  <th><i class="fa fa-bullhorn"></i>Adresse</th>
                                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i>Nom de produit</th>
                                                  <th><i class="fa fa-bookmark"></i>Quantité de produit</th>
                                                  <th><i class=" fa fa-edit"></i>Prix de produit en DH</th>
                                              </tr>
                                          </thead>
                                          <%
                                              try{
                                                  Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                                                  Statement stmt=conn.createStatement();
                                                  String sql="select ligne_com.ref_prod,ligne_com.quant,nom_prod,ligne_com.nom_mar,prix,adresse from produit,ligne_com,stock,marche where ligne_com.nom_mar=marche.nom_mar and produit.ref_prod=ligne_com.ref_prod and stock.nom_mar=ligne_com.nom_mar and stock.ref_prod=ligne_com.ref_prod and ligne_com.id_com="+id+" group by ligne_com.ref_prod";
                                                  ResultSet rs= stmt.executeQuery(sql);
                                                  while(rs.next()){
                                          %>
                                          <tbody>
                                              <tr align="center">
                                                  <td><%= rs.getInt("ligne_com.ref_prod")%></td>
                                                  <td><%= rs.getString("ligne_com.nom_mar")%></td>
                                                  <td><%= rs.getString("adresse")%></td>
                                                  <td class="hidden-phone"><%= rs.getString("nom_prod")%></td>
                                                  <td><%= rs.getInt("ligne_com.quant")%></td>
                                                  <td class="hidden-phone"><%=rs.getFloat("prix")%></td>
                                  
                                              </tr>
                                              <%}%>
                                          </tbody>
                                        </table>
                                        <%} catch(Exception e){out.print(e);}%>
                                    </div><!-- /content-panel -->
                                </div><!-- /col-md-12 -->
                            </div><!-- /row -->
                        </section>
                    </section>
                                    
                                    <footer class="site-footer">
                                        <div class="text-center">
                                            2018 - <%=session.getAttribute("nom")%>
                                            <a href="PageLiv.jsp" class="go-top">
                                                <i class="fa fa-angle-up"></i>
                                            </a>
                                        </div>
                                    </footer>
        </section>
              <script src="assets/js/jquery.js"></script>
              <script src="assets/js/bootstrap.min.js"></script>
              <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
              <script src="assets/js/jquery.scrollTo.min.js"></script>
              <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>
        
    </body>
</html>
