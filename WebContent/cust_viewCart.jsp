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
    <link rel="stylesheet" type="text/css"  href="css/bill.css">
    <link rel="stylesheet" type="text/css"  href="css/style.css">
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
		
			if(session.getAttribute("cemail")==null)
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
			   	<a class="navbar-brand " href="cust_mainpage.jsp">FoodGo</a>
			   	<font color="white" size="5">WELCOME TO FOOD GO <span style="color: #8eb640;font-size: 35px">${cname}</span></font><br>		       
		    </div>	
	<!-- navbar -->
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
		          	<li><a href="Logout" >Sign Out</a></li></ul>
		    	<%
		        }
			    %>
		    </div>
		</nav>			
		<br><br><br><br><br><br><br>
                <div class="text-center">
                    <h1>Update/ View cart</h1>
                </div>
		<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
		response.setHeader("Expires","0");//Proxies
		response.setHeader("Pragma","no-cache");
		
			if(session.getAttribute("cemail")==null)
			{
				response.sendRedirect("signin.jsp");
			}
			%>
			<%@page import="java.sql.*"%>
			<%@page import="com.Food.Dao.Get_connection"%>
			 <table class="table">
             <thead><!--head of tables-->
                 <tr>
                     <th><p style="color: #000" class="text-center">Item no</p></th>
                     <th><p style="color: #000" class="text-center">Item name</p></th>
                     <th><p style="color: #000" class="text-center">Item qty</p></th>
                     <th><p style="color: #000" class="text-center">Price</p></th>
                     <th></th>
                     <th></th>
                 </tr>
             </thead>
			<%
			try
			{	
				String cemail=(String)session.getAttribute("cemail");
	
				String sql ="select ca.cart_ord_qty*m.item_price, ca.cart_id,ca.cart_ord_qty,m.item_name from cart ca,menu m where ca.item_id=m.item_id";
				statement=con.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
	%>
	<div class="row"><!--Update/ View Cart-->
       <form name="Form1" method="post" action="CartUpdateDelete?rest_id=<%= request.getParameter("rest_id")%>">
           <tbody>
               <tr><!--menu1-->
                   <td class="col-md-2 text-center" style="color: blue"><b><input type="hidden" name="cart_id" value="<%=resultSet.getString("cart_id") %>"></b>
                   <b><input type="text" name="cart_id" readonly="readonly" value="<%=resultSet.getString("cart_id") %>"></p></h4></b></td>
                   <td class="col-md-3 text-center" style="color: blue"><b><input type="hidden" name="item_name" value="<%=resultSet.getString("item_name") %>"></b>
                   <b><input type="text" name=item_name readonly="readonly" value="<%=resultSet.getString("item_name") %>"></p></h4></b></td>
                   <td class="col-md-2 text-center" style="color: blue">
                   <b>
                   <input type="number" max="10" min="1" style="width:100px;margin-top: 3px;height: 39px;text-align: center;" autocomplete="off" name="cart_ord_qty" value="<%=resultSet.getString("cart_ord_qty") %>" >
                   </b>
                   </td>
                   <td class="col-md-1 text-center" style="color: blue"><b><input type="text"  style="width:100px" name=item_price readonly="readonly" value="<%=resultSet.getString(1) %>"></b></td>
                   <td class="col-md-2 text-center" style="color: blue; opacity:0"><b><input type="submit" name="action" value="Update"></b></td>
				  <td class="col-md-2 text-center" style="color: blue"><b><input type="submit" name="action" value="Delete"></b></td>
               </tr>                     
           </tbody>
           </form>            
    </div>
	<%
		}
	} catch (Exception e) {
	e.printStackTrace();
	}	
	%>
	</table>
			<form method="post" action="cust_restDisp.jsp?rest_id=<%= request.getParameter("rest_id") %>">
				<input type="submit" value="Add more items">
			</form>
			<form method="post" action="ConfirmOrder">
				<input type="submit" value="Confirm and place order">
			</form>
			
			<br><br><br><br><br><br><br><br><br>
		
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
        <p>Phone: +3-904-12-17-18</p>
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