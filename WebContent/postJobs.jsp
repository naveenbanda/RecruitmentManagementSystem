<html>
<head>
<title>
Post Jobs
</title>
</head>

<body>

<center>

<h1>
Job Posting Form
</h1>
<h3>
hire the best in the world....
</h3>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String date=sdf.format(new Date());
%>

<%

String profile_msg=(String)request.getAttribute("profile_msg");
if(profile_msg!=null)
{
	out.print(profile_msg);
}
String login_msg=(String)request.getAttribute("login_msg");
if(login_msg!=null)
{
	out.print(login_msg);
}

%>

<form action="postJobsProcess.jsp" method="post">
	Job Title		:	<input type="text" name="title"/><br/><br/>
	Job Location	:	<input type="text" name="location"/><br/><br/>
	Type			:	<input type="radio" name="type" value="Internship"/>Internship
						<input type="radio" name="type" value="Full Time"/>Full Time<br/><br/>
	Start Date 		:	<input type="text" name="startDate"/> (Format : yyyy-mm-dd)<br/><br/>
	Duration 		:	<input type="text" name="duration"/><br/><br/>
	Stipend			:	<input type="text" name="stipend"/><br/><br/>
	Apply Till		:	<input type="text" name="applyTill"/> (Format : yyyy-mm-dd)<br/><br/>
	Posted On		:	<input type="text" name="postedDate" value="<%=date%>" disabled/> (Format : yyyy-mm-dd)<br/><br/>
	<textarea rows="8" cols="100" placeholder="Give Description about the Job and Job roles" name="about"></textarea><br/><br/>
	<textarea rows="8" cols="100" placeholder="Qualifications and Skills required for the Job" name="requirement"></textarea><br/><br/>
	
		
</form>

</center>

</body>

</html>