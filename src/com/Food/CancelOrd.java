package com.Food;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.accessibility.AccessibleRelation;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Food.Dao.Get_connection;

@WebServlet("/CancelOrd")
public class CancelOrd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			Get_connection obj = new Get_connection();
			Connection con = obj.get();

			String order_id=request.getParameter("order_id");
			String sql,sql1,diff=null;
			PreparedStatement ps = null;
				Statement statement=null;
				ResultSet resultSet = null;

				int n=0;
				try 
				{	
					sql1="select TIMESTAMPDIFF(MINUTE,time(order_time),now()) from orders where order_id="+order_id;
					statement=con.createStatement();
					resultSet=statement.executeQuery(sql1);
					if(resultSet.next())
					{
						diff=resultSet.getString(1);
						n=Integer.parseInt(diff);
					}					
					
					if(n<=5)
					{
						sql="DELETE from items_ordered where order_id="+order_id;
						 ps = con.prepareStatement(sql);
					     ps.execute();
					     
						 sql="DELETE from orders where order_id="+order_id;
						 ps = con.prepareStatement(sql);
					     ps.execute();
					     
					     response.sendRedirect("cust_mainpage.jsp?cancelled='Your order has been cancelled sucessfully.'");
					}	
					else
					{
						response.sendRedirect("cust_cantdelete.jsp");
					}
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}		
	}
}
