package bean;
import java.sql.*;
import static bean.Provider.*;

public class ConnectionProvider {

	public static Connection con=null;
	
	//static
	//{
		
		
	//}
	
	public static Connection getCon()
	{
		try
		{
			Class.forName(DRIVER);
			con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return con;
	}
	
}
