package com.Food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.FPassDao;

@WebServlet("/PickedUp_order_email")
public class PickedUp_order_email extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html; charset=UTF-8");
	    // Get recipient's email-ID, message & subject-line from fpass.jsp page
		HttpSession session = request.getSession();
		String to=(String)request.getParameter("to");
		System.out.println(to);
		String id=(String) session.getAttribute("rest_id");
		
		System.out.println("d");
	    String subject = "FoodGo Login Credential	 \r\n" ;
	    FPassDao da = new FPassDao();
	    String cpass="";
	    cpass=da.check(to,cpass);
	    System.out.println("dd");
	    String messg = "Hey Foodie, Thanks for visiting FOODGO! Your order has been picked up.Thank you for choosing FoodGo!!";
		// Sender's email ID and password needs to be mentioned
	    String from = "foodgo199@gmail.com";
	    String pass = "foodgo@1234";
		
		if(da.check(to))
		{
			da.send(to,subject,messg,from,pass);
			System.out.println("dsdsd");
			 response.sendRedirect("PickedUp_order_ph_num?cust_email="+to);
		}
		else
		{
			response.sendRedirect("rest_mainpage.jsp");
		}
	}
		
}