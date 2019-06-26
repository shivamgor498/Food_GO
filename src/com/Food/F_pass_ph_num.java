package com.Food;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
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
import com.mysql.cj.protocol.Resultset;

import java.util.concurrent.ThreadLocalRandom;

@WebServlet("/F_pass_ph_num")
public class F_pass_ph_num extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		String ph_num=request.getParameter("ph_no");

		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		ResultSet rs=null;
		
		String sql="select cust_phno, rest_phno from restaurant, cust  where cust_phno=? or rest_phno=?";
		PreparedStatement s;
		try 
		{
			s = con.prepareStatement(sql);
			s.setString(1,ph_num);
			s.setString(2,ph_num);
			rs = s.executeQuery();
			if(rs.next())
			{
				Integer otp=sendSms(ph_num);
				HttpSession session = request.getSession();
				session.setAttribute("ph_num", ph_num);
				session.setAttribute("ph_num_otp", otp);
				response.sendRedirect("otp_ph_num.jsp");
			}			
			else
			{
				response.sendRedirect("f_pass_ph_num.jsp?wrong=Phone number does not exist");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public static Integer sendSms(String con_no) {
		//Your authentication key
        String authkey = "242991AvfgO4tTa6B5bc582e1";
        //Multiple mobiles numbers separated by comma
        String mobiles = con_no;
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "123456";
        //Your message to send, Add URL encoding here.
        int otp = ThreadLocalRandom.current().nextInt(1000, 10000 + 1);
        String message = "Hey Foodie, Thanks for visiting FOODGO! Validate your unique code :- "+otp+" and enjoy amazing services from our site.";
        //define route
        String route="OTP";

        //Prepare Url
        URLConnection myURLConnection=null;
        URL myURL=null;
        BufferedReader reader=null;

        //encoding message
        String encoded_message=URLEncoder.encode(message);
        //Send SMS API
        String mainUrl="http://api.msg91.com/api/sendhttp.php?";

        //Prepare parameter string
        StringBuilder sbPostData= new StringBuilder(mainUrl);
        sbPostData.append("authkey="+authkey);
        sbPostData.append("&mobiles="+mobiles);
        sbPostData.append("&message="+encoded_message);
        sbPostData.append("&route="+route);
        sbPostData.append("&sender="+senderId);

        //final string
        mainUrl = sbPostData.toString();
        try
        {
            //prepare connection
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            //reading response
            String response;
            while ((response = reader.readLine()) != null)
            //print response
            System.out.println(response);

            //finally close connection
            reader.close();
        }
        catch (IOException e)
        {
                e.printStackTrace();
        }
        return otp;
    }
}
