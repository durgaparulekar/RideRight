<%@ page import ="java.sql.*" %>
<%
    String id = "" + session.getAttribute("userID");
    Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from createpool where userid ='"+id+"' order by to_char(tripdate)");
    String from = "",to="",date="",time="";
    if (rs.next()) {
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination"));
        date = "" + rs.getString("tripdate");
         date=date.substring(0,10);
        time = "" + rs.getString("triptime");
%>
        <table >
            <tr>
                               
                <td><font color="black" ><strong>FROM</strong></font></td>
                <td><font color="black" ><strong>TO</strong></font></td>
                <td><font color="black" ><strong>DATE</strong></font></td> <td></td>
                <td><font color="black" ><strong>TIME</strong></font></td>
               
            </tr>
        <tr>
           
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + date %></strong></font></td>
            <td><font color="black" ><strong><%="" + time %></strong></font></td><td>
       
        </td></tr>
<%
        while (rs.next()) {
            from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination"));
        date = "" + rs.getString("tripdate");
         date=date.substring(0,10);
        time = "" + rs.getString("triptime");
%>        
        <tr>
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + date %></strong></font></td>
            <td><font color="black" ><strong><%="" + time %></strong></font></td>
            <td>
                 </td></tr>
<%
        }
} else {
%>
<font color="red" ><strong> No Rides at ALL</strong></font><BR>

<%
    }
%>
</table>
 
<h3>AS PASSENGER:</h3>
<%
    id = "" + session.getAttribute("userID");
     ResultSet rs1 = st.executeQuery("select * from sendrequest where userid ='"+id+"'");
    String tripid="",confirm="";
    if (rs1.next()) {
        tripid=""+rs1.getString("tripid");
        confirm=""+rs1.getString("confirm");
    }
    rs1 = st.executeQuery("select * from createpool  where tripid ='" + tripid + "'");
        if(rs1.next()){
         from = ("" + rs1.getString("tripsource"));
        to = ("" + rs1.getString("tripdestination"));
        date = "" + rs1.getString("tripdate");
         date=date.substring(0,10);
        time = "" + rs1.getString("triptime");
        
%>
        <table>
            <tr>
                               
                <td><font color="black" ><strong>FROM</strong></font></td>
                <td><font color="black" ><strong>TO</strong></font></td>
                <td><font color="black" ><strong>DATE</strong></font></td> <td></td>
                <td><font color="black" ><strong>TIME</strong></font></td>
               <td colspan="2"><font color="black" ><strong>RIDE STATUS</strong></font></td>
            </tr>
        <tr>
           
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + date %></strong></font></td>
            <td><font color="black" ><strong><%="" + time %></strong></font></td><td>
            <td><font color="black" ><strong><%="" + confirm %></strong></font></td><td>
       
        </td></tr>
<%
        while (rs1.next()) {
            from = ("" + rs1.getString("tripsource"));
        to = ("" + rs1.getString("tripdestination"));
        date = "" + rs1.getString("tripdate");
         date=date.substring(0,10);
        time = "" + rs1.getString("triptime");
%>        
        <tr>
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + date %></strong></font></td>
            <td><font color="black" ><strong><%="" + time %></strong></font></td>
             <td><font color="black" ><strong><%="" + confirm %></strong></font></td><td>
            <td>
          </td></tr>
<%
        }
} else {
%>
<font color="red" ><strong> No Rides at ALL</strong></font><BR>

<%
    }
%>
</table>