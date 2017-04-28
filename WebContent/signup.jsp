<html>
<head>
<title>SignUp Page</title>
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

<form action="signupprocess.jsp" method="post">
	Name		:	<input type="text" name="name"/><br/><br/>
	DOB			:	<input type="text" name="DOB"/>	(Format : yyyy-mm-dd)<br/><br/>
	Gender		:	<input type="radio" name="gender" value="Male">Male
					<input type="radio" name="gender" value="Female">Female
					<input type="radio" name="gender" value="Other">Other<br/><br/>
	E-mail		:	<input type="text" name="email"/><br/><br/>
	Password	:	<input type="password" name="pass"/><br/><br/>
	
	
	
	<input type="submit" value="SignUp"/>
</form>

Already have an account <a href="login.jsp">Login</a>

</center>

</body>
</html>