
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
	
	PreparedStatement ps=con.prepareStatement("select * from Info where email=?");
	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	
	String password="",DOB="",gender="",name="";
	
	while(rs.next())
	{
	
	password=rs.getString("password");
	DOB=rs.getString("DOB");
	gender=rs.getString("gender");
	name=rs.getString("name");
	
	}
	
	out.println(name);
	out.println(DOB);
	out.println(password);
	out.println(gender);
	
	con.close();

%>

<center>

<form action="signupprocess.jsp" method="post">
	Name		:	<input type="text" name="name" value=<%=name %>/><br/><br/>
	DOB			:	<input type="text" name="DOB" value=<%=DOB %>/>	(Format : yyyy-mm-dd)<br/><br/>
	Gender		:	<input type="radio" name="gender" value="Male" <%if(gender=="Male")%>checked="checked"/>Male
					<input type="radio" name="gender" value="Female" <%if(gender=="Female")%>checked="checked"/>Female
					<input type="radio" name="gender" value="Other" <%if(gender=="Other")%>checked="checked"/>Other<br/><br/>
	E-mail		:	<input type="text" name="email" value=<%=email %>/><br/><br/>
	Password	:	<input type="password" name="pass" value=<%=password %>/><br/><br/>
	
	
	
	<input type="submit" value="Save Changes"/>
</form>

</center>

<%
	
}
catch(Exception e)
{
	out.println("An error occurred : "+e.toString());
	
}

}

%>