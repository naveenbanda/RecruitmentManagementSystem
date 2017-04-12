package recruitment;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  

@WebServlet("/WelcomePage")

public class WelcomePage extends HttpServlet {  
  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
          
    String n=request.getParameter("userName");  
    out.print("Welcome "+n);  
    }  
  
}  