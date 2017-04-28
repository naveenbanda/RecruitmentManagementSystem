<%@page import="bean.RecruiterSignUpDao"%>
<jsp:useBean id="obj" class="bean.RecruiterSignUpBean"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>

<%
boolean status=RecruiterSignUpDao.signup(obj);

if(status)
{
	session.setAttribute("session","TRUE");
	session.setAttribute("email",obj.getEmail());
	response.sendRedirect("indexAfterRecruiterLogin.jsp");
}
else
{
	out.print("An account already exist with this email-id");
%>
<jsp:include page="recruiterSignUp.jsp"></jsp:include>
<%	
}
%>