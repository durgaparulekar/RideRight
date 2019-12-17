/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Ride;
import database.RideDatabase;
/**
 *
 * @author Diana
 */
@WebServlet(name = "addRide", urlPatterns = {"/addRide"})
public class addRide extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
           Ride ride = new Ride();
        ride.setTripsource(request.getParameter("tripsource"));
        ride.setTripdestination(request.getParameter("tripdestination"));
        ride.setSpareseats(request.getParameter("spareseats"));
        ride.setWay(request.getParameter("way"));
        ride.setTripdate(request.getParameter("tripdate"));
        ride.setTriptime(request.getParameter("triptime"));
        ride.setWomenonly(request.getParameter("womenonly"));
        ride.setTeacheronly(request.getParameter("teacheronly"));
        ride.setDescription(request.getParameter("description"));
        ride.setAmount(request.getParameter("amount"));
        ride.setVehicletype(request.getParameter("vehicletype"));
        ride.setVehiclemodel(request.getParameter("vehiclemodel"));
        
        if(RideDatabase.addRide(ride))
        {
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("register-failure.jsp");
        }
            
              
            
        } finally {
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
