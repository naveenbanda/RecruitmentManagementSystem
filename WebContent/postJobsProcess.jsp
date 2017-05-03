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

<%@page import="java.sql.*"%>

<%

try
{
	Connection con=bean.ConnectionProvider.getCon();
	
	PreparedStatement ps=con.prepareStatement("insert into Jobs values(?,?,?,?,?,?,?,?,?,?,?)");
	
	ps.setString(1,null);
	ps.setString(2,session.getAttribute("email").toString());
	ps.setString(3,request.getParameter("title"));
	ps.setString(4,request.getParameter("type"));
	ps.setString(5,request.getParameter("startDate"));
	ps.setString(6,request.getParameter("duration"));
	ps.setString(7,request.getParameter("stipend"));
	ps.setString(8,request.getParameter("applyTill"));
	ps.setString(9,request.getParameter("postedOn"));
	
	String about=request.getParameter("about");
	StringBuffer sb=new StringBuffer();
	sb.append("<pre>"+about+"</pre>");
	about=sb.toString();
	ps.setString(10,about);
	
	String requirement=request.getParameter("requirement");
	sb=new StringBuffer();
	sb.append("<pre>"+requirement+"</pre>");
	requirement=sb.toString();
	ps.setString(11,requirement);
	
	int rs=ps.executeUpdate();
	
	if(rs!=0)
	{
		out.print("Job Successfully Posted");
%>
		<a href="indexAfterRecruiterLogin.jsp">Home</a>	
<%
	}
	else
	{
		out.print("Something went wrong!! Check the form again please!!");
%>
	<jsp:include page="postJobs.jsp"></jsp:include>
<%
	}
	
	con.close();
	
}
catch(Exception e)
{
	System.out.println(e);
	
}
	}

%>