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
	<%@ include file="headerAfterLogin.jsp"%>

	<% %>

	<%@ include file="mainPage.jsp"%>
<%
}
%>

