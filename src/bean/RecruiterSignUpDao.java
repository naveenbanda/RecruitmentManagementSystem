package bean;
import java.sql.*;

public class RecruiterSignUpDao {
	
	public static boolean signup(RecruiterSignUpBean bean)
	{
		boolean status=false;
		
		RecruiterLoginBean tempBean=new RecruiterLoginBean();
		tempBean.setEmail(bean.getEmail());
		tempBean.setPass(bean.getPass());
		
		if(!RecruiterLoginDao.validate(tempBean))
		{
			status=true;
			
			try
			{
				Connection con=ConnectionProvider.getCon();
				
				PreparedStatement ps=con.prepareStatement("insert into Recruiter value(?,?,?,?)");
				ps.setString(1,bean.getEmail());
				ps.setString(2,bean.getPass());
				ps.setString(3,bean.getName());
				ps.setString(4,bean.getContact());
				
				int rs=ps.executeUpdate();
				
				con.close();
				
				
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		
		return status;
		
	}
	
}
