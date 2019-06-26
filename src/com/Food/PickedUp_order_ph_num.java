package com.Food;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Statement;
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

@WebServlet("/PickedUp_order_ph_num")
public class PickedUp_order_ph_num extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{			
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("rest_id");
		
		String cemail=(String)request.getParameter("cust_email");
		
		System.out.println(cemail);
		
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		ResultSet resultSet=null;
		
		System.out.println("Enter in phno");
		String sql ="SELECT * from cust where  cust_email=\""+cemail+"\"";
		Statement statement;
		try 
		{
			statement = con.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next())
			{
				String ph_num=resultSet.getString("cust_phno");

				System.out.println(ph_num);
				sql ="SELECT * from orders where cust_email=\""+cemail+"\" and rest_id="+id;
				statement = con.createStatement();
				resultSet = statement.executeQuery(sql);
				if(resultSet.next())
				{
					String delivery_order_time=resultSet.getString("delivery_order_time");
					String order_id=resultSet.getString("order_id");
					Integer otp=sendSms(ph_num,delivery_order_time,order_id);
					response.sendRedirect("rest_view_current_order.jsp?c="+id);
				}
			}		
		} catch (Exception e) {
			
			e.printStackTrace();
		}		
	}

	public static Integer sendSms(String con_no,String delivery_order_time,String order_id) {
		//Your authentication key
        String authkey = "242991AvfgO4tTa6B5bc582e1";
        //Multiple mobiles numbers separated by comma
        String mobiles = con_no;
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "123121";
        //Your message to send, Add URL encoding here.
        int otp = ThreadLocalRandom.current().nextInt(1000, 10000 + 1);
        String message = "Hey Foodie, Thanks for visiting FOODGO! Your order id "+order_id+" has been picked up at "+delivery_order_time+".Thank you for choosing FoodGo!!";
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
