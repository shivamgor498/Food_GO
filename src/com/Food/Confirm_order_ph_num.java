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

@WebServlet("/Confirm_order_ph_num")
public class Confirm_order_ph_num extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		HttpSession session = request.getSession();
		
		String cemail=(String)session.getAttribute("cemail");
		
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		ResultSet resultSet=null;
		
		System.out.println("d");
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
				sql ="SELECT sum(order_total) from orders where cust_email=\""+cemail+"\" and order_status=\"Not Picked Up\"";
				statement = con.createStatement();
				resultSet = statement.executeQuery(sql);
				if(resultSet.next())
				{
					String amount=resultSet.getString(1);
					Integer otp=sendSms(ph_num,amount);
					response.sendRedirect("cust_bill.jsp");
				}	//inner if 
			}//outer if
		} catch (Exception e) {
			
			e.printStackTrace();
		}		
	}

	public static Integer sendSms(String con_no,String amount) {
		//Your authentication key
        String authkey = "242991AvfgO4tTa6B5bc582e1";
        //Multiple mobiles numbers separated by comma
        String mobiles = con_no;
        System.out.println(con_no);
        System.out.println(amount);
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "123456";
        //Your message to send, Add URL encoding here.
        int otp = ThreadLocalRandom.current().nextInt(1000, 10000 + 1);
        String message = "Hey Foodie, Thank you for choosing FoodGo! Your order has been confirmed and will be ready for you 30 mins from now please pay "+amount+ " at appropriate the restaurant in cash.";
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
