package com.Food;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.Get_connection;

import java.sql.Connection;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		
		try 
		{
			String sql1="DELETE from cart";
			PreparedStatement s = con.prepareStatement(sql1);
			s.execute();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();		
		session.removeAttribute("cemail");
		session.invalidate();
		response.sendRedirect("signin.jsp");
	}
}