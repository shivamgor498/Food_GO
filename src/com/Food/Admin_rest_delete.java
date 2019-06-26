package com.Food;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Food.Dao.Get_connection;

@WebServlet("/Admin_rest_delete")
public class Admin_rest_delete extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		String rest_id=request.getParameter("rest_id");
		System.out.println(rest_id);
	    Statement statement = null;
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		try
		{
			statement=con.createStatement();
			String sql1="delete from orders where rest_id="+request.getParameter("rest_id");
			String sql2="delete from rest_image where rest_id="+request.getParameter("rest_id");
			String sql3="delete from menu where rest_id="+request.getParameter("rest_id");
	    	String sql4="delete from restaurant where rest_id="+request.getParameter("rest_id");
			String temp="select item_id from menu where rest_id="+request.getParameter("rest_id");
			String temp1=null;
		    Statement statement1 = con.createStatement();
			ResultSet rs=statement.executeQuery(temp);
			while(rs.next()) {
				temp1="delete from items_ordered where item_id="+rs.getString("item_id");
				statement1.executeUpdate(temp1);
			}
			statement.executeUpdate(sql1);
			statement.executeUpdate(sql2);
			statement.executeUpdate(sql3);
			statement.executeUpdate(sql4);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		response.sendRedirect("admin_rest_list.jsp");
	}
}