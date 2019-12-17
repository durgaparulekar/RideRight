package Customer;



import database.RegistrationService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserInfo;

@WebServlet(name = "CustomerRegister", urlPatterns =
{
    "/CustomerRegister"
})
public class CustomerRegister extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
       
        UserInfo customer = new UserInfo();
        customer.setFirstName(request.getParameter("firstName"));
        customer.setLastName(request.getParameter("lastName"));
        customer.setID(10);
        customer.setUsername(request.getParameter("username"));
        customer.setPassword(request.getParameter("password"));    
              
        if(RegistrationService.saveToDBCustomer(customer))
        {
            response.sendRedirect("customer-login.jsp");
        }
        else
	{
          
            response.sendRedirect("register-failure.jsp");
        }
    }
}
