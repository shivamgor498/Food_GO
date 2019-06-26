<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>SIGNUP | FOODGO</title>
	<link rel="stylesheet" href="css/proj2.css">
	<script type="text/javascript" src="js/projSU.js"></script>
	<style type="text/css">
		.logbox{
			height: 710px;
			margin-top : 30px;
			margin-bottom : 50px;
		}
		.sidebox{
	    margin-top: 15px;
	    padding-top: 5px;
	    padding-left: 5px;
		}

	</style>
</head>
<body class="bod">
	<div class="logbox">
		<img src="images/l1.png" class="user">
			<br><br>
		<h2 class="h22">Sign Up</h2>
		<center><span style="color:#8eb640; size:30px ">${param.exist}</span></center>
		<form name="myform" method="post" action="SignUp" onsubmit="return validations()">
			<p>User Name : </p><input type="text" name="cname" placeholder="Enter your Name here" size="50" autocomplete="off">
			<p>Email : </p><input type="email" name="cemail" placeholder="Enter your Email here" size="50" autocomplete="off">
			<p>Contact : </p><input type="text" name="cphno" placeholder="Enter your Contact No. here" size="50" autocomplete="off">
			<p>Password : </p><input type="Password" name="cpass" placeholder="********" size="50">
			<input type="submit" name="" value="Sign Up">
			<pre  style="margin-left: 40px;">Already have account?  <a href="signin.jsp" class="su">Sign In</a>  here</pre>
		</form>
	</div>
	<div class="sidebox">
		<pre style="padding-left: 3%;">Have a Restaurant? <a href="rest_signup_location.jsp" class="su">Add </a>here!!!</pre>
	</div>
</body>
</html>