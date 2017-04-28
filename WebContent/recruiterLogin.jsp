<html>
<head>
<title>Recruiter Login Page</title>
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

<form action="recruiterLoginProcess.jsp" method="post">
Email: <input type="text" name="email"/><br/><br/>
Password: <input type="password" name="pass"/><br/><br/>
<input type="submit" value="Login"/>
</form>

New Recruiter <a href="recruiterSignUp.jsp">Sign Up</a>

</center>

</body>
</html>
