package CON2;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.FileOutputStream;

import javax.activation.DataSource;
import javax.activation.FileDataSource;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import CON2.Connection2;


//@SuppressWarnings("deprecation")
public class AMCPrintData {

	
public static List<AmcDto> viewAmcDetails(String assetno,String ponum,Date startDate,Date endDate) throws SQLException {
		
	System.out.println("in printodata page");
	
		 List<AmcDto> amcdto = new ArrayList<AmcDto>();
		
		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
	     String query =null;
	 
			/* query = "SELECT *,u.full_name,sb.b_name,mb.m_b_no,sb.b_no,mb.m_b_name FROM `circuitid_details` c " +
							"INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id " +
							"INNER JOIN branch_master sb ON sb.id=c.branch_id " +
							"INNER JOIN branch_master_main mb ON mb.m_b_no=sb.b_no " +
							"where " +
							" c.callLoggeddate >=? " +
							" And c.callLoggeddate <=? " +
							" And c.circuit_Id=? " +
							" And c.status='Completed'" +
						   //"And c.linktype_id=?" +
							" Order by c.circuit_Id ";*/
	     
	     if(!assetno.equals("") && ponum.equals(""))
	     {
	     	System.out.println("in asset");
	     query = "select s.hw_id_Nit,s.Asset_no,s.po_no,s.vender_name,s.amc_po,s.amc_podate,s.amc_vender,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.Asset_no=? and (s.amc_exp_date >= ? and s.amc_exp_date <= ?)";
	    
	     }
	     else
	     	if(!ponum.equals("") && assetno.equals(""))
	     	{
	     		System.out.println("in ponum");
	     	query = "select s.hw_id_Nit,s.Asset_no,s.po_no,s.vender_name,s.amc_po,s.amc_podate,s.amc_vender,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.amc_po=? and (s.amc_exp_date >= ? and s.amc_exp_date <= ?)";
	     	
	     	}
	     	else{
	     		System.out.println("in ponum n asset");
	    		query = "select s.hw_id_Nit,s.Asset_no,s.po_no,s.vender_name,s.amc_po,s.amc_podate,s.amc_vender,s.branch,s.sub_branch,s.amc_from_date,s.amc_to_date,s.amc_exp_date,s.amc_amount,b.m_b_name,sb.b_name from hardware_amc_nonit s inner join branch_master_main b on b.m_b_no=s.branch inner join branch_master sb on sb.id=s.sub_branch where s.status='Active' and s.Asset_no=? and s.amc_po=? and (s.amc_exp_date >= ? and s.amc_exp_date <= ?)";
	    		
	     	}

		try{
			if(!assetno.equals("") && ponum.equals(""))
		     {
			 preparedStatement = con.prepareStatement(query);
			 preparedStatement.setString(1, assetno);
			 preparedStatement.setDate(2, new java.sql.Date(startDate.getTime()));
			 preparedStatement.setDate(3, new java.sql.Date(endDate.getTime()));
			 
			// preparedStatement.setString(4, ponum);
		     }
			else if(!ponum.equals("") && assetno.equals(""))
		     	{
		     		preparedStatement = con.prepareStatement(query);
		     		preparedStatement.setString(1, assetno);
					 preparedStatement.setDate(2, new java.sql.Date(startDate.getTime()));
					 preparedStatement.setDate(3, new java.sql.Date(endDate.getTime()));
					 
		     	}
			else{
				 preparedStatement = con.prepareStatement(query);
				 preparedStatement.setString(1, assetno);
				 preparedStatement.setString(2, ponum);	
				 preparedStatement.setDate(3, new java.sql.Date(startDate.getTime()));
				 preparedStatement.setDate(4, new java.sql.Date(endDate.getTime()));
				
			}
		     resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()){
				
				AmcDto amcdto1 = new AmcDto();
				amcdto1.setAssetNo(resultSet.getString("Asset_no"));
				amcdto1.setPoNum(resultSet.getString("po_no"));
				amcdto1.setVender(resultSet.getString("vender_name"));
				amcdto1.setAmcPoNum(resultSet.getString("amc_po"));
				amcdto1.setAmcVender(resultSet.getString("amc_vender"));
				amcdto1.setBranch(resultSet.getString("branch"));
				amcdto1.setSbranch(resultSet.getString("sub_branch"));
				amcdto1.setAmcfrom(resultSet.getString("amc_from_date"));
				amcdto1.setAmcto(resultSet.getString("amc_to_date"));
				amcdto1.setAmcexpiry(resultSet.getString("amc_exp_date"));
				amcdto1.setAmcamt(resultSet.getString("amc_amount"));
               
				amcdto.add(amcdto1);
                
			}
	   }catch (Exception e) {
			e.printStackTrace();

	 }
	 finally {
		 con.close();
		}
	return amcdto;
	}


