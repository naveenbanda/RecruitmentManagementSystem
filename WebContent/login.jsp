<%@ include file="header.jsp"%>

<html>
<head>
<title>Login Page</title>
</head>
<body>
<div id="Login">
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

<form action="loginprocess.jsp" method="post">
Email: <input type="text" name="email"/><br/><br/>
Password: <input type="password" name="pass"/><br/><br/>
<input type="submit" value="Login"/>
</form>

New User <a href="signup.jsp">Sign Up</a>

</center>
</div>
</div>
</body>
</html>


