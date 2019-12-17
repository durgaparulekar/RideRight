<%-- 
    Document   : requests
    Created on : 5 Mar, 2018, 8:35:27 AM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

 <%
                       String id=""+session.getAttribute("userID");  
                         String pname="",tripsource="",tripdestination="", date="",confirm="",tripid="",userid="";
                       try
                       {
                     Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
      Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select s.userid,s.pname,c.tripid,c.tripsource,c.tripdestination,s.confirm from sendrequest s,createpool c where s.tripid=c.tripid and c.userid='"+id+"' and tripdate>=to_char(sysdate) ");
   
    if (rs.next()) {
        pname=(""+rs.getString("pname"));
        tripsource=(""+rs.getString("tripsource"));
          tripdestination=(""+rs.getString("tripdestination"));
          confirm=(""+rs.getString("confirm"));
          userid= (""+rs.getString("userid"));
          tripid= (""+rs.getString("tripid"));
                           %>   
                        
                   <table >
            <tr>
            <td colspan="2"><font color="black" ><strong>Passenger's Name:</strong></font></td>
           <td><font color="black" ><strong>From:</strong></font></td>
           <td><font color="black" ><strong>To:</strong></font></td><td></td><td></td>
           <td><font color="black" ><strong>Status:</strong></font></td>
                </tr>
        <tr>
<!--value="<%--=""+rs.getString("tripid")--%>"-->
            <td colspan="2"><font color="black" ><strong><%= pname %> has requested a ride.</strong></font></td>
            <td><font color="black" ><strong><%= tripsource %> </strong></font></td>
            <td><font color="black" ><strong><%= tripdestination %> </strong></font></td>
           
            <td><a href="#" data-toggle="modal" data-target="#ViewModal">
    <button type="button" value="<%=""+rs.getString("userid")%>"  onclick="whichButton(this.value)" class="btn btn-lg btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;View Details</button></a></td>
        <td>&nbsp;</td> <td><font color="black" ><strong> <%= confirm %></strong></font></td></tr>
                    <%

    while(rs.next()) {
        pname=(""+rs.getString("pname"));
        tripsource=(""+rs.getString("tripsource"));
          tripdestination=(""+rs.getString("tripdestination"));
          confirm=(""+rs.getString("confirm"));
          userid= (""+rs.getString("userid"));
          tripid= (""+rs.getString("tripid"));
    %>        
        <tr><td colspan="2" > &nbsp;</td><td> </td><td> </td><td> </td><td> </td><td> </td></tr>
        <tr>
            <td colspan="2"><font color="black" ><strong><%= pname %> has requested a ride</strong></font></td>
             <td><font color="black" ><strong><%= tripsource %> </strong></font></td>
            <td><font color="black" ><strong><%= tripdestination %> </strong></font>
           
          
             <td><a href="#" data-toggle="modal" data-target="#ViewModal">
        <button type="button" value="<%= ""+rs.getString("userid")%>"  onclick="whichButton(this.value)" class="btn btn-lg btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;View Details</button></a></td>
       
        <td></td>  <td><font color="black" ><strong> <%= confirm %></strong></font></td>
        </tr>
                   <%
                       
        }
}
            
else {
%>
<font color="red" ><strong> No Ride Requests</strong></font><BR>

<%
    }
}
catch(Exception e){}
%>
</table>