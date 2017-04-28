<%@page import="bean.RecruiterLoginDao"%>
<jsp:useBean id="obj" class="bean.RecruiterLoginBean"></jsp:useBean>

<jsp:setProperty property="*" name="obj"/>

<%
boolean status=RecruiterLoginDao.validate(obj);

if(status)
{
	//out.println("You are successfully logged in");
	
	session.setAttribute("session","TRUE");
	session.setAttribute("email",obj.getEmail());
	response.sendRedirect("indexAfterRecruiterLogin.jsp");
	
}
else
{
	out.print("Sorry! E-mail or Password error!!");
%>
<jsp:include page="recruiterLogin.jsp"></jsp:include>
<%
}
%>