<%@ page import ="java.sql.*" %>
<%
  String id = "" + request.getParameter("id");
    Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    
     ResultSet rs = st.executeQuery("select * from usertable u, createpool c where u.userid =c.userid and c.tripid='"+id+"'");
//("select g.name,g.G_id from cust_group c , groups g  where g.G_id=c.G_id AND c.C_id=" + id + ";"); 
//   ResultSet rs = st.executeQuery("select * from createpool join  usertable where createpool.tripid=usertable.tripid='"+id+"'");
    String gender="",from = "",to="",date="",time="",womenonly="",teacheronly="",vehicletype="",vehiclemodel="",description="",firstname="",lastname="",course="",yearr="";
    if (rs.next()) {
       firstname = ("" + rs.getString("firstname"));
         lastname = ("" + rs.getString("lastname"));
        gender = ("" + rs.getString("gender"));
        course= ("" + rs.getString("course"));
        yearr= ("" + rs.getString("yearr"));
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination"));
        date = "" + rs.getString("tripdate");
        date=date.substring(0,10);
        time = "" + rs.getString("triptime");
         womenonly = "" + rs.getString("womenonly");
       teacheronly = "" + rs.getString("teacheronly");
         vehicletype = "" + rs.getString("vehicletype");
         vehiclemodel = "" + rs.getString("vehiclemodel");
         description = "" + rs.getString("description");
         
%>

        
       <font color="black" ><strong> Driver       :   <%= firstname +" "+lastname%></strong></font><br>
         <font color="black" ><strong>Gender     :   <%="" + gender%></strong></font><br>
          <font color="black" ><strong> Studying in      :   <%= yearr +" "+course%></strong></font><br>
        <font color="black" ><strong>From       :   <%="" + from %></strong></font><br>
        <font color="black" ><strong>To       :   <%="" + to %></strong></font><br>
        <font color="black" ><strong>Date :   <%="" + date %></strong></font><br>
        <font color="black" ><strong>Time       :   <%="" + time %></strong></font><br>
       <font color="black" ><strong>Women Only       :   <%="" +womenonly  %></strong></font><br>
        <font color="black" ><strong> Teacher Only      :   <%="" +  teacheronly%></strong></font><br>
        <font color="black" ><strong> Vehicle Type:   <%="" + vehicletype %></strong></font><br>
        <font color="black" ><strong> Vehicle Model      :   <%="" +vehiclemodel  %></strong></font><br>
        <font color="black" ><strong>Description       :   <%="" + description %></strong></font><br>
        <br/>
 <!--<a href="#" data-toggle="modal" data-target="#JoiningModal"><button type="button" value="<%--=""+rs.getString("tripid")--%>" onclick="whichButton(this.value)" class="btn btn-lg btn-success" ><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;Join Ride</button></a>
-->
        <%
        }

%>