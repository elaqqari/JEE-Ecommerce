<%-- 
    Document   : infoResp
    Created on : 25 nov. 2017, 14:38:11
    Author     : f
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inscription Supermarché</title>
            <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

            <link href='https://fonts.googleapis.com/css?family=Raleway:300,200' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
            <link rel="stylesheet" href="login/css/style.css">

    </head>
    <body>
    <form method="post" action="AddSuper.jsp">


    <div class="form">
    <div class="forceColor"></div>
    <div class="topbar">
    <div class="spanColor"></div>
    <input type="text" class="input" name="nom_mar" id="password" placeholder="Nom du supermarché" value=""/>
    <input type="text" class="input" name="adresse" id="password" placeholder="Adresse" value=""/>
    <input type="text" class="input" name="num_mar" id="password" placeholder="Numéro fixe du supermarché" value=""/>
    
    
  </div>
    <button class="submit" id="submit" >Sign up</button><br>
    
    
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="login/js/index.js"></script>
</form>
</body>
</html>
