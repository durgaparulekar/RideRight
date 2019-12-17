/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static database.SessionService.session;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Diana
 */
@WebServlet(urlPatterns = {"/servletLogin"})
public class servletLogin extends HttpServlet {

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
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            int count=0;
             if(email.equals("admin") && pass.equals("admin")){
               response.sendRedirect("http://localhost:14600/rightrideproj/joli/index.jsp");
                 }
             else{
         Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
           
          if (email != null && pass != null) 
          {
            String sql = "Select * from usertable where emailid='" + email + "' and pwd='" + pass + "'";
          Statement st=con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
            count++;
            }
            if (count!=0) {
             
//in this case enter when at least one result comes it means user is valid
            RequestDispatcher dispatcher = request.getRequestDispatcher("./loginsession.jsp");
           dispatcher.forward( request, response);
            
            }
            if(count==0){
              response.sendRedirect("UserDoesntExist.jsp");
            }
            }
            else {
                //in this case enter when  result size is zero  it means user is invalid
              request.setAttribute("errorMessage", "Invalid credentials");
               RequestDispatcher rd = getServletContext().getRequestDispatcher("./login.jsp");
              rd.forward( request, response);
                             
            }
              
          
        }
        }
        
         catch(Exception e) {
             e.printStackTrace();
         }  
            
            
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
