<%@ page import ="java.sql.*" %>
<html>
    <head>
<meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="css/table.css">
        
          
        <link rel="stylesheet" href="css/jquery-ui-1.10.0.custom.min.css"> 
        </head>
<h3>Feedback: </h3>
<%
      
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from feedback");
     String name = "",emailid="",message="",mobileno="";    
    if (rs.next()) {
        name = ("" + rs.getString("name"));
       emailid = ("" + rs.getString("emailid")); 
      message = ("" + rs.getString("message")); 
        %>
        <table border="1" ><tr>
                <td>  <font color="black" >  <strong>Name</strong></font>   </td>
                <td> <font color="black" ><strong>Email ID</strong></font></td>
                <td><font color="black" ><strong>Message</strong></font></td>
                
            </tr>
        <tr>
            <td><font color="black" ><strong><%="" + name %></strong></font></td>
            <td><font color="black" ><strong><%="" + emailid %></strong></font></td>
            <td><font color="black" ><strong><%="" + message %></strong></font></td></tr>
            <%
        while (rs.next()) {
      name = ("" + rs.getString("name"));
       emailid = ("" + rs.getString("emailid"));
      message = ("" + rs.getString("message"));   
%>
            <tr>
                <td><font color="black" ><strong><%="" + name %></strong></font></td>
            <td><font color="black" ><strong><%="" + emailid %></strong></font></td>
            <td><font color="black" ><strong><%="" + message %></strong></font></td></tr>
<%
    }
} else {
%>
            <font color="red" ><strong>No Feedbacks.</strong></font><BR>

<%
    }
%>
</table>
</html>