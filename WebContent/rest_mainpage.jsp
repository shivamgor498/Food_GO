<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>FoodGo</title>
    <!-- Favicons -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
	<!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
     <link rel="stylesheet" href="../4/flatly/bootstrap.css" media="screen">
    <link rel="stylesheet" href="../_assets/css/custom.min.css">
	<!-- Stylesheet -->
    <link rel="stylesheet" type="text/css"  href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet"> 
	<title>Welcome To FoodGo !!</title>
	<style>
		header .intro-text {
		    padding-top: 150px;
		}
	</style>
</head>
<body class="bo" data-target=".navbar-fixed-top">
		<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
			response.setHeader("Expires","0");//Proxies
			response.setHeader("Pragma","no-cache");
		%>
		<!-- Navigation -->
		<nav id="menu" class="navbar navbar-default navbar-fixed-top">
		  <div class="container"> 
		    <!-- Brand and toggle get grouped for better mobile display -->  
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand " href="rest_mainpage.jsp">FoodGo</a>
		      <font color="white" size="5">WELCOME TO FOOD GO ${rname}</font><br>
		    </div>			
	<!-- navbar -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="rest_mainpage.jsp" >Home</a></li>
		        <li><a href="rest_menu_list.jsp" >View Menu</a></li>
		        <li><a href="rest_add_menu.jsp" >Add Menu</a></li>
		        <%
		        if(session.getAttribute("remail")==null)
				{		        	
				%>
					<li><a href="signin.jsp" >Sign In</a></li>
				<%		
				}
		        else
		        {
		    	%>
		          	<li><a href="Logout" >Sign Out</a></li>
		    	<%
		        }
	        	%>
	        </ul>	     
		    </div>
		  </div>
		</nav>		
		<!-- Header -->
	<header id="header">
	  <div class="intro">
	    <div class="overlay">
	      <div class="container">
	        <div class="row"><br><br><br><br><br>
	          <div class="intro-text">
	            <h1>FoodGo</h1>
	            <p>ALREADY READY!</p><br>
	        <%@page import="java.sql.*"%>
			<%@page import="com.Food.Dao.Get_connection"%>
	            <%
	            Statement statement = null;
				ResultSet resultSet = null;					
				Get_connection obj = new Get_connection();
				Connection con = obj.get();
	            String c=(String)session.getAttribute("remail");		      
		        	
		        	String sql="select rest_id from restaurant  where rest_email=\""+c+"\"";
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
					if(resultSet.next())
					{
		    	%>
		          	<a href="rest_view_current_order.jsp?c=<%=resultSet.getInt("rest_id")%>" class="btn btn-custom btn-lg page-scroll">View Current Orders</a>&emsp;&emsp;&emsp;
		          	&emsp;&emsp;&emsp;
		          	<a href="rest_view_past_order.jsp?c=<%=resultSet.getInt("rest_id")%>" class="btn btn-custom btn-lg page-scroll">View Past Orders</a>
		    	<%
					}
	        	%>
	        	</div>
	        </div>
	      </div>
	    </div>
	  </div>
	</header>
	
	<!-- About Section -->
	<div id="about">
	  <div class="container">
	    <div class="row">
	      <div class="col-xs-12 col-md-6 ">
	        <div class="about-img">
	        	<img src="images/mapp.jpg" class="img-responsive" alt="">
	        </div>
	      </div>
	      <div class="col-xs-12 col-md-6">
	        <div class="about-text"><br>
	        <center><p style="font-size: 35px">Locate your restaurant on maps<br><br> and find all other restaurants <br><br> on FoodGo as well !!  <br><br> Click on the button below to  <br><br>find restaurant on maps!!!</p>	          
	        <form  name="myform1" method="get" action="cust_mapp.jsp" ><button type="submit" class="btn btn-custom btn-lg">Find On Map</button></form></center>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>


