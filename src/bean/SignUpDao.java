package bean;
import java.sql.*;

public class SignUpDao {
	
	public static boolean signup(SignUpBean bean)
	{
		boolean status=false;
		
		LoginBean tempBean=new LoginBean();
		tempBean.setEmail(bean.getEmail());
		tempBean.setPass(bean.getPass());
		
		if(!LoginDao.validate(tempBean))
		{
			status=true;
			
			try
			{
				Connection con=ConnectionProvider.getCon();
				
				PreparedStatement ps=con.prepareStatement("insert into Info value(?,?,?,?,?)");
				ps.setString(1,bean.getEmail());
				ps.setString(2,bean.getPass());
				ps.setString(3,bean.getName());
				ps.setString(4,bean.getDOB());
				ps.setString(5,bean.getGender());
				
				int rs=ps.executeUpdate();
				
				ps=con.prepareStatement("insert into Login values(?,?)");
				
				ps.setString(1,bean.getEmail());
				ps.setString(2,bean.getPass());
				
				rs=ps.executeUpdate();
				
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
