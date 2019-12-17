<%-- 
    Document   : createRide
    Created on : 22 Jan, 2018, 11:34:59 AM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <img src="Ride-Right-Logo1.png" alt="logo" align="left" style="width:200px;height:100px;"></h1>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

         <!-- css link -->
           <link rel="stylesheet" type="text/css" href="s2.css" />
         <link href="addnewcar.css" rel="stylesheet" type="text/css"/>
       
         <title>Create a Ride</title>
    </head>
    <body bgcolor="black">
        
        
        <div class="container-fluid form-section">
            <form  class="form-horizontal" name="createRideform" action="" method="post">
                
                <div class="form-group">
                    <label  class="col-md-5 control-label">Source</label>
                    <div class="col-md-3">
                        <input type="text" name="tripsource" class="form-control" required> 
                    </div>
                </div>
                
                <div class="form-group">
                    <label  class="col-md-5 control-label">Destination</label>
                    <div class="col-md-3">
                        <input type="text" name="tripdestination" class="form-control" required> 
                    </div>
                </div>
                
               
                
                        <div class="form-group">
                    <label for="inputCarTrans" class="col-md-5 control-label">Vehicle Type:</label>
                    <div class="col-md-3">
                        <label class="radio-inline">
                            <input type="radio" name="vehicletype" value="car" required>Car
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="vehicletype" value="bike" required>Bike
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="vehicletype" value="scooter" required>Scooter
                        </label>
                    </div>
                </div>
                
                
                
                <div class="form-group">
                    <label class="col-md-5 control-label">Date: </label>
                    <div class="col-md-3">
                        <input type="text" name="tripdate" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-5 control-label"> Time</label>
                    <div class="col-md-3">
                        <input type="text" name="triptime" class="form-control" required>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label  class="col-md-5 control-label"></label>
                    <div class="col-md-3">
                           <label class="radio-inline">
                            <input type="radio" name="way" value="oneway">One Way Trip
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="way" value="bothway">Return Trip
                        </label>
                    </div>
                </div>
                <div class="form-group">
                   <label  class="col-md-5 control-label"></label>
                    <div class="col-md-3">
                        <label class="radio-inline">
                            <input type="radio" name="womenonly" value="womenonly">Women Only
                        </label>
                               </div>
                </div>
                <div class="form-group">
                   <label  class="col-md-5 control-label"></label>
                    <div class="col-md-3">
                        <label class="radio-inline">
                            <input type="radio" name="teacheronly" value="teacheronly">Staff Only
                        </label>
                               </div>
                </div>
                
                <div class="form-group">
                    <label  class="col-md-5 control-label"> Description</label>
                    <div class="col-md-3">
                        <input type="text" name="description" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-md-5 control-label">Cost of Trip </label>
                    <div class="col-md-3">
                        <input type="text" name="amount" class="form-control" required>
                    </div>
                </div>
               
        
                <div class="container-fluid button-section">
                    <div class="row">
                        <div class="col-md-12 text-center">
                          <button type="submit" class="btn btn-success" name="create" value="Create Ride">Create Ride</button>
                        </div>
                    </div>
                </div>
                
            </form>
        </div>

        <div class="container-fluid home-section">
            <div class="row">
                <div class="col-md-12 text-center">
                    <a href="index.jsp" class="hover-link">Back to Home</a>
                </div>
            </div>
        </div>
        
        
        
        
          
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
