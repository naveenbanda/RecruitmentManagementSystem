package recruitment;

import java.io.*;  
import javax.servlet.*;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  

@WebServlet("/servlet2")

public class WelcomePage extends HttpServlet {  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
          
    String n=request.getParameter("userName");  
    out.print("Welcome "+n);  
    }  
  
}  