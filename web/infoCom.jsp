<%-- 
    Document   : infoCom
    Created on : 26 janv. 2018, 15:29:28
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
        <title>Liste des commandes</title>
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
        <section id="main-content">
          <section class="wrapper">
              <div class="row">
                  
                  <div class="col-lg-9 main-chart">
                      <%try{
                                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select nom_util,prenom_util,date_com,id_com,total,adresse_util from utilisateur,commande where utilisateur.id_util=commande.id_util");
                while(rs.next()) {%>
                  <div class="col-md-4 mb">
                      <div class="white-panel pn">
                          <div class="white-header">
                              <form action="CommUtil.jsp">
                                  <font color="Blue" size="2">
                                  <input type="hidden" name="adresse" value="<%=rs.getString("adresse_util")%>" />
                                  <h5>Commande N°<%=rs.getString("id_com")%> <input name="id" type="hidden" value="<%=rs.getString("id_com")%>"/></h5>
                          </div>
                          <p><img src="assets/img/friends/fr-05.jpg" class="img-circle" width="80"></p>
                          <p><b><%=rs.getString("nom_util")%> <%=rs.getString("prenom_util")%> <input type="hidden" name="nom" value="<%=rs.getString("nom_util")%>"/>  <input type="hidden" name="prenom" value="<%=rs.getString("prenom_util")%>"/></b></p>
                          <div class="row">
                              <div class="col-md-6">
                                  <p class="small mt">Date</p>
                                  <p><%=rs.getString("date_com")%> <input type="hidden" name="date" value="<%=rs.getString("date_com")%>" /></p>
                              </div>
                              <div class="col-md-6">
                                  <p class="small mt">Total</p>
                                  <p><%=rs.getFloat("total")%> DH  <input type="hidden" name="total" value="<%=rs.getFloat("total")%>" /></p>
                              </div>
                              <input type="submit" value="Consulter" /></font>
                          </div>
                      </div>
                              </form>
                              
                      
                  </div>
                              <%}}catch(Exception e){System.out.print(e);}%>
                  </div>
                              
                  <div class="col-lg-3 ds">
                   
                    <h3>NOTIFICATIONS</h3>
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p><muted>2 Minutes Ago</muted><br/>
                            <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                        </p>
                        </div>
                    </div>
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p><muted>3 Hours Ago</muted><br/>
                            <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                        </p>
                        </div>
                    </div>
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p><muted>7 Hours Ago</muted><br/>
                            <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                        </p>
                        </div>
                    </div>
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p><muted>11 Hours Ago</muted><br/>
                            <a href="#">Mark Twain</a> commented your post.<br/>
                        </p>
                        </div>
                    </div>
                    
                     
                    
                    <div id="calendar" class="mb">
                        <div class="panel green-panel no-margin">
                            <div class="panel-body">
                                <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title" style="disadding: none;"></h3>
                                    <div id="date-popover-content" class="popover-content"></div>
                                        
                                </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->
                      
                  </div><!-- /col-lg-3 -->
              </div>
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
      <!--footer end-->
  </section>
        
                  
                  
                  
                  
                  
                  
                  
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>
    <script src="assets/js/zabuto_calendar.js"></script>
    
    
    
    
    <script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                }
                
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
    </body>
</html>