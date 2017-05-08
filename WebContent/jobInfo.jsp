<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
		<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js"></script></head>
    <style>
    table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}</style>

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

<%@page import="java.sql.*"%>

<%

try
{
	Connection con=bean.ConnectionProvider.getCon();
	
	int id=Integer.parseInt(request.getParameter("id"));
	//out.println(id);
	PreparedStatement ps=con.prepareStatement("select * from Jobs where id=?");
	ps.setInt(1,id);
	ResultSet rs=ps.executeQuery();
	
		rs.next();
	
		String title=rs.getString("title");
		String type=rs.getString("type");
		String startDate=rs.getString("startDate");
		String applyTill=rs.getString("lastDate");
		int stipend=rs.getInt("stipend");
		String postedOn=rs.getString("postedOn");
		String email=rs.getString("email");
		String duration=rs.getString("duration");
		String about=rs.getString("about");
		String requirement=rs.getString("requirement");
		
	ps=con.prepareStatement("select * from Recruiter where email=?");
	ps.setString(1,email);
	rs=ps.executeQuery();
		
		rs.next();
		
		String name=rs.getString("name");
		long contact=rs.getLong("contact");
	
		
		
%>	

    <body>
        <div class="container">
            <center>  <div class="company_name"><h2><%=name %></h2></div></center>
            <hr><br><div id="job_title"><h3>Job Title : <%=title %></h3>
            </div>
            <br>
            <table>
             <tr>
    <th>Start Date</th>
    <th>Duration</th>
    <th>Stipend</th>
    <th>Posted on</th>
    <th>Apply By</th>
    
  </tr>
  <tr><td><%=startDate %></td>
    <td><%=duration %></td>
    <td><%=stipend %></td>
            <td><%=postedOn %></td>
      <td><%=applyTill %></td><tr></table>
            <br> <br>
            <div class="container"><h3>About The Job</h3><p><%=about %></p>
                </div> <br><br>
            <div class="container">
                <h3>Requirement</h3><p><%=requirement %></p>
                
                
            </div><br><br>
            <div><h3>Contact : </h3><%=contact %></div>
            <div><h3>Email : </h3><%=email %></div>
            
            <form action="apply.jsp?id=<%=id%>" method="post">
        		<input type="submit" value="Apply"/>
			</form>
            
        </div>           <br><br>
           <br><br>
            <br><br>
            
        
        

    </body>
</html>
	

 

	
<%	
	con.close();
	
}
catch(Exception e)
{
	out.println("An error occurred : "+e.toString());
	
}

	}

%>

