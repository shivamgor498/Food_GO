package com.Food;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Food.Dao.Get_connection;


@WebServlet("/rest_images/*")
public class ImageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String rest_id = request.getPathInfo().substring(1); // Returns "foo.png".
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		ResultSet rs=null;
		String sql = "select image from rest_image where rest_id = ?";
		
		try
		{
			PreparedStatement s = con.prepareStatement(sql);
			s.setString(1, rest_id);
//			s.setInt(1, rest_id);
			rs = s.executeQuery();

        
            if (rs.next()) {
                byte[] image = rs.getBytes("image");
                response.setContentType(getServletContext().getMimeType(rest_id));
                response.setContentLength(image.length);
                response.getOutputStream().write(image);
            }
           else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            }
        } 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
    }
}