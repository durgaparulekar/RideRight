
<%@ page import ="java.sql.*" %>
<%    
    String email = request.getParameter("val");
    Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
       Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from usertable where emailid='"+email+"'");
      
    if (rs.next()){          
%>
    <font color="red" ><strong>User already exists</strong></font>
<%
}else{
%>
<font color="green" ><strong> Email ID available</strong></font>
<%
}
%>
