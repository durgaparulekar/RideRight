package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection 
{
	private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private static String username = "rideright";
	private static String password = "rideright";

	private static Connection conn;
        
	private DBConnection()
	{

	}

	public static Connection getConnection()
	{
		try
		{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                     DBConnection.conn = DriverManager.getConnection(DBConnection.url, DBConnection.username, DBConnection.password);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return conn;
	}

}