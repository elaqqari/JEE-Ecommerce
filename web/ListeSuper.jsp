<%-- 
    Document   : ListResp
    Created on : 1 déc. 2017, 19:23:22
    Author     : f
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Liste des responsables</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="bootstrap-4-material-admin/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="bootstrap-4-material-admin/css/fontastic.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="bootstrap-4-material-admin/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="bootstrap-4-material-admin/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="bootstrap-4-material-admin/css/custom.css">
    <!-- Favicon-->
    
    </head>
    <body>
        
        
        <div class="page home-page">
      <!-- Main Navbar-->
      <header class="header">
        <nav class="navbar">
          <!-- Search Box-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="admin.jsp" class="navbar-brand">
                  <div class="brand-text brand-big"><span>Page</span><strong> Administrateur</strong></div>
                  <div class="brand-text brand-small"><strong>AD</strong></div></a>
                  
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                
                
               
                <!-- Logout    -->
                <li class="nav-item"><a href="logout.jsp" class="nav-link logout">Logout<i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="bootstrap-4-material-admin/img/téléchargement.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">
              <h1 class="h4">Administrateur</h1>
              <p>Gérant</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
            <li class="active"> <a href="admin.jsp"><i class="icon-home"></i>Home</a></li>
            <li><a href="#dashvariants" aria-expanded="false" data-toggle="collapse"> <i class="icon-grid"></i> Les Tables</a>
              <ul id="dashvariants" class="collapse list-unstyled">
                <li><a href="ListeSuper.jsp">Supermarchés</a></li>
                <li><a href="ListResp.jsp">Responsables</a></li>
                <li><a href="inter2.jsp">Utilisateurs</a></li>
                <li><a href="ListLiv.jsp">Livreurs</a></li>
              </ul>
            </li>
            <li> <a href="inter4.jsp"> <i class="icon-interface-windows"></i>Gérer les supermarchées</a></li>
            <li> <a href="inter1.jsp"> <i class="icon-interface-windows"></i>Gérer les responsables </a></li>
            <li> <a href="inter3.jsp"> <i class="fa fa-bar-chart"></i>Gérer les Livreurs </a></li>
            <li> <a href="inter5.jsp"> <i class="icon-padnote"></i>Consulter les commandes </a></li>
            
          </ul><!--<span class="heading">Extras</span>-->
          <!--
          <ul class="list-unstyled">	
            <li> <a href="#"> <i class="icon-flask"></i>Demo </a></li>
            <li> <a href="#"> <i class="icon-screen"></i>Demo </a></li>
            <li> <a href="#"> <i class="icon-mail"></i>Demo </a></li>
            <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
          </ul>
      -->
        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Tables</h2>
            </div>
          </header>
        <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
              <li class="breadcrumb-item active">Tables</li>
            </ul>
        </div>
          
          <section class="tables">
        <div class="col-lg-6">
                  <div class="card">
                    <div class="card-close">
                      <div class="dropdown">
                        <button type="button" id="closeCard4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard4" class="dropdown-menu dropdown-menu-right has-shadow"><a href="admin.jsp" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a></div>
                      </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Liste des supermarchés</h3>
                    </div>
                    <div class="card-body">
                      <table class="table table-striped table-sm">
                        <thead>
                          <tr>
                          <tr align="center">
                            
                            <th width="15%">Nom</th>
                            <th width="65%">Adresse</th>
                            <th width="10%">Numéro fixe</th>
                           
                          </tr>
                        </thead>
                        <tbody>
                            <%
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement stmt=conn.createStatement();
                String sql="select* from marche";
                ResultSet rs= stmt.executeQuery(sql);
                
                
                while(rs.next()){
        
        
        %>
                    <tr align="center">
                    
                    <td><%= rs.getString("nom_mar")%></td>
                    <td><%= rs.getString("adresse")%></td>
                    <td><%= rs.getString("num_mar")%></td>
                    
                    </tr>
        <%}%>
        <%} catch(Exception e){out.print(e);}%>
                            
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
      </section>
        <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>ProjetS3 &copy; 2017-2018</p>
                </div>
                <div class="col-sm-6 text-right">
                  <p>Design by <a href="https://bootstrapious.com/admin-templates" class="external">EL AQQARI Ilyas</a></p>
                  <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                </div>
              </div>
            </div>
          </footer>
    </div>
        
          
          
          
        
        
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="bootstrap-4-material-admin/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="bootstrap-4-material-admin/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap-4-material-admin/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="bootstrap-4-material-admin/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="bootstrap-4-material-admin/js/charts-home.js"></script>
    <script src="bootstrap-4-material-admin/js/front.js"></script>
    </body>
</html>
