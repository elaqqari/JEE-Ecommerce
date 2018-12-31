<%-- 
    Document   : inscription
    Created on : 20 nov. 2017, 15:13:34
    Author     : f
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inscription</title>
            <script src="https://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

            <link href='https://fonts.googleapis.com/css?family=Raleway:300,200' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
            <link rel="stylesheet" href="login/css/style.css">

    </head>
   <body>
    <form method="post" action="registration.jsp">


    <button id="findpass"><a href="index.jsp">Connectez-vous ici !</a></button>
    <div class="form">
    <div class="forceColor"></div>
    <div class="topbar">
    <div class="spanColor"></div>
    <input type="text" class="input" name="prenom_util" id="password" placeholder="Prénom" value=""/>
    <input type="text" class="input" name="nom_util" id="password" placeholder="Nom" value=""/>
    <input type="text" class="input" name="adresse_util" id="password" placeholder="Adresse" value=""/>
    <input type="email" class="input" name="email_util" id="password" placeholder="Email" value=""/>
    <input type="text" class="input" name="num_util" id="password" placeholder="Numéro téléphone" value=""/>
    <input type="date" class="input" name="date_util" id="password" placeholder="Date de naissance(ex:1950-01-02)" value=""/>
    <input type="text" class="input" name="login" id="password" placeholder="Login" value=""/>
    <input type="password" class="input" name="password" id="password" placeholder="Password" value=""/>
    
  </div>
    <button class="submit" id="submit" >Sign up</button><br>
    
    
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="login/js/index.js"></script>
</form>
</body>

</html>