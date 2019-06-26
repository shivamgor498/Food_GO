	var lat1=18.5618;
	var longi1=73.9169;
	var name="Incognito";
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

		  //HTML5 geolocation.
		  if (navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(function(position) {
		      var pos = {
		        lat: position.coords.latitude,
		        lng: position.coords.longitude
		      };

		      infoWindow.setPosition(pos);
		      infoWindow.setContent('You are here.');
		      infoWindow.open(map);
		      map.setCenter(pos);
		    }, function() {
		      handleLocationError(true, infoWindow, map.getCenter());
		    });
		  } else {
		    // Browser doesn't support Geolocation
		    handleLocationError(false, infoWindow, map.getCenter());
		  }
		  
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
			  var mark = {lat: lat1, lng: longi1};
			  var contentString = name;

			  var infow = new google.maps.InfoWindow({
			    content: contentString
			  });

			  var marker = new google.maps.Marker({
			    position: mark,
			    map: map,
			    title: 'Uluru (Ayers Rock)'
			  });
			  marker.addListener('click', function() {
			    infow.open(map, marker);
			  });
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