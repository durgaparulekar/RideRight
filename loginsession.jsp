<%@ page import ="java.sql.*" %>

<%
    String email = request.getParameter("email");    
    String pwd = request.getParameter("pass");
    
     Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("Select * from usertable where emailid='" + email + "' and pwd='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userEmail", email);
        session.setAttribute("userpwd", pwd);
        session.setAttribute("userName", rs.getString("firstname")+" "+rs.getString("lastname"));
       session.setAttribute("userID", rs.getString("userid"));
         session.setAttribute("userCourse", rs.getString("course"));
         session.setAttribute("userDepartment", rs.getString("department"));
                  session.setAttribute("userYear", rs.getString("yearr"));       
        session.setAttribute("userMobile", rs.getString("mobileno"));
         session.setAttribute("userAge", rs.getString("age"));
        session.setAttribute("userGender", rs.getString("gender"));        
        //session.setAttribute("NumMessages", MessageParser.unread(Integer.parseInt(rs.getString("C_id"))));
        response.sendRedirect("welcome.jsp");
    }
%>
