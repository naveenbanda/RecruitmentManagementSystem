<%
	if(session.getAttribute("email")==null || session.getAttribute("email")=="")
	{
%>
	You are not logged in<br/>
	<a href="login.jsp">Login</a>
<%
	}

	else
	{
%>

<%@page import="java.sql.*"%>

<%

try
{
	Connection con=bean.ConnectionProvider.getCon();
	
	PreparedStatement ps=con.prepareStatement("select Jobs.id,title,apply.email from Jobs,apply where Jobs.id=apply.id and Jobs.email=?");
	ps.setString(1,session.getAttribute("email").toString());
	ResultSet rs=ps.executeQuery();
%>
	
	<center>
	
	<table border="5">
	<tr>
	<th>ID</th>
	<th>Title</th>
	<th>Applicant Email</th>
	<th>Resume</th>
	
	</tr>

<%	
	while(rs.next())
	{
		int id=rs.getInt("Jobs.id");
		String title=rs.getString("title");
		String email=rs.getString("apply.email");
		
%>	
		<tr>
		<td><%=id %></td>
		<td><%=title %></td>
		<td><%=email %></td>
		<td><a href="downloadResume.jsp?email=<%=email%>">Download</a></td>
		</tr>
		
<%
		
	}
%>
	
 </table>
 
 </center>
	
<%	
	con.close();
	
}
catch(Exception e)
{
	out.println("An error occurred : "+e.toString());
	
}

	}

%>