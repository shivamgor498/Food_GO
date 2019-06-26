package com.Food;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;


import com.Food.Dao.Get_connection;

import java.io.IOException;
import java.sql.*;

@WebServlet("/Add_menu")
public class Add_menu extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String item_name = request.getParameter("item_name");
		String item_price=request.getParameter("item_price");
		String item_type = request.getParameter("item_type");
		String sql="insert into menu (item_name,item_type,item_price,rest_id) values (?,?,?,?)";

		HttpSession session = request.getSession();
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		
		
		try
		{
			String rest_id=(String)session.getAttribute("rest_id");
			PreparedStatement s = con.prepareStatement(sql);
			s.setString(1,item_name);
			s.setString(2,item_type);
			s.setString(3,item_price);
			s.setString(4,rest_id);
			s.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		response.sendRedirect("rest_menu_list.jsp");
	}
}