/*public static int ViewBranchWise(int branchNo,Date startDate,Date endDate,String to,String from) throws SQLException {
	
			  float total=0;
			  String branch=null;
			  int result = 0;
			  DecimalFormat nf = new DecimalFormat("#.##");
		      nf.setMaximumFractionDigits(2);
		      nf.setMinimumFractionDigits(2);
		    
			  Connection con = null;
			  Connection con1 = null;
			  Connection2 dbConn = new Connection2();
			  con = dbConn.getConnection2();
			  con1 = dbConn.getConnection2();
		    
		      PreparedStatement preparedStatement = null;
			  ResultSet resultSet = null;
			  PreparedStatement preparedStatement1 = null;
			  ResultSet resultSet1 = null;
	 
	
	     String query = " SELECT DISTINCT c.catridge_model,s.b_name,mb.m_b_name,c.printer_name,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) = 1 THEN c.amount ELSE 0 END ),2 )Amt_Jan,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =2 THEN amount ELSE 0 END ),2 ) Amt_Feb,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =3 THEN amount ELSE 0 END ),2 ) Amt_Mar,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =4 THEN amount ELSE 0 END ),2 ) Amt_Apr,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =5 THEN amount ELSE 0 END ),2 ) Amt_May,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =6 THEN amount ELSE 0 END ),2 ) Amt_June,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =7 THEN amount ELSE 0 END ),2 ) Amt_July, "+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =8 THEN amount ELSE 0 END ),2 ) Amt_Aug,"+
				        " Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =9 THEN amount ELSE 0 END ),2 ) Amt_Sep,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =10 THEN amount ELSE 0 END ),2 ) Amt_Oct,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =11 THEN amount ELSE 0 END ),2 ) Amt_Nov,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =12 THEN amount ELSE 0 END ),2 ) Amt_dec"+
						" FROM catridge_details c "+  
						" INNER JOIN branch_master s ON c.branch_id = s.id"+
						" INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no"+
						" WHERE month_of_payment >=  ?"+
						" AND month_of_payment <=  ?"+
						" AND c.branch_no = ?"+
						" Group by c.catridge_model"+
						" Order by c.branch_id";
	     
	    String query1 = " SELECT DISTINCT "+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) = 1 THEN amount ELSE 0 END ),2 )Amt_Jan,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =2 THEN amount ELSE 0 END ),2 ) Amt_Feb,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =3 THEN amount ELSE 0 END ),2 ) Amt_Mar,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =4 THEN amount ELSE 0 END ),2 ) Amt_Apr,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =5 THEN amount ELSE 0 END ),2 ) Amt_May,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =6 THEN amount ELSE 0 END ),2 ) Amt_June,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =7 THEN amount ELSE 0 END ),2 ) Amt_July, "+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =8 THEN amount ELSE 0 END ),2 ) Amt_Aug,"+
				        " Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =9 THEN amount ELSE 0 END ),2 ) Amt_Sep,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =10 THEN amount ELSE 0 END ),2 ) Amt_Oct,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =11 THEN amount ELSE 0 END ),2 ) Amt_Nov,"+
						" Round(SUM( CASE WHEN MONTH( c.month_of_payment ) =12 THEN amount ELSE 0 END ),2 ) Amt_dec"+
						" FROM catridge_details c "+  
						" INNER JOIN branch_master s ON c.branch_id = s.id"+
						" INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no"+
						" WHERE month_of_payment >=  ?"+
						" AND month_of_payment <=  ?"+
						" AND c.branch_no = ?"+
						//" Group by c.branch_id"+
						" Order by c.catridge_id";
	try{
		
		
					 preparedStatement = con.prepareStatement(query);
					 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
					 preparedStatement.setInt(3, branchNo);
				     resultSet = preparedStatement.executeQuery();
				     
				     preparedStatement1 = con1.prepareStatement(query1);
					 preparedStatement1.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement1.setDate(2, new java.sql.Date(endDate.getTime()));
					 preparedStatement1.setInt(3, branchNo);
				     resultSet1 = preparedStatement1.executeQuery();
		     
				    HSSFWorkbook xlsFile = new HSSFWorkbook(); // create a workbook
				    // CreationHelper helper = xlsFile.getCreationHelper();
				    Sheet sheet = xlsFile.createSheet("CatridgeReport"); // add a sheet to your workbook
				    Row row = sheet.createRow((short)0);
	
			        CellStyle style0 = xlsFile.createCellStyle();
			        style0.setFillForegroundColor(IndexedColors.WHITE.getIndex());
			        style0.setAlignment(style0.ALIGN_CENTER);
			        style0.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style0.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			        style0.setBorderTop(HSSFCellStyle.BORDER_THIN);
			        style0.setBorderRight(HSSFCellStyle.BORDER_THIN);
			        style0.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			        Font font0 = xlsFile.createFont();
		            font0.setColor(IndexedColors.BLACK.getIndex());
		            style0.setFont(font0);
	            
		            CellStyle style = xlsFile.createCellStyle();
			        style.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
			        style.setAlignment(style.ALIGN_CENTER);
			        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			        Font font = xlsFile.createFont();
		            font.setColor(IndexedColors.BLACK.getIndex());
		            style.setFont(font);
		            
		            CellStyle style1 = xlsFile.createCellStyle();
			        style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			        //  style1.setAlignment(style1.ALIGN_CENTER);
			        style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			        style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
			        style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
			        style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			        Font font1 = xlsFile.createFont();
		            font1.setColor(IndexedColors.BLUE.getIndex());
		            style1.setFont(font1);
		            
		            CellStyle style2 = xlsFile.createCellStyle();
			        style2.setFillForegroundColor(IndexedColors.WHITE.getIndex());
			        //style2.setAlignment(style2.ALIGN_CENTER);
			        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
			        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
			        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			        Font font2 = xlsFile.createFont();
		            font2.setColor(IndexedColors.RED.getIndex());
		            style2.setFont(font2);
		            
		            CellStyle style3 = xlsFile.createCellStyle();
			         style3.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
			       // style3.setAlignment(style3.ALIGN_CENTER);
			        style3.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			        style3.setBorderTop(HSSFCellStyle.BORDER_THIN);
			        style3.setBorderRight(HSSFCellStyle.BORDER_THIN);
			        style3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			        Font font3 = xlsFile.createFont();
		            font3.setColor(IndexedColors.BLUE.getIndex());
		            style3.setFont(font3);
		            
				    Cell cell1 = row.createCell(0);
				    cell1.setCellValue("Branch");
				    cell1.setCellStyle(style);
				    
				    Cell cell2 = row.createCell(1);
				    cell2.setCellValue("Location");
				    cell2.setCellStyle(style);
				    
				    Cell cellx2 = row.createCell(1);
				    cellx2.setCellValue("Printer Name");
				    cellx2.setCellStyle(style);
	
				    Cell cell3 = row.createCell(2);
				    cell3.setCellValue("Cartridge Model");
				    cell3.setCellStyle(style);
				    
				    Cell cell4 = row.createCell(3);
				    cell4.setCellValue("Jan");
				    cell4.setCellStyle(style);
				    
				    Cell cell5 = row.createCell(4);
				    cell5.setCellValue("Feb");
				    cell5.setCellStyle(style);
				    
				    Cell cell6 = row.createCell(5);
				    cell6.setCellValue("Mar");
				    cell6.setCellStyle(style);
				    
				    Cell cell7 = row.createCell(6);
				    cell7.setCellValue("Apr");
				    cell7.setCellStyle(style);
			     
				    Cell cell8 = row.createCell(7);
				    cell8.setCellValue("May");
				    cell8.setCellStyle(style);
	
				    Cell cell9 = row.createCell(8);
				    cell9.setCellValue("June");
				    cell9.setCellStyle(style);
				    
				    Cell cell10 = row.createCell(9);
				    cell10.setCellValue("July");
				    cell10.setCellStyle(style);
				    
				    Cell cell11 = row.createCell(10);
				    cell11.setCellValue("Aug");
				    cell11.setCellStyle(style);
				    			    
				    Cell cell12 = row.createCell(11);
				    cell12.setCellValue("Sep");
				    cell12.setCellStyle(style);
				    
				    Cell cell13 = row.createCell(12);
				    cell13.setCellValue("Oct");
				    cell13.setCellStyle(style);
				    
				    Cell cell14 = row.createCell(13);
				    cell14.setCellValue("Nov");
				    cell14.setCellStyle(style);
				    
				    Cell cell15 = row.createCell(14);
				    cell15.setCellValue("Dec");
				    cell15.setCellStyle(style);
				    
				    Cell cell16 = row.createCell(15);
				    cell16.setCellValue("Total");
				    cell16.setCellStyle(style);
				    
			    
	      int i =1;
		  while(resultSet.next()){
			  	
			    String amt_Jan = resultSet.getString("amt_Jan");   if(amt_Jan == null){amt_Jan=""+0;}   float  t1 = Float.parseFloat(amt_Jan);	 
	      	    String amt_Feb = resultSet.getString("amt_Feb");   if(amt_Feb == null){amt_Feb=""+0;}   float  t2 = Float.parseFloat(amt_Feb);   
	      	    String amt_Mar = resultSet.getString("amt_Mar");   if(amt_Mar == null){amt_Mar=""+0;}   float  t3 = Float.parseFloat(amt_Mar);	
	      	    String amt_Apr = resultSet.getString("amt_Apr");   if(amt_Apr == null){amt_Apr=""+0;}   float  t4 = Float.parseFloat(amt_Apr);   
	      	    String amt_May = resultSet.getString("amt_May");   if(amt_May == null){amt_May=""+0;}   float  t5 = Float.parseFloat(amt_May);	           
	      	    String amt_June = resultSet.getString("amt_June"); if(amt_June == null){amt_June=""+0;} float  t6 = Float.parseFloat(amt_June);     
	      	    String amt_July = resultSet.getString("amt_July"); if(amt_July == null){amt_July=""+0;} float  t7 = Float.parseFloat(amt_July);     
	      	    String amt_Aug = resultSet.getString("amt_Aug");   if(amt_Aug == null){amt_Aug=""+0;}   float  t8 = Float.parseFloat(amt_Aug);	           
	      	    String amt_Sep = resultSet.getString("amt_Sep");   if(amt_Sep == null){amt_Sep=""+0;}   float  t9 = Float.parseFloat(amt_Sep);      
	      	    String amt_Oct = resultSet.getString("amt_Oct");   if(amt_Oct == null){amt_Oct=""+0;}   float  t10 = Float.parseFloat(amt_Oct);    
	      	    String amt_Nov = resultSet.getString("amt_Nov");   if(amt_Nov == null){amt_Nov=""+0;}   float  t11 = Float.parseFloat(amt_Nov);       
	      	    String amt_Dec = resultSet.getString("amt_Dec");   if(amt_Dec == null){amt_Dec=""+0;}   float  t12 = Float.parseFloat(amt_Dec);              
      	     
         	        total=t1+t2+t3+t4+t5+t6+t7+t8+t9+t10+t11+t12;
         	        String total1=nf.format(total);
         	    
				    row = sheet.createRow((short)i);
				   
				    branch=resultSet.getString("m_b_name");
				   
                    Cell cell241 = row.createCell(0);
				    cell241.setCellValue(resultSet.getString("b_name"));
				    cell241.setCellStyle(style0);
				    
				    Cell cell242 = row.createCell(0);
				    cell242.setCellValue(resultSet.getString("m_b_name"));
				    cell242.setCellStyle(style0);
				    
				    Cell cellx242 = row.createCell(1);
				    cellx242.setCellValue(resultSet.getString("printer_name"));
				    cellx242.setCellStyle(style0);
				    
				    Cell cell243 = row.createCell(2);
				    cell243.setCellValue(resultSet.getString("catridge_model"));
				    cell243.setCellStyle(style0);
                   
				    Cell cell24 = row.createCell(3);
				    cell24.setCellValue(amt_Jan);
				    cell24.setCellStyle(style0);
				    
				    Cell cell25 = row.createCell(4);
				    cell25.setCellValue(amt_Feb);
				    cell25.setCellStyle(style0);
				    
				    Cell cell26 = row.createCell(5);
				    cell26.setCellValue(amt_Mar);
				    cell26.setCellStyle(style0);
				    
				    Cell cell27 = row.createCell(6);
				    cell27.setCellValue(amt_Apr);
				    cell27.setCellStyle(style0);
			     
				    Cell cell28 = row.createCell(7);
				    cell28.setCellValue(amt_May);
				    cell28.setCellStyle(style0);

				    Cell cell29 = row.createCell(8);
				    cell29.setCellValue(amt_June);
				    cell29.setCellStyle(style0);
				    
				    Cell cell210 = row.createCell(9);
				    cell210.setCellValue(amt_July);
				    cell210.setCellStyle(style0);
				    
				    Cell cell211 = row.createCell(10);
				    cell211.setCellValue(amt_Aug);
				    cell211.setCellStyle(style0);
				    			    
				    Cell cell212 = row.createCell(11);
				    cell212.setCellValue(amt_Sep);
				    cell212.setCellStyle(style0);
				    
				    Cell cell213 = row.createCell(12);
				    cell213.setCellValue(amt_Oct);
				    cell213.setCellStyle(style0);
				    
				    Cell cell214 = row.createCell(13);
				    cell214.setCellValue(amt_Nov);
				    cell214.setCellStyle(style0);
				    
				    Cell cell215 = row.createCell(14);
				    cell215.setCellValue(amt_Dec);
				    cell215.setCellStyle(style0);
				    
                    Cell cell115 = row.createCell(15);
   			        cell115.setCellValue(total1);
   			        cell115.setCellStyle(style3);
            i++;
		}
		  while(resultSet1.next()){
			  	
			    String amt_Jan = resultSet1.getString("amt_Jan");   if(amt_Jan == null){amt_Jan=""+0;}   float  t1 = Float.parseFloat(amt_Jan);	 
	      	    String amt_Feb = resultSet1.getString("amt_Feb");   if(amt_Feb == null){amt_Feb=""+0;}   float  t2 = Float.parseFloat(amt_Feb);   
	      	    String amt_Mar = resultSet1.getString("amt_Mar");   if(amt_Mar == null){amt_Mar=""+0;}   float  t3 = Float.parseFloat(amt_Mar);	
	      	    String amt_Apr = resultSet1.getString("amt_Apr");   if(amt_Apr == null){amt_Apr=""+0;}   float  t4 = Float.parseFloat(amt_Apr);   
	      	    String amt_May = resultSet1.getString("amt_May");   if(amt_May == null){amt_May=""+0;}   float  t5 = Float.parseFloat(amt_May);	           
	      	    String amt_June = resultSet1.getString("amt_June"); if(amt_June == null){amt_June=""+0;} float  t6 = Float.parseFloat(amt_June);     
	      	    String amt_July = resultSet1.getString("amt_July"); if(amt_July == null){amt_July=""+0;} float  t7 = Float.parseFloat(amt_July);     
	      	    String amt_Aug = resultSet1.getString("amt_Aug");   if(amt_Aug == null){amt_Aug=""+0;}   float  t8 = Float.parseFloat(amt_Aug);	           
	      	    String amt_Sep = resultSet1.getString("amt_Sep");   if(amt_Sep == null){amt_Sep=""+0;}   float  t9 = Float.parseFloat(amt_Sep);      
	      	    String amt_Oct = resultSet1.getString("amt_Oct");   if(amt_Oct == null){amt_Oct=""+0;}   float  t10 = Float.parseFloat(amt_Oct);    
	      	    String amt_Nov = resultSet1.getString("amt_Nov");   if(amt_Nov == null){amt_Nov=""+0;}   float  t11 = Float.parseFloat(amt_Nov);       
	      	    String amt_Dec = resultSet1.getString("amt_Dec");   if(amt_Dec == null){amt_Dec=""+0;}   float  t12 = Float.parseFloat(amt_Dec);              
    	     
	       	        total=t1+t2+t3+t4+t5+t6+t7+t8+t9+t10+t11+t12;
	       	        String total1=nf.format(total);
       	    
				    row = sheet.createRow((short)i);
                
				    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 2));
				    
				    Cell cell224 = row.createCell(0);
				    cell224.setCellValue("Grand Total");
				    cell224.setCellStyle(style);
				    
				    Cell cell24 = row.createCell(3);
				    cell24.setCellValue(amt_Jan);
				    cell24.setCellStyle(style3);
				    
				    Cell cell25 = row.createCell(4);
				    cell25.setCellValue(amt_Feb);
				    cell25.setCellStyle(style3);
				    
				    Cell cell26 = row.createCell(5);
				    cell26.setCellValue(amt_Mar);
				    cell26.setCellStyle(style3);
				    
				    Cell cell27 = row.createCell(6);
				    cell27.setCellValue(amt_Apr);
				    cell27.setCellStyle(style3);
			     
				    Cell cell28 = row.createCell(7);
				    cell28.setCellValue(amt_May);
				    cell28.setCellStyle(style3);

				    Cell cell29 = row.createCell(8);
				    cell29.setCellValue(amt_June);
				    cell29.setCellStyle(style3);
				    
				    Cell cell210 = row.createCell(9);
				    cell210.setCellValue(amt_July);
				    cell210.setCellStyle(style3);
				    
				    Cell cell211 = row.createCell(10);
				    cell211.setCellValue(amt_Aug);
				    cell211.setCellStyle(style3);
				    			    
				    Cell cell212 = row.createCell(11);
				    cell212.setCellValue(amt_Sep);
				    cell212.setCellStyle(style3);
				    
				    Cell cell213 = row.createCell(12);
				    cell213.setCellValue(amt_Oct);
				    cell213.setCellStyle(style3);
				    
				    Cell cell214 = row.createCell(13);
				    cell214.setCellValue(amt_Nov);
				    cell214.setCellStyle(style3);
				    
				    Cell cell215 = row.createCell(14);
				    cell215.setCellValue(amt_Dec);
				    cell215.setCellStyle(style3);
				    
				    Cell cell216 = row.createCell(15);
				    cell216.setCellValue(total1);
				    cell216.setCellStyle(style2);
				 
		        }
				    FileOutputStream fos = new FileOutputStream("temp.xls");
				    xlsFile.write(fos);
				    fos.close();
				  
				   // Switch to using a `FileDataSource` (instead of ByteArrayDataSource)
				    DataSource fds = new FileDataSource("temp.xls");
		  				   
				    String sub="Cartridge Report for Branch: "+branch+"  From date: "+new java.sql.Date(startDate.getTime())+" To  To date: "+new java.sql.Date(endDate.getTime());
				    String body="";
				    result=new SendExcelFileOnEmail().sendEmail(from ,to ,fds ,sub ,body,"CartridgeReport.xls");		
					
	       }
		  		 catch (Exception e) {
		         e.printStackTrace();

            }
      finally {
	    con.close();
	    }
   return result;
  }
@SuppressWarnings("deprecation")
public static int viewBranchWiseConReport(int branchNo,Date startDate,Date endDate,String to,String from,String type) throws SQLException {
	
				  float total=0;
				  String branch=null;
				  int result = 0;
				  DecimalFormat nf = new DecimalFormat("#.##");
			      nf.setMaximumFractionDigits(2);
			      nf.setMinimumFractionDigits(2);
			  
				  Connection con = null;
				  Connection con1 = null;
				  Connection2 dbConn = new Connection2();
				  con = dbConn.getConnection2();
				  con1 = dbConn.getConnection2();
			   
			      PreparedStatement preparedStatement = null;
				  ResultSet resultSet = null;
				  PreparedStatement preparedStatement1 = null;
				  ResultSet resultSet1 = null;
				  String query =null;
				  String query1 =null;
				  
	  if(!type.equals("Select")){	  
			         query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`type`,`monthlycharges`,"+
				            "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
					        " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
							" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
							" FROM consumption_report_details c "+  
							" INNER JOIN branch_master s ON c.branchid = s.id "+
							" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no "+
							" WHERE monthofpayment >=  ? "+
							" AND monthofpayment <=  ? "+
							" AND c.branchNo = ? AND c.typename = ? "+
							" Group by c.number";
	     
			         query1 =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`monthlycharges`,"+
				             "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
					         " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
							 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
							 " FROM consumption_report_details c "+  
							 " INNER JOIN branch_master s ON c.branchid = s.id "+
							 " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no "+
							 " WHERE monthofpayment >=  ? "+
							 " AND monthofpayment <=  ? "+
							 " AND c.branchNo = ? AND c.typename = ? ";
	  }
	  else{
		  
		     query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`type`,`monthlycharges`,"+
		            "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
			        " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
					" Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
					" FROM consumption_report_details c "+  
					" INNER JOIN branch_master s ON c.branchid = s.id "+
					" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no "+
					" WHERE monthofpayment >=  ? "+
					" AND monthofpayment <=  ? "+
					" AND c.branchNo = ? "+
					" Group by c.number";

         query1 =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`monthlycharges`,"+
	             "`current_month_amt`,`empname`,s.b_name,mb.m_b_name,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) = 1 THEN c.current_month_amt ELSE 0 END ),2 )Amt_Jan,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =2 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Feb,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =3 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Mar,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =4 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Apr,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =5 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_May,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =6 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_June,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =7 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_July, "+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =8 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Aug,"+
		         " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =9 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Sep,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =10 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Oct,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =11 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_Nov,"+
				 " Round(SUM( CASE WHEN MONTH( c.monthofpayment ) =12 THEN c.current_month_amt ELSE 0 END ),2 ) Amt_dec"+
				 " FROM consumption_report_details c "+  
				 " INNER JOIN branch_master s ON c.branchid = s.id "+
				 " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no "+
				 " WHERE monthofpayment >=  ? "+
				 " AND monthofpayment <=  ? "+
				 " AND c.branchNo = ? ";
	  }
	   try{
		
		
					 preparedStatement = con.prepareStatement(query);
			    if(!type.equals("Select")){		 
					 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
					 preparedStatement.setInt(3, branchNo);
					 preparedStatement.setString(4, type);
			      }
			     else{
					 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
					 preparedStatement.setInt(3, branchNo);
			      }
					 
				     resultSet = preparedStatement.executeQuery();
				     
				     preparedStatement1 = con1.prepareStatement(query1);
			    if(!type.equals("Select")){		     
					 preparedStatement1.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement1.setDate(2, new java.sql.Date(endDate.getTime()));
					 preparedStatement1.setInt(3, branchNo);
					 preparedStatement1.setString(4, type);
			      }
			     else{
				     preparedStatement1.setDate(1, new java.sql.Date(startDate.getTime()));
				     preparedStatement1.setDate(2, new java.sql.Date(endDate.getTime()));
			 	     preparedStatement1.setInt(3, branchNo);
			      }
					 
				     resultSet1 = preparedStatement1.executeQuery();
				     
				        HSSFWorkbook xlsFile = new HSSFWorkbook(); // create a workbook
				        // CreationHelper helper = xlsFile.getCreationHelper();
				        Sheet sheet = xlsFile.createSheet("ConsumptionReport"); // add a sheet to your workbook
				        Row row = sheet.createRow((short)0);
								     
				        CellStyle style0 = xlsFile.createCellStyle();
				        style0.setFillForegroundColor(IndexedColors.WHITE.getIndex());
				        style0.setAlignment(style0.ALIGN_CENTER);
				        style0.setFillPattern(CellStyle.SOLID_FOREGROUND);
				        style0.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				        style0.setBorderTop(HSSFCellStyle.BORDER_THIN);
				        style0.setBorderRight(HSSFCellStyle.BORDER_THIN);
				        style0.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				        Font font0 = xlsFile.createFont();
			            font0.setColor(IndexedColors.BLACK.getIndex());
			            style0.setFont(font0);
			            
			            CellStyle style = xlsFile.createCellStyle();
				        style.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
				        style.setAlignment(style.ALIGN_CENTER);
				        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
				        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
				        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
				        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				        Font font = xlsFile.createFont();
			            font.setColor(IndexedColors.BLACK.getIndex());
			            style.setFont(font);
			            
			            CellStyle style1 = xlsFile.createCellStyle();
				        style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
				        //  style1.setAlignment(style1.ALIGN_CENTER);
				        style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
				        style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				        style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
				        style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
				        style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				        Font font1 = xlsFile.createFont();
			            font1.setColor(IndexedColors.BLUE.getIndex());
			            style1.setFont(font1);
			            
			            CellStyle style2 = xlsFile.createCellStyle();
				        style2.setFillForegroundColor(IndexedColors.WHITE.getIndex());
				        //style2.setAlignment(style2.ALIGN_CENTER);
				        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
				        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
				        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
				        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				        Font font2 = xlsFile.createFont();
			            font2.setColor(IndexedColors.RED.getIndex());
			            style2.setFont(font2);
			            
			            CellStyle style3 = xlsFile.createCellStyle();
				        style3.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
				        // style3.setAlignment(style3.ALIGN_CENTER);
				        style3.setFillPattern(CellStyle.SOLID_FOREGROUND);
				        style3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				        style3.setBorderTop(HSSFCellStyle.BORDER_THIN);
				        style3.setBorderRight(HSSFCellStyle.BORDER_THIN);
				        style3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				        Font font3 = xlsFile.createFont();
			            font3.setColor(IndexedColors.BLUE.getIndex());
			            style3.setFont(font3);
		        
					    Cell cell1 = row.createCell(0);
					    cell1.setCellValue("Branch");
					    cell1.setCellStyle(style);
					    
					    Cell cell2 = row.createCell(1);
					    cell2.setCellValue("Location");
					    cell2.setCellStyle(style);
					    
					    Cell cell2q = row.createCell(2);
					    cell2q.setCellValue("Type");
					    cell2q.setCellStyle(style);
		
					    Cell cell3 = row.createCell(3);
					    cell3.setCellValue("User Name");
					    cell3.setCellStyle(style);
					    
					    Cell cell11 = row.createCell(4);
					    cell11.setCellValue("Number");
					    cell11.setCellStyle(style);
					    
					    Cell cell21 = row.createCell(5);
					    cell21.setCellValue("Relationship Number");
					    cell21.setCellStyle(style);
		
					    Cell cell31 = row.createCell(6);
					    cell31.setCellValue("ISP Network Type");
					    cell31.setCellStyle(style);
					    
					    Cell cell111 = row.createCell(7);
					    cell111.setCellValue("Consumption Type");
					    cell111.setCellStyle(style);
					    
					    Cell cell211 = row.createCell(8);
					    cell211.setCellValue("Monthly Rental Charges+Tax");
					    cell211.setCellStyle(style);
		
					    Cell cell4 = row.createCell(9);
					    cell4.setCellValue("Jan");
					    cell4.setCellStyle(style);
					    
					    Cell cell5 = row.createCell(10);
					    cell5.setCellValue("Feb");
					    cell5.setCellStyle(style);
					    
					    Cell cell6 = row.createCell(11);
					    cell6.setCellValue("Mar");
					    cell6.setCellStyle(style);
					    
					    Cell cell7 = row.createCell(12);
					    cell7.setCellValue("Apr");
					    cell7.setCellStyle(style);
				     
					    Cell cell8 = row.createCell(13);
					    cell8.setCellValue("May");
					    cell8.setCellStyle(style);
		
					    Cell cell9 = row.createCell(14);
					    cell9.setCellValue("June");
					    cell9.setCellStyle(style);
					    
					    Cell cell10 = row.createCell(15);
					    cell10.setCellValue("July");
					    cell10.setCellStyle(style);
					    
					    Cell cell33 = row.createCell(16);
					    cell33.setCellValue("Aug");
					    cell33.setCellStyle(style);
					    			    
					    Cell cell12 = row.createCell(17);
					    cell12.setCellValue("Sep");
					    cell12.setCellStyle(style);
					    
					    Cell cell13 = row.createCell(18);
					    cell13.setCellValue("Oct");
					    cell13.setCellStyle(style);
					    
					    Cell cell14 = row.createCell(19);
					    cell14.setCellValue("Nov");
					    cell14.setCellStyle(style);
					    
					    Cell cell15 = row.createCell(20);
					    cell15.setCellValue("Dec");
					    cell15.setCellStyle(style);
					    
					    Cell cell16 = row.createCell(21);
					    cell16.setCellValue("Total");
					    cell16.setCellStyle(style);
				    
		  int i =1;
		  while(resultSet.next()){
			  	
			    String amt_Jan = resultSet.getString("amt_Jan");   if(amt_Jan == null){amt_Jan=""+0;}   float  t1 = Float.parseFloat(amt_Jan);	 
	      	    String amt_Feb = resultSet.getString("amt_Feb");   if(amt_Feb == null){amt_Feb=""+0;}   float  t2 = Float.parseFloat(amt_Feb);   
	      	    String amt_Mar = resultSet.getString("amt_Mar");   if(amt_Mar == null){amt_Mar=""+0;}   float  t3 = Float.parseFloat(amt_Mar);	
	      	    String amt_Apr = resultSet.getString("amt_Apr");   if(amt_Apr == null){amt_Apr=""+0;}   float  t4 = Float.parseFloat(amt_Apr);   
	      	    String amt_May = resultSet.getString("amt_May");   if(amt_May == null){amt_May=""+0;}   float  t5 = Float.parseFloat(amt_May);	           
	      	    String amt_June = resultSet.getString("amt_June"); if(amt_June == null){amt_June=""+0;} float  t6 = Float.parseFloat(amt_June);     
	      	    String amt_July = resultSet.getString("amt_July"); if(amt_July == null){amt_July=""+0;} float  t7 = Float.parseFloat(amt_July);     
	      	    String amt_Aug = resultSet.getString("amt_Aug");   if(amt_Aug == null){amt_Aug=""+0;}   float  t8 = Float.parseFloat(amt_Aug);	           
	      	    String amt_Sep = resultSet.getString("amt_Sep");   if(amt_Sep == null){amt_Sep=""+0;}   float  t9 = Float.parseFloat(amt_Sep);      
	      	    String amt_Oct = resultSet.getString("amt_Oct");   if(amt_Oct == null){amt_Oct=""+0;}   float  t10 = Float.parseFloat(amt_Oct);    
	      	    String amt_Nov = resultSet.getString("amt_Nov");   if(amt_Nov == null){amt_Nov=""+0;}   float  t11 = Float.parseFloat(amt_Nov);       
	      	    String amt_Dec = resultSet.getString("amt_Dec");   if(amt_Dec == null){amt_Dec=""+0;}   float  t12 = Float.parseFloat(amt_Dec);              
    	     
			       	    total=t1+t2+t3+t4+t5+t6+t7+t8+t9+t10+t11+t12;
			       	    String total1=nf.format(total);
       	    
				        row = sheet.createRow((short)i);
				        branch=resultSet.getString("m_b_name");
				   
				        Cell cell24 = row.createCell(0);
					    cell24.setCellValue(resultSet.getString("m_b_name"));
					    cell24.setCellStyle(style0);
					    
					    Cell cell25q = row.createCell(1);
					    cell25q.setCellValue(resultSet.getString("b_name"));
					    cell25q.setCellStyle(style0);
					    
					    Cell cell25 = row.createCell(2);
					    cell25.setCellValue(resultSet.getString("type"));
					    cell25.setCellStyle(style0);
					    
					    Cell cell26 = row.createCell(3);
					    cell26.setCellValue(resultSet.getString("empname"));
					    cell26.setCellStyle(style0);
					    
					    Cell cell27 = row.createCell(4);
					    cell27.setCellValue(resultSet.getString("number"));
					    cell27.setCellStyle(style0);
				     
					    Cell cell28 = row.createCell(5);
					    cell28.setCellValue(resultSet.getString("relationnumber"));
					    cell28.setCellStyle(style0);

					    Cell cell29 = row.createCell(6);
					    cell29.setCellValue(resultSet.getString("isptype"));
					    cell29.setCellStyle(style0);
					    
					    Cell cell210 = row.createCell(7);
					    cell210.setCellValue(resultSet.getString("typename"));
					    cell210.setCellStyle(style0);
					    
					    Cell cell1211 = row.createCell(8);
					    cell1211.setCellValue(resultSet.getString("monthlycharges"));
					    cell1211.setCellStyle(style0);
					   
	                    Cell cell124 = row.createCell(9);
					    cell124.setCellValue(amt_Jan);
					    cell124.setCellStyle(style0);
					    
					    Cell cell125 = row.createCell(10);
					    cell125.setCellValue(amt_Feb);
					    cell125.setCellStyle(style0);
					    
					    Cell cell126 = row.createCell(11);
					    cell126.setCellValue(amt_Mar);
					    cell126.setCellStyle(style0);
					    
					    Cell cell217 = row.createCell(12);
					    cell217.setCellValue(amt_Apr);
					    cell217.setCellStyle(style0);
				     
					    Cell cell218 = row.createCell(13);
					    cell218.setCellValue(amt_May);
					    cell218.setCellStyle(style0);

					    Cell cell219 = row.createCell(14);
					    cell219.setCellValue(amt_June);
					    cell219.setCellStyle(style0);
					    
					    Cell cell2110 = row.createCell(15);
					    cell2110.setCellValue(amt_July);
					    cell2110.setCellStyle(style0);
					    
					    Cell cell2111 = row.createCell(16);
					    cell2111.setCellValue(amt_Aug);
					    cell2111.setCellStyle(style0);
					    			    
					    Cell cell212 = row.createCell(17);
					    cell212.setCellValue(amt_Sep);
					    cell212.setCellStyle(style0);
					    
					    Cell cell213 = row.createCell(18);
					    cell213.setCellValue(amt_Oct);
					    cell213.setCellStyle(style0);
					    
					    Cell cell214 = row.createCell(19);
					    cell214.setCellValue(amt_Nov);
					    cell214.setCellStyle(style0);
					    
					    Cell cell215 = row.createCell(20);
					    cell215.setCellValue(amt_Dec);
					    cell215.setCellStyle(style0);
	                 
	                    Cell cell115 = row.createCell(21);
	 			        cell115.setCellValue(total1);
	 			        cell115.setCellStyle(style1);
             i++;
		}
		  
		  while(resultSet1.next()){
			  	
			    String amt_Jan = resultSet1.getString("amt_Jan");   if(amt_Jan == null){amt_Jan=""+0;}   float  t1 = Float.parseFloat(amt_Jan);	 
	      	    String amt_Feb = resultSet1.getString("amt_Feb");   if(amt_Feb == null){amt_Feb=""+0;}   float  t2 = Float.parseFloat(amt_Feb);   
	      	    String amt_Mar = resultSet1.getString("amt_Mar");   if(amt_Mar == null){amt_Mar=""+0;}   float  t3 = Float.parseFloat(amt_Mar);	
	      	    String amt_Apr = resultSet1.getString("amt_Apr");   if(amt_Apr == null){amt_Apr=""+0;}   float  t4 = Float.parseFloat(amt_Apr);   
	      	    String amt_May = resultSet1.getString("amt_May");   if(amt_May == null){amt_May=""+0;}   float  t5 = Float.parseFloat(amt_May);	           
	      	    String amt_June = resultSet1.getString("amt_June"); if(amt_June == null){amt_June=""+0;} float  t6 = Float.parseFloat(amt_June);     
	      	    String amt_July = resultSet1.getString("amt_July"); if(amt_July == null){amt_July=""+0;} float  t7 = Float.parseFloat(amt_July);     
	      	    String amt_Aug = resultSet1.getString("amt_Aug");   if(amt_Aug == null){amt_Aug=""+0;}   float  t8 = Float.parseFloat(amt_Aug);	           
	      	    String amt_Sep = resultSet1.getString("amt_Sep");   if(amt_Sep == null){amt_Sep=""+0;}   float  t9 = Float.parseFloat(amt_Sep);      
	      	    String amt_Oct = resultSet1.getString("amt_Oct");   if(amt_Oct == null){amt_Oct=""+0;}   float  t10 = Float.parseFloat(amt_Oct);    
	      	    String amt_Nov = resultSet1.getString("amt_Nov");   if(amt_Nov == null){amt_Nov=""+0;}   float  t11 = Float.parseFloat(amt_Nov);       
	      	    String amt_Dec = resultSet1.getString("amt_Dec");   if(amt_Dec == null){amt_Dec=""+0;}   float  t12 = Float.parseFloat(amt_Dec);              
  	     
	       	        total=t1+t2+t3+t4+t5+t6+t7+t8+t9+t10+t11+t12;
	       	        String total1=nf.format(total);
     	    
				    row = sheet.createRow((short)i);
              
				    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 8));
				    
				    Cell cell224 = row.createCell(0);
				    cell224.setCellValue("Grand Total");
				    cell224.setCellStyle(style);
				    
				    
				    Cell cell24 = row.createCell(9);
				    cell24.setCellValue(amt_Jan);
				    cell24.setCellStyle(style3);
				    
				    Cell cell25 = row.createCell(10);
				    cell25.setCellValue(amt_Feb);
				    cell25.setCellStyle(style3);
				    
				    Cell cell26 = row.createCell(11);
				    cell26.setCellValue(amt_Mar);
				    cell26.setCellStyle(style3);
				    
				    Cell cell27 = row.createCell(12);
				    cell27.setCellValue(amt_Apr);
				    cell27.setCellStyle(style3);
			     
				    Cell cell28 = row.createCell(13);
				    cell28.setCellValue(amt_May);
				    cell28.setCellStyle(style3);

				    Cell cell29 = row.createCell(14);
				    cell29.setCellValue(amt_June);
				    cell29.setCellStyle(style3);
				    
				    Cell cell210 = row.createCell(15);
				    cell210.setCellValue(amt_July);
				    cell210.setCellStyle(style3);
				    
				    Cell cell2111 = row.createCell(16);
				    cell2111.setCellValue(amt_Aug);
				    cell2111.setCellStyle(style3);
				    			    
				    Cell cell212 = row.createCell(17);
				    cell212.setCellValue(amt_Sep);
				    cell212.setCellStyle(style3);
				    
				    Cell cell213 = row.createCell(18);
				    cell213.setCellValue(amt_Oct);
				    cell213.setCellStyle(style3);
				    
				    Cell cell214 = row.createCell(19);
				    cell214.setCellValue(amt_Nov);
				    cell214.setCellStyle(style3);
				    
				    Cell cell215 = row.createCell(20);
				    cell215.setCellValue(amt_Dec);
				    cell215.setCellStyle(style3);
				    
				    Cell cell216 = row.createCell(21);
				    cell216.setCellValue(total1);
		 		    cell216.setCellStyle(style2);
		      }
				    FileOutputStream fos = new FileOutputStream("temp.xls");
				    xlsFile.write(fos);
				    fos.close();
				  
				    // Switch to using a `FileDataSource` (instead of ByteArrayDataSource)
				    DataSource fds = new FileDataSource("temp.xls");
		  				   
				    String sub="Consumption Report for Branch: "+branch+"  From date: "+new java.sql.Date(startDate.getTime())+" To  To date: "+new java.sql.Date(endDate.getTime());
				    String body="";
				    result=new SendExcelFileOnEmail().sendEmail(from ,to ,fds ,sub ,body,"ConsumptionReport.xls");		
					
	               }
		  		      catch (Exception e) {
		               e.printStackTrace();

                 }
                finally {
	                 con.close();
	            }
          return result;
  }*/
				 	
}
	

