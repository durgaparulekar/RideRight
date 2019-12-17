<%@ page import ="java.sql.*" %>
<%@ page import ="Ride.*" %>

<%
    
    String user = "" + session.getAttribute("userID");
    String tripid = ("" + request.getParameter("butt"));
    java.util.Date date= new java.util.Date();
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String tripsource="", tripdestination="";
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
       ResultSet r = st.executeQuery("select * from createpool where tripid='"+tripid+"'");
       if(r.next()) {
            tripsource = ""+r.getString("tripsource") ;
            tripdestination = ""+r.getString("tripdestination");
        int i = st.executeUpdate("DELETE from createpool where tripid='" + tripid +"' ");
        i = st.executeUpdate("DELETE from sendrequest where tripid='" + tripid +"' ");
       // i = st.executeUpdate("UPDATE  counts set groups=groups-1 where pri=1;");
        Mail.DeletePostedRideMail("" + session.getAttribute("userEmail"), "" + session.getAttribute("userName"),(tripsource+" To "+tripdestination),tripid);
              response.sendRedirect("welcome.jsp?del=1");
       }
       else{
           response.sendRedirect("welcome.jsp");
       }
    
    
%>