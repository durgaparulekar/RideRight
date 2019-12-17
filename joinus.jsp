<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="s1.css" />
    </head>
    <body bgcolor="black">
        
        <h1> <img src="Ride-Right-Logo1.png" alt="logo" align="left" style="width:200px;height:100px;"></h1>
        
   
<form name="loginForm" method="post">
    <div class="wrapper">
<table  height="100%" width="70%"  bgcolor="gainsboro" align="center" >
    <tr>
        <td>
            <%
    String emailid=request.getParameter("emailid");
if(emailid!=null ){
Object errormessage = request.getAttribute("errorMessage");
               %>
               <font color="red"><%out.println("Error : " +errormessage); 
}
%>
        </td>
    </tr>
    <tr>
<td colspan=2>
<center><font size=7><b>Sign up as: </b></font></center>
</td>
</tr>
  <tr>
    <td><center><button type="submit" style="height: 40px; width: 100px; color:white; background-color: black; margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%"  onclick="document.forms[0].action = 'registration1.jsp'; return true;">Faculty</button></center> </td>
</tr>
<tr>
    <td><center><button type="submit" style="height: 40px; width: 100px; color:white; background-color: black; margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%" onclick="document.forms[0].action = 'registration.jsp'; return true;">Student</button></center> </td>
</tr>

</table>
    </div>
</form></body></html>