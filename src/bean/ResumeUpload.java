package bean;
 
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.*;

import com.mysql.jdbc.ResultSet;
 
@WebServlet("/ResumeUpload")
@MultipartConfig(maxFileSize = 104857600)    // upload file's size up to 16MB
public class ResumeUpload extends HttpServlet {
     
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
    	HttpSession session=request.getSession();
        String email=(String) session.getAttribute("email");
         
        InputStream inputStream = null; 
        
        Part filePart = request.getPart("resume");
        if (filePart != null) {
            
            inputStream = filePart.getInputStream();
        }
         
        String message = null;
         
        try {
            
            Connection con=ConnectionProvider.getCon();
            
            PreparedStatement ps=con.prepareStatement("select * from resume where email=?");
        	ps.setString(1,email);
        	ResultSet rs=(ResultSet) ps.executeQuery();
        	
        	if(rs.next())
        	{
        		ps=con.prepareStatement("update resume set resume=? where email=?");
        		ps.setBlob(1,inputStream);
        		ps.setString(2,email);
        		int res=ps.executeUpdate();
        		
        		if(res!=0)
        		{
        			message = "File uploaded and saved into database";
        		}
        	}
        	else
        	{
        		ps=con.prepareStatement("insert into resume values(?,?)");
        		ps.setString(1,email);
        		if(inputStream!=null)
        		{
        			ps.setBlob(2,inputStream);
        		}
        		int res=ps.executeUpdate();
        	
        		if(res!=0)
        		{
        			message = "File uploaded and saved into database";
        		}
        	}
        	
        	con.close();
            
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }
            request.setAttribute("Message", message);
             
           
            getServletContext().getRequestDispatcher("/resumeMessage.jsp").forward(request, response);
        }
    }

