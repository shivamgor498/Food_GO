<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="css/bill.css" rel="stylesheet">
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
    <style>
    #menu.navbar-default .navbar-nav > li > a {
	text-transform: uppercase;
	color: #ddd;
	font-weight: 500;
	font-size: 15px;
	padding: 5px 0;
	border: 2px solid transparent;
	letter-spacing: 0.5px;
	margin: 10px 15px 0 15px;
}
    body
			 {
			     background: url(images/b6.jpg) no-repeat center center fixed; 
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
			
			 }
    .logbox {
      	position: relative;
      	top: 60%;
      	margin-bottom : 200px;
      	margin-top : 50px;
      	left: 50%;
      	transform: translate(-50%,-30%);
      	width: 50%;
      	box-sizing: border-box;
      	background: rgba(0,0,0,0.6);
      	border-radius: 2% 5%;
      }
      hr {
	height: 2px;
	width: 580px;
	text-align: center;
	position: relative;
	background: #8eb640;
	margin: 0;
	margin-bottom: 40px;
	border: 0;
}
    </style>
</head>
		<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
			response.setHeader("Expires","0");//Proxies
			response.setHeader("Pragma","no-cache");
		
			if(session.getAttribute("cemail")==null)
			{
				response.sendRedirect("signin.jsp");
			}
			session.setAttribute("bill","Not Picked Up");
			String cust_email=(String)session.getAttribute("cemail");
			 System.out.println(cust_email);
		%>
<body class="bo" data-target=".navbar-fixed-top">
		<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
			response.setHeader("Expires","0");//Proxies
			response.setHeader("Pragma","no-cache");
		
			if(session.getAttribute("cemail")==null)
			{
				response.sendRedirect("signin.jsp");
			}
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
		<div class="logbox">
        <div class="container text-center">
            <div class="col-md-12">
            <div class="col-md-6 text-center"><br><br><br>
            <div class="row"><!--head tables for info 1-->                
           <%@page import="java.sql.*"%>
		   <%@page import="com.Food.Dao.Get_connection"%>
           <%
           		String ord_id=null;
		        Statement statement = null;
		   		ResultSet resultSet = null;

     		   	String total=null;
     			String sql=null;				
		
		   		Get_connection obj = new Get_connection();
		   		Connection con = obj.get();
		   		try
				{
		   			sql="select cu.cust_name,co.cust_email,cu.cust_phno,date(co.order_time),time(co.order_time),co.cust_email from cust cu, orders co where  co.order_status=\"Not Picked Up\" and cu.cust_email=co.cust_email and co.cust_email=\""+cust_email+"\"";
		   		 	System.out.println(cust_email);
		   			statement =con.createStatement();
        			resultSet = statement.executeQuery(sql);
        			if(resultSet.next() )
        			{
        	%>        		
        		<div class="col-md-4 text-center">	
           			<p style="color: #4CAF50"><b>Customer Name</b></p>
                    <p><%=resultSet.getString(1) %></p>
                </div>
                <div class="col-md-4 text-center">
                    <p style="color: #4CAF50"><b>Customer Number</b></p>
                    <p><%=resultSet.getString(3) %></p>
                </div>
                <div class="col-md-4 text-center">
                    <p style="color: #4CAF50"><b>Customer Email</b></p>
                    <p><%=resultSet.getString(2) %></p>
                </div>
            </div>
            <br><hr>
            <div class="row text-center"><!--head tables for info 2-->
                <div class="col-md-4">
                    <p style="color: #4CAF50"><b>Date:</b></p>
                    <p><%=resultSet.getString(4) %></p>
                </div>
                <div class="col-md-4">
                    <p style="color: #4CAF50"><b>Time</b></p>
                    <p><%=resultSet.getString(5) %></p>
                </div>
            </div>
            <br><hr>
            <div class="row"><!--Receipt-->
                <div class="text-center">
                    <h1 class="h21">Receipt</h1>
                </div>
                <table class="table">
                    <thead><!--head of tables-->
                    <tr>
                            <th><p style="color: #4CAF50" class="text-center">Product</p></th>
                            <th><p style="color: #4CAF50" class="text-center">Restaurant</p></th>
                            <th><p style="color: #4CAF50" class="text-center">Status</p></th>
                            <th><p style="color: #4CAF50" class="text-center">#</p></th>
                            <th class="text-center"><p style="color: #4CAF50">Price</p></th>
                        </tr>
                    </thead>
                    <tbody><!--menu1-->
	<%		}//end of if
        			
        			sql ="SELECT * FROM orders ORDER BY order_id DESC LIMIT 1 ";
    				statement=con.createStatement();				
    				resultSet = statement.executeQuery(sql);
    				while(resultSet.next())
    				{		
    					ord_id=resultSet.getString("order_id");
    				}		
			sql ="SELECT sum(order_total)FROM orders where order_status=\"Not Picked Up\" and  cust_email=\""+cust_email+"\" and  order_id="+ord_id;
			statement=con.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next())
			{			
				total=resultSet.getString(1) ;
			}
			
			sql="select distinct(m.item_name),o.order_status, o.order_time,i.item_qty,r.rest_name,m.item_price*i.item_qty from restaurant r,"+
					"items_ordered i,orders o,menu m where r.rest_id=m.rest_id and i.item_id=m.item_id and i.order_id=o.order_id "
			+"and r.rest_id=o.rest_id and o.order_status=\"Not Picked Up\" and o.cust_email=\""+cust_email+"\" and  o.order_id="+ord_id;
			statement=con.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next())
			{
	%>
				<tr>
                 <td class="col-md-3"><p style="color: white"><%=resultSet.getString(1) %></p></h4></td>
                 <td class="col-md-3"><p style="color: white"><%=resultSet.getString(5) %></p></h4></td>
                 <td class="col-md-2"><p style="color: white"><%=resultSet.getString(2) %></p></h4></td>
                 <td class="col-md-2" style="text-align: center; color: white"><%=resultSet.getString(4) %></td>
                 <td class="col-md-2 text-center" style="color: white"><%=resultSet.getString(6) %></td>
                </tr>
	<%
			}//end of while}
	%>
	<hr>
             <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="text-right">
                                <h4 style="color: #4CAF50"><b>Total:</b></h4></td>
                            <td class="text-center"><h4><b><p><%=total %></p></b></h4></td>
                        </tr>
                    </tbody>
                </table>
               <%			
		} 
		catch (Exception e) {
				e.printStackTrace();
		}
	%>
                <hr>
                <b><input type="submit" name="" value="Generate PDF"></b><br><br>
                <b><h2><a href="CancelOrd?order_id=<%=ord_id %>">Cancel Order</a></h2></b>
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