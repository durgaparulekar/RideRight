<%-- 
    Document   : forgotpassword
    Created on : 11 Dec, 2017, 9:32:03 AM
    Author     : pc33
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <link rel="stylesheet" type="text/css" href="s1.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
       
        <script type="text/javascript" src="validate.js"></script>
    </head>
    <body bgcolor="black">
        <img src="Ride-Right-Logo1.png" alt="logo" align="left" style="width:200px;height:100px;"></h1>
          
               
                    <form name="forgotpassword" method="post" action="./changepassword" autocomplete="on">
<table  height="100%" width="70%"  bgcolor="gainsboro" align="center" >
    <tr>
    <td>
     <%
      String email=request.getParameter("email");
         if(email!=null){
         Object errormessage = request.getAttribute("errormessage");
               %>
               <font color="red"><%out.println("Error : " +errormessage); 
    }
     %>
        
    </td>
</tr>

<tr >
    <td colspan=2><center><font size=10><b> Forgot Password</b></font></center></td>
</tr>

<tr><td></td>
<td><input type="text" size=25 name="email" style="height:40px; width:200px; " placeholder="Enter the registered Email ID"  required></td>



<td> <input type="submit" value="Submit"/></td> </tr>
<tr><td><a href="login.jsp">Try Signing In Again</a></td></tr>
                        </table>
             </form>
              
              
    </body>
</html>