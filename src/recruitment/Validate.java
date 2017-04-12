package recruitment;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Validate")

public class Validate {

	public static boolean checkUser(String email,String pass)
	{
		boolean st=false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/RecruitmentDatabase","root", "naveen");
			
			//System.out.println(con);
			
			PreparedStatement pst = con.prepareStatement("select * from Login where email=? and password=?");
            pst.setString(1, email);
            pst.setString(2, pass);
			
            ResultSet rs = pst.executeQuery();
			
            st=rs.next();
			
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return st;
		
	}
}
