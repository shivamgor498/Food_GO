package com.Food;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Food.Dao.Get_connection;

@WebServlet("/OrdDelivered")
public class OrdDelivered extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			Get_connection obj = new Get_connection();
			Connection con = obj.get();
			
			String order_id=request.getParameter("order_id");
			String cust_email=request.getParameter("cust_email");
			String sql=null;
			PreparedStatement ps = null;
				try
				{	
						 sql="update orders set order_status=\"Picked Up\",delivery_order_time=now() where order_id="+order_id;
						 ps = con.prepareStatement(sql);
					     ps.executeUpdate();
					     System.out.println("k");
					     System.out.println(cust_email);
					     response.sendRedirect("PickedUp_order_email?to="+cust_email);
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}		
	}
}