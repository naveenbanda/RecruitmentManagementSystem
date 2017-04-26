package recruitment;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")

public class Login extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String n=request.getParameter("userName");
		//System.out.println(n);
		String p=request.getParameter("userPass");
		//System.out.println(Validate.checkUser(n,p));
		
		if(Validate.checkUserLogin(n,p))
		{
			RequestDispatcher rd=request.getRequestDispatcher("WelcomePage");
			rd.forward(request,response);
		}
		else
		{
			out.print("Sorry UserName or Password Error!");
			RequestDispatcher rd=request.getRequestDispatcher("/index.html");
			rd.include(request,response);
		}
	}
}


