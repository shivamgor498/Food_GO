package com.Food;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.Get_connection;

@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		HttpSession session = request.getSession();
		String cemail=(String)session.getAttribute("cemail");
		int item_count=0;
		HttpSession session1 = request.getSession();
		session1.setAttribute("item_count", item_count);

		String total=null,sql=null,ord_id=null;
		PreparedStatement ps = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String rest_id[]=new String[10];
		int count=0,i=0;
		try
		{	
			  String query = "delete FROM cart where cart_ord_qty<=0 or cart_ord_qty>50 ";
		      PreparedStatement preparedStmt = con.prepareStatement(query);
		      preparedStmt.execute();
			sql ="SELECT count(distinct(rest_id)) FROM cart ";
			statement=con.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next())
			{			
				count=resultSet.getInt(1);
			}
			i=1;
			sql ="SELECT distinct(rest_id) FROM cart ";
			statement=con.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next() && i<=count)
			{			
				rest_id[i]=resultSet.getString(1);
				i++;
			}
				
			i=1;
			while(i<=count)
			{
				sql="INSERT INTO orders (cust_email,rest_id) values (?,?)";			
				ps = con.prepareStatement(sql);
				ps.setString(1,cemail);
				ps.setString(2,rest_id[i]);
				ps.executeUpdate();
				
			//Calculating total
				sql ="SELECT sum(m.item_price * c.cart_ord_qty) as value FROM menu m,cart c WHERE m.item_id=c.item_id and"
					+ " m.rest_id=c.rest_id and c.rest_id="+rest_id[i]+"";
				statement=con.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next())
				{			
					total=resultSet.getString(1) ;
				}			
				
				
				sql ="SELECT * FROM orders ORDER BY order_id DESC LIMIT 1 ";
				statement=con.createStatement();				
				resultSet = statement.executeQuery(sql);
				while(resultSet.next())
				{		
					ord_id=resultSet.getString("order_id");
				}
				sql="Update orders set order_time=now(),order_status=\"Not Picked Up\", order_total="+total
						+ " where  rest_id="+rest_id[i]+" and  order_id="+ord_id;
				ps = con.prepareStatement(sql);
				ps.executeUpdate();
				//inserting into item_ordered
				sql="INSERT INTO items_ordered(order_id,item_id,item_qty)"
						+"SELECT c.order_id, ca.item_id,ca.cart_ord_qty FROM orders c,cart ca where "
						+ "ca.cust_email=c.cust_email and order_id="+ord_id;
				
				ps = con.prepareStatement(sql);
				ps.executeUpdate();
		
				ps = null;				
				sql="DELETE from cart where rest_id="+rest_id[i];
				ps = con.prepareStatement(sql);
				ps.executeUpdate();

				System.out.print("Cart is now empty");							

				i++;
			}
			System.out.println("Yo");
			response.sendRedirect("Confirm_order_email");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
  }
}