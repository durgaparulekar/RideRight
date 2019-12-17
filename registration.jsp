<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="s2.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript">
            reqObj = null;
            function verify() {
                document.getElementById("EmailExists").innerHTML = "Checking";
                if (window.XMLHttpRequest) {
                    reqObj = new XMLHttpRequest();
                } else {
                    reqObj = new ActiveXObject("Microsoft.XMLHTTP");
                }
                reqObj.onreadystatechange = process;
                reqObj.open("GET", "CheckIfEmailExists.jsp?val=" + document.getElementById("emailid").value, true);
                reqObj.send();
            }
            function process() {
                if (reqObj.readyState === 4) {
                    document.getElementById("EmailExists").innerHTML = reqObj.responseText;
                    if (document.getElementById("emailid").value === "") {
                        document.getElementById("EmailExists").innerHTML = "";
                    }
                    var che = '' + reqObj.responseText;
                    che = che.trim();
                    if (che === '<font color="red" ><strong>User already exists</strong></font>') {
                        document.getElementById("emailid").value = "";
                    }
                }
            }
            function ReadImg() {
                var input = document.getElementById("collegeid");
                var fReader = new FileReader();
                fReader.readAsDataURL(input.files[0]);
                fReader.onloadend = function(event) {
                    document.getElementById("img1").src = event.target.result;
                };
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
            
            $(function(){
                $("#submit").on("click",function(){
                    if($('#age').val()>100||$('#age').val()<15){
                        alert("Invalid age");
                        return false;
                    }
                });
            });
                       
            
            
            
        </script>
        
        <script>
           $(document).ready(function() {
  $("#showHide").click(function() {
    if ($(".password").attr("type") == "password") {
      $(".password").attr("type", "text");

    } else {
      $(".password").attr("type", "password");
    }
  });
});
        </script>
         <script type="text/javascript" src="validation.js"></script>
         <script language="javascript" type="text/javascript">
            function dynamicdropdown(listindex)
            {
                document.getElementById("subcategory").length = 0;
                switch (listindex)
                {
                    case "Commerce" :
                        document.getElementById("subcategory").options[0]=new Option("Please select your course","");
                        document.getElementById("subcategory").options[1]=new Option("BCom","BCom");
                        document.getElementById("subcategory").options[2]=new Option("BAF","BAF");
                        document.getElementById("subcategory").options[3]=new Option("BMS","BMS");
                        document.getElementById("subcategory").options[4]=new Option("Not Applicable","Not Applicable");
                             break;
                    
                    case "Arts" :
                        document.getElementById("subcategory").options[0]=new Option("Please select your course ","");
                        document.getElementById("subcategory").options[1]=new Option("BA","BA");
                        document.getElementById("subcategory").options[2]=new Option("BMM","BMM");
                        document.getElementById("subcategory").options[3]=new Option("Not Applicable","Not Applicable");
                        break;
                    case "Science" :
                        document.getElementById("subcategory").options[0]=new Option("Please select your course");
                        document.getElementById("subcategory").options[1]=new Option("Computer Science","Computer Science");
                        document.getElementById("subcategory").options[2]=new Option("Informaton Technology","Informaton Technology");
                        document.getElementById("subcategory").options[3]=new Option("Micro Biology","Micro Biology");
                        document.getElementById("subcategory").options[4]=new Option("Bio Technology","Bio Technology");
                        document.getElementById("subcategory").options[5]=new Option("BSc","BSc");
                        document.getElementById("subcategory").options[6]=new Option("Not Applicable","Not Applicable");
                        break;
                                }
                return true;
            }
       </script>
    </head>
    <body bgcolor="black" >
        <h1> <img src="Ride-Right-Logo1.png" alt="logo" align="left" style="width:200px;height:100px;" ></h1>
        
      <form  method="post" action="./registerServlet" name="StudentRegistration" onsubmit="return(validation());" enctype="multipart/form-data">

<table  cellpadding="5" width="55%" height="60%"  align="center" cellspacing="2" bgcolor="gainsboro">

<tr>
<td >
<center><font size=7><b> Registration Form</b></font></center>
</td>
</tr>

<tr>
<td><font size=5>First Name:</font></td>
<td><input type="text" name="firstname" id="firstname" size="30" style="height:30px; width:200px; " required></td>
</tr>

<tr>
<td><font size=5>Last Name:</font> </td>
<td><input type="text" name="lastname" id="lastname" size="30" style="height:30px; width:200px; " required></td>
</tr>

                            
<!--  <input id ="emailcheck" name="email" type="email" placeholder="Email"  onblur="verify()" class="form-control" required>
        <span id="EmailExists" class="EmailExists"></span>-->
                            
                        
<tr>
<td><font size=5>Email ID:</font> </td>
<td><input type="email" name="emailid" id="emailid" size="30" style="height:30px; width:200px; " onblur="verify()" required>
<span id="EmailExists" class="EmailExists"></span>
<%--
    String emailid=request.getParameter("emailid");
if(emailid!=null ){
Object errormessage = request.getAttribute("errorMessage");
               %>
               <font color="red"><%out.println("Error : " +errormessage); 
}
--%>
</td>
</tr>

<tr>
<td><font size=5>Password:</font></td>
<td><input type="password" name="pass" id="pass" class="password" size="30" style="height:30px; width:200px; " required></td>
</tr>
<tr>
    <td></td>
    <td>
      <input type="checkbox" id="showHide" />
      <label for="showHide" id="showHideLabel">Show Password</label>
    </td>
  </tr>

<tr>
<td><font size=5>Confirm Password:</font></td>
<td><input type="password" name="cpassword" id="cpassword" class="password" size="30" style="height:30px; width:200px; " required></td>
</tr>

<tr>
 <td><font size=5>Address:</font> </td>
 <td><textarea name="address" rows="5"  id="address" style="width:200px; " required></textarea></td>
</tr>

<tr>
    <td><font size=5>Gender:</font></td>
    <td>
 <input type="radio" name="gender" value="Male" checked><font size=5> Male<br>
  <input type="radio" name="gender" value="Female" > <font size=5>Female<br>
  <input type="radio" name="gender" value="other"> <font size=5>Other 
</td>
</tr>

 
  <tr>
      <td><font size=5> Department:</font>
      
      <td><font size="4">
      <select name="department"  id="category" style="width:200px" onchange="javascript:dynamicdropdown(this.options[this.selectedIndex].value);" required >
            <option value="default">Select Department</option>
                <option value="Arts">Arts</option>
                <option value="Commerce">Commerce</option>
                <option value="Science">Science</option>
                
            </select>
      </td>
  </tr>
  <tr>
      <td> <font size="5"> Course:</font></td>
      <td>
           <script type="text/javascript" language="JavaScript">
               document.write('<select name="course" id="subcategory" style="width:200px " ><option value="">Please select department</option></select>')
          
           </script>
            </td>
            <noscript>
                <select name="course" id="subcategory" >
                    <option value="default">Please select </option>
                </select>
            </noscript>
</tr>
<tr>
<td><font size=5>Year:</font></td>
<td><font size=4><select required name="year" style="width:200px;" >
<option value="default" >--Select--</option>
<option value="fyjc">F.Y.J.C</option>
<option value="syjc">S.Y.J.C</option>
<option value="firstyear">First Year</option>
<option value="secondyear">Second Year</option>
<option value="thirdyear">Third Year</option>
    </select>
</td>
</tr>

<tr>
<td><font size=5>Age: </td>
<td><input maxlength="3" type="text" name="age" id="age" size="10" style="height:30px; width:200px; " onkeypress="return backspaceAlpha(event)"  required></td>
</tr>

<tr>
<td><font size=5>Mobile No: </td>
<td><input type="text" name="mobileno" id="mobileno" size="10" style="height:30px; width:200px; " onkeypress="return backspaceAlpha(event)"   maxlength="10" required></td>
</tr>

<tr>
    <td><font size=5>Upload your College Id here: </td>
    <td><input type="file" name="collegeid" id="collegeid" onchange="ReadImg()" accept="image/*"  required >
    <img id = "img1" name ="img1" style="height:80px; width:80px" />
    </td>
</tr>
  


<tr>
<td>	<font size=5><input type="reset" value="Reset" style="height: 40px; width: 100px; color:white; background-color: black; margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%"> 	</td>
    <td> <font size=5>  <input id="submit" type="submit" value="Sign up" style="height: 40px; width: 100px; color:white; background-color: black; margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%"> </td>	
    
</tr>
<tr>
    <td>         Already a member ?	<a href="login.jsp" class="to_register"> Go and log in </td>
			
</tr>
</table>					
                            </form>
                 
    </body>
</html>
  
