/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import static database.SessionService.session;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Ride.*;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Diana
 */
@WebServlet(urlPatterns = {"/changepassword"})
public class changepassword extends HttpServlet {

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
            String emailid="";
           String email=request.getParameter("email");
            String pass=request.getParameter("pwd");
             Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
    Statement st = con.createStatement();
    
     ResultSet rs = st.executeQuery("select * from usertable where emailid='"+email+"' ");
           if(rs.next()){
          emailid=rs.getString("emailid");
           Ride.Mail.forgotPass(emailid);
         // response.sendRedirect("forgotpassword.jsp");
        // out.println("An Email along with the login credentials has been sent to you on your registered email. ");
            request.setAttribute("errormessage", "An Email along with the login credentials has been sent to you on your registered email.");
                RequestDispatcher rd=request.getRequestDispatcher("forgotpassword.jsp");  
 
rd.forward(request, response); 
           }
     else{
                request.setAttribute("errormessage", "Invalid Email");
               RequestDispatcher rd1 = request.getRequestDispatcher("forgotpassword.jsp");
              rd1.forward( request, response);
     }
     
        }
        catch(Exception e){}finally {
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
