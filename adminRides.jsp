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
        <h3>Created Carpool Rides: </h3>
<%
      
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from createpool c,usertable u where u.userid=c.userid and tripdate>=to_char(sysdate) ");
     /*and tripdate>='sysdate'*/
     String from = "",to="",confirm="",name="",emailid="",lname="",tripdate="",triptime="",amount="",tripid="";    
    if (rs.next()) {
        tripid=("" + rs.getString("tripid"));
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination")); 
        name=("" + rs.getString("firstname")); 
        lname=("" + rs.getString("lastname")); 
            emailid=("" + rs.getString("emailid")); 
        tripdate=("" + rs.getString("tripdate")); 
        tripdate=tripdate.substring(0,10);
        triptime=("" + rs.getString("triptime")); 
         amount=("" + rs.getString("amount")); 
        %>
        <table border="1"><tr>
                <td>  <font color="black" >  <strong>TRIP ID</strong></font>   </td>
                <td>  <font color="black" >  <strong>FROM</strong></font>   </td>
                <td> <font color="black" ><strong>TO</strong></font></td>
                <td><font color="black" ><strong>NAME</strong></font></td>
                <td><font color="black" ><strong>EMAIL ID</strong></font></td>
                <td> <font color="black"  ><strong>TRIPDATE</strong></font></td><td></td>
                <td><font color="black" ><strong>TRIPTIME</strong></font></td>
                <td><font color="black" ><strong>AMOUNT</strong></font></td>
            </tr>
        <tr>
            <td><font color="black" ><strong><%="" + tripid %></strong></font></td>
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td><font color="black" ><strong><%="" + name +" "+lname%></strong></font></td>
            <td><font color="black" ><strong><%="" + emailid %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + tripdate %></strong></font></td>
            <td><font color="black" ><strong><%="" + triptime %></strong></font></td>
            <td><font color="black" ><strong><%="" + amount %></strong></font></td>
        </tr>
           <%
        while (rs.next()) {
             tripid=("" + rs.getString("tripid"));
     from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination")); 
        name=("" + rs.getString("firstname")); 
            emailid=("" + rs.getString("emailid")); 
 tripdate=("" + rs.getString("tripdate")); 
        triptime=("" + rs.getString("triptime")); 
         amount=("" + rs.getString("amount")); 
%>
             <tr>
          <td><font color="black" ><strong><%="" + tripid %></strong></font></td>
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td><font color="black" ><strong><%="" + name +" "+lname%></strong></font></td>
            <td><font color="black" ><strong><%="" + emailid %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + tripdate %></strong></font></td>
            <td><font color="black" ><strong><%="" + triptime %></strong></font></td>
            <td><font color="black" ><strong><%="" + amount %></strong></font></td>
        </tr>
<%
    }
} else {
%>
<font color="red" ><strong> No Carpool Rides Created.</strong></font><BR>

<%
    }
%>
</table>
<h3>Requested Carpool Rides: </h3>
<%
    ResultSet  rs1 = st.executeQuery("select * from sendrequest s,createpool c,usertable u where s.tripid=c.tripid and s.userid=u.userid and c.tripdate>=to_char(sysdate) ");
    //and tripdate>='sysdate'
   // ResultSet rs1 = st.executeQuery("select g.name,g.G_id from cust_group c , groups g  where g.G_id=c.G_id AND c.C_id=" + id + ";");
if (rs1.next()) {
     tripid=("" + rs1.getString("tripid"));
    from = ("" + rs1.getString("tripsource"));
        to = ("" + rs1.getString("tripdestination"));   
        confirm=("" + rs1.getString("confirm")); 
        name=("" + rs1.getString("firstname")); 
        lname=("" + rs1.getString("lastname")); 
         emailid=("" + rs1.getString("emailid")); 
       //mobileno=("" + rs1.getString("mobileno")); 
        %>
        <table border="1"><tr>
           <td>  <font color="black" >  <strong>TRIP ID</strong></font>   </td>
          <td>  <font color="black" ><strong>FROM</strong></font> </td>
                <td><font color="black" ><strong>TO</strong></font></td>
              <!--  <td><font color="black" ><strong>CONTACT</strong></font></td>-->
                <td><font color="black" ><strong>PASSENGER'S NAME</strong></font></td>
               <td><font color="black" ><strong>EMAIL ID</strong></font></td>
              <td><font color="black" ><strong>CONFIRMATION</strong></font></td>
                
            </tr>
               <tr>
            <td><font color="black" ><strong><%="" + tripid %></strong></font></td>
     <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <!-- <td><font color="black" ><strong><%--="" + mobileno --%></strong></font></td>-->
                <td><font color="black" ><strong><%="" + name +" "+lname%></strong></font></td>  
                 <td><font color="black" ><strong><%="" + emailid %></strong></font></td>
             <td><font color="RED" ><strong><%="" + confirm %></strong></font></td>
                 
            
        </tr>
        <%
        while (rs1.next()) {
             tripid=("" + rs1.getString("tripid"));
        from = ("" + rs1.getString("tripsource"));
        to = ("" + rs1.getString("tripdestination")); 
         name=("" + rs1.getString("firstname")); 
        lname=("" + rs1.getString("lastname")); 
         emailid=("" + rs1.getString("emailid")); 
       // mobileno=("" + rs.getString("mobileno")); 
%>
        <tr>
             <td><font color="black" ><strong><%="" + tripid %></strong></font></td>
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <!--  <td><font color="black" ><strong><%--="" + mobileno --%></strong></font></td>-->
            <td><font color="black" ><strong><%="" + name +" "+lname%></strong></font></td>
             <td><font color="black" ><strong><%="" + emailid %></strong></font></td>
           <td><font color="RED" ><strong><%="" + confirm %></strong></font></td>

        </tr>
        <%
    }

} else {
%>
<font color="red" ><strong> No Requested Rides.</strong></font><BR>

<%
    }
%>
        </table>
</html>