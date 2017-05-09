<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
  String email = request.getParameter("email");    
	Connection con=bean.ConnectionProvider.getCon();
  PreparedStatement ps=con.prepareStatement("select * from resume where email = ?");
  ps.setString(1,email);
  ResultSet rs = ps.executeQuery();
  rs.next();
  
  
  response.reset();                           
  
      response.setContentType("application/pdf");
 

  response.addHeader("Content-Disposition","attachment; filename=resume");

  Blob blb = rs.getBlob(2);
  byte[] bdata = blb.getBytes(1, (int) blb.length());
  
  // get the response Output stream object to write the content of the file into header
  OutputStream output =  response.getOutputStream();
  output.write(bdata);
  output.close();
  // close the obejct of ResultSet
  rs.close();
  
  // close the connection object.. 
  con.close();
  
%>