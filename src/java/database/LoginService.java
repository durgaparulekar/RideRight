package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;

public class LoginService
{
  /*  public static boolean validateLogin(String username, String password)
    {
        boolean success = false;
        
        try
        {
            Connection conn = DBConnection.getConnection();
            
            String query = "SELECT * FROM adminInfo WHERE username=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            String dbUsername = "", dbPassword = "";
            while(rs.next())
            {
                dbUsername = rs.getString("username");
                dbPassword = rs.getString("password");
            }
            
            if(username.equals(dbUsername) && password.equals(dbPassword))
                success = true;
            else
                success = false;
        } 
        catch (Exception e)
        {
            System.out.println(e);
        }
        return success;
    }
    */
    public static boolean validateLoginCustomer(String email, String pass)
    {
        boolean success = false;
        
        try
        {
            Connection conn = DBConnection.getConnection();
            Statement st=conn.createStatement();
            int count=0;
          if (email != null && pass != null) 
          {
            String sql = "Select * from usertable where emailid='" + email + "' and pwd='" + pass + "'";
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
            count++;
            }
            if (count!=0) {
               success=true;
            }
            else{
                success=false;
            }
          }
        /*    String query = "SELECT * FROM usertable WHERE emailid=? AND pwd=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, pass);
            
            ResultSet rs = stmt.executeQuery();
            
            String dbUsername = "", dbPassword = "";
            while(rs.next())
            {
                dbUsername = rs.getString("email");
                dbPassword = rs.getString("pass");
            }
          
            if(email.equals(dbUsername) && pass.equals(dbPassword))
                success = true;
            else
                success = false;
        */
            
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return success;
    }
}
