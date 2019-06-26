<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.right
{ float : right}
</style>
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
    <link rel="stylesheet" type="text/css"  href="css/cust_rest.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet"> 
	<title>Welcome To FoodGo !!</title>
</head>
<body class="bo" data-target=".navbar-fixed-top">

		<!-- Navigation -->
		<nav id="menu" class="navbar navbar-default navbar-fixed-top" style="background-color: #262626;">
		  <div class="container"> 
		    <!-- Brand and toggle get grouped for better mobile display -->  
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand " href="cust_mainpage.jsp">FoodGo</a>
		      <font color="white" size="5">WELCOME TO FOOD GO <span style="color: #8eb640;font-size: 35px">${cname}</span></font><br>
		    </div>	
	<!-- navbar -->
		     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="cust_mainpage.jsp#about" >Find on Map</a></li>
		        <li><a href="cust_mainpage.jsp#restaurants" >Restaurants</a></li>
		        <li><a href="cust_mainpage.jsp#portfolio" >Filters</a></li>
		        <li><a href="cust_mainpage.jsp#team" >team</a></li>
		        <%
		        if(session.getAttribute("cemail")==null)
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
		    </div>
		  </div>
		</nav>		
		<!-- Header -->
	<header id="header">
	  <div class="intro">
	    <div class="overlay">
	      <div class="container">
	        <div class="row"><br><br><br><br><br>
		
	<br><br>
	 <h2> <font color="black">RESTAURANTS</font></h2>	<hr>
	  <!-- <div class="row">	 --> 
	  		<%@page import="java.sql.*"%>
			<%@page import="com.Food.Dao.Get_connection"%>
			<%
					int i=2;
					Statement statement = null;
					ResultSet resultSet = null;
			
					Get_connection obj = new Get_connection();
					Connection con = obj.get();
			try
			{						
				String sql="select * from restaurant r,rest_image r1 where r.rest_id=r1.rest_id";
				statement=con.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					if((i%2)==0){
			%>
						<div class="container">
							<div class="row">
							<b>
								<div class="col-xs-12 col-md-6">
									<div class="menu-item-name"><font color="black"size="6"><a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><%=resultSet.getString(2)%></a></font></div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_addr") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_phno") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_open") %>-<%=resultSet.getString("rest_close") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_pricet") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_rating") %></font> </div>
								</div></b>
								<div class="col-xs-12 col-md-6 ">
									<a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><img src="${pageContext.request.contextPath}/rest_images/<%=resultSet.getString("rest_id")%>" class="img-responsive" height="700px" width="450px" alt="Project Title"></a>
								</div>
							</div>
						</div>
			<% 
			}else{//if close else start
			%>			
					<div id="about">		
						<div class="container">
							<div class="row">
								<div class="col-xs-12 col-md-6 ">
									<a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><img src="${pageContext.request.contextPath}/rest_images/<%=resultSet.getString("rest_id")%>" class="img-responsive" height="800px" width="380px"  alt="Project Title"></a>
								</div>
								
							    <div class="col-xs-12 col-md-6"><b><div class="right">
									<div class="menu-item-name"><font color="black"size="6"><a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><%=resultSet.getString(2)%></a></font></div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_addr") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_phno") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_open") %>-<%=resultSet.getString("rest_close") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_pricet") %></font> </div>
									<div class="menu-item-description"><font color="black"size="4"><%=resultSet.getString("rest_rating") %></font> </div>
								</div></b> 
								</div></div>
							</div>	
						</div>			
				<% }//else closed
				i++;
			    }//outer while
		} catch (Exception e) {
			e.printStackTrace();
		}
			%>
	     
		 </div>
		</div>
	   </div>
	  </div>	  
	</header>
	<br><br><br><br><br><br><br><br>		
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
	<!-- <script type="text/javascript" src="js/bootstrap.js"></script>  -->
	<script type="text/javascript" src="js/SmoothScroll.js"></script> 
	<script type="text/javascript" src="js/nivo-lightbox.js"></script> 
	<script type="text/javascript" src="js/jquery.isotope.js"></script> 
	<script type="text/javascript" src="js/contact_me.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>