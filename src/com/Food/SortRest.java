package com.Food;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SortRest")
public class SortRest extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sql1=null,sql2=null,sql3=null,sql4=null,sql5=null,sql6=null,sql7=null;
		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if ("Rating".equals(action))
		{
			sql1="SELECT * FROM restaurant GROUP BY rest_rating LIMIT 6";
		}
		else if ("Price".equals(action))
		{
			sql2="SELECT * FROM restaurant GROUP BY rest_pricet LIMIT 6";				
		}
		else if ("Starter".equals(action))
		{
			sql5="SELECT * FROM restaurant r, menu m where r.rest_id=m.rest_id and lower(m.item_type) like '%starter%'  group by r.rest_id LIMIT 6";				
		}
		else if ("Lunch".equals(action))
		{
			sql3="SELECT * FROM restaurant r, menu m where r.rest_id=m.rest_id and lower(m.item_type) like '%lunch%' group by r.rest_id LIMIT 6;";				
		}
		else if ("Dinner".equals(action))
		{
			sql4="SELECT * FROM restaurant r, menu m where r.rest_id=m.rest_id and lower(m.item_type) like '%dinner%' group by r.rest_id LIMIT 6";				
		}
		else if ("Dessert".equals(action))
		{
			sql6="SELECT * FROM restaurant r, menu m where r.rest_id=m.rest_id and lower(m.item_type) like '%dessert%'  group by r.rest_id LIMIT 6";				
		}
		else if ("Drinks".equals(action))
		{
			sql7="SELECT * FROM restaurant r, menu m where r.rest_id=m.rest_id and lower(m.item_type) like '%drink%'  group by r.rest_id LIMIT 6";				
		}
		
		session.setAttribute("sql1", sql1);
		session.setAttribute("sql2", sql2);
		session.setAttribute("sql3", sql3);
		session.setAttribute("sql4", sql4);
		session.setAttribute("sql5", sql5);
		session.setAttribute("sql6", sql6);
		session.setAttribute("sql7", sql7);
		response.sendRedirect("cust_mainpage.jsp#portfolio");
	}
}