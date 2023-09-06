package com.eazyroom.web.utility;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.eazyroom.web.entities.Eazy;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class GeneratePdfUtil {

	public static ByteArrayInputStream ownerReport(List<Eazy> eazy, String utype) {

		String title = "EazyRooM";
		String subtitle = "(" + utype + ")";

		Document document = new Document();
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20);
		Paragraph titleparagraph = new Paragraph(title, titleFont);
		titleparagraph.setAlignment(Element.ALIGN_CENTER);

		Paragraph paragraph = new Paragraph();
		paragraph.add(new Chunk(subtitle));
		paragraph.setAlignment(Element.ALIGN_CENTER);

		try {

			PdfPTable table = new PdfPTable(6);
			table.setWidthPercentage(90);
			table.setWidths(new int[] { 5, 8, 5, 5, 5, 8 });

			Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

			PdfPCell hcell;
			hcell = new PdfPCell(new Phrase("Name", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Contact", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Rent", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Room in", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Room for", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Address", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			for (Eazy eazy2 : eazy) {

				PdfPCell cell;

				cell = new PdfPCell(new Phrase(eazy2.getName()));
				cell.setPaddingLeft(10);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getContno()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getRent()));
				cell.setPaddingLeft(10);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getCity()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getGender()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getAddress()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);
			}

			PdfWriter.getInstance(document, out);
			document.open();

			document.add(titleparagraph);
			document.add(paragraph);
			document.add(new Paragraph("\n"));
			document.add(table);

			document.close();

		} catch (DocumentException ex) {
			Logger.getLogger(GeneratePdfUtil.class.getName()).log(Level.SEVERE, null, ex);
		}
		return new ByteArrayInputStream(out.toByteArray());
	}

	
	
	public static ByteArrayInputStream tenantReport(List<Eazy> eazy, String utype) {

		String title = "EazyRooM";
		String subtitle = "(" + utype + ")";

		Document document = new Document();
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20);
		Paragraph titleparagraph = new Paragraph(title, titleFont);
		titleparagraph.setAlignment(Element.ALIGN_CENTER);

		Paragraph paragraph = new Paragraph();
		paragraph.add(new Chunk(subtitle));
		paragraph.setAlignment(Element.ALIGN_CENTER);

		try {

			PdfPTable table = new PdfPTable(6);
			table.setWidthPercentage(90);
			table.setWidths(new int[] { 5, 8, 5, 5, 5, 8 });

			Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

			PdfPCell hcell;
			hcell = new PdfPCell(new Phrase("Name", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Contact", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Budget", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Preferred City", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Gender", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Address", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			for (Eazy eazy2 : eazy) {

				PdfPCell cell;

				cell = new PdfPCell(new Phrase(eazy2.getName()));
				cell.setPaddingLeft(10);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getContno()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getRent()));
				cell.setPaddingLeft(10);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getCity()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getGender()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(eazy2.getAddress()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);
			}

			PdfWriter.getInstance(document, out);
			document.open();

			document.add(titleparagraph);
			document.add(paragraph);
			document.add(new Paragraph("\n"));
			document.add(table);

			document.close();

		} catch (DocumentException ex) {
			Logger.getLogger(GeneratePdfUtil.class.getName()).log(Level.SEVERE, null, ex);
		}
		return new ByteArrayInputStream(out.toByteArray());
	}
}