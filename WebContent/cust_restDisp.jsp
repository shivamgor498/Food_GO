<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FoodGo</title>
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css"  href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">
<style>
		a.fa-globe
		{
		  position: relative;
		  font-size: 2em;
		  color: grey;
		  cursor: pointer;
		}
		span.num {
		  position: absolute;
		  font-size: 0.3em;
		  top: 1px;
		  color: #fff;
		  right: 2px;
		}
		*.icon-colour {color: Green}
		i {   
		    width:100px;
		    text-align:center;
		    vertical-align:middle;
		}
		.badge{
		    background: #FA3B3B;
		    width: 20px;
		    height: 30px;
		    margin: 0;
		    border-radius: 90%;
		    position:relative;
		    top:-34px;
		    right:6px;
		    padding:5px;
		}
		header .intro-text {
		    padding-top: 150px;
		}
		input {
			text-align: center;
		}
		
		<%	
			Statement statement = null;
			ResultSet resultSet = null;
			String s,sql;
			Get_connection obj = new Get_connection();
			Connection con = obj.get();
			String rest_id=request.getParameter("rest_id");
			try
			{	
				sql="select * from rest_image  where rest_id="+rest_id;
				statement=con.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){				
			%>		
			.intro{	
			display: table;
			width: 100%;
			padding: 0;
			background: url("${pageContext.request.contextPath}/rest_images/<%=resultSet.getString("rest_id")%>") no-repeat fixed;
			background-color: #e5e5e5;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			background-size: cover;
			-o-background-size: cover;									    	
			}
			<% 
			    }//outer while
		} catch (Exception e) {
			e.printStackTrace();
		}	%>
	</style>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
		<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
			response.setHeader("Expires","0");//Proxies
			response.setHeader("Pragma","no-cache");
			
		
			if(session.getAttribute("cemail")==null)
			{
				/* response.sendRedirect("signin.jsp"); */
				int item_count=0;
				HttpSession session1 = request.getSession();
				session1.setAttribute("item_count", item_count);
			}
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
		      <a class="navbar-brand " href="cust_mainpage.jsp">FoodGo</a>
		      <font color="white" size="5">WELCOME TO FOOD GO ${cname}</font><br>
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
			<%@page import="java.sql.*"%>
			<%@page import="com.Food.Dao.Get_connection"%>
			<%
				
				HttpSession session1=request.getSession();
				int item_count=(int)session1.getAttribute("item_count");
				session.setAttribute("check", "1");
			%>
<!-- Header -->
<header id="header">
  <div class="intro">
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="intro-text">			
			<%	
				try
				{					
					sql="select * from restaurant where rest_id="+rest_id;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
					if(resultSet.next())
					{
			%>
            <h1><%=resultSet.getString("rest_name")%></h1>
			<% 
					}
				} 
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			%>
            <p>A healthy outside starts from the inside.</p>


					<a href="#restaurant-menu" class="btn btn-custom page-scroll" id="scroll">Menu</a><br>
            <% 
            if(request.getParameter("menu")!=null) { %>
				<script type="text/javascript">
					window.location=document.getElementById('scroll').href;
				</script>
            <% } %>
            <a href="cust_search_rest.jsp" class="btn btn-custom">Choose a different restaurant</a>
            
           </div>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- Restaurant Menu Section -->


<div id="restaurant-menu">
</div>

