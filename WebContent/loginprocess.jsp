<%@page import="bean.LoginDao"%>
<jsp:useBean id="obj" class="bean.LoginBean"></jsp:useBean>

<jsp:setProperty property="*" name="obj"/>

<%
boolean status=LoginDao.validate(obj);

if(status)
{
	//out.println("You are successfully logged in");
	
	session.setAttribute("session","TRUE");
	session.setAttribute("email",obj.getEmail());
	response.sendRedirect("indexAfterLogin.jsp");
	
}
else
{
	out.print("Sorry! E-mail or Password error!!");
%>
<jsp:include page="login.jsp"></jsp:include>
<%
}
%>