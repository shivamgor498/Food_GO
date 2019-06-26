package com.Food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Food.Dao.FPassDao;

@WebServlet("/FPass")
public class FPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html; charset=UTF-8");
	    // Get recipient's email-ID, message & subject-line from fpass.jsp page
	    String to = request.getParameter("mail");
	    String subject = "FoodGo Login Credential	 \r\n" ;
	    FPassDao da = new FPassDao();
	    String cpass="";
	    cpass=da.check(to,cpass);
	    String messg = "Your FoodGo Account Will Be Accessible By Using -\r\n" +"\r\n" +"User Name : "+ to +"\r\n" + "Password  : "+ cpass;
		// Sender's email ID and password needs to be mentioned
	    String from = "foodgo199@gmail.com";
	    String pass = "foodgo@1234";
		
		if(da.check(to))
		{
			da.send(to,subject,messg,from,pass);
			response.sendRedirect("f_pass_email_success.jsp");
		}
		else
		{
			response.sendRedirect("signin.jsp?wrong=Email address doesn't exist");
		}
	}
		
}