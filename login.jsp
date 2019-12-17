

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
<head>
    <title>Login Page</title>
 <link rel="stylesheet" type="text/css" href="s1.css" />
</head>
<body bgcolor="black">
    <h1>
        <img src="Ride-Right-Logo1.png" alt="logo" align="left" style="width:200px;height:100px;"></h1>
<form name="loginForm" method="post" action="./servletLogin">
    <div class="wrapper">
<table  height="100%" width="70%"  bgcolor="gainsboro" align=center >
  <tr>
    <td>
     <%
      String email=request.getParameter("email");
            String pass=request.getParameter("pass");
     if(email!=null && pass!=null){
         Object errormessage = request.getAttribute("errorMessage");
               %>
               <font color="red"><%out.println("Error : " +errormessage); 
     }
     %>
        
    </td>
</tr>
<tr>
<td colspan=2><center><font size=10><b> Login Page</b></font></center></td>
</tr>

<tr align=center>

<td ><input type="text" size=30 name="email" placeholder="Email" style="height:40px; width:200px; " required></td>
</tr>

<tr align=center>

<td ><input type="Password" size=30 name="pass" placeholder="Password"  style="height:40px; width:200px" required></td>
</tr>

<tr>
<td align="center" ><font size=4><a href="forgotpassword.jsp">Forgot Password? </a></font></td>
</tr>


<tr>
    <td><center><button type="submit" style="height: 40px; width: 100px; color:white; background-color: black; margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%" >Login</button></center> </td>
 
</tr>


<tr>
    <td><font size=4>Not a member yet ?</font></td>
    <td><font size=4><a href="joinus.jsp" class="to_register">Join us</a></font> </td>
</tr>

</table>
    </div>
    
</form>
</body>
</html>