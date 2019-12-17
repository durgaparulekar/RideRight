/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static database.SessionService.session;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diana
 */
@WebServlet(urlPatterns = {"/rideServlet"})
public class rideServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             // HttpSession session=request.getSession();
              
              
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
          
       if(i!=0)
       {
           
          response.sendRedirect("welcome.jsp"); 
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
