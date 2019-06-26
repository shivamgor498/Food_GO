package com.Food;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.Get_connection;

@WebServlet("/Cart")
public class Cart extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		Statement statement = null;
		ResultSet resultSet = null;
		HttpSession session=request.getSession(false);
		HttpSession session1=request.getSession();
		try
		{					  
		    String cust_email=(String)session.getAttribute("cemail");
		    System.out.println(cust_email);
		    String item_id=request.getParameter("item_id");
		    String rest_id=request.getParameter("rest_id");
			String qty = request.getParameter("quantity");
			int item_count=(int)(session1.getAttribute("item_count"));
			if(session.getAttribute("cemail")==null)
			{
				response.sendRedirect("signin.jsp"); 
			}
			
		    String sql="SELECT * FROM cart";
		    statement=con.createStatement();
			resultSet = statement.executeQuery(sql);
			int f=0;
			while(resultSet.next())
			{
				String compare=resultSet.getString(2);
				if(item_id.equals(compare))
				{
					PreparedStatement ps = null;
					sql="update cart set cart_ord_qty=cart_ord_qty+? where item_id=? and cust_email=?";
					ps = con.prepareStatement(sql);
					ps.setString(1,qty);
					ps.setString(2,item_id);
					ps.setString(3,cust_email);
					int i = ps.executeUpdate();
					if(i > 0)
					{
						System.out.println("Record Updated Successfully");
						response.sendRedirect("cust_restDisp.jsp?rest_id="+rest_id+"&menu=show");
						f=1;
					}
					else
					{
						System.out.println("There is a problem in updating Record.");
					} 
				}
			}
			if(f==0)
			{
				sql ="insert into cart(item_id,cust_email,rest_id,cart_ord_qty) values (?, ?, ?,?)";
				item_count++;
				PreparedStatement s = con.prepareStatement(sql);
				s.setString(1,item_id);
				s.setString(2,cust_email);
				s.setString(3,rest_id);
				s.setString(4,qty);
				s.executeUpdate();
				session1.setAttribute("item_count",item_count );
				response.sendRedirect("cust_restDisp.jsp?rest_id="+rest_id+"&item_count="+item_count+"&menu=show");
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
