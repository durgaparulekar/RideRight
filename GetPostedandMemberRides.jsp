<%@ page import ="java.sql.*" %>
<%
      String id = "" + session.getAttribute("userID");
     // String date="2/24/2018";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from createpool where userid ='"+id+"'and  tripdate>=to_char(sysdate)");
     /*and tripdate>='sysdate'*/
     String from = "",to="",confirm="",mobileno="";    
    if (rs.next()) {
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination")); 
      
        %>
        <table><tr>
                <td>  <font color="black" >  <strong>FROM</strong></font>   </td>
                <td> <font color="black" ><strong>TO</strong></font></td>
                <td><font color="black" ><strong>VIEW</strong></font></td>
                <td><font color="black" ><strong>REMOVE</strong></font></td>
            </tr>
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
<h3>Requested carpool rides: </h3>
<%
    ResultSet  rs1 = st.executeQuery("select * from sendrequest s,createpool c where s.tripid=c.tripid and s.userid ='"+id+"' and c.tripdate>=to_char(sysdate) ");
    //and tripdate>='sysdate'
   // ResultSet rs1 = st.executeQuery("select g.name,g.G_id from cust_group c , groups g  where g.G_id=c.G_id AND c.C_id=" + id + ";");
if (rs1.next()) {
    from = ("" + rs1.getString("tripsource"));
        to = ("" + rs1.getString("tripdestination"));   
        confirm=("" + rs1.getString("confirm")); 
       //mobileno=("" + rs1.getString("mobileno")); 
        %>
        <table><tr><td>
            <font color="black" ><strong>FROM</strong></font> </td>
                <td><font color="black" ><strong>TO</strong></font></td>
              <!--  <td><font color="black" ><strong>CONTACT</strong></font></td>-->
                <td><font color="black" ><strong>VIEW</strong></font></td>
                <td><font color="black" ><strong>REMOVE</strong></font></td>
                <td><font color="black" ><strong>CONFIRMATION</strong></font></td>
                <td align="center"><font color="black" ><strong>MAKE PAYMENT</strong></font></td>
            </tr>
        <tr><td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <!-- <td><font color="black" ><strong><%--="" + mobileno --%></strong></font></td>-->
                   <td><a href="#" data-toggle="modal" data-target="#ViewModal">
                    <button type="button" value="<%=""+rs1.getString("tripid")%>"  onclick="vButton(this.value)" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;&nbsp;&nbsp;&nbsp;View</button></a></td>
                   <td>
        <a href="#" data-toggle="modal" data-target="#DeletionModal2">
            <button type="button" value="<%=""+rs1.getString("tripid")%>" onclick="whichButton2(this.value)" class="btn btn-lg btn-warning" ><i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;Remove</button></a></td>
                 <td><font color="RED" ><strong><%="" + confirm %></strong></font></td>
                 <td><a href="https://paytm.com/" /> Make Payment</td>
            
        </tr>
        <%
        while (rs1.next()) {
            from = ("" + rs1.getString("tripsource"));
        to = ("" + rs1.getString("tripdestination"));    
       // mobileno=("" + rs.getString("mobileno")); 
%>
        <tr><td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <!--  <td><font color="black" ><strong><%--="" + mobileno --%></strong></font></td>-->
            <td><a href="#" data-toggle="modal" data-target="#ViewModal">
                    <button type="button" value="<%=""+rs1.getString("tripid")%>"  onclick="vButton(this.value)" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;&nbsp;&nbsp;&nbsp;View</button></a></td>
                    <td>
        <a href="#" data-toggle="modal" data-target="#DeletionModal2">
            <button type="button" value="<%=""+rs1.getString("tripid")%>" onclick="whichButton2(this.value)" class="btn btn-lg btn-warning" ><i class="glyphicon glyphicon-remove"></i>&nbsp;&nbsp;Remove</button></a></td>-->
<td><font color="RED" ><strong><%="" + confirm %></strong></font></td>
<td><a href="https://paytm.com/" ></td>
        </tr>
        <%
    }

} else {
%>
<font color="red" ><strong> You haven't requested any rides.</strong></font><BR>

<%
    }
%>
        </table>