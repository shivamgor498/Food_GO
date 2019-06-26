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
  <div class="panel-heading">Customer Details <a href="admin_cust_order_history.jsp?cust_email=<%=request.getParameter("cust_email")%>"><button type="button" class="btn btn-success" style="margin-left: 500px">Order History</button></div>




  <!-- Table -->
  <table class="table">

        <%@page import="java.sql.*"%>
        <%@page import="com.Food.Dao.Get_connection"%>
        <%
        Statement statement = null;
        ResultSet rs = null;                    
        Get_connection obj = new Get_connection();

        Connection con = obj.get();
            String sql="select * from cust where cust_email='"+request.getParameter("cust_email")+"'";
            System.out.println(sql);
            statement=con.createStatement();
            rs = statement.executeQuery(sql);
            if(rs.next())
            {
        %>

    <thead>
      <tr>
        <th>Email</th>
        <th>Name</th>
      </tr>
    </thead>
    <tbody>
        <tr>
        <td><%=rs.getString("cust_email")%></td>
        <td><%=rs.getString("cust_name")%></td>
        </tr>
    </tbody>
     <thead>
      <tr>
        <th>Phone Number</th>
        <th>Password</th>       
       </tr>
     </thead>
     <tbody>
        <tr>
        <td><%=rs.getString("cust_phno")%></td>
        <td><%=rs.getString("cust_pass")%></td>
        </tr>
    </tbody>


        <%
            }
        %>


  </table>
</div>
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
</body>
</html>
