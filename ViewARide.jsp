<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!doctype html>
<html>

    <head>
        <title>View Ride| RideRight</title>
        <meta name="viewport" content="width=device-width">
       <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
       
   <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script type="text/javascript" src="jquery.ui.timepicker.js?v=0.3.3"></script>
        <link rel="stylesheet" href="css/social.css">
        <link rel="stylesheet" href="css/htmlBody.css">
        <link rel="stylesheet" href="css/sidebar.css">        
        <link rel="stylesheet" href="css/RadioCheckBox.css">
        <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.min.css">  
         <link rel="stylesheet" href="css/a.css"> 
         
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
     
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }
      #map {
        margin-right: 400px;
      }
      #floating-panel {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }
      @media print {
        #map {
           margin: 0;
        }
        #right-panel {
          float: none;
          width: auto;
        }
      }
    </style>

   
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
      function initMap() {
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('right-panel'));

        var control = document.getElementById('floating-panel');
        control.style.display = 'block';
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

       
          calculateAndDisplayRoute(directionsService, directionsDisplay);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var start = document.getElementById('start').value;
        var end = document.getElementById('end').value;
        directionsService.route({
          origin: start,
          destination: end,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-kHUxcysO6MNNVBPA4xE1CXw0K6BmWZk&callback=initMap">
    </script>
        
    </head>

    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container1">
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
                        <% if (session.getAttribute("userID") == null) {%>
                        <li>
                            <a href="register.jsp">Register</a>
                        </li>
                        <%}%>
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
                    <div>
                                                  <div id="p"></div>
                        <BR>
                        <p id="">       From         : <%="" + request.getParameter("tripsource")%></p>                        
                       <p id="">          To         : <%="" + request.getParameter("tripdestination")%></p> 
                        <p id="driver">     Driver       : <%="" + request.getParameter("name")%></p>
                        <p id="driverEmail">Email        : <%="" + request.getParameter("emailid")%></p>
                        <p id="driverPhone">Phone        : <%="" + request.getParameter("mobileno")%></p>
                        <p id="car">        Type          : <%="" + request.getParameter("vehicletype")%></p>
                        <p id="stime">      Start time   : <%="" + request.getParameter("triptime")%></p>
                        <p id="etime">      Date:     : <%="" + request.getParameter("tripdate")%></p>
                        <p id="stime">      Amount   : <%="" + request.getParameter("amount")%></p> 
                        <p id="fuel">       Women Only         : <%="" + request.getParameter("womenonly")%></p>   
                          <p id="fuel">     Teacher Only         : <%="" + request.getParameter("teacheronly")%></p>   
                                          
     
                        <button type="button" class="btn btn-lg btn-success" onclick="window.location.href='welcome.jsp'">
                            Go Back
                        </button><br> <br><br>
                   <!--     <form id="calculate-route" name="calculate-route"  action="#" >
     <input type="hidden" id="from" name="from"  value="<%--= request.getParameter("tripsource")%>"size="30" />
     <!-- <a id="from-link" href="#">Get my position</a>-->
      <br />
      <input type="hidden" id="to" name="to"  value="<%=request.getParameter("tripdestination")--%>" size="30" />
     <!-- <a id="to-link" href="#">Get my position</a>-->
     <!-- <br />

                          <input class="btn btn-lg btn-success" type="submit" value="Show Route">   
                          </form>
     <div id="map" style="width:740px;height:520px;"></div>
    <p id="error"></p>-->
   
                </div>
            </div>
        </div> 
      <div id="floating-panel">
       <input type="hidden" value="<%= request.getParameter("tripsource")%>" id="start"/>
      <input type="hidden" value="<%= request.getParameter("tripdestination")%>" id="end"/>
      </div>
      
      <div id="right-panel"></div>
      <div id="map" style="width:740px;height:520px;"></div>
      
     <div id="down">
         <hr><footer><center>
            <p>All rights reserved &copy; RideRight 2018</p>
            <p>Developed By: Durga Parulekar & Diana Elavia</p>
            <p>Contact Us &nbsp:&nbsp;&nbsp;ride1right@gmail.com 
                    </p></center>
        </footer>
     </div>                                 
     
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


