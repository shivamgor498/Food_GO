package com.Food;

import java.io.IOException;
import javax.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Food.Dao.Get_connection;
import javax.servlet.*;
@WebServlet("/Register")
@MultipartConfig(maxFileSize = 16177216)
public class Register extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String rest_name = request.getParameter("rest_name");
		String rest_addr = request.getParameter("rest_addr");
		String rest_phno = request.getParameter("rest_phno");
		String rest_open = request.getParameter("rest_open");
		String rest_close = request.getParameter("rest_close");
		String rest_rating = request.getParameter("rest_rating");
		String rest_pricet = request.getParameter("rest_pricet");
		String rest_lat = request.getParameter("rest_lat");
		String rest_long = request.getParameter("rest_long");
		String rest_email = request.getParameter("rest_email");
		String rest_pass = request.getParameter("rest_pass");
		//Part rest_img_location = request.getPart("rest_img");

		String sql="insert into restaurant (rest_name,rest_addr,rest_phno,rest_open,rest_close,rest_rating,rest_pricet,rest_lat,rest_long,rest_email,rest_pass)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?)";
		String sql1="insert into rest_image (rest_id,image) values (?,?)";
		String get_rest_id="select * from restaurant where rest_email=?";
		
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		
		try
		{
			PreparedStatement s = con.prepareStatement(sql);
			PreparedStatement s1 = con.prepareStatement(sql1);
			s.setString(1, rest_name);
			s.setString(2, rest_addr);
			s.setString(3, rest_phno);
			s.setString(4, rest_open);
			s.setString(5, rest_close);
			s.setString(6, rest_rating);
			s.setString(7, rest_pricet);
			s.setString(8, rest_lat);
			s.setString(9, rest_long);
			s.setString(10, rest_email);
			s.setString(11, rest_pass);
			int count = s.executeUpdate();
			System.out.println("number of rows updated :- "+count);
			
			ResultSet rs=null;
			PreparedStatement g1 = con.prepareStatement(get_rest_id);
			g1.setString(1, rest_email);
			rs = g1.executeQuery();
			if(rs.next()) {
				String rest_id = rs.getString(1);
				//InputStream is = rest_img_location.getInputStream();
				s1.setString(1, rest_id);
				//s1.setBlob(2, is);
				count = s1.executeUpdate();
			}
			response.sendRedirect("rest_mainpage.jsp");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}		
	}	
		
}
