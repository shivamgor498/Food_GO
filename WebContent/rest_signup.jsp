<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Restaurant Add | FOODGO</title>
	<link rel="stylesheet" href="css/rest.css">
	<script type="text/javascript" src="js/projSI.js"></script>
	<style type="text/css">
		.logbox{
			height: 1000px;
		}
	</style>
</head>
<body class="bod">
	<div class="logbox">
		<img src="images/l1.png" class="user">
			<br><br>
		<h2 class="h22">ADD YOUR RESTAURANT</h2>
		<form name="myform" method="post" enctype="multipart/form-data" action="Register" onsubmit="return validations()">
			<div>
				<input name="rest_name" type="text" placeholder="Name Of Restaurant..." required size="50">
			</div><br>
			<div>
				<input name="rest_addr" type="text" readonly="readonly" placeholder="Address of Restaurant..." size="50"  value="<%= request.getParameter("venue") %>" required>
			</div><br>
			<div>
				<label>Opening time</label><input name="rest_open" type="time" placeholder="Opening Time" step="2" required>
			</div><br>
			<div>
				<label>Closing time</label><input name="rest_close" type="time" placeholder="Closing Time" step="2" required>
			</div><br>
			<div>
				<input name="rest_pricet" type="text" placeholder="Price for Two..." required size="50">
			</div><br>
			<div>
				<input name="rest_phno" type="text" placeholder="Contact..." required size="50">
			</div><br>
			<div>
				<input name="rest_rating" type="text" placeholder="Rating..." required size="50">
			</div><br>
			<div>
				<input name="rest_email" type="email" placeholder="Email of Restaurant..." required size="50">
			</div><br>
			<div>
				<input name="rest_pass" type="password" placeholder="Password..." required size="50">
			</div><br>
			<div>
			<input type="text" readonly="readonly" name="rest_lat"  size="50" id="lat">
	 		</div><br>
	 		<div>
	 		<input type="text" readonly="readonly" name="rest_long" size="50" id="lon">
	 		</div><br>
			<div>
				<!-- <input class="btn images" name="rimg" enctype="multipart/form-data" type="file" placeholder="Place Image Here..." required size="25"> -->
				<label class="fileContainer">Upload File Here!!<input type="file" name="rest_img" accept="image/*" required/></label>
			</div><br>
			<input type="submit" name="rsubmit" value="Sign In">
		</form>
	</div>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCPek9FKLxZHoJM9PwsVdD5uZGJoP6m74g&sensor=false"></script>
	<script type="text/javascript">
	
	var geocoder = new google.maps.Geocoder();
	var address = "<%= request.getParameter("venue") %>";
	
	geocoder.geocode( { 'address': address}, function(results, status) {
	
	if (status == google.maps.GeocoderStatus.OK) {
		var latitude = results[0].geometry.location.lat();
		var longitude = results[0].geometry.location.lng();
		document.getElementById("lat").value = latitude
		document.getElementById("lon").value = longitude
	    } 
	});
	</script>
</body>
</html></center>