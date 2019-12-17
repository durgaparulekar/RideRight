<%@ page import ="java.sql.*" %>
<html>
<h3>Hello World</h3>
</html>
<%
     String userid ="" + request.getParameter("id");
     
 Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
     ResultSet rs = st.executeQuery("select * from sendrequest s,usertable u where s.userid=u.userid and u.userid='"+userid+"'");
    String yearr = "",course="",gender="",faculty = "",from = "",to="",vehicletype="",name = "",emailid="",mobileno="",womenonly = "",teacheronly="",tripdate = "",triptime="",tripid="";    
    if (rs.next()) {
         name = (rs.getString("firstname") + " " + rs.getString("lastname"));
         yearr= rs.getString("yearr");
         course= rs.getString("course");
         gender= rs.getString("gender");
         faculty= rs.getString("faculty"); 
            emailid = rs.getString("emailid");
            mobileno = rs.getString("mobileno");
        userid= (""+rs.getString("userid"));  
        tripid=(""+rs.getString("tripid"));
         ResultSet driv = st.executeQuery("select * from sendrequest s,createpool c where s.tripid=c.tripid and s.userid='"+userid+"' and c.tripid=" + rs.getString("tripid"));
        if (driv.next()) {
           from = ("" + driv.getString("tripsource"));
        to = ("" + driv.getString("tripdestination"));        
        tripdate = (""+driv.getString("tripdate"));
         tripdate=tripdate.substring(0,10);
        triptime = (""+driv.getString("triptime"));
        //tripid= (""+driv.getString("triptime"));
                
        }
    }
    String url = "viewPassenger.jsp?tripsource=" + from +
            "&tripdestination=" + to + "&name=" + name + 
             "&triptime=" + triptime + 
            "&tripdate=" + tripdate +
             "&mobileno=" + mobileno +
            "&emailid=" +emailid +
            "&userid=" +userid +
            "&tripid=" +tripid +
             "&yearr=" + yearr + "&course=" + course + 
              "&gender=" + gender + "&faculty=" + faculty  ;
    response.sendRedirect(url);



%>




<%--
    
    String userid=""+request.getParameter("id");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from usertable where userid='"+userid+"'");
      //and tripdestination='"+tripdestination+"'    and triptime>=to_char(sysdate,'hh:mi')    and triptime>=to_char(sysdate,'hh:mi:ss')
    String name = "",gender="",email="",course="";
    if (rs.next()) {
        name = ("" + rs.getString("firstname"));
        gender = ("" + rs.getString("gender"));
        email = ("" + rs.getString("emailid"));
        course = "" + rs.getString("course");
        
%>
<p>Name:<%="" + name %></p>
<p>Gender:<%="" + gender %></p>
<p>Email:<%="" + email %></p>
<p>Course:<%="" + name %></p>
<a href="#" data-toggle="modal" data-target="#JoiningModal"><button type="button" value="<%=""+rs.getString("userid")%>" onclick="whichButton(this.value)" class="btn btn-lg btn-success" ><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;Join Ride</button></a>

<a href="#" data-toggle="modal" data-target="#ViewModal">
        <button type="button" value="<%--= ""+rs.getString("userid")%>"  onclick="whichButton(this.value)" class="btn btn-default btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;Accept</button></a>
       
        <a href="#" data-toggle="modal" data-target="#DeletionModal">
            <button type="button" value="<%--=""+rs.getString("userid")%>" onclick="vButton(this.value)" class="btn btn-lg btn-warning" >
               &nbsp;&nbsp;Decline</button></a>
        
<%
    }
--%>

