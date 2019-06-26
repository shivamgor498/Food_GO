package com.Food;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Food.Dao.Get_connection;
import com.Food.Dao.SignupDao;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("entered in signup");
		HttpSession session = request.getSession();
		String cname = request.getParameter("cname");
		String cemail = request.getParameter("cemail");
		Get_connection obj = new Get_connection();
		String sql="select cust_email from cust where cust_email='"+cemail+"'";
		Connection con = obj.get();
		try {
			PreparedStatement s = con.prepareStatement(sql);
			ResultSet rs=s.executeQuery();
			System.out.println(sql);
			if(rs.next()) {
				System.out.println("dvfgdd");
				response.sendRedirect("cust_signup.jsp?exist=Email id already exist");
			}
			else {
				String cpass = request.getParameter("cpass");
				String cphno = request.getParameter("cphno");
				SignupDao da = new SignupDao();
				if(da.check(cname,cemail, cpass,cphno))
				{
					session=request.getSession(true);
					session.setAttribute("cemail", cemail);	
					session.setAttribute("cname", cname );
					session.setAttribute("signin_type", "cust");	
					int item_count=0;
					HttpSession session1 = request.getSession();
					session1.setAttribute("item_count", item_count);
					response.sendRedirect("cust_mainpage.jsp");
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
