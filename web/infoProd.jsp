<%-- 
    Document   : infoProd
    Created on : 27 nov. 2017, 14:47:58
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
        <title>Ajouter Produit</title>
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
        
        <%try{
                                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select nom_mar from resp,compte where resp.id_resp= compte.id and compte.login='" + session.getAttribute("login") + "'");
                if(rs.next()) {%>
               
                 
    <section id="container" >
        <header class="header black-bg">
            <div class="sidebar-toggle-box">
                <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                
            </div>
            <a href="PageResp.jsp" class="logo"><b><%=session.getAttribute("type_enligne")%></b></a>
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
              
              	  <p class="centered"><a href="PageResp.jsp"><img src="assets/img/téléchargement.jpg" class="img-circle" width="60"></a></p>
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
        <%=session.getAttribute("nom_resp")%></h5>
              	  	
                  <li class="mt">
                      <a class="active" href="PageResp.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Menu</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Composants</span>
                      </a>
                      <!-- #############################################################
                      <ul class="sub">
                          <li><a  href="calendar.html">Calendrier</a></li>
                          <li><a  href="gallery.html">Galerie</a></li>
                      </ul>
                      -->
                  </li>
              </ul>
                </div>
        </aside>
         <section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Veuillez entrer les coordonnées de votre produit !</h3>
          	<div class="row mt">
                    <center>
                        <table>
                            <form action="AjouterProduit" method="post">
                                <tr>
                                    <td>Reférence produit :</td>
                                    <td><input type="number" name="ref" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Nom de produit :</td>
                                    <td><input type="text" name="nom_prod" value="" /></td>
                                </tr>
                                
                                <tr>
                                    <td>Prix de produit :</td>
                                    <td><input type="number" name="prix" value=""  step="any"/></td>
                                </tr>
                                <tr>
                                    <td>Quantité de produit :</td>
                                    <td><input type="number" name="quant" value="" /></td>
                                </tr>
                                <tr>
                                    
                                    <td>Type de produit :</td>
                                    
                                    <td>
                                        <hr>
                                        <select class="form-control" name="type_prod">
                                            <option>Electromenager</option>
                                            <option>Bureautique</option>
                                            <option>Sport et loisirs</option>
                                            <option>Jus ou limonade</option>
                                            <option>Ustensiles</option>
                                            <option>Legumes et fruits</option>
                                            <option>Biscuit</option>
                                            <option>Produit laitiers</option>
                                            <option>Soin de cheveux</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Responsable : </td>
                                    <td> <%=rs.getString("nom_mar")%></td>
                                </tr>
                               <%session.setAttribute("type_enligne", rs.getString("nom_mar"));
                               }} catch(Exception e){out.print(e);}%>        
                            <tr>
                                <td><input type="submit" value="Valider" /></td>
                                <td><input type="reset" value="Reset" /></td>
                            </tr>
                        </form>
                        </table>
                    </center>
          	</div>
			
		</section>
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2018 - <%=session.getAttribute("nom_resp")%>
              <a href="PageResp.jsp" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
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