<br><br><br>
			<%
			if(request.getParameter("menu")!=null) { %>
			<br><br> 
			<% } %>
	  <div class="container">
	 	<center>
	 	 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
		<a href="cust_viewCart.jsp?rest_id=<%=rest_id%>" class="fa fa-shopping-cart fa-3x icon-colour"><span class="badge"><%=item_count %></span>
		</a>
		</center>
	    <div class="row">
	    <%
				try
				{
                    sql="select * from menu where (lower(item_type)  like \"%starter%\") and  rest_id="+rest_id;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
		%>
	      <div class="col-xs-12 col-md-6">
	     <div class="menu-section">
	     <center><h2 class="menu-section-title">Starter</h2>
	    	<hr></center>
			<%
					while(resultSet.next()){
			%>
						<b><br><form method="post" action="Cart">
							<input type="hidden" name="item_id" value="<%=resultSet.getString("item_id") %>">
							<input type="hidden" name="rest_id" value="<%=resultSet.getString("rest_id") %>">
						 	<div class="col-xs-12 col-md-3"><%=resultSet.getString("item_name")%></div>
				            <div class="col-xs-12 col-md-3"><%=resultSet.getString("item_price")%></div>
						<%
							ResultSet items_present = null;
							String sql1="select cart_ord_qty from cart where item_id="+resultSet.getString("item_id");
							statement=con.createStatement();
							items_present = statement.executeQuery(sql1);
							if(items_present.next())
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="<%=items_present.getString("cart_ord_qty")%>" name="quantity"></div>
						<%
							}//end if
							else
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" size="2" value="0" name="quantity" max="10" min="1"></div>
						<%	} %>
							<div class="col-xs-12 col-md-3"><button type="submit" class="btn">Add To Cart</button></div>
						</form><br><br></b>
						<% 
								}//outer while
							} 
							catch (Exception e) 
							{
								e.printStackTrace();
							}
						%>
		</div>
      </div>     
      <%
				try
				{
                    sql="select * from menu where (lower(item_type)  like \"%lunch%\") and  rest_id="+rest_id;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
	  %>
      <div class="col-xs-12 col-md-6">
	     <div class="menu-section">
	     <center><h2 class="menu-section-title">Lunch</h2>
	     <hr></center>
			<%
					while(resultSet.next()){
			%>
						<b><br><form method="post" action="Cart">
							<input type="hidden" name="item_id" value="<%=resultSet.getString("item_id") %>">
							<input type="hidden" name="rest_id" value="<%=resultSet.getString("rest_id") %>">
						 	<div class="col-xs-12 col-md-3"><%=resultSet.getString("item_name")%></div>
				            <div class="col-xs-12 col-md-3"><%=resultSet.getString("item_price")%></div>				         
						<%
							ResultSet items_present = null;
							String sql1="select cart_ord_qty from cart where item_id="+resultSet.getString("item_id");
							statement=con.createStatement();
							items_present = statement.executeQuery(sql1);
							if(items_present.next())
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1"  size="2" value="<%=items_present.getString("cart_ord_qty")%>" name="quantity"></div>
						<%
							}//end if
							else
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="0" name="quantity"></div>
						<%	} %>
							<div class="col-xs-12 col-md-3"><button type="submit" class="btn">Add To Cart</button></div>
						</form><br><br></b>
						<% 
								}//outer while
							} 
							catch (Exception e) 
							{
								e.printStackTrace();
							}
						%>
		</div>
      </div>
      </div><br><br>
 <div class="row">
       <%
				try
				{
                    sql="select * from menu where (lower(item_type) like \"%dinner%\")and  rest_id="+rest_id;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
	  %>
	
	    <div class="col-xs-12 col-md-6">
	     <div class="menu-section">
	     <center><h2 class="menu-section-title">Dinner</h2>
	     <hr></center>
			<%
					while(resultSet.next()){
			%>
						<b><br><form method="post" action="Cart">
							<input type="hidden" name="item_id" value="<%=resultSet.getString("item_id") %>">
							<input type="hidden" name="rest_id" value="<%=resultSet.getString("rest_id") %>">
						 	<div class="col-xs-12 col-md-3"><%=resultSet.getString("item_name")%></div>
				            <div class="col-xs-12 col-md-3"><%=resultSet.getString("item_price")%></div>				         
						<%
							ResultSet items_present = null;
							String sql1="select cart_ord_qty from cart where item_id="+resultSet.getString("item_id");
							statement=con.createStatement();
							items_present = statement.executeQuery(sql1);
							if(items_present.next())
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="<%=items_present.getString("cart_ord_qty")%>" name="quantity"></div>
						<%
							}//end if
							else
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="0" name="quantity"></div>
						<%	} %>
							<div class="col-xs-12 col-md-3"><button type="submit" class="btn">Add To Cart</button></div>
						</form><br><br></b>
						<% 
								}//outer while
							} 
							catch (Exception e) 
							{
								e.printStackTrace();
							}
						%>
		</div>
      </div>
       <%
				try
				{
                    sql="select * from menu where (lower(item_type) like \"%dessert%\") and  rest_id="+rest_id;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
	  %>
    	<div class="col-xs-12 col-md-6">
	     <div class="menu-section">
	     <center><h2 class="menu-section-title">Desserts</h2>
	     <hr></center>
			<%
					while(resultSet.next()){
			%>
						<b><br><form method="post" action="Cart">
							<input type="hidden" name="item_id" value="<%=resultSet.getString("item_id") %>">
							<input type="hidden" name="rest_id" value="<%=resultSet.getString("rest_id") %>">
						 	<div class="col-xs-12 col-md-3"><%=resultSet.getString("item_name")%></div>
				            <div class="col-xs-12 col-md-3"><%=resultSet.getString("item_price")%></div>				         
						<%
							ResultSet items_present = null;
							String sql1="select cart_ord_qty from cart where item_id="+resultSet.getString("item_id");
							statement=con.createStatement();
							items_present = statement.executeQuery(sql1);
							if(items_present.next())
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="<%=items_present.getString("cart_ord_qty")%>" name="quantity"></div>
						<%
							}//end if
							else
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="0" name="quantity"></div>
						<%	} %>
							<div class="col-xs-12 col-md-3"><button type="submit" class="btn">Add To Cart</button></div>
						</form><br><br></b>
						<% 
								}//outer while
							} 
							catch (Exception e) 
							{
								e.printStackTrace();
							}
						%>
		</div>
      </div>
	</div><br><br>
       <%
				try
				{
                    sql="select * from menu where (lower(item_type) like \"%drin%\") and  rest_id="+rest_id;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
	  %>  
	 <div class="row">    
      <div class="col-xs-12 col-md-6">
	     <div class="menu-section">
	     <center><h2 class="menu-section-title">Special Drinks</h2>
	     <hr></center>
			<%
					while(resultSet.next()){
			%>
						<b><br><form method="post" action="Cart">
							<input type="hidden" name="item_id" value="<%=resultSet.getString("item_id") %>">
							<input type="hidden" name="rest_id" value="<%=resultSet.getString("rest_id") %>">
						 	<div class="col-xs-12 col-md-3"><%=resultSet.getString("item_name")%></div>
				            <div class="col-xs-12 col-md-3"><%=resultSet.getString("item_price")%></div>				         
						<%
							ResultSet items_present = null;
							String sql1="select cart_ord_qty from cart where item_id="+resultSet.getString("item_id");
							statement=con.createStatement();
							items_present = statement.executeQuery(sql1);
							if(items_present.next())
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="<%=items_present.getString("cart_ord_qty")%>" name="quantity"></div>
						<%
							}//end if
							else
							{
						%>
							<div class="col-xs-12 col-md-3"><input type="number" max="10" min="1" size="2" value="0" name="quantity"></div>
						<%	} %>
							<div class="col-xs-12 col-md-3"><button type="submit" class="btn">Add To Cart</button></div>
						</form><br><br></b>
						<% 
								}//outer while
							} 
							catch (Exception e) 
							{
								e.printStackTrace();
							}
       			System.out.println(rest_id);
						%>
		</div>
      </div>
   </div>   <br><br><center>

  		<form method="post" action="cust_viewCart.jsp?rest_id=<%=rest_id%>">
			<button type="submit" class="btn btn-custom btn-lg">View Cart</button>
		</form>
		<form method="post" action="ConfirmOrder">
			<button type="submit" class="btn btn-custom btn-lg">Confirm and place order</button>
		</form></center>
</div><br><br>

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
      <p>By continuing past this page, you agree to our Terms of Service, Cookie Policy, Privacy Policy and Content Policies. All trademarks are properties of their respective owners. &copy;2018 - FoodGoâ¢ Media Pvt Ltd. All rights reserved. Designed by FoodGo Team.</p>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery.1.11.1.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
