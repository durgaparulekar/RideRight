<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <title>Post Ride | RideRight</title>
        <meta name="viewport" content="width=device-width">
        
        
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>                       
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
       
        <script type="text/javascript" src="timepicker/jquery.ui.timepicker.js?v=0.3.3"></script>
    <!--    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-kHUxcysO6MNNVBPA4xE1CXw0K6BmWZk&callback=initMap" ></script>-->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-kHUxcysO6MNNVBPA4xE1CXw0K6BmWZk&libraries=places&callback=initAutocomplete"
         async defer></script>
   <!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>-->
        <link rel="stylesheet" href="css/social.css">
        <link rel="stylesheet" href="css/htmlBody.css">
        <link rel="stylesheet" href="css/sidebar.css">   
         <link rel="stylesheet" href="css/a.css">   
        <link rel="stylesheet" href="css/RadioCheckBox.css">
        <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.min.css">
        
        <script type="text/javascript">                    
            function load(url,callback) {                        
                var xmlhttp;
                if (window.XMLHttpRequest) xmlhttp = new XMLHttpRequest();
                else xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

                xmlhttp.onreadystatechange = function () {
                  if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    callback(xmlhttp.responseText);
                  }
                };
                xmlhttp.open('GET', url);
                xmlhttp.send();
              }

           
              };            
        </script>
         <script type="text/javascript">
            function validateForm() {
                return true;
            }

            function fuelTypeProcess() {
                if (document.calculator.fuelTypeCost[0].checked) {
                    document.calculator.fuelCost.value = 80.50;
                }
                else {
                    document.calculator.fuelCost.value = 65.5;
                }
               
            }

                 function calculateExpense() {
                var f = document.calculator;
               // var maintenanceCost = f.maintenanceCost.value;
                var fuelCost = f.fuelCost.value;
                var mileage = f.mileage.value;
               // var noOfDays = f.noOfDays.value;
                var kmsDay = f.kmsDay.value;
                var parkingCost = f.parkingCost.value;
                var costPerDay=((fuelCost/mileage)* kmsDay + parkingCost)/2;
           //     var costPerDay = (kmsDay / mileage * fuelCost) * kmsDay + parkingCost * 1;
                var result = costPerDay;

//         result += parkingCost * noOfDays;
                result = Math.round(result);
                document.getElementById("costM").innerHTML = result;
                document.getElementById("costY").innerHTML = result * 2;

                            }
            function isCar() {
                return document.calculator.vehichleType[0].checked;
            }

        </script>
      <script>
            $(function() {
                var date = new Date();
                var currentMonth = date.getMonth();
                var currentDate = date.getDate();
                var currentYear = date.getFullYear();
                $("#sdate").datepicker({
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    minDate: new Date(currentYear, currentMonth, currentDate),
                    onSelect: function(selected) {
                        $("#edate").datepicker("option", "minDate", selected);
                    }
                });
            });

        </script>        
              


          
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
   <script>
      
      function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
             center: new google.maps.LatLng(19.089373, 72.835061),
        //  center: {lat: -33.8688, lng: 151.2195},
          zoom: 10,
          mapTypeId: 'roadmap'
        });
         var map2 = new google.maps.Map(document.getElementById('map2'), {
          center: new google.maps.LatLng(19.089373, 72.835061),
        //  center: {lat: -33.8688, lng: 151.2195},
          zoom: 10,
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
              url: place.icon && 'http://entryworks.com/map_markers_poi/home.png',
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
              url: place.icon && 'http://chart.apis.google.com/chart?chst=d_map_pin_letter_withshadow&chld=TO|52BE0A|000000' ,
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
      function backspaceAlpha(e) {
                var key;
                if (window.event)
                    key = window.event.keyCode;     //IE
                else
                    key = e.which;     //firefox
                if (key >= 48 && key <= 57)
                    return true;
                else
                    return false;
            }           
            function backspaceAll(e) {
                return false;
            }       

    </script>
        
    </head>

    <body>
         <% if (session.getAttribute("userID") == null) {
            response.sendRedirect("index.jsp");
        }%>
        
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button><a class="navbar-brand" href="index.jsp">RideRight</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="welcome.jsp">Home</a>
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
                         <!--      <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tools<b class="caret"></b></a>
                            <ul class="dropdown-menu">-->
                                <li>
                                    <a href="#" data-toggle="modal" data-target="#CostCalc">Cost Calculator</a>
                                </li>
                          <!--  </ul>
                        </li>-->
                    </ul>
                    <p class="navbar-right">                                             
                        <div class="dropdown navbar-right" >
			<button type="button" class="btn dropdown-toggle navbar-right" id="dropdownMenu1" data-toggle="dropdown">
 			 <span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;<%="  " + session.getAttribute("userEmail")%>   
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
        </div>        <br>
        <div class="row">
            <div class="col-md-1">
                
                    <ul id="css3menu1" class="topmenu">
                        <nav>
                            <li class="topfirst"><a href="welcome.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-dashboard"></i>&nbsp;&nbsp;&nbsp;&nbsp;DASHBOARD</a></li>
                            <li class="topmenu"><a  href="searchride.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;SEARCH RIDE</a></li>
                            <li class="topmenu"><a  href="postride.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-map-marker"></i>&nbsp;&nbsp;&nbsp;&nbsp;POST RIDE</a></li>
                            <li class="topmenu"><a  href="viewAllRides.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-road"></i>&nbsp;&nbsp;&nbsp;&nbsp;VIEW ALL RIDES</a></li>
                        <li class="topmenu"><a  href="viewRequests.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-road"></i>&nbsp;&nbsp;&nbsp;&nbsp;VIEW ALL REQUESTS</a></li>
  </nav>
                    </ul>
               
            </div>
            <div class="col-md-7 col-md-push-1">
                <div class="container1">
                    <p>Hi, <%=" " + session.getAttribute("userName")%></p>
                    <h3>Post ride</h3>                    
                    <form onsubmit="return invalidateChecks()" method="post" action="PostedRide.jsp">
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
                       
                        <input type="hidden" name="homelat" id="homelat"/>
                        <input type="hidden" name="officelat" id="officelat"/>
                        <input type="hidden" name="homelng" id="homelng"/>
                        <input type="hidden" name="officelng" id="officelng"/>
                        <BR>
                        
                        <div class="row">
                            <div class="form-group col-md-7">
                                Capacity of Car:<BR>
                                     
                               <input checked name="spareseats" type="radio" value="2" id="carcap2" class="radio-inline"/><label for="carcap2">2</label>
                                <input name="spareseats" type="radio" value="3" id="carcap3" class="radio-inline"/><label for="carcap3">3</label>
                                <input name="spareseats" type="radio" value="4" id="carcap4" class="radio-inline"/><label for="carcap4">4</label>
                                <input name="spareseats" type="radio" value="5" id="carcap5" class="radio-inline"/><label for="carcap5">5</label>
                                           
                            </div>
                        </div>
                       <div class="row">
                            <div class="form-group col-md-7">
                                Way:<BR>
                                <input checked name="way" type="radio" value="oneway" id="oneway" class="radio-inline"/><label for="oneway">One Way</label>
                                <input name="way" type="radio" value="returnway" id="returnway" class="radio-inline"/><label for="returnway">ReturnWay</label>
                                
                                              
                            </div>
                        </div>
                         <table>
                            <tr><td>
                                    <div class="row">
                                        Date:
                                        <div class="form-group col-md-12 ">
                                            <input type="text" name="tripdate" id="sdate" placeholder="Date" class="form-control" onkeypress="return backspaceAll(event)" required/>                    
                                        </div>
                                    </div>
                                </td></tr>
                        </table>
                        
                        <table>
                            <tr><td>
                                    <div class="row">
                                        <div class="form-group col-md-12 ">
                                             <input  type="text" id="stime" name="triptime" class="form-control" placeholder="Start Time" onkeypress="return backspaceAll(event)"   required/>
                                           
                                            <script>
                                                 $(function() {
                var time = new Date();
                var currentHours = time.getHours();
                var currentMinutes = time.getMinutes();
                var currentSeconds = time.getSeconds();
                $("#stime").timepicker({
                      validateOnBlur : true,
                         minTime: new Date(currentHours, currentMinutes, currentSeconds),
                    onSelect: function(selected) {
                        $("#stime").timepicker("option", "minTime", selected);
                     
                    }
                });
            });
            
                                            </script>
                                        </div>
                                    </div>

                                </td></tr>
                        </table>
                        <div class="row">
                                       Amount *(Can be calculated via Cost Calculator):
                                        <div class="form-group col-md-12 ">
                                            <input type="text" name="amount"  placeholder="Amount" class="form-control" onkeypress="return backspaceAlpha(event)" style="height:50px; width:200px;" required/> 
                                            <a href="#" data-toggle="modal" data-target="#CostCalc">Cost Calculator</a>
                                        </div>
                                    </div>

                        <br>
                        <div class="row">
                            <div class="form-group col-md-7">
                <input class="checkbox-inline" name="womenonly"  type="checkbox" id="womenonly" value="selected"><label for="womenonly">Women Only</label>
                                </div>
                            </div>            
                            
                        
                            <div class="row">
                            <div class="form-group col-md-7">
                               
                                <input class="checkbox-inline" name="teacheronly"  type="checkbox" id="teacheronly" value="selected"><label for="teacheronly">Teacher Only</label>
                                 </div>
                        </div>                      
                           
                         <div class="row">
                            <div class="form-group col-md-7 ">
                                <select name="vehicletype" class="form-control"  required>
                                    <option value="-1">--Type of Vehicle--</option>  
                                    <option value="car" selected>Car</option>
                                    <option value="scooter">Scooter</option>
                                    <option value="bike">Bike</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group col-md-7 ">
                                <select name="vehiclemodel" class="form-control"  required>
                                   <option value="default">--Type--</option>
                                   <option value="audi">Audi</option>
                                   <option value="aprila">Aprilia</option>
                                   <option value="bajaj">Bajaj</option>
                                    <option value="bmw">BMW</option>
                                   <option value="chevrolet">Chevrolet</option>
                                   <option value="fiat">Fiat</option>
                                   <option value="ford">Ford</option>
                                    <option value="honda">Honda</option>
                                     <option value="hero">Hero</option>
                                    <option value="hyundai">Hyundai</option>
                                    <option value="ktm">KTM</option>
                                    <option value="mahindra">Mahindra</option>
                                    <option value="maruti">Maruti Suzuki</option>
                                      <option value="mercedes-benz">Mercedes-Benz</option>
                                     <option value="mitsubishi">Mitsubishi</option>
                                    <option value="nissan">Nissan</option>
                                     <option value="renault">Renault</option>
                                     <option value="skoda">Skoda</option>
                                    <option value="tata">Tata</option>
                                    <option value="toyota">Toyota</option>
                                    <option value="tvs">TVS</option>
                                    <option value="volkswagen">Volkswagen</option>
                                    <option value="volvo">Volvo</option>
                                    <option value="yamaha">Yamaha</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group col-md-7 ">
                                <p>Description:</p>
                                <textarea name="description" ></textarea>
                            </div></div>
                        
                        
                        <button type="submit" onclick="getVal()" class="btn btn-lg btn-success">
                            <i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post Ride
                        </button>
                         <button type="reset"  class="btn btn-lg btn-success">
                           Cancel
                        </button>
                    </form>
                    
                </div>
            </div>
        </div>  
                    <hr><footer><center>
            <p>All rights reserved &copy; RideRight 2018</p>
            <p>Developed By: Durga Parulekar & Diana Elavia</p>
            <p>Contact Us &nbsp:&nbsp;&nbsp;ride1right@gmail.com 
                
     
            </p></center>
        </footer>
        
        <div class="modal fade" id="CostCalc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="glyphicon glyphicon-remove"></i></button>
                        <h4 class="modal-title" id="myModalLabel">Cost Calculator !</h4>
                    </div>
                    <div class="modal-body">

                        <form action="" name="calculator" onsubmit="return validateForm()">
                            <table>
                                <tr>
                                    <td>Kms/day<b>(round trip)</b>:</td>
                                    <td><input value="20" type="text" name="kmsDay" class="form-control"></td>
                                </tr>

                                        <tr>
                                    <td>Kms/litre <b>(mileage)</b>:</td>
                                    <td><input value="12" type="text" name="mileage" class="form-control"></td>
                                </tr>
                                <tr>                                    
                                    <td>Fuel Type:</td>
                                    <td><input name="fuelTypeCost" type="radio" id="fuelType1" value="petrol" checked onclick="fuelTypeProcess()" class="radio-inline"><label for="fuelType1">Petrol</label></input>                                                                                
                                        <input name="fuelTypeCost" type="radio" id="fuelType2" value="diesel" onclick="fuelTypeProcess()" class="radio-inline"><label for="fuelType2">Diesel</label></input>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cost of fuel/litre: <b>(in Rs)</b></td>
                                    <td><input type="text" name="fuelCost" value="80.5" class="form-control"/></td>
                                </tr>

                               
                                <tr>
                                    <td>Daily parking cost:<b>(if any) (in Rs)</b>)</td>
                                    <td><input value="10" type="text" name="parkingCost" class="form-control"/></td>
                                </tr>

                                <input type="hidden" name="calculate">
                                <tr>

                                    <td><br><button type="button" onclick="calculateExpense()" value="Calculate Cost" class="btn btn-default">Calculate Cost</button></td>

                                </tr>
                            </table>
                        </form>
                        <br>
                        

                        <div style="display:inline;">
                            <b style="color:green;">Total Cost Incurred</b><br><br>

                            <b>One trip: Rs. <span id="costM">0.0</span></b> <br>
                            <b>Round trip : Rs. <span id="costY">0.0</span> </b>
                        </div>

                       
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html> 

