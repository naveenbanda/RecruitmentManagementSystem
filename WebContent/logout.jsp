<% 
	session.setAttribute("session","FALSE");
	session.setAttribute("email",null);
	session.invalidate();
	response.sendRedirect("index.jsp");
%>