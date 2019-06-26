package com.Food.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
public class FPassDao
{
	String sql="select cust_pass from cust where cust_email=?";
	Get_connection obj = new Get_connection();
	Connection con = obj.get();
	public String check(String cemail,String cpass)
	{
		try 
		{
			PreparedStatement s = con.prepareStatement(sql);
			s.setString(1,cemail);
			
			ResultSet rs = s.executeQuery();
			if(rs.next())
			{
				cpass=rs.getString("cust_pass");
				return cpass;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return "";
	}
	
	
	public boolean check(String cemail)
	{
		try 
		{
			PreparedStatement s = con.prepareStatement(sql);
			s.setString(1,cemail);
			
			ResultSet rs = s.executeQuery();
			if(rs.next())
			{
				return true;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	public void send(String to,String subject,String messg,final String from,final String pass) 
	{
		//Creating a result for getting status that messsage is delivered or not!
	    String host = "smtp.gmail.com";
	    // Creating Properties object
	    Properties props = new Properties();
	    // Defining properties
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.user",from );
	    props.put("mail.password", pass);
	    props.put("mail.smtp.port", "587");
	    // Authorized the Session object.
	    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator()
	    {
	        protected PasswordAuthentication getPasswordAuthentication()
	        {
	    	   return new PasswordAuthentication(from, pass);
	        }
	    });
	    	try 
		    {
		        // Create a default MimeMessage object.
		        MimeMessage message = new MimeMessage(mailSession);
		        // Set From: header field of the header.
		        message.setFrom(new InternetAddress(from));
		        // Set To: header field of the header.
		        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		        // Set Subject: header field
		        message.setSubject(subject);
		        // Now set the actual message
		        message.setText(messg);
		        // Send message
		        Transport.send(message);		  
		    } 
		    catch (Exception mex) 
		    {
		        mex.printStackTrace();		        
		    }
		}
}
