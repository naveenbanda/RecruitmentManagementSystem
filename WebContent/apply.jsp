<%@ include file="headerAfterLogin.jsp"%>

<div id="Apply">

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
	
	String email=session.getAttribute("email").toString();
	
	int id=Integer.parseInt(request.getParameter("id"));
	
	//out.println("yes");
	
	PreparedStatement ps=con.prepareStatement("select * from apply where email=? and id=?");
	ps.setString(1,email);
	ps.setInt(2,id);
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		%>
		You have already applied!!<br/>
		<a href="indexAfterLogin.jsp">Home</a>
		<%	
	}
	else
	{
		ps=con.prepareStatement("insert into apply value(?,?)");
		ps.setInt(1,id);
		ps.setString(2,email);
		int res=ps.executeUpdate();
		
		%>
		Successfully applied!!<br/>
		<a href="indexAfterLogin.jsp">Home</a>
		<%	
		
	}
	
	
	
}
catch(Exception e)
{
	out.println("An error occurred : "+e.toString());
	
}

}

%>

</div>