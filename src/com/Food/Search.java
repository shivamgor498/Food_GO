package com.Food;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Search")
public class Search extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String input = request.getParameter("input");
		String sql1=null,sql2=null,sql3=null,sql=null;
		HttpSession session = request.getSession();

		if(input.equals("all")){
			sql="select * from restaurant";
			System.out.println("\nEntered for all");
		}
		else{
			sql1="select * from restaurant where rest_name like '%"+input+"%'";
			sql2="select * from restaurant where rest_addr like '%"+input+"%'";
			sql3="select * from restaurant where rest_rating like '%"+input+"%'";
			System.out.println("\nEntered for specific rest");
		}
		session.setAttribute("input", input);
		session.setAttribute("sql", sql);
		session.setAttribute("sql1", sql1);
		session.setAttribute("sql2", sql2);
		session.setAttribute("sql3", sql3);
		response.sendRedirect("cust_search_rest.jsp");
	}

}