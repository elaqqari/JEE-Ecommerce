<%-- 
    Document   : PageUtil
    Created on : 17 janv. 2018, 21:31:23
    Author     : f
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Page d'acceuil</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript">
            addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1);
            }
                    
        </script>
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
        
        
        <%try{
                                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select nom_util,prenom_util,id_util from utilisateur,compte where utilisateur.id_util= compte.id and  compte.login='" + session.getAttribute("login") + "'");
                if(rs.next()) {
                    session.setAttribute("id_user", rs.getInt("id_util"));
                session.setAttribute("nom_enligne", rs.getString("nom_util"));
                session.setAttribute("prenom_enligne", rs.getString("prenom_util"));
                 }} catch(Exception e){out.print(e);}%>
        
        
        
        
        
        
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
                <section class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <div class="w3l_banner_nav_right_banner">
                                    <h3>Faites votre <span>nourriture</span> avec épicé.</h3>
                                    <div class="more">
                                        <a href="produits.jsp" class="button--saqui button--round-l button--text-thick" data-text="Achetez maintenant">Achetez maintenant</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="w3l_banner_nav_right_banner1">
                                    <h3>Faites votre <span>nourriture</span> avec épicé.</h3>
                                    <div class="more">
                                        <a href="produits.jsp" class="button--saqui button--round-l button--text-thick" data-text="Achetez maintenant">Achetez maintenant</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="w3l_banner_nav_right_banner2">
                                    <h3>Réduction<i>50%</i> </h3>
                                    <div class="more">
                                        <a href="produits.jsp" class="button--saqui button--round-l button--text-thick" data-text="Achetez maintenant">Achetez maintenant</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
                <!-- flexSlider -->
                <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
                <script defer src="js/jquery.flexslider.js"></script>
                <script type="text/javascript">
                    $(window).load(function(){
                        $('.flexslider').flexslider({
                            animation: "slide",
                            start: function(slider){
                                $('body').removeClass('loading');
                            }
                        });
                    });
                                    
                </script>
                <!-- //flexSlider -->
            </div>
            <div class="clearfix"></div>
                
        </div>
            <div class="banner_bottom">
                <div class="wthree_banner_bottom_left_grid_sub">
                </div>
                <div class="wthree_banner_bottom_left_grid_sub1">
                    
                    <<div class="col-md-9 w3l_fresh_vegetables_grid_right">
					<div class="col-md-4 w3l_fresh_vegetables_grid">
						<div class="w3l_fresh_vegetables_grid1">
							<img src="images/8.jpg" alt=" " class="img-responsive" />
						</div>
					</div>
					<div class="col-md-4 w3l_fresh_vegetables_grid">
						<div class="w3l_fresh_vegetables_grid1">
							<div class="w3l_fresh_vegetables_grid1_rel">
								<img src="images/7.jpg" alt=" " class="img-responsive" />
								<div class="w3l_fresh_vegetables_grid1_rel_pos">
									<div class="more m1">
										<a href="products.html" class="button--saqui button--round-l button--text-thick" data-text="Shop now">Shop now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="w3l_fresh_vegetables_grid1_bottom">
							<img src="images/10.jpg" alt=" " class="img-responsive" />
							<div class="w3l_fresh_vegetables_grid1_bottom_pos">
								<h5>Special Offers</h5>
							</div>
						</div>
					</div>
					<div class="col-md-4 w3l_fresh_vegetables_grid">
						<div class="w3l_fresh_vegetables_grid1">
							<img src="images/9.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="w3l_fresh_vegetables_grid1_bottom">
							<img src="images/11.jpg" alt=" " class="img-responsive" />
						</div>
					</div>
					<div class="clearfix"> </div>
					<div class="agileinfo_move_text">
						
						<div class="agileinfo_breaking_news">
							<span> </span>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
                    
                    <div class="clearfix"> </div>
                        
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="top-brands">
                <div class="container">
                    <h3>Suggestion exclusif</h3>
                    <div class="agile_top_brands_grids">
                        <%try{
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
                Statement st = conn.createStatement();
                Statement st1 = conn.createStatement();
                ResultSet rs,rs1;
                rs = st.executeQuery("select stock.ref_prod,min(prix),nom_prod,stock.nom_mar,quant,max(prix) from produit,stock,resp where stock.ref_prod=produit.ref_prod and stock.nom_mar= resp.nom_mar group by nom_prod order by RAND()");
                while(rs.next()){
                    if(rs.getFloat("min(prix)")!=rs.getFloat("max(prix)")){
                        rs1=st1.executeQuery("select stock.ref_prod,prix,nom_prod,stock.nom_mar,quant from stock,produit,resp where stock.ref_prod=produit.ref_prod and stock.nom_mar= resp.nom_mar and prix =(select min(prix) from stock,produit where stock.ref_prod=produit.ref_prod and nom_prod='"+rs.getString("nom_prod")+"' )");
                        if(rs1.next()){
                %>
                
                        <div class="col-md-3 top_brand_left">
                            <div class="hover14 column">
                                <div class="agile_top_brand_left_grid">
                                    <div class="tag"><img src="images/tag.png" alt=" " class="img-responsive" /></div>
                                    <div class="agile_top_brand_left_grid1">
                                        <figure>
                                            <div class="snipcart-item block" >
                                                <div class="snipcart-thumb">
                                                    <a href="#"><img title=" " alt=" " src="images/images.png" /></a>
                                                    <p><%=rs.getString("nom_prod")%></p>
                                                    <h4><%=rs.getFloat("min(prix)")%> DH<span><%=rs.getFloat("max(prix)")%> DH</span></h4>
                                                </div>
                                                <div class="snipcart-details top_brand_home_details">
                                                    <form name="<%= rs.getString("stock.ref_prod")%>" action="CartController" method="post">
                                                        <input type="hidden" name="ref" value="<%= rs.getString("stock.ref_prod")%>"/>
                                                        <td><input type="hidden" name="description" value="<%= rs.getString("nom_prod")%>"></td>
                                                        <td><input type="hidden" name="price" value="<%= rs.getFloat("min(prix)")%>"></td>
                                                        <td><input type="hidden" value="1" name="quantity"></td>
                                                        <td><input type="hidden" name="modelNo" value="<%= rs.getString("nom_mar")%>"></td>
                                                        <input type="hidden" name="action" value="add">
                                                        <input type="submit" name="addToCart" value="Ajouter" class="button" />
                                                    </form>
                                                    
									
                                                </div>
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </div>
                <%}}}} catch(Exception e){out.print(e);}%>
				
				
				<div class="clearfix"> </div>
			</div>
		</div>
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
