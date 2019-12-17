package Customer;

import database.LoginService;
import database.SessionService;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CustomerLogin", urlPatterns =
{
    "/CustomerLogin"
})
public class CustomerLogin extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if(SessionService.validateSession(request, response))
        {
             RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
             dispatcher.forward(request, response);
        }
        else{
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
       
            
        HttpSession session;
        
        if(LoginService.validateLoginCustomer(email, pass))
        {
            session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("index.jsp");
        }
        else
        {
             request.setAttribute("errorMessage", "Invalid credentials");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
              rd.forward( request, response);
        }
    }
}
