<%-- 
    Document   : myRides
    Created on : 22 Jan, 2018, 10:09:32 PM
    Author     : Diana
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                 <link href="inventory.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="container-fluid table-section">
             <div class="row">
                <div class="col-md-12 text-center">
                    <form name="table" action="Inventory" method="get">
                        <table class="table table-bordered">
                            <tr class="heading">
                                <td>Source</td>
                                <td>Destination</td>
                                <td>Available seats</td>
                                <td>Way</td>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Women Only</td>
                                <td>Teacher Only</td>
                                <td>Description </td>
                                   <td>Cost</td>   
                                   <td>Vehicle Type</td>
                                    <td>Vehicle Model</td>
                            </tr>
                            <%
                                try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
            String sql="select * from createpool";
            
           PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs= ps.executeQuery();
           while(rs.next()){
                      out.println("<tr>");
                out.println("<td>"+rs.getString(1)+"</td>");
               out.println("<td>"+rs.getString(2)+"</td>");
               out.println("<td>"+rs.getString(3)+"</td>");
               out.println("<td>"+rs.getString(4)+"</td>");
               out.println("<td>"+rs.getString(5)+"</td>");
               out.println("<td>"+rs.getString(6)+"</td>");
               out.println("<td>"+rs.getString(7)+"</td>");
               out.println("<td>"+rs.getString(8)+"</td>");
               out.println("<td>"+rs.getString(9)+"</td>");
               out.println("<td>"+rs.getString(10)+"</td>");
               out.println("<td>"+rs.getString(11)+"</td>");
               out.println("<td>"+rs.getString(12)+"</td>");
                       out.println("</tr>");         
                                
                                
           }
                                
                                
                                
                                }
                                catch(Exception e){}
            %>
               
                        </table> 
                            
                            
                            
                            
                            
                            
                            
                          
    </body>
</html>
