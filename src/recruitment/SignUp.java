package recruitment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import org.apache.catalina.servlet4preview.RequestDispatcher;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")

public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		if(!Validate.checkUserSignUp(email,password))
		{
			javax.servlet.RequestDispatcher rd=request.getRequestDispatcher("WelcomePage");
			rd.forward(request, response);
		}
		else
		{
			out.print("An account already exists with that e-mail id!");
			RequestDispatcher rd=(RequestDispatcher) request.getRequestDispatcher("/signup.html");
			rd.include(request, response);
		}
	}

}
