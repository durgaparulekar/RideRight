/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author Diana
 */
@WebServlet(urlPatterns = {"/searchServlet"})
public class searchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           String tripsource = request.getParameter("FromInput");
           String tripdestination=request.getParameter("ToInput");
            Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
            String sql="select * from createpool where tripsource='"+tripsource+"' and tripdestination='"+tripdestination+"'";
                   
            
           PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs= ps.executeQuery();
                         out.println("    <table border=1>");
                        out.println("     <tr>");
                        out.println("    <th>Source</th>");
                         out.println("   <th>Destination</th>");
                        out.println("    <th>Available seats</th>");
                        out.println("    <th>Way</th>");
                        out.println("    <th>Date</th>");
                         out.println("   <th>Time</th>");
                         out.println("   <th>Women Only</th>");
                         out.println("   <th>Teacher Only</th>");
                         out.println("  <th>Description </th>");
                          out.println("    <th>Cost</th> ");  
                        out.println("  <th>Vehicle Type</th>");
                            out.println(" <th>Vehicle Model</th>");
                      out.println(" </tr>");
           while(rs.next()){
                out.println("<tr><td>"+rs.getString(1)+"</td>");
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
              out.println("<td> <a href=''><center>View Details<center></a></td>");
                       out.println("</tr>");         
                       out.println("</table>");        
                                
           }      
        }
        catch(Exception e){}
        
        finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
