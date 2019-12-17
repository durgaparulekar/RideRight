<%-- 
    Document   : feedback
    Created on : 17 Mar, 2018, 2:39:23 PM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="Ride.*" %>
<%
                String user=(String)session.getAttribute("userID");  
                int userid = Integer.parseInt(user);
              // String user = ""+session.getAttribute("userID");
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String  message= request.getParameter("message");
           
             Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
        /*      Statement st = con.createStatement();
            int i = st.executeUpdate("insert into createpool(tripsource,tripdestination,spareseats,way,tripdate,triptime,womenonly,teacheronly,description,amount,vehicletype,vehiclemodel,userid)"
                    + "values('"+tripsource+"','"+tripdestination+"','"+spareseats+"','"+way+"','"+tripdate+"','"+triptime+"','"+womenonly+"','"+teacheronly+"','"+description+"','"+amount+"','"+vehicletype+"','"+vehiclemodel+"','"+userid+"')");
        */
        
          PreparedStatement ps=con.prepareStatement("insert into feedback(userid,name,emailid,message)values(?,?,?,?)");  
          ps.setString(1,user);   
          ps.setString(2,name);
         ps.setString(3,email);
          ps.setString(4,message);
          
         int i=ps.executeUpdate();
          Mail.QueryMail(email,name,message);
          if(i!=0)
       {
           response.sendRedirect("contact.jsp?s=1" );
        //  response.sendRedirect("welcome.jsp"); 
       }
        
    
           

%>
