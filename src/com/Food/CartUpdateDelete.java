package com.Food;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.Get_connection;

@WebServlet("/CartUpdateDelete")
public class CartUpdateDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");HttpSession session1=request.getSession();
		int item_count=(int)(session1.getAttribute("item_count"));

		if ("Update".equals(action))
		{
			Get_connection obj = new Get_connection();
			Connection con = obj.get();
			String cart_id = request.getParameter("cart_id");
			String cart_ord_qty=request.getParameter("cart_ord_qty");
			if(cart_id != null)
			{
				PreparedStatement ps = null;			
				try
				{			
					String sql="update cart set cart_ord_qty=? where cart_id="+cart_id;
					ps = con.prepareStatement(sql);
					ps.setString(1,cart_ord_qty);
					int i = ps.executeUpdate();
					if(i > 0)
					{
						System.out.print("Record Updated Successfully");
						response.sendRedirect("cust_viewCart.jsp?rest_id="+request.getParameter("rest_id"));
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
			
			String cart_id = request.getParameter("cart_id");
			
			if(cart_id != null)
			{
				PreparedStatement ps = null;
				
				try
				{			
					String sql="DELETE from cart where cart_id = ?";
					ps = con.prepareStatement(sql);
					ps.setString(1,cart_id);
					int i = ps.executeUpdate();
					if(i > 0)
					{
						item_count--;
						session1.setAttribute("item_count", item_count);
						System.out.print("Deleted the item in cart Successfully");
						response.sendRedirect("cust_viewCart.jsp?rest_id="+request.getParameter("rest_id"));
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
