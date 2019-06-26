<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Admin</title>

    <!-- Bootstrap CSS CDN -->
     <link rel="stylesheet" href="admin_css/link1.css">

    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="admin_css/navbar.css">
    <script defer src="admin_css/link2.css"></script>

    <!-- Font Awesome JS -->
    <script defer src="admin_css/link3.css"></script>

    <link href="https://fonts.googleapis.comcss?family=Lobster" rel="stylesheet">

    <link rel="stylesheet" type="textcss" href="admin_css/button.css">
    <link rel="stylesheet" type="textcss" href="admin_css/register_stud.css">
    <link rel="stylesheet" type="textcss" href="admin_css/table.css">

<style type="text/css">

html{
    margin-bottom: 100px;
}
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 60%;
}

#customers td,th
{
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: rgb(89, 137, 214);
    color: white;
}
    

</style>
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

                        <em><h1 class="heading" style="margin-left:400px">Food Go!</h1></em>

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
            	<p align="right">
            	<u>
				<a href="Rest_list_pdf" style="color : rgb(89, 137, 214);font-size:25px;margin-right:50px;">Get PDf</a>
				</u></p>
				<br>
<center>
	        <h3> Restaurants
		        <br>
			</h3>
	 <%
	 String temp=null;
	 	if(request.getParameter("rest_name")==null){
	 		temp = "";
	 	}else{
	 		temp=request.getParameter("rest_name");
	 	}
	 %>
    <form action="admin_rest_list.jsp">
    <input type="text" name="rest_name" autofocus onfocus="var temp_value=this.value; this.value=''; this.value=temp_value" value="<%=temp%>" placeholder="Search Restaurants by name..." autocomplete="off" >
    </form>
    <u><a href="admin_rest_list.jsp?show=all" style="color : rgb(89, 137, 214)">List all</a></u>
    <br>
        <br>
        <table id="customers">
            <tr>
                <th>Id</th>
                <th>Name</th>
            </tr>
	            <%@page import="java.sql.*"%>
				<%@page import="com.Food.Dao.Get_connection"%>
	            <%
	            Statement statement = null;
				ResultSet rs = null;					
				Get_connection obj = new Get_connection();
				Connection con = obj.get();
				String sql = null;
				if (request.getParameterMap().containsKey("rest_name")) {
                    String rest_name = request.getParameter("rest_name");
		        	sql="select * from restaurant where rest_name LIKE '%"+rest_name+"%'";
                }
                else{
                    sql="select * from restaurant";
                }
					System.out.println(sql);
					statement=con.createStatement();
					rs = statement.executeQuery(sql);
					while(rs.next())
					{
		    	%>
            <tr>
                <td><%=rs.getString("rest_id")%></td>
                <td style="color:blue;"><a href="admin_rest_info.jsp?rest_id=<%=rs.getString("rest_id")%>"><u><%=rs.getString("rest_name")%></u></a></td>
            </tr>
		    	<%
					}
	        	%>
        </table>
        </center>
</div>
</div>


    <script src="admin_css/link4.css"></script>
    <!-- Popper.JS -->
    <script src="admin_css/link5.css"></script>
    <!-- <script src="/staticcss/link5.css"></script> -->
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

