
<!doctype html>
<html>
    <head>
        <title>Contact Us | RideRight</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/social.css">
        <link rel="stylesheet" href="css/htmlBody.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/table.css">
        <link rel="stylesheet" href="css/RadioCheckBox.css">
        <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.min.css"> 
        <link rel="stylesheet" href="css/a.css"> 
        <script type="text/javascript">
            <%if(session.getAttribute("userID")!=null){%>
            function load(url, callback) {
                var xmlhttp;
                if (window.XMLHttpRequest)
                    xmlhttp = new XMLHttpRequest();
                else
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
                        callback(xmlhttp.responseText);
                    }
                };
                xmlhttp.open('GET', url);
                xmlhttp.send();
            }
            window.onload = function() {
                load('GetMessages.jsp', function(response) {
                });
            };
            <%}%>
      
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
        <% int dele = request.getParameter("s") == null ? 0 : Integer.parseInt(("" + request.getParameter("s")).trim());
            if (dele == 1) {
        %>
        <script type="text/javascript">
            $(window).load(function() {
                $('#SentModal').modal('show');
            });
        </script>
        <%}%>
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
                       
                        <li>
                            <a href="faqs.jsp">FAQ's</a>
                        </li>
                        <li class="active">
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
                    <% if (session.getAttribute("userID") != null) {%>
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
                    <%} else {%>
                
                    <%}%>
                </div>
            </div>
        </div>
                <br>
        <div class="row">
            <% if (session.getAttribute("userID") != null) {%>
            <div class="col-md-0">
                
                    <ul id="css3menu1" class="topmenu">
                        <nav>
                            <li class="topfirst"><a href="welcome.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-dashboard"></i>&nbsp;&nbsp;&nbsp;&nbsp;DASHBOARD</a></li>
                            <li class="topmenu"><a  href="searchride.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;SEARCH RIDE</a></li>
                            <li class="topmenu"><a  href="postride.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-map-marker"></i>&nbsp;&nbsp;&nbsp;&nbsp;POST RIDE</a></li>
                            <li class="topmenu"><a  href="viewAllRides.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-road"></i>&nbsp;&nbsp;&nbsp;&nbsp;VIEW ALL RIDES</a></li>
                        <li class="topmenu"><a  href="viewRequests.jsp" style="width:200px;height:50px;line-height:20px;"><i class="glyphicon glyphicon-road"></i>&nbsp;&nbsp;&nbsp;&nbsp;VIEW REQUESTS</a></li>
                              </nav>
                    </ul>
              
            </div>
            <%}%>
            <div class="col-md-<% if (session.getAttribute("userID") != null) {%>7<%} else {%>12<%}%>">
                <div class="container1"><br>                    
                    <form method="post" action="feedback.jsp">
                        
                        <b><font size="8"><h3>CONTACT US /FEEDBACK</h3></font></b>
                        <input required type="text" name="name" class="form-control" placeholder="FirstName LastName"><br>
                        <input required type="email" name="email" class="form-control" placeholder="Your Email-id"><br>
                        <textarea required class="form-control"  name="message" placeholder="Enter your message here..."></textarea><br>

                        <center><button class="btn btn-success btn-lg" type="submit"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;&nbsp;Submit !</button></center>
                    </form>  
                    <p><font size="5">Any question about carpooling? Looking for a carpooling solution?</font><br><br>
                        <font size="4">
                        For Queries Contact<br><br>
                         :&nbsp:&nbsp;&nbsp;ride1right@gmail.com <br>
                        
                    </p>
               <hr><footer><center>
            <p>All rights reserved &copy; RideRight 2018</p>
            <p>Developed By: Durga Parulekar & Diana Elavia</p>
            <p>Contact Us &nbsp:&nbsp;&nbsp;ride1right@gmail.com 
                    </p></center>
        </footer>
                </div>
            </div>
        </div><!-- /container -->                
 <div class="modal fade" id="SentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="glyphicon glyphicon-remove"></i></button>
                        <h4 class="modal-title" id="myModalLabel">Sent Query !</h4>
                    </div>
                    <div class="modal-body">
                        <p>Your Query has been sent to the website Administrator !!!</p>
                        <a href="welcome.jsp"><button type="button" class="btn btn-success btn-lg" data-dismiss="modal">OK</button></a>
                    </div>      
                </div>
            </div>
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


