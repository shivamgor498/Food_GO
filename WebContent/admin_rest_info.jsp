<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>student_dashboard</title>

    <!-- Bootstrap CSS CDN -->
     <link rel="stylesheet" href="admin_css/link1.css">

    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="admin_css/navbar.css">
    <script defer src="admin_css/link2.css"></script>

    <!-- Font Awesome JS -->
    <link rel="stylesheet" type="text/css" href="admin_css/link3.css">
    <script defer src="admin_css/link3.css"></script>

    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="admin_css/table.css">
    <link rel="stylesheet" type="text/css" href="admin_css/button.css">
    <link rel="stylesheet" type="text/css" href="admin_css/register_stud.css">
</head>

<body>

    <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav id="sidebar"  class="active">
            <div class="sidebar-header">
            <a href="admin_home.jsp"><img src="images/admin_logo.jpg" style="width: 55px; height: 60px;border-radius: 50%;">
                <span style="font-size: 25px"> Hello Admin </span></a>
            </div>

            <ul class="list-unstyled components">
                <p>Foood Go!</p>
                <li>
                    <li>
                        <a href="admin_rest_list.jsp" data-toggle="collapse" aria-expanded="false">Restaurants</a>
                    </li>
                    <li>
                        <a href="admin_cust_list.jsp" data-toggle="collapse" aria-expanded="false">Customers</a>
                    </li>
                </li>
                <li>
                    <a href="signin.jsp" data-toggle="collapse" aria-expanded="false">Logout</a>
                </li>
        </ul>

        </nav>

        <!-- Page Content Holder -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="navbar-btn active">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                    
                        <em><h1 class="heading" style="padding-left:400px">Food Go!</h1></em>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                             <li class="nav-item">
                                <a class="nav-link" href="signin.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="line"></div>
            <div class="line"></div>
<center>
        

<style>
	#sp
	{
		max-width: 70%;
		/*margin-top : 70px;*/
	}
	.tables{
		margin-left:120px;
	}
	.a
	{
		text-transform: uppercase;
	}
	.panel-heading
	{
    font-weight: bolder;
		background-color: rgb(89, 137, 214);
	}
  .table td, .table th 
  {
    border: 2px solid #dee2e6;
    padding-top: 0.5rem;
    padding-bottom: 0.5rem;
    text-align: center;
  }
  .panel-heading {
    padding-top: 10px;
    padding-bottom: 10px;
    font-family: initial;
  }
  .table thead th {
      border: 2px solid #dee2e6;
    font-family: initial;
  }
</style>

<div class="tables">

<div class="panel panel-primary" id="sp">
  <!-- Default panel contents -->
  <div class="panel-heading" style="font-size: 50px">Restaurant Details<a href="admin_rest_chart.jsp?rest_id=<%=request.getParameter("rest_id")%>">

    <br><button type="button" class="btn btn-default" style="margin-left: 20px; color:blue;">Graph</button></a>
   <a href="admin_rest_order_history.jsp?rest_id=<%=request.getParameter("rest_id")%>"><button type="button" class="btn btn-success" style="margin-left: 500px">Order History</button></div>

  <!-- Table -->
  <table class="table">

        <%@page import="java.sql.*"%>
		<%@page import="com.Food.Dao.Get_connection"%>
        <%
        Statement statement = null;
		ResultSet rs = null;					
		Get_connection obj = new Get_connection();
		
		Connection con = obj.get();
   	String sql="select * from restaurant where rest_id="+request.getParameter("rest_id");
		statement=con.createStatement();
		rs = statement.executeQuery(sql);
		if(rs.next())
		{
    	%>

    <thead>
      <tr>
        <th>Email</th>
        <th colspan="2">Name</th>
      </tr>
    </thead>
    <tbody>
        <tr>
        <td><%=rs.getString("rest_email")%></td>
        <td colspan="2"><%=rs.getString("rest_name")%></td>
        </tr>
    </tbody>
     <thead>
      <tr>
        <th>Phone Number</th>
        <th colspan="2">Password</th>       
       </tr>
     </thead>
     <tbody>
        <tr>
        <td><%=rs.getString("rest_phno")%></td>
        <td colspan="2"><%=rs.getString("rest_pass")%></td>          
        </tr>
    </tbody>

     <thead>
      <tr>
        <th colspan="3">Address</th>
       </tr>
     </thead>
     <tbody>
        <tr>
            <td colspan="3"><%=rs.getString("rest_addr")%></td>          
        </tr>
    </tbody>

     <thead>
      <tr>
        <th>Latitude</th>
        <th>Longitude</th>
        <th>Rating</th>
       </tr>
     </thead>
     <tbody>
        <tr>
            <td><%=rs.getString("rest_lat")%></td>
            <td><%=rs.getString("rest_long")%></td>
            <td><%=rs.getString("rest_rating")%></td> 
        </tr>
    </tbody>
     <thead>
      <tr>
        <th>Opening Time</th>
        <th>Closing Time</th>
        <th>Price for 2</th>
       </tr>
     </thead>
     <tbody>
        <tr>
            <td><%=rs.getString("rest_open")%></td> 
            <td><%=rs.getString("rest_close")%></td>
            <td>$<%=rs.getString("rest_pricet")%></td>
        </tr>
    </tbody>
    	<%
			}
    	%>
  </table>

  <a href="Admin_rest_delete?rest_id=<%=request.getParameter("rest_id")%>"><button class = "btn btn-danger">Delete</button></a>


     <%
     String temp=null;
        if(request.getParameter("item_name")==null){
            temp = "";
        }else{
            temp=request.getParameter("item_name");         
        }
     %><br><br><br>
    <form action="admin_rest_info.jsp?rest_id=<%=request.getParameter("rest_id")%>"  method="post">
    <input type="text" name="item_name" autofocus onfocus="var temp_value=this.value; this.value=''; this.value=temp_value" value="<%=temp%>" placeholder="Search Menu by name..." autocomplete="off" >
    </form>
    <u><a href="admin_rest_info.jsp?rest_id=<%=request.getParameter("rest_id")%>" style="color : rgb(89, 137, 214)">List all</a></u>

   <table id="customers" style="margin-top: 30px;width: 100%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Type</th>
            </tr>
          <%
        if (request.getParameterMap().containsKey("item_name")) {
                  String item_name = request.getParameter("item_name");
              sql="select * from menu where rest_id="+request.getParameter("rest_id") + " item_name LIKE '%"+item_name+"%'";
        }
        else{
              sql="select * from menu where rest_id="+request.getParameter("rest_id");
        }
          statement=con.createStatement();
          rs = statement.executeQuery(sql);
          while(rs.next())
          {
          %>
            <tr>
                <td><%=rs.getString("item_id")%></td>
                <td><%=rs.getString("item_name")%></td>
                <td><%=rs.getString("item_price")%></td>
                <td><%=rs.getString("item_type")%></td>
            </tr>
          <%
          }
            %>
</div>
<br>
<form action="admin_rest_chart.jsp?rest_id=<%=request.getParameter("rest_id")%>" method="post">
</div>
</div>
<div>
</form>


    <script src="admin_css/link4.css"></script>
    <!-- Popper.JS -->
    <script src="admin_css/link5.css"></script>
    <!-- <script src="/static/admin_css/link5.css"></script> -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
    </div>
</body>
</html>
