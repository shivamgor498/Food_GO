<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>SIGNIN | FOODGO</title>
	<link rel="stylesheet" href="css/proj2.css">
	<script type="text/javascript" src="js/projSI.js"></script>
	<style type="text/css">
		.logbox{
			height: 550px;
		}
	</style>
</head>
<body class="bod">
	<div class="logbox">
		<img src="images/l1.png" class="user">
			<br><br>
		<h2 class="h22">Sign In</h2>
		<center><span style="color:#8eb640; size:30px ">${param.wrong}</span></center>
		<center><span style="color:#8eb640; size:30px ">${param.sucess}</span></center>
		<form name="myform" method="post" action="Login" onsubmit="return validations()">
			<p>Email : </p><input type="Email" name="email" placeholder="Enter your Email here" size="50" autocomplete="off">
			<p>Password : </p><input type="Password" name="pass" placeholder="********" size="50">
			<input type="submit" name="" value="Sign In">
			<a href="f_pass_ph_num.jsp"><pre style="padding-left: 10%; color: yellowgreen">Forgot Password?</pre></a>
			<pre style="padding-left: 10%;">Don't have account?  <a href="cust_signup.jsp" class="su">Sign Up</a>  here</pre>
		</form>
	</div>
	
</body>
</html></center>
