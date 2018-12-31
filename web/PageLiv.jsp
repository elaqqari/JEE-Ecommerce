<%-- 
    Document   : PageLiv
    Created on : 26 nov. 2017, 13:33:53
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
        <title>Page d'acceuil</title>
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
                rs = st.executeQuery("select nom_liv,prenom_liv from livreur,compte where livreur.id_liv= compte.id and  compte.login='" + session.getAttribute("login") + "'");
                if(rs.next()) {
                session.setAttribute("prenom", rs.getString("prenom_liv"));
                session.setAttribute("nom", rs.getString("nom_liv"));
                 }} catch(Exception e){out.print(e);}%>
        
        <section id="container" >
        
        <%
    if ((session.getAttribute("login") == null) || (session.getAttribute("login") == "")) {
        %>
        You are not logged in<br/>
            <a href="index.jsp">Please Login</a>
        <%} else {
        %>
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
                      <div class="row mt">
                      	<div class="col-md-4 col-sm-4 mb">
                            
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5><a href="infoCom.jsp">Consulter commande</a></h5>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-6 goleft">
                                        <p><i class="fa fa-database"></i>livrer une commande</p>
                                    </div>
                                    <div class="col-sm-6 col-xs-6"></div>
                                </div>
                                <div class="centered">
                                    <a href="infoCom.jsp"><img src="assets/img/loupe.jpg" width="130"></a>
                                    
                                </div>
                            </div>
                      	</div>
                      </div>
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
    
    
    <script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Bienvenue <%=session.getAttribute("nom")%>',
            // (string | mandatory) the text inside the notification
            text: 'Veuillez livrer les commandes le plus tôt possible, faites votre travaille à la perfection et vous serez <span target="_blank" style="color:#ffd777">récompensé </span>.',
            // (string | optional) the image to display on the left
            image: 'assets/img/téléchargement.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
    
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
  

        <%
        }
        %>
    </body>
</html>
