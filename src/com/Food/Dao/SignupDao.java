package com.Food.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.Food.Dao.Get_connection;

public class SignupDao {
	String sql="insert into cust (cust_name,cust_email,cust_pass,cust_phno) values (?,?,?,?)";
	Get_connection obj = new Get_connection();
	Connection con = obj.get();
	
	public boolean check(String cname, String cemail, String cpass,String cphno)
	{
		try
		{
			PreparedStatement s = con.prepareStatement(sql);
			s.setString(1,cname);
			s.setString(2,cemail);
			s.setString(3,cpass);
			s.setString(4,cphno);
			if(s.executeUpdate()==1)
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
}
