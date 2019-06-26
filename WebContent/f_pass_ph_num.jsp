<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>FORGOT_PASSWORD | FOODGO</title>
  <link rel="stylesheet" href="css/proj1.css">
  <script type="text/javascript" src="js/projFP.js"></script>
  <style>
  	.logbox{
  		height : 420px;
  	}
  </style>
</head>
<body class="bod">
  <div class="logbox">
    <img src="images/l1.png" class="user">
      <br><br>
    <h2 class="h22">Forgot Password</h2>
    <center><span style="color:#8eb640; size:30px ">${param.wrong}</span></center>
    <form name="myform" method="post" action="F_pass_ph_num" onsubmit="return validations()">
      <pre style="color: white; font-size: 17px;margin-left: 40px;">Please Enter your Phone number below &
we will send you information of password.</pre>
      <p>Mobile Number : </p><input type="text" name="ph_no" placeholder="Enter your Phone number here" size="50">      
      <input type="submit" value="Submit">
      <pre  style="margin-left: 40px;">Complete action using email..  <a href="f_pass_email.jsp" class="su">Click here</a>  here</pre>
    </form>
  </div>
  <br>
  </body>
</html>
