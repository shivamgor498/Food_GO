/*package com.Food;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/Client")

public class Client extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String TITLE = "../../../eclipse-workspace/FoodGo/WebContent/PDF/Test";
    public static final String PDF_EXTENSION = ".pdf";


public static final String DEST = "results/zugferd/pdf/basic%05d.pdf";
public static final String ICC = "resources/color/sRGB_CS_profile.icm";
public static final String REGULAR = "resources/fonts/OpenSans-Regular.ttf";
public static final String BOLD = "resources/fonts/OpenSans-Bold.ttf";
public static final String NEWLINE = "\n";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,ParserConfigurationException, SQLException,
        SAXException, TransformerException, ParseException
        DataIncompleteException, InvalidCodeException 
	{
        LicenseKey.loadLicenseFile(
        System.getenv("ITEXT7_LICENSEKEY")
        + "/itextkey-html2pdf_typography.xml");
    File file = new File(DEST);
    file.getParentFile().mkdirs();
    PdfInvoicesBasic app = new PdfInvoicesBasic();
    PojoFactory factory = PojoFactory.getInstance();
    List<Invoice> invoices = factory.getInvoices();
    for (Invoice invoice : invoices) {
        app.createPdf(invoice);
    }
    factory.close();
        response.sendRedirect("PDF/Test.pdf");
	}





















































public void createPdf(Invoice invoice)
    throws ParserConfigurationException, SAXException, TransformerException,
    IOException, ParseException, DataIncompleteException, InvalidCodeException {
 
    String dest = String.format(DEST, invoice.getId());
 
    // Create the XML
    InvoiceData invoiceData = new InvoiceData();
    IBasicProfile basic = invoiceData.createBasicProfileData(invoice);
    InvoiceDOM dom = new InvoiceDOM(basic);
 
    // Create the ZUGFeRD document
    ZugferdDocument pdfDocument = new ZugferdDocument(
        new PdfWriter(dest), ZugferdConformanceLevel.ZUGFeRDBasic,
        new PdfOutputIntent("Custom", "", "http://www.color.org",
            "sRGB IEC61966-2.1", new FileInputStream(ICC)));
    pdfDocument.addFileAttachment(
        "ZUGFeRD invoice", dom.toXML(), "ZUGFeRD-invoice.xml",
        PdfName.ApplicationXml, new PdfDictionary(), PdfName.Alternative);
 
    // Create the document
    Document document = new Document(pdfDocument);
    document.setFont(PdfFontFactory.createFont(REGULAR, true))
            .setFontSize(12);
    PdfFont bold = PdfFontFactory.createFont(BOLD, true);
 
    // Add the header
    document.add(
        new Paragraph()
        .setTextAlignment(TextAlignment.RIGHT)
        .setMultipliedLeading(1)
            .add(new Text(String.format("%s %s\n", basic.getName(), basic.getId()))
                .setFont(bold).setFontSize(14))
            .add(convertDate(basic.getDateTime(), "MMM dd, yyyy")));
    // Add the seller and buyer address
    document.add(getAddressTable(basic, bold));
    // Add the line items
    document.add(getLineItemTable(invoice, bold));
    // Add the grand totals
    document.add(getTotalsTable(
        basic.getTaxBasisTotalAmount(), basic.getTaxTotalAmount(),
        basic.getGrandTotalAmount(), basic.getGrandTotalAmountCurrencyID(),
        basic.getTaxTypeCode(), basic.getTaxApplicablePercent(),
        basic.getTaxBasisAmount(), basic.getTaxCalculatedAmount(),
        basic.getTaxCalculatedAmountCurrencyID(), bold));
    // Add the payment info
    document.add(getPaymentInfo(basic.getPaymentReference(),
        basic.getPaymentMeansPayeeFinancialInstitutionBIC(),
        basic.getPaymentMeansPayeeAccountIBAN()));
 
    document.close();
}



















public Table getAddressTable(IBasicProfile basic, PdfFont bold) {
    Table table = new Table(new UnitValue[]{
        new UnitValue(UnitValue.PERCENT, 50),
        new UnitValue(UnitValue.PERCENT, 50)})
            .setWidthPercent(100);
    table.addCell(getPartyAddress("From:",
        basic.getSellerName(),
        basic.getSellerLineOne(),
        basic.getSellerLineTwo(),
        basic.getSellerCountryID(),
        basic.getSellerPostcode(),
        basic.getSellerCityName(),
        bold));
    table.addCell(getPartyAddress("To:",
        basic.getBuyerName(),
        basic.getBuyerLineOne(),
        basic.getBuyerLineTwo(),
        basic.getBuyerCountryID(),
        basic.getBuyerPostcode(),
        basic.getBuyerCityName(),
        bold));
    table.addCell(getPartyTax(basic.getSellerTaxRegistrationID(),
        basic.getSellerTaxRegistrationSchemeID(), bold));
    table.addCell(getPartyTax(basic.getBuyerTaxRegistrationID(),
        basic.getBuyerTaxRegistrationSchemeID(), bold));
    return table;
}
















public Cell getPartyAddress(String who, String name,
    String line1, String line2, String countryID,
    String postcode, String city, PdfFont bold) {
    Paragraph p = new Paragraph()
        .setMultipliedLeading(1.0f)
        .add(new Text(who).setFont(bold)).add(NEWLINE)
        .add(name).add(NEWLINE)
        .add(line1).add(NEWLINE)
        .add(line2).add(NEWLINE)
        .add(String.format("%s-%s %s", countryID, postcode, city));
    Cell cell = new Cell()
        .setBorder(Border.NO_BORDER)
        .add(p);
    return cell;
}
public Cell getPartyTax(String[] taxId, String[] taxSchema, PdfFont bold) {
    Paragraph p = new Paragraph()
        .setFontSize(10).setMultipliedLeading(1.0f)
        .add(new Text("Tax ID(s):").setFont(bold));
    if (taxId.length == 0) {
        p.add("\nNot applicable");
    }
    else {
        int n = taxId.length;
        for (int i = 0; i < n; i++) {
            p.add(NEWLINE)
            .add(String.format("%s: %s", taxSchema[i], taxId[i]));
        }
    }
    return new Cell().setBorder(Border.NO_BORDER).add(p);
}





























public Table getLineItemTable(Invoice invoice, PdfFont bold) {
    Table table = new Table(
        new UnitValue[]{
            new UnitValue(UnitValue.PERCENT, 43.75f),
            new UnitValue(UnitValue.PERCENT, 12.5f),
            new UnitValue(UnitValue.PERCENT, 6.25f),
            new UnitValue(UnitValue.PERCENT, 12.5f),
            new UnitValue(UnitValue.PERCENT, 12.5f),
            new UnitValue(UnitValue.PERCENT, 12.5f)})
        .setWidthPercent(100)
    .setMarginTop(10).setMarginBottom(10);
    table.addHeaderCell(createCell("Item:", bold));
    table.addHeaderCell(createCell("Price:", bold));
    table.addHeaderCell(createCell("Qty:", bold));
    table.addHeaderCell(createCell("Subtotal:", bold));
    table.addHeaderCell(createCell("VAT:", bold));
    table.addHeaderCell(createCell("Total:", bold));
    Product product;
    for (Item item : invoice.getItems()) {
        product = item.getProduct();
        table.addCell(createCell(product.getName()));
        table.addCell(createCell(
            InvoiceData.format2dec(InvoiceData.round(product.getPrice())))
                .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(String.valueOf(item.getQuantity()))
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(
            InvoiceData.format2dec(InvoiceData.round(item.getCost())))
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(
            InvoiceData.format2dec(InvoiceData.round(product.getVat())))
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(
            InvoiceData.format2dec(InvoiceData.round(
                item.getCost() + ((item.getCost() * product.getVat()) / 100))))
            .setTextAlignment(TextAlignment.RIGHT));
    }
    return table;
}

















public Cell createCell(String text) {
    return new Cell().setPadding(0.8f)
        .add(new Paragraph(text)
            .setMultipliedLeading(1));
}
public Cell createCell(String text, PdfFont font) {
    return new Cell().setPadding(0.8f)
        .add(new Paragraph(text)
            .setFont(font).setMultipliedLeading(1));
}















public Table getTotalsTable(String tBase, String tTax, String tTotal,
    String tCurrency, String[] type, String[] percentage, String base[],
    String tax[], String currency[], PdfFont bold) {
    Table table = new Table(
        new UnitValue[]{
            new UnitValue(UnitValue.PERCENT, 8.33f),
            new UnitValue(UnitValue.PERCENT, 8.33f),
            new UnitValue(UnitValue.PERCENT, 25f),
            new UnitValue(UnitValue.PERCENT, 25f),
            new UnitValue(UnitValue.PERCENT, 25f),
            new UnitValue(UnitValue.PERCENT, 8.34f)})
        .setWidthPercent(100);
    table.addCell(createCell("TAX:", bold));
    table.addCell(createCell("%", bold)
        .setTextAlignment(TextAlignment.RIGHT));
    table.addCell(createCell("Base amount:", bold));
    table.addCell(createCell("Tax amount:", bold));
    table.addCell(createCell("Total:", bold));
    table.addCell(createCell("Curr.:", bold));
    int n = type.length;
    for (int i = 0; i < n; i++) {
        table.addCell(createCell(type[i])
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(percentage[i])
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(base[i])
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(tax[i])
            .setTextAlignment(TextAlignment.RIGHT));
        double total = Double.parseDouble(base[i]) + Double.parseDouble(tax[i]);
        table.addCell(createCell(
            InvoiceData.format2dec(InvoiceData.round(total)))
            .setTextAlignment(TextAlignment.RIGHT));
        table.addCell(createCell(currency[i]));
    }
    table.addCell(new Cell(1, 2).setBorder(Border.NO_BORDER));
    table.addCell(createCell(tBase, bold)
        .setTextAlignment(TextAlignment.RIGHT));
    table.addCell(createCell(tTax, bold)
        .setTextAlignment(TextAlignment.RIGHT));
    table.addCell(createCell(tTotal, bold)
        .setTextAlignment(TextAlignment.RIGHT));
    table.addCell(createCell(tCurrency, bold));
    return table;
}














public Paragraph getPaymentInfo(String ref, String[] bic, String[] iban) {
    Paragraph p = new Paragraph(String.format(
        "Please wire the amount due to our bank account using "
        + " the following reference: %s",
        ref));
    int n = bic.length;
    for (int i = 0; i < n; i++) {
        p.add(NEWLINE).add(String.format("BIC: %s - IBAN: %s", bic[i], iban[i]));
    }
    return p;
}




}*/