<%
	if(session.getAttribute("email")==null || session.getAttribute("email")=="")
	{
%>
	You are not logged in<br/>
	<a href="recruiterLogin.jsp">Login</a>
<%
}
else
{
%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
        String email=(String) session.getAttribute("email");

		String rtempfile = File.createTempFile("temp","1").getParent(); 
		MultipartRequest multi = new MultipartRequest(request,rtempfile, 15*1024*1024);

		Enumeration files = multi.getFileNames();
		
		String name="";
		String fileExtesion="";
		File ff =null;
		FileInputStream fin =null;
		
		while (files.hasMoreElements())
		{
		   name=(String)files.nextElement();                                        
		   ff = multi.getFile(name);
		   fileExtesion = ff.getName().substring(ff.getName().lastIndexOf("."));
		   
		   // check user has select the correct file or not
		   boolean fileAllowed = fileExtesion.equalsIgnoreCase(".txt")||
		                         fileExtesion.equalsIgnoreCase(".pdf")||
		                         fileExtesion.equalsIgnoreCase(".doc")||
		                         fileExtesion.equalsIgnoreCase(".docx")||
		                         fileExtesion.equalsIgnoreCase(".xls")||
		                         fileExtesion.equalsIgnoreCase(".xlsx");
		   
		   if((ff!=null)&&fileAllowed)
		   {
		
        try {
            
            Connection con=bean.ConnectionProvider.getCon();
            
            PreparedStatement ps=con.prepareStatement("select * from resume where email=?");
        	ps.setString(1,email);
        	
        	ResultSet rs=(ResultSet) ps.executeQuery();
        	
        	if(rs.next())
        	{
        		ps=con.prepareStatement("update resume set resume=? where email=?");
        		fin=new FileInputStream(ff);
        		ps.setBinaryStream(1,(InputStream)fin, (int)(ff.length()));
        		//ps.setBlob(1,request.getParameter("resume"));
        		ps.setString(2,email);
        		int res=ps.executeUpdate();
        		
        	}
        	else
        	{
        		ps=con.prepareStatement("insert into resume values(?,?)");
        		fin=new FileInputStream(ff);
        		ps.setString(1,email);
        		ps.setBinaryStream(2,(InputStream)fin, (int)(ff.length()));
        		//ps.setBlob(2,request.getParameter("resume"));
        		
        		int res=ps.executeUpdate();
        	
        		
        	}
        	
        	con.close();
            
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        
		out.print("Resume Successfully Uploaded");
%>
		<a href="indexAfterLogin.jsp">Home</a>	
<%
        
}
		   else
		   {
			   out.print("Please select the correct file...");
		   }
		   
		}
	
}

%>
       