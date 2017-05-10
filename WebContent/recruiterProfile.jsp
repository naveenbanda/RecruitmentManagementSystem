<%@ include file="headerAfterRecruiterLogin.jsp"%>

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
		<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js"></script></head>

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
	
	//out.println(email);
	
	PreparedStatement ps=con.prepareStatement("select * from Recruiter where email=?");
	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	
	String password="",contact="",name="";
	
	while(rs.next())
	{
	
	password=rs.getString("password");
	contact=rs.getString("contact");
	name=rs.getString("name");
	
	}
	
	//out.println(name);
	//out.println(DOB);
	//out.println(password);
	//out.println(gender);
	
	con.close();

%>

    <body>
    <div id="RecruiterProfile">
        <div class="container">
            <center>  <div class="CompanyName"><h2><%=name %></h2></div></center>
            <hr><br>
            <div id="email"><h3>Email : <%=email %></h3></div>
            <div><h3>Contact: <%=contact %></h3></div>
		</div>
		
		<div class="container">
		<%

		try
		{
			con=bean.ConnectionProvider.getCon();
	
			ps=con.prepareStatement("select Jobs.id,Jobs.title,Jobs.type,Jobs.startDate,Jobs.lastDate from Jobs where email=?");
			ps.setString(1,email);
			rs=ps.executeQuery();
		%>
	
		<center>
		<div class="postedTable"><h2>Posted Jobs</h2></div>
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
%>		
		</div>
		
		</div>
    </body>
</html>

<%
	
}
catch(Exception e)
{
	out.println("An error occurred : "+e.toString());
	
}

}

%>