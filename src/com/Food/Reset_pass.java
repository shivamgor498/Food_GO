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

@WebServlet("/Reset_pass")
public class Reset_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String new_password = request.getParameter("new_password");
		System.out.println("in reset pass");
		HttpSession session = request.getSession();
		String number = (String)session.getAttribute("ph_num");

		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		System.out.println(number);
		System.out.println(new_password);
		
		try
		{
			String sql="update cust set cust_pass=?  where cust_phno=?";
			PreparedStatement s = con.prepareStatement(sql);
			s.setString(1,new_password);
			s.setString(2,number);
			int count = s.executeUpdate();
			System.out.println("number of rows updated for cust :- "+count);		
		
			String sql1="update restaurant set rest_pass=? where rest_phno=?";
			PreparedStatement s1 = con.prepareStatement(sql1);
			s1.setString(1,new_password);
			s1.setString(2,number);
			int count1 = s1.executeUpdate();
			System.out.println("number of rows updated for rest :- "+count1);
			response.sendRedirect("signin.jsp?sucess=Password Updated Successfully");
		} 

		catch (Exception e) 
		{
			e.printStackTrace();
		}		
		
	}

}
