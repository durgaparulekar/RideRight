<%-- 
    Document   : searchRideTrial
    Created on : 21 Feb, 2018, 8:13:38 PM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Ride | RideRight</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>        
         <link rel="stylesheet" href="css/social.css">
        <link rel="stylesheet" href="css/htmlBody.css">
        <link rel="stylesheet" href="css/sidebar.css">        
        <link rel="stylesheet" href="css/RadioCheckBox.css">
                 <link rel="stylesheet" href="css/a.css">   

        <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.min.css">
         <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map  {
        height: 90%;
        width: 80%;
      }
      #map2{
          height:90%;
          width:70%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 200px;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }
    
      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }
      #pac-input2{
          
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }
      #pac-input2:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
      }
    </style>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-kHUxcysO6MNNVBPA4xE1CXw0K6BmWZk&libraries=places&callback=initAutocomplete"
         async defer></script>
         <script>
      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13,
          mapTypeId: 'roadmap'
        });
         var map2 = new google.maps.Map(document.getElementById('map2'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13,
          mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var input2 = document.getElementById('pac-input2');
       
        var searchBox = new google.maps.places.SearchBox(input);
        var searchBox2 = new google.maps.places.SearchBox(input2);
       
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map2.controls[google.maps.ControlPosition.TOP_LEFT].push(input2);
        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });
         map2.addListener('bounds_changed', function() {
          searchBox2.setBounds(map2.getBounds());
        });
        var markers = [];
        var markers2=[];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
        
         searchBox2.addListener('places_changed', function() {
          var places2 = searchBox2.getPlaces();

          if (places2.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers2.forEach(function(marker) {
            marker.setMap(null);
          });
          markers2 = [];

          // For each place, get the icon, name and location.
          var bounds2 = new google.maps.LatLngBounds();
          places2.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers2.push(new google.maps.Marker({
              map: map2,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds2.union(place.geometry.viewport);
            } else {
              bounds2.extend(place.geometry.location);
            }
          });
          map2.fitBounds(bounds2);
        });
      }

    </script>
       
    </head>
    <body>
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container1">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button><a class="navbar-brand" href="homepage.jsp">RideRight</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="works.jsp">How it works ?</a>
                        </li>
                        
                        <li>
                            <a href="faqs.jsp">FAQ's</a>
                        </li>
                        <li>
                            <a href="contact.jsp">Contact</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tools<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                             <!--       <a href="#" data-toggle="modal" data-target="#CostCalc">Cost Calculator</a>-->
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <p class="navbar-right">                                             
                    <div class="dropdown navbar-right" >
                        <button type="button" class="btn dropdown-toggle navbar-right" id="dropdownMenu1" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;<%="  "+session.getAttribute("userEmail")%>   
                        </button>  
                        <ul class="dropdown-menu navbar-right" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="EditProfile.jsp"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;Edit Profile</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="help.jsp"><i class="glyphicon glyphicon-question-sign"></i>&nbsp;&nbsp;Help</a></li> 
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="logout.jsp"><i class="glyphicon glyphicon-off"></i>&nbsp;&nbsp;Logout</a></li>
                        </ul>
                    </div>
                    </p>
                </div><!--/.navbar-collapse -->
            </div>
        </div>        
                        <br>
                         <div class="row">
            <div class="col-md-1">
                
                    <ul id="css3menu1" class="topmenu">
                        <nav>
                            <li class="topfirst"><a href="welcome.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-dashboard"></i>&nbsp;&nbsp;&nbsp;&nbsp;DASHBOARD</a></li>
                            <li class="topmenu"><a  href="searchride.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;SEARCH RIDE</a></li>
                            <li class="topmenu"><a  href="postride.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-map-marker"></i>&nbsp;&nbsp;&nbsp;&nbsp;POST RIDE</a></li>
                            <li class="topmenu"><a  href="viewAllRides.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-road"></i>&nbsp;&nbsp;&nbsp;&nbsp;VIEW ALL RIDES</a></li>
                            <li class="topmenu"><a  href="messages.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;&nbsp;&nbsp;MESSAGES<span class="badge red"><%=session.getAttribute("NumMessages")%></span></a></li>
                        </nav>
                    </ul>
               
            </div>
            <div class="col-md-7 col-md-push-1">
                <div class="container1">
                    <p>Hi, <%=" " + session.getAttribute("userName")%></p>
                    <h3>Search ride</h3>
                    <form onsubmit="return invalidateChecks();" method="post" action="ViewSpecificRide.jsp" > 
        <table>
            <tr>
                 <td>
                                  <div class="row">
                                      <div class="form-group col-md-12 ">
                                        <input id="pac-input" name="FromInput" class="controls" type="text" placeholder="Enter Source location" required>
                                        <div id="map" style="width:425px;height:300px;border:solid black 1px;"></div>
                              </div></div>
                                      </td>
                                       <td>
                                  <div class="row">
                                       <div class="form-group col-md-12 ">
                                 
                 <input id="pac-input2" class="controls" name="ToInput" type="text" placeholder="Enter Destination location" required>
                          <div id="map2" style="width:425px;height:300px;border:solid black 1px;"></div>
                                       </div></div>
                                      </td>
            </tr>
        </table>
                        <button type="submit" onclick="getVal();" class="btn btn-lg btn-success">
                            <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;Search Ride
                        </button>
                    </form>
                   
                </div>
            </div>
        </div>
              
    </body>
</html>
