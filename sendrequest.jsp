<%-- 
    Document   : sendrequest
    Created on : 16 Feb, 2018, 11:33:32 AM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="Ride.*" %>
<%
    String userID=""+session.getAttribute("userID");
    String email=""+session.getAttribute("userEmail");
    String id = "" + request.getParameter("id");
   int tripid = Integer.parseInt(id);
 String tripsource="",tripdestination="",triptime="",tripdate="",trip="";
   String user = "" + session.getAttribute("userID");
int userid = Integer.parseInt(user);
   
         String pname = "" + session.getAttribute("userName");     
  Class.forName("oracle.jdbc.driver.OracleDriver");
 
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
       Statement st = con.createStatement();
       ResultSet rs1 = st.executeQuery("select * from createpool c, usertable u where u.userid=c.userid and c.userid='"+userID+"' and c.tripid='"+tripid+"'");
     if(rs1.next()){
       response.sendRedirect("Allreadymember.jsp"); 
      }
    else{
       ResultSet rs = st.executeQuery("select * from sendrequest where userid='"+userid+"' and tripid='"+tripid+"'");
      if(rs.next()){
       response.sendRedirect("Allreadymember.jsp"); 
      }
      else{
          
        PreparedStatement ps=con.prepareStatement("insert into sendrequest(userid,tripid,pname,confirm)values(?,?,?,?)");  
        ps.setInt(1,userid);
        ps.setInt(2,tripid);
        ps.setString(3,pname);
        ps.setString(4,"PENDING");
        // ps.setString(5,email);
   int i=ps.executeUpdate(); 
         if(i!=0)
       {
         ResultSet rs2 = st.executeQuery("select * from createpool c, sendrequest s where c.tripid=s.tripid and s.userid='"+userID+"'");
      if(rs2.next()){
     tripsource = ("" + rs2.getString("tripsource"));
    tripdestination = ("" + rs2.getString("tripdestination"));
    triptime = ("" + rs2.getString("triptime"));
      tripdate = ("" + rs2.getString("tripdate"));
   //  trip= ("" + rs.getString("tripid"));
}
     Mail.JoinRideMail(""+session.getAttribute("userEmail"), ""+session.getAttribute("userName"), (tripsource +" TO "+tripdestination),triptime , tripdate,id);
  
           response.sendRedirect("welcome.jsp"); 
       
       }
      } 
     }

%>
 