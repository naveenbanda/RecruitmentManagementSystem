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

	public static boolean checkUserLogin(String email,String pass)
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
	
	public static boolean checkUserSignUp(String email,String password)
	{
		boolean st=true;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/RecruitmentDatabase","root","naveen");
			
			PreparedStatement ps=con.prepareStatement("select * from Login where email=?");
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			
			st=rs.next();
			
			if(st==false)
			{
				ps=con.prepareStatement("insert into Login values(?,?)");
				ps.setString(1,email);
				ps.setString(2,password);
				
				int result=ps.executeUpdate();
				
			}
			
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return st;
		
	}
}