<!-- Team Section -->
<div id="team" class="text-center">
  <div class="overlay">
    <div class="container">
      <div class="col-md-10 col-md-offset-1 section-title">
        <h2>Meet Our Team</h2>
        <hr>
      </div>
      <div id="row">
      	<div class="col-md-3 team">
          <div class="thumbnail">
            <div class="team-img"><img src="images/sahil.jpg" alt="..."></div>
            <div class="caption">
              <h3>Sahil Chimnani</h3>
              <p>sahilchimnani1212@gmail.com</p>
            </div>
          </div>
        </div>

        <div class="col-md-3 team">
          <div class="thumbnail">
            <div class="team-img"><img src="images/apoorva.jpg" alt="..."></div>
            <div class="caption">
              <h3>Apoorva Chandrakar</h3>
              <p>apoorva.chandrakar2@gmail.com</p>
            </div>
          </div>
        </div>

        <div class="col-md-3 team">
          <div class="thumbnail">
            <div class="team-img"><img src="images/abhishek.jpg" alt="..."></div>
            <div class="caption">
              <h3>Abhishek Firodiya</h3>
              <p>abhishek.firodiya@gmail.com</p>
            </div>
          </div>
        </div>

        <div class="col-md-3 team">
          <div class="thumbnail">
            <div class="team-img"><img src="images/shivam.jpg" alt="..."></div>
            <div class="caption">
              <h3>Shivam Gor</h3>
              <p>shivamgor498@gmail.com</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>

<div id="footer">
  <div class="container text-center">
    <div class="col-md-3">
      <h3>Restaurant</h3>
      <div class="contact-item">
        <a href="rest_signup_location.jsp"><p>Add your restaurant</p></a>
        <a href="signin.jsp"><p>View your Restaurant</p></a>
      </div>
    </div>
    <div class="col-md-3">
      <a href="cust_mapp.jsp"><h3>Find restaurants</h3></a>
      <div class="contact-item">
	     <div class="col-md-6">
	     </div>
	    <div class="col-md-6">
	    </div>
	    <form  name="myform1" method="get" action="cust_mapp.jsp" ><button type="submit" class="btn btn-custom btn-lg">Find On Map</button></form>

      </div>
    	</div>
    <div class="col-md-3">
      <h3>Terms & Conditions</h3>
      <div class="contact-item">
        <a href="tnc.html"><p>Terms & Conditions.</p></a>
        <a href="privacypolicy.html"><p>Privacy Policy</p></a>
      </div>
    </div>
    <div class="col-md-3">
      <h3>Contact Info</h3>
      <div class="contact-item">
        <p>Phone: 9876254123</p>
        <p>Email: foodgo199@gmail.com</p>
      </div>
    </div>
  </div>
  <div class="container-fluid text-center copyrights">
    <div class="col-md-8 col-md-offset-2">
      <div class="social">
        <ul>
          <li><a target="blank" href="https://www.facebook.com/ashura.foodgo.1"><i class="fa fa-facebook"></i></a></li>
          <li><a target="blank" href="https://twitter.com/AshuraFoodgo"><i class="fa fa-twitter"></i></a></li>
          <li><a target="blank" href="https://plus.google.com/u/1/101668962014042474177"><i class="fa fa-google-plus"></i></a></li>
          <li><a href="" ><i class="fa fa-instagram"></i></a></li>
        </ul>
      </div>
      <p>By continuing past this page, you agree to our Terms of Service, Cookie Policy, Privacy Policy and Content Policies. All trademarks are properties of their respective owners. &copy;2018 - FoodGo™ Media Pvt Ltd. All rights reserved. Designed by FoodGo Team.</p>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
	<script type="text/javascript" src="js/bootstrap.js"></script> 
	<script type="text/javascript" src="js/SmoothScroll.js"></script> 
	<script type="text/javascript" src="js/nivo-lightbox.js"></script> 
	<script type="text/javascript" src="js/jquery.isotope.js"></script>  
	<script type="text/javascript" src="js/contact_me.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>