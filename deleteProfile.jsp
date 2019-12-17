<%@ page import ="java.sql.*" %>
<%@ page import ="Ride.*" %>

<%
    
    String id = ""+session.getAttribute("userID");
     Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from usertable where userid=" + id + ";");
    
    while(rs.next()){
        Mail.DeletePostedRideMail(""+session.getAttribute("userEmail"), ""+session.getAttribute("userName"), rs.getString("name"), rs.getString("G_id"));
    }      
    rs = st.executeQuery("select * from cust_group where C_id=" + id + ";");
    while(rs.next()){
        Mail.DeleteJoinRideMail(""+session.getAttribute("userEmail"), ""+session.getAttribute("userName"), rs.getString("name"), rs.getString("G_id"), ""+session.getAttribute("userMobile"));
    } 
    Mail.AcccountDeletion(""+session.getAttribute("userEmail"), ""+session.getAttribute("userName"));
    int i = st.executeUpdate("Delete from  customer where C_id = " + id + ";");
    i = st.executeUpdate("Delete from  cust_group where C_id = " + id + ";");
    i = st.executeUpdate("Delete from  groups where C_id = " + id + ";");
    i = st.executeUpdate("UPDATE  counts set users=users-1 where pri=1;");
    response.sendRedirect("logout.jsp");    
%>
