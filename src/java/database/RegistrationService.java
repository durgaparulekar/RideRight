package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import model.AdminInfo;
import model.UserInfo;

public class RegistrationService
{/*
    public static boolean saveToDB(AdminInfo admin)
    {
        boolean success = false;
        int executedValue = 0;
        try
        {
            Connection conn = DBConnection.getConnection();
            
            String query = "INSERT INTO adminInfo (id, username, password, firstName, lastname)"
                    + "VALUES (?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, admin.getID());
            stmt.setString(2, admin.getUsername());
            stmt.setString(3, admin.getPassword());
            stmt.setString(4, admin.getFirstName());
            stmt.setString(5, admin.getLastName());
            
            executedValue = stmt.executeUpdate();
            if(executedValue > 0)
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
    public static boolean saveToDBCustomer(UserInfo customer)
    {
         boolean success = false;
        int executedValue = 0;
        try
        {
            Connection conn = DBConnection.getConnection();
            String query = "INSERT INTO clientInfo (id, username, password, firstName, lastname)"
                    + "VALUES (?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, customer.getID());
            stmt.setString(2, customer.getUsername());
            stmt.setString(3, customer.getPassword());
            stmt.setString(4, customer.getFirstName());
            stmt.setString(5, customer.getLastName());
            
            executedValue = stmt.executeUpdate();
            if(executedValue > 0)
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
    
}
