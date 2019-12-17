<%@ page import ="java.sql.*" %>

<%
    String id = "" + session.getAttribute("userID");
    String tripsource=""+request.getParameter("FromInput");
    String tripdestination=""+request.getParameter("ToInput");
     String tripdate=""+request.getParameter("tripdate");
    Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from createpool where tripsource like '%"+tripsource+"%' and tripdestination like '%"+tripdestination+"%' and tripdate>=to_char(sysdate) ");
      //and tripdestination='"+tripdestination+"'    and triptime>=to_char(sysdate,'hh:mi')    and triptime>=to_char(sysdate,'hh:mi:ss')
    String from = "",to="",date="",time="";
    if (rs.next()) {
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination"));
        date = ("" + rs.getString("tripdate"));
        date=date.substring(0,10);
        time = "" + rs.getString("triptime");
        
%>
        <table>
            <tr>
                               
                <td><font color="black" ><strong>FROM</strong></font></td>
                <td><font color="black" ><strong>TO</strong></font></td>
                <td ><font color="black" ><strong>DATE</strong></font></td>
                <td></td>
                <td><font color="black" ><strong>TIME</strong></font></td>
                <td><font color="black" ><strong>JOIN</strong></font></td>
            </tr>
        <tr>
           
            <td><font color="black" ><strong><%="" + from %></strong></font></td>
            <td><font color="black" ><strong><%="" + to %></strong></font></td>
            <td colspan="2"><font color="black" ><strong><%="" + date %></strong></font></td>
            <td><font color="black" ><strong><%="" + time %></strong></font></td><td>
        <a href="#" data-toggle="modal" data-target="#JoiningModal">
            <button type="button" value="<%=""+rs.getString("tripid")%>" onclick="whichButton(this.value)" class="btn btn-lg btn-success" >
                <i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;View Details
            </button></a></td></tr>
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
            <td colspan="2"><strong><%="" + date %></strong></font></td>
            <td><font color="black" ><strong><%="" + time %></strong></font></td>
            <td>
        <a href="#" data-toggle="modal" data-target="#JoiningModal"><button type="button" value="<%=""+rs.getString("tripid")%>" onclick="whichButton(this.value)" class="btn btn-lg btn-success" ><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;View Details</button></a></td></tr>
<%
        }
} else {
%>
<font color="red" ><strong> No Rides at ALL</strong></font><BR>

<%
    }
%>
</table>
