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
	<%@ include file="headerAfterRecruiterLogin.jsp"%>

	<% %>

	<%@ include file="mainPage.jsp"%>
<%
}
%>

