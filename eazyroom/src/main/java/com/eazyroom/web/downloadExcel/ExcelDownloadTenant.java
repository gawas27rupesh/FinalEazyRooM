package com.eazyroom.web.downloadExcel;

import java.io.InputStream;
import java.net.URL;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.commons.compress.utils.IOUtils;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.eazyroom.web.entities.Eazy;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExcelDownloadTenant extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String date = (LocalDate.now().toString());
		String utype = model.get("utype").toString();
		String filename = "attachment; filename=\"" + "EazyRooM_"+utype+"_"+date+".xls\" ";
		response.setHeader("Content-Disposition", filename);
		
		if (workbook.getSheet("Owner") != null) {
			workbook.removeSheetAt(workbook.getSheetIndex("Owner")); 
		}
		
		Sheet sheet = workbook.createSheet("Owner");
		
		Drawing drawing = sheet.createDrawingPatriarch();
		ClientAnchor anchor = drawing.createAnchor(200, 15, 1023, 255, (short) 0, 0, (short) 1, 0);
		InputStream inputStream = new URL(
				"https://rntdata.s3.us-east-2.amazonaws.com/RNTPortfolio/prod/Images/rntmailstamp.png")
					.openStream();
		byte[] bytes = IOUtils.toByteArray(inputStream);
		int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
		inputStream.close();
		Picture logo = drawing.createPicture(anchor, pictureIdx);
		logo.resize(0.72, 0.78);
		
		sheet.setHorizontallyCenter(true);
		sheet.setDisplayGridlines(true);
		
		Font headerFont=workbook.createFont();
		headerFont.setFontName("Arial");
		headerFont.setFontHeightInPoints((short) 23);
		headerFont.setBold(true);
		headerFont.setColor(IndexedColors.BLACK.getIndex());
		
		Font titleFont = workbook.createFont();
		headerFont.setFontHeightInPoints((short) 13);
		titleFont.setFontName("Arial");
		titleFont.setColor(IndexedColors.WHITE.getIndex());
		titleFont.setBold(true);
		
		Font headFont=workbook.createFont();
		headFont.setBold(true);
		
		CellStyle headerRight1 = workbook.createCellStyle();
		headerRight1.setBorderTop(BorderStyle.THIN);
		headerRight1.setBorderRight(BorderStyle.THIN);

		CellStyle headeUp1 = workbook.createCellStyle();
		headeUp1.setBorderTop(BorderStyle.THIN);
		
		CellStyle headerUp = workbook.createCellStyle();
		headerUp.setAlignment(HorizontalAlignment.LEFT);
		headerUp.setBorderTop(BorderStyle.THIN);
		headerUp.setBorderLeft(BorderStyle.THIN);
		headerUp.setBorderRight(BorderStyle.THIN);
		headerUp.setBorderBottom(BorderStyle.THIN);

		
		CellStyle projectHeader = workbook.createCellStyle();
		projectHeader.setAlignment(HorizontalAlignment.CENTER);
		projectHeader.setVerticalAlignment(VerticalAlignment.CENTER);
		projectHeader.setFont(headerFont);
		projectHeader.setFillPattern(FillPatternType.FINE_DOTS);
		projectHeader.setFillForegroundColor(IndexedColors.WHITE.getIndex());
		projectHeader.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		projectHeader.setBorderLeft(BorderStyle.THIN);
		projectHeader.setBorderTop(BorderStyle.THIN);
		projectHeader.setBorderRight(BorderStyle.THIN);
		projectHeader.setBorderBottom(BorderStyle.THIN);

		CellStyle title = workbook.createCellStyle();
		title.setAlignment(HorizontalAlignment.CENTER);
		title.setVerticalAlignment(VerticalAlignment.CENTER);
		title.setFillPattern(FillPatternType.FINE_DOTS);
		title.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
		title.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		title.setFont(titleFont);
		title.setWrapText(true);
		title.setBorderTop(BorderStyle.THIN);
		title.setBorderBottom(BorderStyle.THIN);
		title.setBorderLeft(BorderStyle.THIN);
		title.setBorderRight(BorderStyle.THIN);
		
		CellStyle allBorder2 = workbook.createCellStyle();
		allBorder2.setAlignment(HorizontalAlignment.LEFT);
		allBorder2.setVerticalAlignment(VerticalAlignment.CENTER);
		allBorder2.setWrapText(true);
		allBorder2.setBorderTop(BorderStyle.THIN);
		allBorder2.setBorderBottom(BorderStyle.THIN);
		allBorder2.setBorderLeft(BorderStyle.THIN);
		allBorder2.setBorderRight(BorderStyle.THIN);
		
		CellStyle allBorder3 = workbook.createCellStyle();
		allBorder3.setAlignment(HorizontalAlignment.LEFT);
		allBorder3.setVerticalAlignment(VerticalAlignment.CENTER);
		allBorder3.setWrapText(true);
		allBorder3.setFont(headFont);
		allBorder3.setBorderTop(BorderStyle.THIN);
		allBorder3.setBorderBottom(BorderStyle.THIN);
		allBorder3.setBorderLeft(BorderStyle.THIN);
		allBorder3.setBorderRight(BorderStyle.THIN);
		
		 // Create a cell style
        CellStyle style = workbook.createCellStyle();
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);

		
		Row header = sheet.createRow(0);
		header.setHeightInPoints(50);
		int columnWidth = 20 * 256; // 20 characters wide
		sheet.setColumnWidth(0, columnWidth);
		header.createCell(0).setCellValue(utype);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 7));
		header.getCell(0).setCellStyle(projectHeader);
		
		
		String Utype = (String) model.get("utype");
		String User_Name = (String) model.get("User Name");
		String User_Mobile = (String) model.get("User Mobile");
		String User_Designation = (String) model.get("User Designation");
		
		int rows = 1;
		int b = 0;
		sheet.setColumnWidth(b, 20 * 256);
		sheet.setColumnWidth(b+1, 20 * 256);
		sheet.setColumnWidth(b+2, 20 * 256);
		sheet.setColumnWidth(b+3, 20 * 256);
		sheet.setColumnWidth(b+4, 20 * 256);
		sheet.setColumnWidth(b+5, 20 * 256);
		sheet.setColumnWidth(b+6, 20 * 256);
		sheet.setColumnWidth(b+7, 20 * 256);
		
		Row br1 = sheet.createRow(rows);
		Row br2 = sheet.createRow(rows + 1); // Create a new row for the second part of the data
		Font font4 = workbook.createFont();
		br1.setHeightInPoints(18);
		br2.setHeightInPoints(18);
		
		
		String[] attList = {"Posts of: ","","User Name : ","","User Mobile : ","","User Designation : ",""};
		// Set metadata values and apply formatting in the first row
		sheet.addMergedRegion(new CellRangeAddress(1,1,0,1));
		Cell row1=br1.createCell(b);
		row1.setCellValue(attList[0] + Utype);
		row1.setCellStyle(allBorder3);
		
		Cell row01=br1.createCell(b+1);
		row01.setCellStyle(allBorder3);
		
		sheet.addMergedRegion(new CellRangeAddress(1,1,2,3));
		Cell row2=br1.createCell(b + 2);
		row2.setCellValue(attList[2] + User_Name);
		row2.setCellStyle(allBorder3);
		
		Cell row23=br1.createCell(b+3);
		row23.setCellStyle(allBorder3);
		
		sheet.addMergedRegion(new CellRangeAddress(1,1,4,5));
		Cell row3=br1.createCell(b + 4);
		row3.setCellValue(attList[4] + User_Mobile);
		row3.setCellStyle(allBorder3);
		
		Cell row45=br1.createCell(b+5);
		row45.setCellStyle(allBorder3);
		
		sheet.addMergedRegion(new CellRangeAddress(1,1,6,7));
		Cell row4=br1.createCell(b + 6);
		row4.setCellValue(attList[6] + User_Designation);
		row4.setCellStyle(allBorder3);
		
		Cell row67=br1.createCell(b+7);
		row67.setCellStyle(allBorder3);
		
	
		/********************* project Data end here ******************/
		
		int OwnerStartRow = rows + 2; 
		
		Row brHeaderRow = sheet.createRow(OwnerStartRow);
		brHeaderRow.createCell(0).setCellValue("User Type");
		brHeaderRow.createCell(1).setCellValue("Name");
		brHeaderRow.createCell(2).setCellValue("Contact");
		brHeaderRow.createCell(3).setCellValue("State");
		brHeaderRow.createCell(4).setCellValue("City");
		brHeaderRow.createCell(5).setCellValue("Gender");
		brHeaderRow.createCell(6).setCellValue("Address");
		brHeaderRow.createCell(7).setCellValue("Post Date");
			
		for (int i = 0; i < 8; i++) {
		    brHeaderRow.getCell(i).setCellStyle(title);
		}
		
		List<Eazy> testCaseList = (List<Eazy>) model.get("eazy");
		int rowIndex = OwnerStartRow + 1;
		
		sheet.setVerticallyCenter(true);
		for (Eazy eazy : testCaseList) {
			Row dataRow = sheet.createRow(rowIndex);
			
			Cell r1=dataRow.createCell(0);
			r1.setCellValue(eazy.getUtype());
			r1.setCellStyle(allBorder2);
			
			Cell r2=dataRow.createCell(1);
			r2.setCellValue(eazy.getName());
			r2.setCellStyle(allBorder2);
			
			Cell r3=dataRow.createCell(2);
			r3.setCellValue(eazy.getContno());
			r3.setCellStyle(allBorder2);
			
			Cell r4=dataRow.createCell(3);
			r4.setCellValue(eazy.getState());
			r4.setCellStyle(allBorder2);
			
			Cell r5=dataRow.createCell(4);
			r5.setCellValue(eazy.getCity());
			r5.setCellStyle(allBorder2);
			
			Cell r6=dataRow.createCell(5);
			r6.setCellValue(eazy.getGender());
			r6.setCellStyle(allBorder2);
			
			Cell r7=dataRow.createCell(6);
			r7.setCellValue(eazy.getAddress());
			r7.setCellStyle(allBorder2);
			
			Cell r8=dataRow.createCell(7);
			r8.setCellValue(eazy.getPostdate());
			r8.setCellStyle(allBorder2);
			rowIndex++;
		}
	}
}
