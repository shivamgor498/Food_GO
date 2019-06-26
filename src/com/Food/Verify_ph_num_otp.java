
package com.Food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Verify_ph_num_otp")
public class Verify_ph_num_otp extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		HttpSession session = request.getSession();
		String otp=request.getParameter("otp");
		Integer temp = (Integer)session.getAttribute("ph_num_otp");
		String correct_otp= Integer.toString(temp) ;
		System.out.println(otp);
		System.out.println(correct_otp);
		System.out.println("entered in verify");
		
		if(otp.equals(correct_otp)) {
			session.removeAttribute("incorrect_otp");
	        response.sendRedirect("reset_pass.jsp");
		}
		else {
			session.setAttribute("incorrect_otp", "Incorrect OTP");
	        response.sendRedirect("otp_ph_num.jsp?wrong=Incorrect OTP");			
		}
	}

}
