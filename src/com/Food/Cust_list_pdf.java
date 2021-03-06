package com.Food;

import com.Food.Dao.Get_connection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Cust_list_pdf")
public class Cust_list_pdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static final String DEST = "../../../eclipse-workspace/FoodGoo_final/WebContent/PDF/Cust_list_pdf.pdf";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
	        File file = new File(DEST);
	        file.getParentFile().mkdirs();
	        new Cust_list_pdf().createPdf(DEST,request);
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		System.out.println("sucess");
		response.sendRedirect("PDF/Cust_list_pdf.pdf");
	}
    
    public void createPdf(String dest,HttpServletRequest request) throws IOException, DocumentException,ServletException {
        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream(dest));
        document.open();

        PdfPTable table = new PdfPTable(4);
        PdfPCell item = new PdfPCell(new Phrase("Name"));
        item.setBackgroundColor(BaseColor.GRAY);
        table.addCell(item);
        
        PdfPCell desc = new PdfPCell(new Phrase("Phone no"));
        desc.setBackgroundColor(BaseColor.GRAY);
        table.addCell(desc);
        
        PdfPCell quan = new PdfPCell(new Phrase("Email"));
        quan.setBackgroundColor(BaseColor.GRAY);
        table.addCell(quan);
        
        PdfPCell price = new PdfPCell(new Phrase("Password"));
        price.setBackgroundColor(BaseColor.GRAY);
        table.addCell(price);
        

        PdfPCell f1 = new PdfPCell(new Phrase("1"));
        PdfPCell f2 = new PdfPCell(new Phrase("2"));
        PdfPCell f3 = new PdfPCell(new Phrase("3"));
        PdfPCell f4 = new PdfPCell(new Phrase("4"));
        
		String sql="select * from cust";
		Get_connection obj = new Get_connection();
		Connection con = obj.get();
		ResultSet rs=null;
		try
		{
			PreparedStatement s = con.prepareStatement(sql);
			rs = s.executeQuery();
			while(rs.next()) {
				System.out.println("in welcome");
				f1 = new PdfPCell(new Phrase(rs.getString(1)));
		        table.addCell(f1);
		        f2 = new PdfPCell(new Phrase(rs.getString(2)));
		        table.addCell(f2);
		        f3 = new PdfPCell(new Phrase(rs.getString(3)));
		        table.addCell(f3);
		        f4 = new PdfPCell(new Phrase(rs.getString(4)));
		        table.addCell(f4);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

        document.add(table);
        document.close();
			
	}

}