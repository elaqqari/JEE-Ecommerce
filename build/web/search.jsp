<%-- 
    Document   : search
    Created on : 8 déc. 2017, 21:53:19
    Author     : f
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultat</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="ProjetS3" />
        <script type="application/x-javascript">
            addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1);
            }
                    
        </script>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" /> 
        <script src="js/jquery-1.11.1.min.js"></script>
        <link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                });
            });
                    
        
        </script>
    </head>
    <body>
        
        

        <div class="agileits_header">
            <div class="w3l_offers">
                <a href="#">Les offres d'aujourd'hui !</a>
            </div>
            <div class="w3l_search">
                <form action="search.jsp" method="post">
                    <input type="text" name="produit" value="Search a product..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search a product...';}" required="">
                    <input type="submit" value=" ">
                </form>
            </div>
            
            <div class="product_list_header">
                <form action="ShoppingCart.jsp" method="post" class="last">
                    
                        <input type="submit" name="submit" value="Voir votre carte" class="button" />
                    
                </form>
            </div>
            <div class="w3l_header_right">
                <ul>
				<li class="dropdown profile_details_drop">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
							<ul class="dropdown-menu drp-mnu">
								<li><a href="logout.jsp">Logout</a></li> 
								
							</ul>
						</div>                  
					</div>	
				</li>
			</ul>
		</div>
            <div class="w3l_header_right1">
                <h2><a href="mail.html">Contact Us</a></h2>
            </div>
            <div class="clearfix">
                
            </div>
                
        </div>
        <script>
            $(document).ready(function() {
                var navoffeset=$(".agileits_header").offset().top;
                $(window).scroll(function(){
                    var scrollpos=$(window).scrollTop();
                    if(scrollpos >=navoffeset){
                        $(".agileits_header").addClass("fixed");
                    }else{
                        $(".agileits_header").removeClass("fixed");
                    }
                });
            });
	</script>
        <div class="logo_products">
            <div class="container">
                <div class="w3ls_logo_products_left">
                    <h1><a href="PageUtil.jsp"><span>Easy</span> Buying</a></h1>
                </div>
                <div class="w3ls_logo_products_left1">
                    <ul class="special_items">
                        <li><a href="#">Events</a><i>/</i></li>
                        <li><a href="#">About Us</a><i>/</i></li>
                        <li><a href="#">Best Deals</a><i>/</i></li>
                        <li><a href="#">Services</a></li>
                    </ul>
                </div>
                <div class="w3ls_logo_products_left1">
                    <ul class="phone_email">
                        <li><i class="fa fa-phone" aria-hidden="true"></i>(+0123) 234 567</li>
                        <li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">easy@buying.com</a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div><br><center>
                    <%
    if ((session.getAttribute("login") == null) || (session.getAttribute("login") == "")) {
        response.sendRedirect("index.jsp");
        %>
        
        <%} else {
        %>
        <h1>
        <jsp:useBean id="cal" class="org.projet.jstl.Calendrier"/>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:set var="heure" value="${cal.heure}" scope="request"/>
        <c:choose>
        <c:when test="${heure>=6 && heure<18}">
            Bonjour 
        </c:when>
        <c:otherwise>Bonsoir </c:otherwise>
        </c:choose>
        
        <%=session.getAttribute("nom_enligne")%> <%=session.getAttribute("prenom_enligne")%></h1>
        <%
        }
        %></center>
            </div>
                
        </div>
            <div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="PageUtil.jsp">Menu</a><span>|</span></li>
				<li>Resultat</li>
			</ul>
		</div>
	</div>
        
        
        <div class="banner">
            <div class="w3l_banner_nav_left">
                <nav class="navbar nav_bottom">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav nav_1">
                            <li><a href="products.html">Electroménager</a></li>
                            <li><a href="household.html">Bureautique</a></li>
                            <li class="dropdown mega-dropdown active">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Légumes et fruits<span class="caret"></span></a>
                                <div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
                                    <div class="w3ls_vegetables">
                                        <ul>
                                            <li><a href="vegetables.html">Légumes</a></li>
                                            <li><a href="vegetables.html">Fruits</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li><a href="kitchen.html">Cuisine</a></li>
                            <li><a href="short-codes.html">Biscuit</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Boisson<span class="caret"></span></a>
                                <div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
                                    <div class="w3ls_vegetables">
                                        <ul>
                                            <li>Limonade</li>
                                            <li>Jus</li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li><a href="pet.html">Produit laitiers</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sport et loisirs<span class="caret"></span></a>
                                <div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
                                    <div class="w3ls_vegetables">
                                        <ul>
                                            <li><a href="frozen.html">Frozen Snacks</a></li>
                                            <li><a href="frozen.html">Frozen Nonveg</a></li>
                                        </ul>
                                    </div>                  
                                </div>	
                            </li>
                            <li><a href="bread.html">Images et son</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>
            </div>
            <div class="w3l_banner_nav_right">
                <div class="privacy about">
                    <h3>Res<span>ultat</span></h3>
                        <div class="checkout-right">
                            <h4>Le Resultat de votre recherche est: </h4>
				
        
        <table class="timetable_sub">
            
                <thead>
                    <tr>
                    <tr align="center">
                    <th width="20%">Nom Produit</th>
                    <th width="20%">Prix</th>
                    <th width="20%">Quantité</th>
                    <th width="20%">Supermarché</th>
                    <th width="20%">Valider</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="rem1">
                <%try{
                String nom=request.getParameter("produit");
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select stock.ref_prod,prix,nom_prod,nom_mar,quant from stock,produit where stock.ref_prod=produit.ref_prod and prix =(select min(prix) from stock,produit where stock.ref_prod=produit.ref_prod and nom_prod='"+nom+"') and nom_prod='"+nom+"' ;");
                while(rs.next()){
                
                %>
                    <form name="<%= rs.getString("ref_prod")%>" action="CartController" method="post">
                        <input type="hidden" name="ref" value="<%= rs.getString("ref_prod")%>">
                    <td><%= rs.getString("nom_prod")%><input type="hidden" name="description" value="<%= rs.getString("nom_prod")%>"></td>
                    <td><%= rs.getFloat("prix")%><input type="hidden" name="price" value="<%= rs.getFloat("prix")%>"></td>
                    <td><input type="text" size="2" value="1" name="quantity"></td>
                            
                    
                    <td><%= rs.getString("nom_mar")%><input type="hidden" name="modelNo" value="<%= rs.getString("nom_mar")%>"></td>
                    <input type="hidden" name="action" value="add">
                    <td><button class="btn btn-success btn-xs" type="submit" name="addToCart" ><i class="fa fa-check " ></i></button></td>
                    </tr>
                     </form>
                    <%}%>
           
        <% } catch(Exception e){out.print(e);}%>
        </table>
        <!-- } catch(Exception e){out.print(e);} -->
        <div class="clearfix"></div>
            
        
                        </div>

                </div>
                
        <div class="col-md-4 checkout-left-basket">
            <h4>Continue au panier</h4>
            <ul>
                <jsp:useBean id="cart" scope="session" class="org.projet.beans.CartBean" />
                <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                <c:if test="${cart.lineItemCount==0}">
                <tr>
                    <td colspan="4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">- Le panier est actuellement vide -<br/>
                </tr>
                </c:if>
                <c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">
                    <li><c:out value="${cartItem.modelDescription}"/><i>-</i>    x <c:out value="${cartItem.quantity}"/> <i>-</i>        <span><c:out value="${cartItem.totalCost}"/> DH</span></li>
                </c:forEach>
                    <li>Total <i>-</i> <span><c:out value="${cart.orderTotal}"/> DH</span></li>
            </ul>
        </div>
                
            </div>
        <div class="clearfix"></div>
        </div>
                <div class="footer">
		<div class="container">
                    <div class="clearfix"> </div>
			<div class="agile_footer_grids">
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
					<div class="w3_footer_grid_bottom">
						<h4>Paiements sécurisés 100%</h4>
						<img src="images/card.png" alt=" " class="img-responsive" />
					</div>
				</div>
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
					<div class="w3_footer_grid_bottom">
						<h5>Connectez-vous avec nous</h5>
						<ul class="agileits_social_icons">
							<li><a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="google"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
							<li><a href="#" class="instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#" class="dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="wthree_footer_copy">
				<p>© 2018 Easy Buying</p>
			</div>
		</div>
	</div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <script src="js/jquery-1.11.1.min.js"></script>
									<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									</script>
								<!--quantity-->
							<script>$(document).ready(function(c) {
								$('.close1').on('click', function(c){
									$('.rem1').fadeOut('slow', function(c){
										$('.rem1').remove();
									});
									});	  
								});
						   </script>
							<script>$(document).ready(function(c) {
								$('.close2').on('click', function(c){
									$('.rem2').fadeOut('slow', function(c){
										$('.rem2').remove();
									});
									});	  
								});
						   </script>
						  	<script>$(document).ready(function(c) {
								$('.close3').on('click', function(c){
									$('.rem3').fadeOut('slow', function(c){
										$('.rem3').remove();
									});
									});	  
								});
						   </script>

<!-- //js -->
<!-- script-for sticky-nav -->
	<script>
	$(document).ready(function() {
		 var navoffeset=$(".agileits_header").offset().top;
		 $(window).scroll(function(){
			var scrollpos=$(window).scrollTop(); 
			if(scrollpos >=navoffeset){
				$(".agileits_header").addClass("fixed");
			}else{
				$(".agileits_header").removeClass("fixed");
			}
		 });
		 
	});
	</script>
<!-- //script-for sticky-nav -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.js"></script>
<script>
		paypal.minicart.render();

		paypal.minicart.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});

	</script>
        
    </body>
</html>
