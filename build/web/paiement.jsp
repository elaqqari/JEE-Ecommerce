<%-- 
    Document   : paiement
    Created on : 27 janv. 2018, 17:47:17
    Author     : f
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Paiement</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="ProjetS3" />
        <script type="application/x-javascript">
            addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1);
            }
                    
        </script>
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>
        
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
				<li>Panier</li>
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
<!-- payment -->
		<div class="privacy about">
                    <h3>Paie<span>ment</span></h3>
                    <div class="checkout-right">
                        <div id="parentHorizontalTab">
                            <ul class="resp-tabs-list hor_1">
                                <li>Crédit/débit</li>
                                <li>Compte Paypal</li>
                            </ul>
                            <div class="resp-tabs-container hor_1">
                                <div>
                                    <form action="#" method="post" class="creditly-card-form agileinfo_form">
                                        <section class="creditly-wrapper wthree, w3_agileits_wrapper">
                                            <div class="credit-card-wrapper">
                                                <div class="first-row form-group">
                                                    <div class="controls">
                                                        <label class="control-label">Nom sur carte</label>
                                                        <input class="billing-address-name form-control" type="text" name="name" placeholder="Amine Saad">
                                                    </div>
                                                    <div class="w3_agileits_card_number_grids">
                                                        <div class="w3_agileits_card_number_grid_left">
                                                            <div class="controls">
                                                                <label class="control-label">Numéro de carte</label>
                                                                <input class="number credit-card-number form-control" type="text" name="number"
                                                                       inputmode="numeric" autocomplete="cc-number" autocompletetype="cc-number" x-autocompletetype="cc-number"
                                                                       placeholder="&#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149;">
                                                            </div>
                                                        </div>
                                                        <div class="w3_agileits_card_number_grid_right">
                                                            <div class="controls">
                                                                <label class="control-label">CVV</label>
                                                                <input class="security-code form-control"Â·
                                                                       inputmode="numeric"
                                                                       type="text" name="security-code"
                                                                       placeholder="&#149;&#149;&#149;">
                                                            </div>
                                                        </div>
                                                        <div class="clear"> </div>
                                                    </div>
                                                    <div class="controls">
                                                        <label class="control-label">Expiration Date</label>
                                                        <input class="expiration-month-and-year form-control" type="text" name="expiration-month-and-year" placeholder="MM / YY">
                                                    </div>
                                                </div>
                                                <button class="submit"><span>Effectuer un paiement </span></button>
                                            </div>
                                        </section>
                                    </form>

                                </div>
                                
                                <div>
                                    <div id="tab4" class="tab-grid" style="display: block;">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img class="pp-img" src="images/paypal.png" alt="Image Alternative text" title="Image Title">
                            
                                                <p>Important: Vous serez redirigé vers le site Web de PayPal pour effectuer votre paiement en toute sécurité.</p><a class="btn btn-primary">Commander via Paypal</a>	
                                            </div>
                                            <div class="col-md-6">
                                                <form class="cc-form">
                                                    <div class="clearfix">
                                                        <div class="form-group form-group-cc-number">
                                                            <label>Numéro de carte</label>
                                                            <input class="form-control" placeholder="xxxx xxxx xxxx xxxx" type="text"><span class="cc-card-icon"></span>
                                                        </div>
                                                        <div class="form-group form-group-cc-cvc">
                                                            <label>CVV</label>
                                                            <input class="form-control" placeholder="xxxx" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                        <div class="form-group form-group-cc-name">
                                                            <label>Nom du titulaire</label>
                                                            <input class="form-control" type="text">
                                                        </div>
                                                        <div class="form-group form-group-cc-date">
                                                            <label>Valide jusqu'au</label>
                                                            <input class="form-control" placeholder="MM / YY" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="checkbox checkbox-small">
                                                        <label>
                                                            <input class="i-check" type="checkbox" checked="">Ajouter à mes cartes</label>
                                                    </div>
                                                    <input class="btn btn-primary submit" type="submit" class="submit" value="Procéder au paiement">
                                                </form>
                                            </div>
                                        </div>
                        
                                    </div>
                                </div>
                            </div>
                        </div>
	
	<!--Plug-in Initialisation-->

	<!-- // Pay -->
	
                    </div>

                </div>
<!-- //payment -->
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
<!-- easy-responsive-tabs -->    
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<script src="js/easyResponsiveTabs.js"></script>
<!-- //easy-responsive-tabs --> 
	<script type="text/javascript">
    $(document).ready(function() {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
<!-- credit-card -->
		<script type="text/javascript" src="js/creditly.js"></script>
        <link rel="stylesheet" href="css/creditly.css" type="text/css" media="all" />

		<script type="text/javascript">
			$(function() {
			  var creditly = Creditly.initialize(
				  '.creditly-wrapper .expiration-month-and-year',
				  '.creditly-wrapper .credit-card-number',
				  '.creditly-wrapper .security-code',
				  '.creditly-wrapper .card-type');

			  $(".creditly-card-form .submit").click(function(e) {
				e.preventDefault();
				var output = creditly.validate();
				if (output) {
				  // Your validated credit card output
				  console.log(output);
				}
			  });
			});
		</script>
	<!-- //credit-card -->

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
