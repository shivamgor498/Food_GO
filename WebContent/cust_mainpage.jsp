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
	        <div class="row">

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
	            String c=(String)session.getAttribute("cemail");

		        if(session.getAttribute("cemail")==null)
				{		        	
				%>
					<a href="cust_search_rest.jsp" class="btn btn-custom btn-lg page-scroll">Discover Restaurants</a>
				<%		
				}
		        else
		        {
		        	
		    	%>
		          	<a href="cust_view_current_order.jsp?c=<%=c%>" class="btn btn-custom btn-lg page-scroll">View Current Orders</a>&emsp;&emsp;&emsp;
		          	<a href="cust_search_rest.jsp" class="btn btn-custom btn-lg ">Discover Restaurants</a>&emsp;&emsp;&emsp;
		          	<a href="cust_view_past_order.jsp?c=<%=c%>" class="btn btn-custom btn-lg page-scroll">View Past Orders</a>
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
	        <center><p style="font-size: 35px">Wanna pick up food and can't <br><br> find which restaurant's are on <br><br> your way? Don't worry we got <br><br> you covered!! Click on the <br><br> button below to find a <br><br> restaurant on maps!!</p>	          
	        <form  name="myform1" method="get" action="cust_mapp.jsp" ><button type="submit" class="btn btn-custom btn-lg">Find On Map</button></form></center>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- Restaurant Menu Section -->
	<div id="restaurants">	 
	  <div class="section-title text-center center">
		<div class="overlay">
		  <h2>Restaurants</h2>
		  <hr>
		      <p>You order. We serve.</p>
		</div>
	  </div>
	 <div class="container">
	    <div class="row">
			<% 	try
			{						
				String sql="select * from restaurant r,rest_image r1 where r.rest_id=r1.rest_id limit 6";
				statement=con.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
			%>
		<div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg">
              <div class="hover-text">
               <p style="color:black; weight:bold;">
               	  <div class="menu-item-name"><a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><%=resultSet.getString("rest_name")%></a></div>
				  <div class="menu-item-description"><%=resultSet.getString("rest_addr") %> </div>
				  <div class="menu-item-description"><%=resultSet.getString("rest_open") %>-<%=resultSet.getString("rest_close") %> </div>
				  <div class="menu-item-description"><%=resultSet.getString("rest_pricet") %> </div>
				  <div class="menu-item-description"><%=resultSet.getString("rest_rating") %> </div>
			   </p>
              </div>
              <a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><img src="${pageContext.request.contextPath}/rest_images/<%=resultSet.getString("rest_id")%>" style="width:100%;height:200px;" alt="Restaurant Img" data-lightbox-gallery="gallery1"></a>
            </div>
          </div>
         </div>

			<% 
							
					    }//outer while
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>
  		</div>    

		  	<div class="col-md-4 col-md-offset-4 jt_col column_container">    
             <a href="cust_rest.jsp" >&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="submit" class="btn btn-custom btn-lg">View All Restaurant</button></a>
            </div><br><br><br>
		</div> 
	<br>
   <!-- Portfolio Section -->
	<div id="portfolio">
	  <div class="section-title text-center center">
		<div class="overlay">
	      <h2>Filters</h2>
	      <hr>
	      <p>Having trouble deciding what to order? Let us help you!</p>
	    </div>
		</div>
	<div class="container">
	  <div class="row"><center>
	    <form name="Form2" method="get" action="SortRest" >
			<input type="submit" class="btn btn-custom btn-lg" name="action" value="Rating">
    		<input type="submit" class="btn btn-custom btn-lg" name="action" value="Price">
    		<input type="submit" class="btn btn-custom btn-lg" name="action" value="Starter">
    		<input type="submit" class="btn btn-custom btn-lg" name="action" value="Lunch">
    		<input type="submit" class="btn btn-custom btn-lg" name="action" value="Dinner">    		
    		<input type="submit" class="btn btn-custom btn-lg" name="action" value="Dessert">
    		<input type="submit" class="btn btn-custom btn-lg" name="action" value="Drinks">
		</form></center>
	     <%
				try
				{
					String sql1=(String)session.getAttribute("sql1");
					String sql2=(String)session.getAttribute("sql2");
					String sql3=(String)session.getAttribute("sql3");
					String sql4=(String)session.getAttribute("sql4");
					String sql5=(String)session.getAttribute("sql5");
					String sql6=(String)session.getAttribute("sql6");
					String sql7=(String)session.getAttribute("sql7");
					statement=con.createStatement();
					int i=0;
					while(true){
						if(sql1!=null){
							resultSet = statement.executeQuery(sql1);
							sql1=null;
						}else if(sql2!=null){
							resultSet = statement.executeQuery(sql2);
							sql2=null;
						}else if(sql3!=null){
							resultSet = statement.executeQuery(sql3);
							sql3=null;
						}else if(sql4!=null){
							resultSet = statement.executeQuery(sql4);
							sql4=null;
						}else if(sql5!=null){
							resultSet = statement.executeQuery(sql5);
							sql5=null;
						}else if(sql6!=null){
							resultSet = statement.executeQuery(sql6);
							sql6=null;
						}else if(sql7!=null){
							resultSet = statement.executeQuery(sql7);
							sql7=null;
						}
						i++;
						if(i==18)
							break; 
						while(resultSet.next()){
							%>
						<div class="col-sm-6 col-md-4 col-lg-4">
				          <div class="portfolio-item">
				            <div class="hover-bg">
				              <div class="hover-text">
				               <p style="color:black; weight:bold;">
				               	  <div class="menu-item-name"><a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><%=resultSet.getString("rest_name")%></a></div>
								  <div class="menu-item-description"><%=resultSet.getString("rest_addr") %> </div>
								  <div class="menu-item-description"><%=resultSet.getString("rest_open") %>-<%=resultSet.getString("rest_close") %> </div>
								  <div class="menu-item-description"><%=resultSet.getString("rest_pricet") %> </div>
								  <div class="menu-item-description"><%=resultSet.getString("rest_rating") %> </div><br><br>
							   </p>
				              </div>
				              <a href="cust_restDisp.jsp?rest_id=<%= resultSet.getInt("rest_id")%>"><img src="${pageContext.request.contextPath}/rest_images/<%=resultSet.getString("rest_id")%>" style="width:100%;height:200px;" alt="Restaurant Img" data-lightbox-gallery="gallery1"></a>
				            </div>
				          </div>
				         </div>
					<% 
						}				
					}//outer while
				} catch (Exception e) {
					e.printStackTrace();
				}
					%>  
        </div>
	  </div>
	  <div class="col-md-4 col-md-offset-4 jt_col column_container">    
             <a href="cust_search_rest.jsp" >&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="submit" class="btn btn-custom btn-lg">View All Restaurant</button></a>
            </div><br><br>
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
<!-- Contact Section -->
<div id="contact" class="text-center">
  <div class="container">
    <div class="section-title text-center">
      <h2>Contact Form</h2>
      <hr>
      <p>Contact us anytime you want. We are here to solve your query!</p>
    </div>
    <div class="col-md-10 col-md-offset-1">
      <form name="sentMessage" id="contactForm" novalidate>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input type="text" id="name" class="form-control" placeholder="Name" required="required">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <input type="email" id="email" class="form-control" placeholder="Email" required="required">
              <p class="help-block text-danger"></p>
            </div>
          </div>
        </div>
        <div class="form-group">
          <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message" required></textarea>
          <p class="help-block text-danger"></p>
        </div>
        <div id="success"></div>
        <button type="submit" class="btn btn-custom btn-lg">Send Message</button>
      </form>
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