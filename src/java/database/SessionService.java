package database;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionService
{
    public static HttpSession session;
    
    public static boolean validateSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if(null == session)
        {
          return false; 
        }
        else
        {
           String email = (String) session.getAttribute("email");
           if(null == email)
           {
               return false;
           }
           else
           {
               SessionService.session = session;
               return true;
           }
        }
    }  
}