/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Ride;
public class RideDatabase {
    public static boolean addRide(Ride ride)
    {
        boolean success = false;
        int executedValue = 0;
        
        try
        {
            Connection conn = DBConnection.getConnection();
            
            String query = "INSERT INTO createpool(tripsource,tripdestination,spareseats,way,tripdate,triptime,womenonly,teacheronly,description,amount,vehicletype,vehiclemodel)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            
            stmt.setString(1, ride.getTripsource());
            stmt.setString(2, ride.getTripdestination());
            stmt.setString(3, ride.getSpareseats());
            stmt.setString(4, ride.getWay());
            stmt.setString(5, ride.getTripdate());
            stmt.setString(6, ride.getTriptime());
            stmt.setString(7, ride.getWomenonly());
            stmt.setString(8, ride.getTeacheronly());
            stmt.setString(9, ride.getDescription());
            stmt.setString(10, ride.getAmount());
            stmt.setString(11, ride.getVehicletype());
            stmt.setString(12, ride.getVehiclemodel());
            
            
            executedValue = stmt.executeUpdate();
            
            if(executedValue > 0)
                success = true;
            else
                success= false;
        } 
        catch (Exception e)
        {   
            System.out.println(e);
        }
        
        return success;
    }
}
