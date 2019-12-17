
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="Ride.*" %>
<%
    String id = "" + request.getParameter("userid");
     String tripid = "" + request.getParameter("tripid");
     String driverEmail= (String)session.getAttribute("userEmail");
      String driver= (String)session.getAttribute("userName");
   int userid = Integer.parseInt(id);
           String emailid="",username="",tripdestination="",tripsource="",tripdate="",triptime="",tripid1="";
  Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
   Statement st=con.createStatement();
   ResultSet r = st.executeQuery("select * from usertable u,sendrequest s  where s.userid=u.userid and u.userid='"+userid+"' ");
       while(r.next()) {
           username=""+r.getString("firstname");
          emailid = ""+r.getString("emailid");
          tripid1=""+r.getString("tripid");
          if(tripid1==tripid){
        ResultSet r2 = st.executeQuery("select * from createpool  where tripid='"+tripid1+"' ");
       if(r2.next()) {
           tripsource=""+r2.getString("tripsource");
          tripdestination=""+r2.getString("tripdestination");
          tripdate=""+r2.getString("tripdate");
          triptime=""+r2.getString("triptime");
       }  
          }  
          }
        String  confirm="DECLINED";
   String sql="update sendrequest set confirm='"+confirm+"' where userid='"+userid+"' and tripid='"+tripid1+"'";  
        
  int i= st.executeUpdate(sql); 
  Mail.DeclinedMail(emailid,username,driver,driverEmail,(tripsource +" TO "+tripdestination),tripdate,triptime);
  if(i!=0)
       {    
          response.sendRedirect("viewRequests.jsp"); 
       }
        
        
%>
<%--
Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
   Statement st=con.createStatement();
   ResultSet r = st.executeQuery("select * from usertable u,createpool c,sendrequest s  where s.userid=u.userid and u.userid='"+userid+"' and s.tripid='"+tripid+"' ");
       if(r.next()) {
          username=""+r.getString("firstname");
           emailid = ""+r.getString("emailid");
           tripsource=""+r.getString("tripsource");
          tripdestination=""+r.getString("tripdestination");
           tripdate=""+r.getString("tripdate");
          triptime=""+r.getString("triptime");
       }
        String  confirm="DECLINED";
   String sql="update sendrequest set confirm='"+confirm+"' where userid='"+userid+"' and tripid='"+tripid+"'";  
        
  int i= st.executeUpdate(sql);    
   


--%>