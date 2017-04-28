<%@page import="bean.SignUpDao"%>
<jsp:useBean id="obj" class="bean.SignUpBean"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>

<%
boolean status=SignUpDao.signup(obj);

if(status)
{
	session.setAttribute("session","TRUE");
	session.setAttribute("email",obj.getEmail());
	response.sendRedirect("indexAfterLogin.jsp");
}
else
{
	out.print("An account already exist with this email-id");
%>
<jsp:include page="signup.jsp"></jsp:include>
<%	
}
%>