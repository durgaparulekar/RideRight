<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>

<%    
    String tripid ="" + request.getParameter("butt");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
     ResultSet rs = st.executeQuery("select * from createpool where tripid ='"+tripid+"'");
    String from = "",to="",vehicletype="",name = "",emailid="",mobileno="",womenonly = "",teacheronly="",tripdate = "",triptime="",amount="";    
    if (rs.next()) {
        from = ("" + rs.getString("tripsource"));
        to = ("" + rs.getString("tripdestination"));        
            tripdate = (""+rs.getString("tripdate"));
             tripdate=tripdate.substring(0,10);
               triptime = (""+rs.getString("triptime"));
               vehicletype = (""+rs.getString("vehicletype"));
               womenonly = rs.getString("womenonly"); 
             teacheronly = rs.getString("teacheronly"); 
             amount=rs.getString("amount");
         ResultSet driv = st.executeQuery("select * from usertable where userid=" + rs.getString("userid"));
        if (driv.next()) {
            name = (driv.getString("firstname") + " " + driv.getString("lastname"));
            emailid = driv.getString("emailid");
            mobileno = driv.getString("mobileno");
                
        }
    }
    String url = "ViewARide.jsp?tripsource=" + from +
            "&tripdestination=" + to + "&name=" + name + 
            "&vehicletype=" + vehicletype + "&triptime=" + triptime + 
            "&tripdate=" + tripdate + "&triptime=" + triptime + 
            "&womenonly=" + womenonly +  "&mobileno=" + mobileno +
            "&emailid=" +emailid   +  "&teacheronly="+ teacheronly +  "&amount="+ amount ;
    response.sendRedirect(url);
%>