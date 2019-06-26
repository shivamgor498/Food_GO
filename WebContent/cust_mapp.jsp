<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link rel="stylesheet" href="css/map.css">
	<script src="js/geo1.js"></script>
	<title>Welcome To FoodGo !!</title>
	<style>
		.search_categories .select select{
		  font-size: 13px;
		  padding: 10px 8px 10px 14px;
		  background: #fff;
		  border: 1px solid #ccc;
		  border-radius: 6px;
		  overflow: hidden;
		  position: relative;
		}
		
		.search_categories .select{
		  width: 20%;
		  background:url('arrow.png') no-repeat;
		  background-position:80% center;
		}
		
	</style>
</head>
<body>

	
	<%@page import="java.sql.*"%>
	<%@page import="com.Food.Dao.Get_connection"%>
	
	<%
		Statement statement = null;
		ResultSet resultSet = null;

		Get_connection obj = new Get_connection();
		Connection con = obj.get();
	
		try
		{ 	
			statement=con.createStatement();
			String sql="SELECT * FROM journey";
			resultSet = statement.executeQuery(sql);
	%>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<b>Start:</b>
			<span class="search_categories">
    			<span class="select">
				<select id="start">
		        <%  while(resultSet.next()){ %>
		            <option value="<%=resultSet.getString("gplace")%>"><%=resultSet.getString("place")%></option>
		        <% } %>
	       		 </select>
	       		 </span>
	       	</span>
    <%
		}
		catch (Exception e) {
		e.printStackTrace();
		}
	%>
	<%	
		try
		{ 
			statement=con.createStatement();
			String sql="SELECT * FROM journey";
			resultSet = statement.executeQuery(sql); 
	%>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b>End: </b>
		<span class="search_categories">
    		<span class="select">
				<select id="end">
				  <%  while(resultSet.next()){ %>
		            <option value="<%=resultSet.getString("gplace")%>"><%=resultSet.getString("place") %></option>
		          <% } %>
		        </select>	
		    </span>
		</span>	  
	<%
			}
			catch (Exception e) {
			e.printStackTrace();
			}
	%>
	<script>

		var map;
		var infowindow;
		function initMap() {
		 var loc = {lat: 18.5204, lng: 73.8567};

		  map = new google.maps.Map(document.getElementById('map'), {
		    center: loc,
		    zoom: 12
		  });
			  
		  //Geolocation
			  infoWindow = new google.maps.InfoWindow;
			  
			//distance
				var directionsService = new google.maps.DirectionsService;
				var directionsDisplay = new google.maps.DirectionsRenderer;
				 directionsDisplay.setMap(map);

				  var onChangeHandler = function() {
				    calculateAndDisplayRoute(directionsService, directionsDisplay);
				  };
				  document.getElementById('start').addEventListener('change', onChangeHandler);
				  document.getElementById('end').addEventListener('change', onChangeHandler);  
			//restaurant

	<%
	  try
	  { 	
		statement=con.createStatement();
		String sql="SELECT * FROM restaurant";
		resultSet = null;
		resultSet = statement.executeQuery(sql);
			while(resultSet.next())
	        {         
				String name="";
				float lat,longi;
				lat  = resultSet.getFloat("rest_lat");
				longi = resultSet.getFloat("rest_long");
				name = resultSet.getString("rest_name");
	%>
				  var marker = new google.maps.Marker({
				    position: {lat: <%= lat %>,lng: <%= longi %>},
				    map: map,
				    title: '<%= name %>'
				  });
				  marker.addListener('click', function() {
				    infow.open(map, marker);
				  });
	<%
	        }//end of while
	  }
	catch (Exception e) {
		e.printStackTrace();
		}
	%>		
}//end of initimap
			  
			//distance
			  function calculateAndDisplayRoute(directionsService, directionsDisplay) {
				  directionsService.route({
				    origin: document.getElementById('start').value,
				    destination: document.getElementById('end').value,
				    travelMode: 'DRIVING'
				  }, function(response, status) {
				    if (status === 'OK') {
				      directionsDisplay.setDirections(response);
				    } else {
				      window.alert('Directions request failed due to ' + status);
				    }
				  });
				}
			  
			//Geolocation
			function handleLocationError(browserHasGeolocation, infoWindow, pos) {
			  infoWindow.setPosition(pos);
			  infoWindow.setContent(browserHasGeolocation ?
			                        'Error: The Geolocation service failed.' :
			                        'Error: Your browser doesn\'t support geolocation.');
			  infoWindow.open(map);
			}
		</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPek9FKLxZHoJM9PwsVdD5uZGJoP6m74g&libraries=places&callback=initMap"></script>
		<br><br><div class="intro-text" id="map">	</div>
		
</body>
</html>