<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
    // --- String Join Function
    public String join(ArrayList<?> arr, String del)
    {
        StringBuilder output = new StringBuilder();
        for (int i = 0; i < arr.size(); i++)
        {
            if (i > 0) output.append(del);
            
            // --- Quote strings, only, for JS syntax
            if (arr.get(i) instanceof String) output.append("\"");
            output.append(arr.get(i));
            if (arr.get(i) instanceof String) output.append("\"");
        }
        return output.toString();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Sales</title>
    <script type="text/javascript" src="https://cdn.zingchart.com/zingchart.min.js"></script>
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
<form action="admin_rest_chart.jsp?rest_id=<%=request.getParameter("rest_id")%>" method="post">
<div>
<table class="table">
  <thead>
      <tr>
        <th>Select Fields for Graph</th>
        <th colspan="2">Month</th>
        <th colspan="2">Year</th>
      </tr>
    </thead>
    <tbody>
        <tr>
        <td></td>
        <td colspan="2">
          <div class="text-center">
              <select name="month">
                <option value="0">All</option>
                <option value="1">January</option>
                <option value="2">February</option>
                <option value="3">March</option>
                <option value="4">April</option>
                <option value="5">May</option>
                <option value="6">June</option>
                <option value="7">July</option>
                <option value="8">August</option>
                <option value="9">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
              </select>
            </div></td>
        <td colspan="2">
          <div class="text-center">
              <select name="year">
                <option value="2018">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>
                <option value="2015">2015</option>
              </select>
            </div>
        </td>
        </tr>
    </tbody> 
</table>
<div id=graph_rest><center>
<button class = "btn btn-primary" >Graph</button></center>
</div>
</div>
</div>
</div>
<div>
</form>
    <%@page import="java.sql.*"%>

    <%@page import="com.Food.Dao.Get_connection"%>
	
    <%
		    Statement statement = null;
		    ResultSet rs = null;
		    Get_connection obj = new Get_connection();

		    Connection con = obj.get();
		    String mont = "0";
		    if(request.getParameterMap().containsKey("month"))
		    	mont = request.getParameter("month");
		    String yr = "2015";
		    if(request.getParameterMap().containsKey("year"))
		    	yr = request.getParameter("year");
            HttpSession session123 = request.getSession();
            String sql="select count(*) as count,MONTH(order_time) as day from orders where YEAR(order_time)='"+yr+"' and rest_id="+request.getParameter("rest_id") + " group by MONTH(order_time)";
            String sql1="select count(*) as count,DAY(order_time) as day from orders where YEAR(order_time)='"+yr+"' and MONTH(order_time)='"+ mont + "' and rest_id="+request.getParameter("rest_id") +" group by DAY(order_time)";
//            String emailid = (String) session123.getAttribute("email_id");
          	PreparedStatement stmt=null;
            if(mont.equals("0")){
                stmt=con.prepareStatement(sql);
                %>
                <p style="margin-left:10%;"><i>X-axis: Month</i></p>
                <p style="margin-left:10%;"><i>Y-axis: Count of Orders</i></p>
            <%}
            else{
                stmt=con.prepareStatement(sql1);
                %>
                <p style="margin-left:10%;"><i>X-axis: Date</i></p>
                <p style="margin-left:10%;"><i>Y-axis: Count of Orders</i></p>
              <%
            }
            ResultSet rs1 = stmt.executeQuery();
            ArrayList<String> Day = new ArrayList<String>();
            ArrayList<Integer> Count = new ArrayList<Integer>();
            while(rs1.next())
            {
            	System.out.println(rs1.getString("day"));
            	System.out.println(rs1.getString("count"));
                Day.add(rs1.getString("day"));
                Count.add(rs1.getInt("count"));
            }
            con.close();
        %>

<center>
<h1>
	Date : <%= mont%> , <%= yr%>
</h1>
</center>
    <script>
        var SalesData = [<%= join(Count, ",") %>];
        var ProductData = [<%= join(Day, ",") %>];
        
    window.onload = function()
    {
        zingchart.render
        ({
            id:"myChart",
            width:"100%",
            height:400,
            data:
            {
                "type":"bar",
                "title":
                {
                    "text":"Total"
                },
                "scale-x":
                {
                    "labels": ProductData
                },
                "plot":
                {
                    "line-width":1
                },
                "series":
                [
                    {
                      "values":SalesData
                    }
                ]
            }
        });
    };
    </script>
    <div id="myChart"></div>
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
