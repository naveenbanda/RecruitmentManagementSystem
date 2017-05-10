<%@ include file="headerAfterRecruiterLogin.jsp"%>

<div id="DisplayJobs">

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
	
	PreparedStatement ps=con.prepareStatement("select id,title,type,startDate,lastDate from Jobs");
	
	ResultSet rs=ps.executeQuery();
%>
	
	<center>
	
	<table border="5">
	<tr>
	<th>ID</th>
	<th>Title</th>
	<th>Type</th>
	<th>Start Date</th>
	<th>Apply Till</th>
	
	</tr>

<%	
	while(rs.next())
	{
		int id=rs.getInt("id");
		String title=rs.getString("title");
		String type=rs.getString("type");
		String startDate=rs.getString("startDate");
		String applyTill=rs.getString("lastDate");
%>	
		<tr onclick="location.href='jobInfo.jsp?id=<%=id%>'">
		<td><%=id %></td>
		<td><%=title %></td>
		<td><%=type %></td>
		<td><%=startDate %></td>
		<td><%=applyTill %></td>
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

</div>