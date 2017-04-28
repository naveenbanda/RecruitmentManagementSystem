<html>
<head>
<title>Recruiter SignUp Page</title>
</head>
<body>
<center>
<h1>
WeRecruits.com
</h1>
<h3>
an online portal for job seekers and recruiters....
</h3>

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

<form action="recruiterSignUpProcess.jsp" method="post">
	Organisation Name		:	<input type="text" name="name"/><br/><br/>
	Contact Number			:	<input type="text" name="contact"/><br/><br/>
	E-mail					:	<input type="text" name="email"/><br/><br/>
	Password				:	<input type="password" name="pass"/><br/><br/>
	
	<input type="submit" value="SignUp"/>
</form>

Already have an account <a href="recruiterLogin.jsp">Login</a>

</center>

</body>
</html>