<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>    
    <head>
        <title>Help? | RideRight</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/social.css">
         <link rel="stylesheet" href="css/a.css">
        <link rel="stylesheet" href="cssc/htmlBody.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/table.css">
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
        </div><br>
        <div class="row">
            <div class="col-md-1">
                
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
            <div class="col-md-8 col-md-push-1">
                
                    <div class="row">
                     <div class="col-md-8" style="left:130px;">		
	    <center><b><font size="8"><h3>HELP</h3></font></b></center>
	   <p>
	   If you have any questions, suggestions or problems relating to this website, please send an email to <a href="#">ride1right@gmail.com</a>
	   </p>
	  </div>
          </div>
          
	<br>

	<div class="row">
          <div class="col-md-8" style="left:130px;">
                      <center><b><font size="8"><h3>DISCLAMER</h3></font></b></center>
	
           <p>Design and the persons associated with this website do not take any responsibility for any
           happenings, good or bad, which might occur as a result of sharing a ride with someone you  
	   do, or do not know.</p><br>

	   <p>This website is simply an effort to make it easier for people to put up last minute postings
	   requesting rides or passengers to help reduce the number of cars on the roads and to help
           reduce the emission of gases.</p><br>

	   <p>Also, any attempt to use information obtained from this website for advertising or marketing 
	   purposes is forbidden. No one wants to receive unsolicited junk so please do not attempt to collect
	   contact details from this website. All visits to this website are logged.</p>
           </div>
          </div>
                     <hr><footer><center>
            <p>All rights reserved &copy; RideRight 2018</p>
            <p>Developed By: Durga Parulekar & Diana Elavia</p>
            <p>Contact Us &nbsp:&nbsp;&nbsp;ride1right@gmail.com 
                    </p></center>
        </footer>
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
