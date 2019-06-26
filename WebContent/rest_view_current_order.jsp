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
    <link rel="stylesheet" type="text/css"  href="css/bill.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet"> 
	<title>Welcome To FoodGo !!</title>	
</head>
<body class="bo" data-target=".navbar-fixed-top">
		<%@page import="java.sql.*"%>
		<%@page import="com.Food.Dao.Get_connection"%>
		<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
			response.setHeader("Expires","0");//Proxies
			response.setHeader("Pragma","no-cache");
		
			if(session.getAttribute("cemail")==null && session.getAttribute("remail")==null)
			{
				response.sendRedirect("signin.jsp");
			}			
				Statement statement = null;
				ResultSet resultSet = null;
				Statement statement1 = null;
				ResultSet resultSet1 = null;
				
				Get_connection obj = new Get_connection();
				Connection con = obj.get();
					String type=(String)session.getAttribute("signin_type");
		%>
		<!-- Navigation -->
		<nav id="menu" class="navbar navbar-default navbar-fixed-top"  style="background-color: #262626;">
		  <div class="container"> 
		    <!-- Brand and toggle get grouped for better mobile display -->  
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
			   <%
			   if(type=="cust")
				{
			   %>
			   	<a class="navbar-brand " href="cust_mainpage.jsp">FoodGo</a>
			   	<font color="white" size="5">WELCOME TO FOOD GO <span style="color: #8eb640;font-size: 35px">${cname}</span></font><br>
			   <%		
				}
		        else
		        {
		    	%>
		          	<a class="navbar-brand " href="rest_mainpage.jsp">FoodGo</a>
		          	<font color="white" size="5">WELCOME TO FOOD GO <span style="color: #8eb640;font-size: 35px">${rname}</span></font><br>
		    	<%
		        }
		      	%>
		      
		    </div>	
	<!-- navbar -->
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
		          	<li><a href="Logout" >Sign Out</a></li></ul>
		    	<%
		        }
	        	%>    	     
		    </div>
		</nav>		
<div class="container">
	        <b><font color="black">
			<% 
			String id=null,cust_email;
			%>
			<br><br><br><br><br><br><br><br><br><br>
			<div class="row">
			<div class="col-md-12">
	    		<div class=" col-md-2">ORDER ID</div>
	    		<div class=" col-md-3">CUSTOMER EMAIL</div>
	    		<div class=" col-md-2">ORDER TIME</div>
	    		<div class=" col-md-1">ORDER TOTAL</div>
	    		<div class=" col-md-2">ORDER STATUS</div>
	    	</div>
	    	</div>
		<%		id=(String)request.getParameter("c");
				try
				{
					String sql ="select * from orders o, restaurant r where r.rest_id=o.rest_id and o.order_status=\"Not Picked Up\" "
						+"and o.rest_id="+id ;
					statement=con.createStatement();
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){						
						String k=resultSet.getString("order_id");
			%>	
				<div class="row">
	    		<div class="col-md-12">
	     		<br>
						<form method="post" action="OrdDelivered" >
							<input type="hidden" name="order_id" value="<%=resultSet.getString("order_id") %>">
							<input type="hidden" name="cust_email" value="<%=resultSet.getString("cust_email") %>">
						 	<div class=" col-md-2"><%=resultSet.getString("order_id")%></div>
				            <div class=" col-md-3"><%=resultSet.getString("cust_email")%></div>
							<div class=" col-md-2"><%=resultSet.getString("order_time")%></div>
				            <div class=" col-md-1"><%=resultSet.getString("order_total")%></div>
				            <div class=" col-md-2"><%=resultSet.getString("order_status")%></div>					
							<div class=" col-md-2"><button type="submit" class="btn">Order Picked Up</button></div>
						</form>
				</div>
				</div>
							<div class="row">
							<div class="col-md-12">
					    		<div class=" col-md-2">ITEM NAME</div>
					    		<div class=" col-md-2">ITEM QTY</div>
					    		<div class=" col-md-2">ITEM TOTAL</div>
					    		<div class="col-md-2"></div>
					    		<div class="col-md-2"></div>
					    		<div class="col-md-2"></div>
					    	</div>
					    	</div>					
			<% 
					String sql1 ="select (i.item_qty*m.item_price), i.item_id,m.item_name,i.item_qty from items_ordered i,orders c,menu m where i.item_id=m.item_id and"+ 
							" c.order_status=\"Not Picked Up\" and i.order_id=c.order_id and c.order_id="+k+" and c.rest_id="+id ;
					statement1=con.createStatement();
					resultSet1 = statement1.executeQuery(sql1);
					while(resultSet1.next()){
			%>
			<div class="row">
	    	<div class="col-md-12">			
			&emsp;&emsp;&emsp;&emsp;<div class="col-md-2"><%=resultSet1.getString("item_name")%></div>
			&emsp;&emsp;&emsp;&emsp;<div class="col-md-2"><%=resultSet1.getString("item_qty")%></div>
			&emsp;&emsp;&emsp;&emsp;<div class="col-md-2"><%=resultSet1.getString(1) %></div>
									<div class="col-md-2"></div>
									<div class="col-md-2"></div>
									<div class="col-md-2"></div>
					</div>
					</div>		
					<% 
							}//inner while
					%>			 
				<br>
					<%			
								
					}//outer while	
							} catch (Exception e) {
								e.printStackTrace();
						}
			%>		
			</font>
		</b>
 </div>

<br><br><br><br><br><br>



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