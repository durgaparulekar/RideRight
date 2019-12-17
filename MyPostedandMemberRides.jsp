<%@ page import ="java.sql.*" %>
<h1>Hello world</h1>
<%
      String id = "" + session.getAttribute("userID");
       out.println("Hello");
     Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from createpool where userid ='"+id+"'");
     String from = "",to="";    
    if (rs.next()) {
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination"));        
        %>
        <table><tr>
                <td>  <font color="black" >  <strong>FROM</strong></font>   </td>
                <td> <font color="black" ><strong>TO</strong></font></td>
                <td><font color="black" ><strong>VIEW</strong></font></td>
                <td><font color="black" ><strong>REMOVE</strong></font></td></tr>
        <tr>
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td><a href="#" data-toggle="modal" data-target="#ViewModal">
    <button type="button" value="<%=""+rs.getString("tripid")%>"  onclick="vButton(this.value)" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;&nbsp;&nbsp;&nbsp;View</button></a></td><td>
        <a href="#" data-toggle="modal" data-target="#DeletionModal">
            <button type="button" value="<%=""+rs.getString("tripid")%>" onclick="whichButton(this.value)" class="btn btn-lg btn-warning" ><i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;Remove</button></a></td></tr>
<%
        while (rs.next()) {
      from = ("" + rs.getString("tripsource"));
      to = ("" + rs.getString("tripdestination"));  
%>
            <tr><td><font color="black" ><strong><%="" + from %></strong></font></td>
                <td><font color="black" ><strong><%="" + to %></strong></font></td>
                <td><a href="#" data-toggle="modal" data-target="#ViewModal">
        <button type="button" value="<%= ""+rs.getString("tripid")%>"  onclick="vButton(this.value)" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;&nbsp;&nbsp;&nbsp;View</button></a></td>
        <td>
        <a href="#" data-toggle="modal" data-target="#DeletionModal">
            <button type="button" value="<%=""+rs.getString("tripid")%>" onclick="whichButton(this.value)" class="btn btn-lg btn-warning" >
                <i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;Remove</button></a>
        </td>
            </tr>
<%
    }
} else {
%>
<font color="red" ><strong> No Posted Rides</strong></font><BR>

<%
    }
%>
</table>
