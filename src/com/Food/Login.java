package com.Food;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		LoginDao da = new LoginDao();
		HttpSession session = request.getSession();
		if(email.equals("admin@gmail.com") && password.equals("admin123*"))
		{
			session=request.getSession(true);
			session.setAttribute("cemail", email);	
			session.setAttribute("signin_type", "admin");
			response.sendRedirect("admin_home.jsp");
		}
		else if(da.check(email, password,session)=="customer")
		{
			session=request.getSession(true);
			session.setAttribute("cemail", email);	
			session.setAttribute("signin_type", "cust");	
			int item_count=0;
			HttpSession session1 = request.getSession();
			session1.setAttribute("item_count", item_count);
			response.sendRedirect("cust_mainpage.jsp");
		}
		else if(da.check(email, password,session)=="restaurant")
		{
			session.setAttribute("remail", email);
			session.setAttribute("signin_type", "rest");
			response.sendRedirect("rest_mainpage.jsp");
		}
		else
		{
			response.sendRedirect("signin.jsp?wrong=Invalid Credentials");
		}
	}
}