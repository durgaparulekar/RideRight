/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
  import Ride.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
/**
 *
 * @author Diana
 */
@WebServlet(urlPatterns = {"/registerServlet"})
@MultipartConfig(maxFileSize = 1073741824)
public class registerServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
          //  int userid=Integer.parseInt(request.getParameter("userid"));
          String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String emailid = request.getParameter("emailid");
           
            String pwd = request.getParameter("pass");
              String address = request.getParameter("address");
              
            String gender = request.getParameter("gender");
            String faculty = request.getParameter("faculty");
            String course = request.getParameter("course");
            String yearr = request.getParameter("year");
            String department = request.getParameter("department");        
            int age=Integer.parseInt(request.getParameter("age"));
             String mobileno = request.getParameter("mobileno");
         
             InputStream inputStream = null; // input stream of the upload file
// obtains the upload file part in this multipart request
        Part filePart = request.getPart("collegeid");       //problem in this line for registration1.jsp
          inputStream = filePart.getInputStream();
     
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rideright","rideright");
      // Statement st=con.createStatement();
     /*   ResultSet rs=st.executeQuery("select * from usertable where emailid='"+emailid+"'");
            int count=0;
            while(rs.next())
            {
            count++;
            }
            if(count!=0)
            {   
             request.setAttribute("errorMessage", "Email Already Exists. Try again with a different email ID");
              RequestDispatcher rd = getServletContext().getRequestDispatcher("/joinus.jsp");
              rd.forward(request,response);
            }*/
            
                  

        PreparedStatement ps=con.prepareStatement("insert into usertable(firstname,lastname,emailid,pwd,address,gender,faculty,course,yearr,department,age,mobileno,collegeid)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");  
              ps.setString(1,firstname);
         ps.setString(2,lastname);
          ps.setString(3,emailid);
           ps.setString(4,pwd);
           ps.setString(5,address);
           ps.setString(6,gender);
           ps.setString(7,faculty);
           ps.setString(8,course);
           ps.setString(9,yearr);
           ps.setString(10,department);
           ps.setInt(11,age);
           ps.setString(12,mobileno);
           ps.setBinaryStream(13, inputStream);         
// ps.setBinaryStream(12, photo.getInputStream(), (int)  photo.getSize());
           int i=ps.executeUpdate();
           Ride.Mail.RegMail(emailid, (firstname+" "+lastname), pwd,address,  mobileno, gender);    
       if(i!=0)
       {
          response.sendRedirect("login.jsp"); 
       }
        }
        
        catch(Exception e){
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
  