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
	<!-- Stylesheet -->
	<link rel="stylesheet" type="text/css"  href="css/style.css">
	<link rel="stylesheet" type="text/css"  href="css/cust_main.css">
    
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet"> 
	<title>Welcome To FoodGo !!</title>
	<style>
.form-control:focus {
	    border-color: ;
	    outline: 0;
	    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
	    box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
	}
	.form-control {
		  display: block;
		  height: 52px;
		  }
	.col-sm-5{
		font-size: 12px;
		margin-bottom: 50px;
		padding-top: 15px;
		padding-bottom: 15px;
		box-shadow: 1px 5px 10px #8eb640;
		font-size: 25px;
		font-family: Arial;
		}
	header .intro-text {
	    padding-top: 70px;
	}
	a {
	    color: #8eb640;
	}
.intro span {
    color: white;
	}

.input {
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #8eb640;
  color: #8eb640;
  box-sizing: border-box;
  font-family: 'Arvo';
  font-size: 25px;
  height: 50px;
  padding: 10px 0px;
  position: relative;
  width: 400px;
  margin-bottom: 25px;

  &:focus {
    outline: none;    
  }
}

input:focus {outline:0;}
	

input::-webkit-input-placeholder {
  color: #8eb640;
}

input:focus::-webkit-input-placeholder {
  color: #8eb640;
}

.input:focus+.underline {
  transform: scale(1);
}

.underline {
    background-color: #8eb640;
    display: inline-block;
    height: 1px;
    left: 280px;
    margin-top: -4px;
    position: absolute;
    -webkit-transform: scale(0, 1);
    transform: scale(0, 1);
    -webkit-transition: all 0.5s linear;
    transition: all 0.5s linear;
    width: 750px;
}
a:hover {
    color: white;
}

*, *:before, *:after {
    box-sizing: border-box;
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
		<nav id="menu" class="navbar navbar-default navbar-fixed-top" style="background-color: #262626; height: 80px;">
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
		      <font color="white" size="5">WELCOME TO FOOD GO <span style="color:  #8eb640;"> ${cname}</span></font><br>
		    </div>	
	<!-- navbar -->
		    <div>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="cust_mainpage.jsp#about" >About</a></li>
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
		</ul></div></div>
		</nav>		

<header id="header">
  <div class="intro">
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="intro-text">			
<div class="container">
  <div class="jumbotron" style="background-color: #262626;color: white">

		<center>
		<form action="Search" method="get" style="color: red;size: 10px" id="myForm">
			<div class="form-inline my-2 my-lg-0">
		<input class="input" type="text" name="input" autofocus="autofocus" 
		placeholder="Search by name,address,rating..." size="30" autocomplete="off" value="${input}"
		 onfocus="var temp_value=this.value; this.value=''; this.value=temp_value" style="border:0px solid black">
		<span class="underline" style="top:171px"></span>

					<br><button type="submit"  style="background-color: #262626;border-color: #262626;opacity:0"></button>
		   </div>
		</form>

		<a href="Search?input=all" style="font-size: 30px">List all </a></button>
		</center> 
		<br><br>

		<%@page import="java.sql.*"%>
		<%@page import="com.Food.Dao.Get_connection"%>
		
		<%
			Statement statement = null;
			ResultSet resultSet = null;

			Get_connection obj = new Get_connection();
			Connection con = obj.get();
					try
					{
						String sql1=(String)session.getAttribute("sql1");
						String sql2=(String)session.getAttribute("sql2");
						String sql3=(String)session.getAttribute("sql3");
						String sql=(String)session.getAttribute("sql");
						
						statement=con.createStatement();
						int i=0;
						while(true){
							if(sql1!=null){
								resultSet = statement.executeQuery(sql1);
								sql1=null;
							}
							else if(sql2!=null){
								resultSet = statement.executeQuery(sql2);
								sql2=null;
							}
							else if(sql3!=null){
								resultSet = statement.executeQuery(sql3);
								sql3=null;
							}
							else if(sql!=null){
								resultSet = statement.executeQuery(sql);
								sql=null;
							}
							i++;
							if(i==5)
								break;
						while(resultSet.next()){
							
				%>
				<div class="row">
					<div class="col-sm-5">
						<span style="font-size: 50px;">
						<a href="cust_restDisp.jsp?rest_id= <%=resultSet.getString("rest_id")%>">
							<%=resultSet.getString("rest_name")%>
						</a>
						</span>
						<span style="float: right;font-size: 20px;color: #E74C3C;">
						<%=resultSet.getString("rest_rating")%> *
						</span><br>
						<span style="font-size: 10px">
							<%=resultSet.getString("rest_addr") %><br>
						</span>
						<div style="font-size: 11px;">
							<span style="float: left;">
							<%=resultSet.getString("rest_phno")%>
							</span>
							<span style="float: right;">
							$<%=resultSet.getString("rest_pricet")%>
							</span>
						</div>
					</div>
					<div class="col-sm-2">
					</div>
				<%	if(resultSet.next()) { %>
					<div class="col-sm-5">
						<span style="font-size: 50px;">
						<a href="cust_restDisp.jsp?rest_id= <%=resultSet.getString("rest_id")%>">
							<%=resultSet.getString("rest_name")%>
						</a>
						</span>
						<span style="float: right;font-size: 20px;color: #E74C3C;">
						<%=resultSet.getString("rest_rating")%> *
						</span><br>
						<span style="font-size: 10px">
							<%=resultSet.getString("rest_addr") %><br>
						</span>
						<div style="font-size: 11px;">
							<span style="float: left;">
							<%=resultSet.getString("rest_phno")%>
							</span>
							<span style="float: right;">
							$<%=resultSet.getString("rest_pricet")%>
							</span>
						</div>
					</div>
					<% } %>
				</div><br><br>
				<% 
						}//outer while
						}//outer for
						} catch (Exception e) {
							e.printStackTrace();
						}
				%>
	</div>
  </div>
</div>


           </div>
        </div>
      </div>
    </div>
  </div>
</header>
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
</body>
</html>