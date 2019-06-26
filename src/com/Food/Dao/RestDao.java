package com.Food.Dao;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class RestDao
{
	String sql="SELECT * FROM restaurant";
	Get_connection obj = new Get_connection();
	Connection con = obj.get();
	Statement statement = null;
	ResultSet resultSet = null;
	public boolean check(String rname)
	{
		try 
		{
			statement=con.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next())
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
