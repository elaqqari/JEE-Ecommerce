<%-- 
    Document   : index
    Created on : 20 nov. 2017, 15:15:49
    Author     : f
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="UTF-8">
    <title>Authetification</title>
        <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

        <link href='https://fonts.googleapis.com/css?family=Raleway:300,200' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
        <link rel="stylesheet" href="login/css/style.css">

  
    </head>

<body>
    
    <form action="login.jsp" method="post">
  
    <button id="findpass"><a href="inscription.jsp">S'inscrire?</a></button>
    <div class="form">
    <div class="forceColor"></div>
    <div class="topbar">
    <div class="spanColor"></div>
    <input type="text" class="input" name="login" id="password" placeholder="login" value=""/>
    <input type="password" class="input" name="password" id="password" placeholder="Password" value=""/>
  </div>
  <button class="submit" id="submit" >Login</button>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="login/js/index.js"></script>
</form>
</body>
</html>