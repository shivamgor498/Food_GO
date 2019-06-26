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

@WebServlet("/UpdateItem")
public class UpdateItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");

		if ("Update".equals(action))
		{
			Get_connection obj = new Get_connection();
			Connection con = obj.get();
			String item_id = request.getParameter("item_id");
			String item_name=request.getParameter("item_name");
			String item_price = request.getParameter("item_price");
			String item_type=request.getParameter("item_type");
			if(item_id != null)
			{
				PreparedStatement ps = null;			
				try
				{			
					String sql="update menu set item_name=?,item_price=?,item_type=?  where item_id="+item_id;
					ps = con.prepareStatement(sql);
					ps.setString(1,item_name);
					ps.setString(2,item_price);
					ps.setString(3,item_type);
					int i = ps.executeUpdate();
					if(i > 0)
					{
						System.out.print("Record Updated Successfully");
						response.sendRedirect("rest_menu_list.jsp");
					}
					else
					{
						System.out.print("There is a problem in updating Record.");
					} 
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}//end of if
		}
		else if ("Delete".equals(action))
		{
			Get_connection obj = new Get_connection();
			Connection con = obj.get();
			
			String item_id = request.getParameter("item_id");
			
			if(item_id != null)
			{
				PreparedStatement ps = null;
				
				try
				{			
					String sql="DELETE from menu where item_id = ?";
					ps = con.prepareStatement(sql);
					ps.setString(1,item_id);
					int i = ps.executeUpdate();
					if(i > 0)
					{
						System.out.print("Deleted the item in cart Successfully");
						response.sendRedirect("rest_menu_list.jsp");
					}
					else
					{
						System.out.print("There is a problem in updating Record.");
					} 
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
	}

}
