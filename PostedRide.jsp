<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <title>Posted Ride | RideRight</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
     <!--  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-kHUxcysO6MNNVBPA4xE1CXw0K6BmWZk&callback=initMap"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>-->
        <link rel="stylesheet" href="css/social.css">
        <link rel="stylesheet" href="css/htmlBody.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/RadioCheckBox.css">
         <link rel="stylesheet" href="css/a.css">
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
         <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-kHUxcysO6MNNVBPA4xE1CXw0K6BmWZk&libraries=places&callback=calculateRoute"
        async defer></script>
   <!-- <script src="http://maps.google.com/maps/api/js?sensor=true"></script>-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
      function calculateRoute(from, to) {
        // Center initialized to Naples, Italy
        var myOptions = {
          zoom: 10,
          center: new google.maps.LatLng(19.089373, 72.835061),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        // Draw the map
        var mapObject = new google.maps.Map(document.getElementById("map"), myOptions);

        var directionsService = new google.maps.DirectionsService();
        var directionsRequest = {
          origin: from,
          destination: to,
          travelMode: google.maps.DirectionsTravelMode.DRIVING,
          unitSystem: google.maps.UnitSystem.METRIC
        };
        directionsService.route(
          directionsRequest,
          function(response, status)
          {
            if (status == google.maps.DirectionsStatus.OK)
            {
              new google.maps.DirectionsRenderer({
                map: mapObject,
                directions: response
              });
            }
            else
              $("#error").append("Unable to retrieve your route<br />");
          }
        );
      }

      $(document).ready(function() {
        // If the browser supports the Geolocation API
        if (typeof navigator.geolocation == "undefined") {
          $("#error").text("Your browser doesn't support the Geolocation API");
          return;
        }

        $("#from-link, #to-link").click(function(event) {
          event.preventDefault();
          var addressId = this.id.substring(0, this.id.indexOf("-"));

          navigator.geolocation.getCurrentPosition(function(position) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({
              "location": new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
            },
            function(results, status) {
              if (status == google.maps.GeocoderStatus.OK)
                $("#" + addressId).val(results[0].formatted_address);
              else
                $("#error").append("Unable to retrieve your address<br />");
            });
          },
          function(positionError){
            $("#error").append("Error: " + positionError.message + "<br />");
          },
          {
            enableHighAccuracy: true,
            timeout: 10 * 1000 // 10 seconds
          });
        });

        $("#calculate-route").submit(function(event) {
          event.preventDefault();
          calculateRoute($("#from").val(), $("#to").val());
        });
      });
    </script>
    </head>

    <body onload="initialize()">
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

                    <br>
                    <form method="post" action="post.jsp">
                         
                        <p id="From">FROM : <%="" + request.getParameter("FromInput")%></p>
                        <p id="To">  TO   : <%="" + request.getParameter("ToInput")%></p>
                        <p id="">      CAR CAPACITY  : <%="" + request.getParameter("spareseats")%></p>
                        <p id="">      WAY  : <%="" + request.getParameter("way")%></p>
                        <p id="">      DATE  : <%="" + request.getParameter("tripdate")%></p>
                        <p id="">      TIME  : <%="" + request.getParameter("triptime")%></p>
                         <p id="">      AMOUNT  : <%="" + request.getParameter("amount")%></p>
                        <p id="">      WOMEN ONLY  : <%="" + request.getParameter("womenonly")%></p>
                         <p id="">      TEACHER ONLY  : <%="" + request.getParameter("teacheronly")%></p>
                        
                        <p id="">      VEHICLE TYPE  : <%="" + request.getParameter("vehicletype")%></p>
                        <p id="">     VEHICLE MODEL  : <%="" + request.getParameter("vehiclemodel")%></p>
                        
                        <p id="">      DESCRIPTION  : <%="" + request.getParameter("description")%></p>
                           
                        <div id="po"></div>

                        <input type="hidden" name="FromInput" value="<%="" + request.getParameter("FromInput")%>"/>
                        <input type="hidden" name="ToInput" value="<%="" + request.getParameter("ToInput")%>"/>
                        <input type="hidden" name="spareseats" value="<%="" + request.getParameter("spareseats")%>"/>
                        <input type="hidden" name="way" value="<%="" + request.getParameter("way")%>"/>
                        <input type="hidden" name="tripdate" value="<%="" + request.getParameter("tripdate")%>"/>
                        <input type="hidden" name="triptime" value=" <%="" + request.getParameter("triptime")%>"/>
                        <input type="hidden" name="amount" value=" <%="" + request.getParameter("amount")%>"/>
                        <input type="hidden" name="womenonly" value=" <%="" + request.getParameter("womenonly")%>"/>
                        <input type="hidden" name="teacheronly" value=" <%="" + request.getParameter("teacheronly")%>"/>
                        <input type="hidden" name="vehicletype" value=" <%="" + request.getParameter("vehicletype")%>"/>                                               
                        <input type="hidden" name="vehiclemodel" value="<%="" + request.getParameter("vehiclemodel")%>"/>
                        <input type="hidden" name="description" value="<%="" + request.getParameter("description")%>"/>
                       
                        <button type="submit" class="btn btn-lg btn-success">
                            <i class="glyphicon glyphicon-check"></i>&nbsp;&nbsp;Save Post Ride
                        </button>
                        <button type="button" id="cancel" class="btn btn-lg btn-warning" onclick="window.location.href='postride.jsp'">
                            <i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;&nbsp;&nbsp;Cancel
                        </button>
                        <script>
                        $("cancel").onclick = function() {
                            location.href = "postride.jsp";
                        };
                        </script>
                    </form>
                       
                    
                </div>
            </div>
        </div>
                        <div>
                            <form id="calculate-route" name="calculate-route"  method="get">
      
      <input type="hidden" id="from" name="from"  value="<%= request.getParameter("FromInput")%>"size="30" />
     <!-- <a id="from-link" href="#">Get my position</a>-->
      <br />

     
      <input type="hidden" id="to" name="to"  value="<%= request.getParameter("ToInput")%>" size="30" />
     <!-- <a id="to-link" href="#">Get my position</a>-->
      <br />

      <input type="submit" value="Click to see the route on the Map" />
      
    </form>
    <div id="map" style="width:740px;height:520px;"></div>
    <p id="error"></p>
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


