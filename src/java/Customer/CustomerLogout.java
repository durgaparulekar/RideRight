package Customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CustomerLogout", urlPatterns =
{
    "/CustomerLogout"
})
public class CustomerLogout extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session;
        session = request.getSession();
        
        String email = (String) session.getAttribute("email");
        
        if(email != null)
        {
            session.removeAttribute("email");
            
        }
       
        response.sendRedirect("CustomerLogin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    }
}
