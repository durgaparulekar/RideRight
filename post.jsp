<%-- 
    Document   : post
    Created on : 7 Feb, 2018, 1:43:05 AM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="Ride.*" %>
<%
                String user=(String)session.getAttribute("userID");  
                int userid = Integer.parseInt(user);
              // String user = ""+session.getAttribute("userID");
            
            String tripsource = request.getParameter("FromInput");
            String tripdestination = request.getParameter("ToInput");
            String spareseats = request.getParameter("spareseats");//
               
            String way = request.getParameter("way");
              String tripdate = request.getParameter("tripdate");
              
            String triptime = request.getParameter("triptime");
            String womenonly = request.getParameter("womenonly");
            String  teacheronly= request.getParameter("teacheronly");
            String description = request.getParameter("description");        
          
             String amount = request.getParameter("amount");
             String vehicletype = request.getParameter("vehicletype");
             String vehiclemodel = request.getParameter("vehiclemodel");//
            
             //Integer userid = (Integer) session.getAttribute("userID");
         // Integer userid = ((Integer) session.getAttribute("userID")).intValue();
             Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        /*      Statement st = con.createStatement();
            int i = st.executeUpdate("insert into createpool(tripsource,tripdestination,spareseats,way,tripdate,triptime,womenonly,teacheronly,description,amount,vehicletype,vehiclemodel,userid)"
                    + "values('"+tripsource+"','"+tripdestination+"','"+spareseats+"','"+way+"','"+tripdate+"','"+triptime+"','"+womenonly+"','"+teacheronly+"','"+description+"','"+amount+"','"+vehicletype+"','"+vehiclemodel+"','"+userid+"')");
        */
        
          PreparedStatement ps=con.prepareStatement("insert into createpool(tripsource,tripdestination,spareseats,way,tripdate,triptime,womenonly,teacheronly,description,amount,vehicletype,vehiclemodel,userid)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");  
              ps.setString(1,tripsource);
         ps.setString(2,tripdestination);
          ps.setString(3,spareseats);
           ps.setString(4,way);
           ps.setString(5,tripdate);
           ps.setString(6,triptime);
           ps.setString(7,womenonly);
           ps.setString(8,teacheronly);
           ps.setString(9,description);
           ps.setString(10,amount);
           ps.setString(11,vehicletype);
          ps.setString(12,vehiclemodel);
            
           ps.setInt(13,userid);
              int i=ps.executeUpdate();
          
        //  Mail.PostRideMail(""+session.getAttribute("userEmail"), ""+session.getAttribute("userName"), ""+session.getAttribute("userName"),triptime, tripdate);
      Mail.PostRideMail(""+session.getAttribute("userEmail"), ""+session.getAttribute("userName"), (tripsource +" TO "+tripdestination),triptime , tripdate);
        if(i!=0)
       {
           
          response.sendRedirect("welcome.jsp"); 
       }
        
    
           

%>