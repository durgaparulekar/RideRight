<%@ page import ="java.sql.*" %>
<%
    String id = "" + session.getAttribute("userID");

    session.setAttribute("userpwd", request.getParameter("pass1"));
    session.setAttribute("userAge", request.getParameter("age"));
    session.setAttribute("userCourse", request.getParameter("course"));
    session.setAttribute("userDepartment", request.getParameter("department"));
    session.setAttribute("userYear", request.getParameter("year"));
    session.setAttribute("userMobile", request.getParameter("mobileno"));

     Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
       Statement st = con.createStatement();
    
   
    int i = st.executeUpdate("UPDATE  usertable set pwd = '"+request.getParameter("pass1")+"'"
           + " ,age='"+request.getParameter("age")+"'"
            + " ,course='"+request.getParameter("course")+"'"
            + " ,yearr='"+request.getParameter("year")+"'"
            + " ,department='"+request.getParameter("department")+"'"
            + " ,mobileno='"+request.getParameter("mobileno")+"'"
                    + "where userid='"+id+"'");
           
    response.sendRedirect("EditProfile.jsp?ed=1");
%> 