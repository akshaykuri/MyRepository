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
import CON2.Catridge;

//@SuppressWarnings("deprecation")
public class PrintData {

	public static List<Catridge> viewModelWiseCatridge(int branchNo, Date startDate,Date endDate) throws SQLException {
		
		float total=0;
		DecimalFormat nf = new DecimalFormat("#.##");
        nf.setMaximumFractionDigits(2);
        nf.setMinimumFractionDigits(2);
        
         Connection con = null;
   	     Connection2 dbConn = new Connection2();
   	     con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 
		 List<Catridge> catridges = new ArrayList<Catridge>();
		
		 String query = null;
		 query = " SELECT DISTINCT c.catridge_model,s.b_name,mb.m_b_name,c.printer_name,"+
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
		
		try {
			
			 preparedStatement = con.prepareStatement(query);
	 
			 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
		     resultSet = preparedStatement.executeQuery();
			
			 while(resultSet.next())
			 { 
				    Catridge catridge = new Catridge();
				 
				    catridge.setBranchLocation(resultSet.getString("b_name"));
				    catridge.setBranchName(resultSet.getString("m_b_name"));
				    catridge.setPrinterName(resultSet.getString("printer_name"));
				    catridge.setCatridgeModel(resultSet.getString("catridge_model"));
				    catridge.setBranchNo(branchNo);
				    	
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
               	    
	                    catridge.setAmtJan(amt_Jan);
					    catridge.setAmtFeb(amt_Feb);
					    catridge.setAmtMar(amt_Mar);
					    catridge.setAmtApr(amt_Apr);
					    catridge.setAmtMay(amt_May);
					    catridge.setAmtJune(amt_June);
					    catridge.setAmtJuly(amt_July);
					    catridge.setAmtAug(amt_Aug);
					    catridge.setAmtSep(amt_Sep);
					    catridge.setAmtOct(amt_Oct);
					    catridge.setAmtNov(amt_Nov);
					    catridge.setAmtDec(amt_Dec);
					    catridge.setModelWiseTotal(total1);
					
				    catridges.add(catridge);
          }
			 
		 } catch (Exception e) {
					e.printStackTrace();

			 }
			 finally {
				 con.close();
				}
		return catridges;
	}

	public static List<Catridge> viewMonthWiseCatridge(int branchNo, Date StartDate,Date endDate) throws SQLException {

		float total=0;
		DecimalFormat nf = new DecimalFormat("#.##");
        nf.setMaximumFractionDigits(2);
        nf.setMinimumFractionDigits(2);
        
		List<Catridge> catridges = new ArrayList<Catridge>();

		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 
		String query = " SELECT DISTINCT "+
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
		
		try {
			
			 preparedStatement = con.prepareStatement(query);
		 
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
		
			 resultSet = preparedStatement.executeQuery();
			 while(resultSet.next())
			 {
				    Catridge catridge = new Catridge();
			
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
              	  
               	    catridge.setAmtJan(amt_Jan);
				    catridge.setAmtFeb(amt_Feb);
				    catridge.setAmtMar(amt_Mar);
				    catridge.setAmtApr(amt_Apr);
				    catridge.setAmtMay(amt_May);
				    catridge.setAmtJune(amt_June);
				    catridge.setAmtJuly(amt_July);
				    catridge.setAmtAug(amt_Aug);
				    catridge.setAmtSep(amt_Sep);
				    catridge.setAmtOct(amt_Oct);
				    catridge.setAmtNov(amt_Nov);
				    catridge.setAmtDec(amt_Dec);
					catridge.setTotalAmt(total1);
					    
				    catridges.add(catridge);
      }
			 
		} catch (Exception e) {
					e.printStackTrace();

			 }
			 finally {
				 con.close();
				}
		return catridges;
	}
	public static List<Catridge> viewmonthwise(int branchNo, Date StartDate,Date endDate) throws SQLException {

		 float total=0;
		 DecimalFormat nf = new DecimalFormat("#.##");
         nf.setMaximumFractionDigits(2);
         nf.setMinimumFractionDigits(2);
        
		 List<Catridge> catridges = new ArrayList<Catridge>();

		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 
		 String query = " SELECT *,s.b_name,mb.m_b_name FROM `catridge_details` c"+
                        " INNER JOIN branch_master s ON c.branch_id = s.id"+
	                    " INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no"+
	                    " WHERE month_of_payment >=  ?  AND month_of_payment <=  ?  AND c.branch_no = ? order by catridge_id";
		try {
			
			 preparedStatement = con.prepareStatement(query);
		 
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
		
			 resultSet = preparedStatement.executeQuery();
			 while(resultSet.next())
			     {
				           Catridge catridge = new Catridge();
			
				           catridge.setCatridgeModel(resultSet.getString("catridge_model"));
				           catridge.setBranchLocation(resultSet.getString("b_name"));
				           catridge.setBranchName(resultSet.getString("m_b_name"));
				           catridge.setQuantity(resultSet.getInt("quantity"));
				           catridge.setCost(resultSet.getFloat("cost"));
				           catridge.setAmount(resultSet.getFloat("amount"));
				           catridge.setVendorName(resultSet.getString("vendor_name"));
				           catridge.setPoNumber(resultSet.getString("po_number"));
				           catridge.setInvoiceno(resultSet.getString("invoiceno"));
				           catridge.setInoviceAmt(resultSet.getFloat("invoice_amt"));
				           catridge.setInvoiceDate(resultSet.getDate("invoice_date"));
				           catridge.setChequeno(resultSet.getString("chequeno"));
				           catridge.setChequeAmt(resultSet.getFloat("chequeAmt"));
				           catridge.setChequeDate(resultSet.getDate("cheque_date"));
				           catridge.setMonthOfPayment(resultSet.getDate("month_of_payment"));
				           
					    
				    catridges.add(catridge);
               }
			 
		     } catch (Exception e) {
					e.printStackTrace();
			 }
			 finally {
				 con.close();
				}
		return catridges;
	}
	
	public static List<LotusNewins> viewmonthwiseLotusUsed(int branchNo, Date StartDate,Date endDate) throws SQLException {

		 float total=0;
		 DecimalFormat nf = new DecimalFormat("#.##");
         nf.setMaximumFractionDigits(2);
         nf.setMinimumFractionDigits(2);
       
		 List<LotusNewins> lotusnewinss = new ArrayList<LotusNewins>();

		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
       
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 String query =null;
	if(branchNo == 0){
		        query = " SELECT *,mb.m_b_name,u.full_name FROM `lotus_used` c"+ 
				        " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
				        " INNER JOIN leavemanagement.user u ON u.emp_id = c.initiator"+
				        " WHERE month >=  ?  AND month <=  ? order by c.month";
	}
	else{
		         query = " SELECT *,mb.m_b_name,u.full_name FROM `lotus_used` c"+ 
				         " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
				         " INNER JOIN leavemanagement.user u ON u.emp_id = c.initiator"+
				         " WHERE month >=  ?  AND month <=  ?  AND c.branchNo = ? order by c.month";
	     }
		try {
			
			 preparedStatement = con.prepareStatement(query);
			 if(branchNo == 0){
			     preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			     preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 }
			 else{
				 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			     preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
				 preparedStatement.setInt(3, branchNo); 
			 }
			 
		
			 resultSet = preparedStatement.executeQuery();
			 while(resultSet.next())
			     {
				           LotusNewins lotusnewins = new LotusNewins();
			
				           lotusnewins.setMonth(resultSet.getDate("month"));
				           lotusnewins.setBranchName(resultSet.getString("m_b_name"));
				           lotusnewins.setTotal_used(resultSet.getInt("total"));
				           lotusnewins.setEmpName(resultSet.getString("full_name"));
				          
					       lotusnewinss.add(lotusnewins);
              }
			 
		     } catch (Exception e) {
					e.printStackTrace();
			 }
			 finally {
				 con.close();
				}
		return lotusnewinss;
	}
	
	public static List<LotusNewins> viewmonthwiseNewinsUsed(int branchNo, Date StartDate,Date endDate) throws SQLException {

		 float total=0;
		 DecimalFormat nf = new DecimalFormat("#.##");
        nf.setMaximumFractionDigits(2);
        nf.setMinimumFractionDigits(2);
      
		 List<LotusNewins> lotusnewinss = new ArrayList<LotusNewins>();

		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
      
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 String query =null;
			 
			 
	if(branchNo == 0){	 
		         query = " SELECT *,mb.m_b_name,u.full_name FROM `newins_used` c"+
				         " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
				         " INNER JOIN leavemanagement.user u ON u.emp_id = c.initiator"+
				         " WHERE month >=  ?  AND month <=  ?  order by c.month";
	}
	else{
		     query = " SELECT *,mb.m_b_name,u.full_name FROM `newins_used` c"+
			         " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
			         " INNER JOIN leavemanagement.user u ON u.emp_id = c.initiator"+
			         " WHERE month >=  ?  AND month <=  ?  AND c.branchNo = ? order by c.month";
	}
		  
		  try {
			
			 preparedStatement = con.prepareStatement(query);
		if(branchNo == 0){	
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
		  }
		 else{
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
		 }
			 resultSet = preparedStatement.executeQuery();
			 while(resultSet.next())
			     {
				           LotusNewins lotusnewins = new LotusNewins();
				   
				           lotusnewins.setMonth(resultSet.getDate("month"));
				           lotusnewins.setBranchName(resultSet.getString("m_b_name"));
				           lotusnewins.setTotal_used(resultSet.getInt("total"));
				           lotusnewins.setEmpName(resultSet.getString("full_name"));
				          
					       lotusnewinss.add(lotusnewins);
             }
			 
		     } catch (Exception e) {
					e.printStackTrace();
			 }
			 finally {
				 con.close();
				}
		return lotusnewinss;
	}
	
	public static List<LotusNewins> viewmonthwiseSapUsed(int branchNo, Date StartDate,Date endDate) throws SQLException {

		 float total=0;
		 DecimalFormat nf = new DecimalFormat("#.##");
       nf.setMaximumFractionDigits(2);
       nf.setMinimumFractionDigits(2);
     
		 List<LotusNewins> lotusnewinss = new ArrayList<LotusNewins>();

		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
     
        PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
		 String query =null;
			 
			 
	if(branchNo == 0){	 
		         query = " SELECT *,mb.m_b_name,u.full_name FROM `sap_used` c"+
				         " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
				         " INNER JOIN leavemanagement.user u ON u.emp_id = c.initiator"+
				         " WHERE month >=  ?  AND month <=  ?  order by c.month";
	}
	else{
		     query = " SELECT *,mb.m_b_name,u.full_name FROM `sap_used` c"+
			         " INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no"+
			         " INNER JOIN leavemanagement.user u ON u.emp_id = c.initiator"+
			         " WHERE month >=  ?  AND month <=  ?  AND c.branchNo = ? order by c.month";
	}
		  
		  try {
			
			 preparedStatement = con.prepareStatement(query);
		if(branchNo == 0){	
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
		  }
		 else{
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
		 }
			 resultSet = preparedStatement.executeQuery();
			 while(resultSet.next())
			     {
				           LotusNewins lotusnewins = new LotusNewins();
				   
				           lotusnewins.setMonth(resultSet.getDate("month"));
				           lotusnewins.setBranchName(resultSet.getString("m_b_name"));
				           lotusnewins.setTotal_used(resultSet.getInt("total"));
				           lotusnewins.setEmpName(resultSet.getString("full_name"));
				          
					       lotusnewinss.add(lotusnewins);
            }
			 
		     } catch (Exception e) {
					e.printStackTrace();
			 }
			 finally {
				 con.close();
				}
		return lotusnewinss;
	}
	
	
public static List<IspOutage> viewIspOutage(String circuitid,Date startDate,Date endDate) throws SQLException {
		
		 List<IspOutage> ispOutages = new ArrayList<IspOutage>();
		
		 Connection con = null;
		 Connection2 dbConn = new Connection2();
		 con = dbConn.getConnection2();
        
         PreparedStatement preparedStatement = null;
		 ResultSet resultSet = null;
	     String query =null;
	     
	     if(circuitid.equals("All")){
	    	 query = " SELECT *,u.full_name,sb.b_name,mb.m_b_no,sb.b_no,mb.m_b_name FROM `circuitid_details` c " +
					 " INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id " +
					 " INNER JOIN branch_master sb ON sb.id=c.branch_id " +
					 " INNER JOIN branch_master_main mb ON mb.m_b_no=sb.b_no " +
					 " where " +
					 " c.callLoggeddate >=? " +
					 " And c.callLoggeddate <=? " + 
					 " And c.status='Completed'" + 
					 " Order by c.branchNo ";
	     }
	     else{
			 query = "SELECT *,u.full_name,sb.b_name,mb.m_b_no,sb.b_no,mb.m_b_name FROM `circuitid_details` c " +
							"INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id " +
							"INNER JOIN branch_master sb ON sb.id=c.branch_id " +
							"INNER JOIN branch_master_main mb ON mb.m_b_no=sb.b_no " +
							"where " +
							" c.callLoggeddate >=? " +
							" And c.callLoggeddate <=? " +
							" And c.circuit_Id=? " +
							" And c.status='Completed'" +
						   //"And c.linktype_id=?" +
							" Order by c.circuit_Id ";
			 
	     }
	     
		try{
			 preparedStatement = con.prepareStatement(query);
			
			 if(circuitid.equals("All")){
				 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
				 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime())); 
			 }
			 else{
				 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
				 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
				 preparedStatement.setString(3, circuitid);
			 }
			 
		
		     resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()){
				
				IspOutage ispOutage = new IspOutage();
				ispOutage.setIspOutageId(resultSet.getString("ispoutageno"));
				ispOutage.setLinkType(resultSet.getString("linktype_id"));
				ispOutage.setCircuitId(resultSet.getString("circuit_Id"));
				ispOutage.setIsp_name(resultSet.getString("isp_name"));
				ispOutage.setTroubleTicketNo(resultSet.getString("ttno"));
				ispOutage.setConnectionDowndate(resultSet.getString("connectionDowndate"));
				ispOutage.setLinkdowntime(resultSet.getString("linkdowntime"));
                ispOutage.setConRestoreddate(resultSet.getString("conRestoreddate"));
                ispOutage.setLinkrestoredtime(resultSet.getString("linkrestoredtime"));
                ispOutage.setOutageReport(resultSet.getString("outagereport"));
                ispOutage.setCallLoggeddate(resultSet.getString("callLoggeddate"));
                ispOutage.setCalllogtime(resultSet.getString("calllogtime"));
                ispOutage.setReason(resultSet.getString("reason"));
                ispOutage.setRemarks(resultSet.getString("Remark"));
				ispOutage.setBranchId(resultSet.getInt("branch_id"));
				ispOutage.setBranchNo(resultSet.getInt("m_b_no"));
                ispOutage.setBranchLocation(resultSet.getString("b_name"));
                ispOutage.setBranchName(resultSet.getString("m_b_name"));
               
                ispOutages.add(ispOutage);
                
			}
	   }catch (Exception e) {
			e.printStackTrace();

	 }
	 finally {
		 con.close();
		}
	return ispOutages;
	}

public static List<PhotoCopier> viewphotoCopier1(int branchno, Date startDate, Date endDate) throws SQLException {
	
	 List<PhotoCopier> photoCopier = new ArrayList<PhotoCopier>();
	
	 Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	
     String query =null;
 
		 query = "SELECT *,mb.m_b_name,b.b_name,MONTH(month_of_payment) as month FROM `photocopier_details` a "+
		         "INNER JOIN branch_master b ON b.id=a.branch_id "+
		         "INNER JOIN branch_master_main mb ON mb.m_b_no=a.branch_no "+
		         "where branch_no=? AND month_of_payment >= ? AND month_of_payment <=?  order by a.month_of_payment";
	try{
		    preparedStatement = con.prepareStatement(query);
		 
			preparedStatement.setInt(1, branchno);
			preparedStatement.setDate(2, new java.sql.Date(startDate.getTime()));
			preparedStatement.setDate(3, new java.sql.Date(endDate.getTime()));
		
	        resultSet = preparedStatement.executeQuery();
		    while(resultSet.next()){ 
			
			PhotoCopier photoCopier1 = new PhotoCopier();
			
			photoCopier1.setMonth(resultSet.getInt("month"));
			photoCopier1.setPh_id(resultSet.getInt("ph_id"));
			photoCopier1.setBrand(resultSet.getString("brand"));
			photoCopier1.setModelno(resultSet.getString("modelno"));
			photoCopier1.setSerialno(resultSet.getString("serialno"));
			photoCopier1.setVendorname(resultSet.getString("vendorname"));
			photoCopier1.setVendortype(resultSet.getString("vendortype"));
			photoCopier1.setMachinetype(resultSet.getString("machinetype"));
			photoCopier1.setRentamt(resultSet.getFloat("rentamt"));
			
			photoCopier1.setRcgst_per(resultSet.getFloat("rcgst_per"));
			photoCopier1.setRcgst_amt(resultSet.getFloat("rcgst_amt"));
			photoCopier1.setRsgst_per(resultSet.getFloat("rsgst_per"));
			photoCopier1.setRsgst_amt(resultSet.getFloat("rsgst_amt"));
			
			photoCopier1.setRinvoice_no(resultSet.getString("rinvoice_no"));
			photoCopier1.setRinvoice_date(resultSet.getString("rinvoice_date"));
			photoCopier1.setRinvoice_Amt(resultSet.getFloat("rinvoice_Amt"));
			photoCopier1.setRfilepath(resultSet.getString("rinvoice_file"));
			
			String filepath1=resultSet.getString("rinvoice_file");
			String filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
			photoCopier1.setRfilename(filename);
			
			//photoCopier1.setTaxamt(resultSet.getFloat("taxamt"));
			photoCopier1.setTotal_amt(resultSet.getFloat("total_amt"));
			photoCopier1.setMonth_of_payment(resultSet.getDate("month_of_payment"));
			photoCopier1.setClosingdate(resultSet.getDate("closingdate"));
			photoCopier1.setOpeningdate(resultSet.getDate("openingdate"));
			
			photoCopier1.setChequeNo(resultSet.getString("cheque_no"));
			photoCopier1.setChequeAmt(resultSet.getFloat("chequeAmt"));
			photoCopier1.setChequeDate(resultSet.getString("cheque_date"));
			
			photoCopier1.setCreateddate(resultSet.getString("createddate"));
			photoCopier1.setInstalleddate(resultSet.getString("installeddate"));
			photoCopier1.setAgreementdate(resultSet.getString("agreementdate"));
			photoCopier1.setAgreementsdate(resultSet.getString("agreementsdate"));
			photoCopier1.setAgreementedate(resultSet.getString("agreementedate"));
			
			photoCopier1.setBranchLocation(resultSet.getString("b_name"));
			photoCopier1.setBranchName(resultSet.getString("m_b_name"));
           
            photoCopier.add(photoCopier1);           
		}
     }catch (Exception e) {
		e.printStackTrace();

     }
      finally {
	      con.close();
	  }
    return photoCopier;
   }
public static List<PhotoCopier> viewphotoCopier2() throws SQLException {
	List<PhotoCopier> photoCopier = new ArrayList<PhotoCopier>();
	
	 Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	 
	
    String query =null;
 
		 query = "SELECT * FROM `photocopy_summary` WHERE 1";
	try{
		
		preparedStatement = con.prepareStatement(query);
	    resultSet = preparedStatement.executeQuery();
		while(resultSet.next()){
			
			PhotoCopier photoCopier1 = new PhotoCopier();
			
			photoCopier1.setPh_id(resultSet.getInt("ph_id"));
			photoCopier1.setPhoto_type(resultSet.getString("photo_type"));
			photoCopier1.setSerialno(resultSet.getString("serial_no"));
			photoCopier1.setClosing_balance(resultSet.getInt("closing_balance"));
			photoCopier1.setOpening_balance(resultSet.getInt("opening_balance"));
			photoCopier1.setTotal_copies(resultSet.getInt("total_copies"));
			photoCopier1.setFree_copies(resultSet.getInt("free_copies"));
			photoCopier1.setExtra_copies(resultSet.getInt("extra_copies"));
			
			photoCopier1.setPer_copy_cost(resultSet.getFloat("per_copy_cost"));
			photoCopier1.setCharged_amt(resultSet.getFloat("charged_amt"));
			
			photoCopier1.setCgst_per(resultSet.getFloat("cgst_per"));
			photoCopier1.setCgst_amt(resultSet.getFloat("cgst_amt"));
			photoCopier1.setSgst_per(resultSet.getFloat("sgst_per"));
			photoCopier1.setSgst_amt(resultSet.getFloat("sgst_amt"));
			
			photoCopier1.setInvoice_no(resultSet.getString("invoice_no"));
			photoCopier1.setInvoice_amt(resultSet.getFloat("invoice_amt"));
			photoCopier1.setInvoice_date(resultSet.getString("invoice_date"));
			photoCopier1.setFilepath(resultSet.getString("filepath"));
			
			String filepath1=resultSet.getString("filepath");
			String filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
			photoCopier1.setFilename(filename);
	         photoCopier.add(photoCopier1);
            
		}
     }catch (Exception e) {
		e.printStackTrace();
     }
      finally {
	      con.close();
	  }
    return photoCopier;
   }

public static List<PhotoCopier> viewsum(int branchno, Date startDate, Date endDate) throws SQLException {
	
	 List<PhotoCopier> photoCopier = new ArrayList<PhotoCopier>();
	
	 Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	 
     String query =null;
 
		 query = "SELECT MONTH(`month_of_payment`) as month,SUM(`rentamt`) as rent,"+
		         "SUM(`total_amt`) as totalamt  FROM `photocopier_details` a "+
		         "where branch_no=? AND month_of_payment >= ? AND month_of_payment <=? group by MONTH(`month_of_payment`)";
	try{
		    preparedStatement = con.prepareStatement(query);
		 
			preparedStatement.setInt(1, branchno);
			preparedStatement.setDate(2, new java.sql.Date(startDate.getTime()));
			preparedStatement.setDate(3, new java.sql.Date(endDate.getTime()));
		
		    resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
			
			PhotoCopier photoCopier1 = new PhotoCopier();
			
			photoCopier1.setMonth(resultSet.getInt("month"));
			photoCopier1.setRentamt(resultSet.getFloat("rent"));
			//photoCopier1.setTaxamt(resultSet.getFloat("tax"));
			photoCopier1.setTotal_amt(resultSet.getFloat("totalamt"));
           
            photoCopier.add(photoCopier1);
            
		}
     }catch (Exception e) {
		e.printStackTrace();

     }
      finally {
	      con.close();
	  }
    return photoCopier;
   }
public static List<Consumption> viewBranchWiseConsumptionReport(int branchNo, Date StartDate,Date endDate,String type) throws SQLException {

	float total=0;
	DecimalFormat nf = new DecimalFormat("#.##");
    nf.setMaximumFractionDigits(2);
    nf.setMinimumFractionDigits(2);
    
	List<Consumption> consumption = new ArrayList<Consumption>();

	 Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	 String query =null;
	 
	 if(type.equals("Select") && branchNo == 0 ){
	         query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`type`,`typename`,`monthlycharges`,"+
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
					" Group by c.number order by c.branchNo ";
	 }
	 else if(!type.equals("Select") && branchNo == 0 ){
         query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`type`,`typename`,`monthlycharges`,"+
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
				" AND c.typename = ? "+
				" Group by c.number order by c.branchNo";
     }
	 else if(!type.equals("Select") && branchNo != 0 ){
         query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`type`,`typename`,`monthlycharges`,"+
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
        }
	 
	 else{
		 query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`type`,`typename`,`monthlycharges`,"+
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
	 }
			
	try {
		
		 preparedStatement = con.prepareStatement(query);
	 if(type.equals("Select") && branchNo == 0 ){	
		     preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
		     preparedStatement.setDate(2,new java.sql.Date(endDate.getTime())); 
	  }
	  else if(!type.equals("Select") && branchNo == 0 ){
		     preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime())); 
			 preparedStatement.setString(3, type);
	  }
	  else if(!type.equals("Select") && branchNo != 0){  
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
			 preparedStatement.setString(4, type);
	   }
	  else{
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
	  }
		 resultSet = preparedStatement.executeQuery();
		 while(resultSet.next())
		 {
			    Consumption consumption1 = new Consumption();
		
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
          	  
          	    consumption1.setUserName(resultSet.getString("empname"));
	          	consumption1.setNumber(resultSet.getString("number"));
	          	consumption1.setRelationship_no(resultSet.getString("relationnumber"));
	          	consumption1.setIsptype(resultSet.getString("isptype"));
	          	consumption1.setContype(resultSet.getString("typename"));
	          	consumption1.setMonthlyAmtPaid(resultSet.getString("monthlycharges"));
	          	consumption1.setBranchLocation(resultSet.getString("b_name"));
	          	consumption1.setBranchName(resultSet.getString("m_b_name"));
	          	consumption1.setType(resultSet.getString("type"));
          	    consumption1.setAmtJan(amt_Jan);
	          	consumption1.setAmtFeb(amt_Feb);
	          	consumption1.setAmtMar(amt_Mar);
	          	consumption1.setAmtApr(amt_Apr);
	          	consumption1.setAmtMay(amt_May);
	          	consumption1.setAmtJune(amt_June);
	          	consumption1.setAmtJuly(amt_July);
	          	consumption1.setAmtAug(amt_Aug);
	          	consumption1.setAmtSep(amt_Sep);
	          	consumption1.setAmtOct(amt_Oct);
	          	consumption1.setAmtNov(amt_Nov);
	          	consumption1.setAmtDec(amt_Dec);
			    consumption1.setTotalAmt(total1);
				    
				consumption.add(consumption1);
  }
		 
	} catch (Exception e) {
				e.printStackTrace();

		 }
		 finally {
			 con.close();
			}
	return consumption;
}
public static List<Consumption> viewBranchWiseConsumptionReport1(int branchNo, Date StartDate,Date endDate,String type) throws SQLException {

	float total=0;
	DecimalFormat nf = new DecimalFormat("#.##");
    nf.setMaximumFractionDigits(2);
    nf.setMinimumFractionDigits(2);
    
	List<Consumption> consumption = new ArrayList<Consumption>();

	 Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	 String query =null;
	 
	 if(type.equals("Select") && branchNo == 0 ){	
	         query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`monthlycharges`,"+
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
					" order by c.branchNo ";
 }
	 else if(!type.equals("Select") && branchNo == 0 ){
     query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`monthlycharges`,"+
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
			" AND c.typename = ? order by c.branchNo ";
  }
 else if(!type.equals("Select") && branchNo != 0 ){  
     query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`monthlycharges`,"+
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
	         query =" SELECT DISTINCT `number`,`relationnumber`,`isptype`,`typename`,`monthlycharges`,"+
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
	try {
		
		 preparedStatement = con.prepareStatement(query);
		 
	 if(type.equals("Select") && branchNo == 0 ){	
			 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
	  }
	  else if(!type.equals("Select") && branchNo == 0 ){
		     preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime())); 
			 preparedStatement.setString(3, type);
	  }
	  else if(!type.equals("Select") && branchNo != 0){  
		     preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
			 preparedStatement.setString(4, type);
	   }
	  else{
		     preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
	  }
		 
		 resultSet = preparedStatement.executeQuery();
		 while(resultSet.next())
		 {
			 Consumption consumption1 = new Consumption();
		
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
          	  
          	    consumption1.setAmtJan(amt_Jan);
	          	consumption1.setAmtFeb(amt_Feb);
	          	consumption1.setAmtMar(amt_Mar);
	          	consumption1.setAmtApr(amt_Apr);
	          	consumption1.setAmtMay(amt_May);
	          	consumption1.setAmtJune(amt_June);
	          	consumption1.setAmtJuly(amt_July);
	          	consumption1.setAmtAug(amt_Aug);
	          	consumption1.setAmtSep(amt_Sep);
	          	consumption1.setAmtOct(amt_Oct);
	          	consumption1.setAmtNov(amt_Nov);
	          	consumption1.setAmtDec(amt_Dec);
			    consumption1.setTotalAmt(total1);
				    
				consumption.add(consumption1);
  }
		 
	} catch (Exception e) {
				e.printStackTrace();

		 }
		 finally {
			 con.close();
			}
	return consumption;
}
public static List<Consumption> viewBranchWiseConsumptionReport2(int branchNo, Date StartDate,Date endDate) throws SQLException {

	DecimalFormat nf = new DecimalFormat("#.##");
    nf.setMaximumFractionDigits(2);
    nf.setMinimumFractionDigits(2);
    
	List<Consumption> consumption = new ArrayList<Consumption>();

	 Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	 
	  String query =" SELECT c.`id` as id1, `initiatorId`, `empno`,`type`, `empname`, `branchid`, `branchNo`, `number`, `relationnumber`, "+
                    "`isptype`, `typename`, `monthlycharges`, `billfromdate`, `billtodate`, `monthofpayment`, `number_status`, "+
		            "`invoiceno`, `invoiceamt`, `invoicedate`, `chequenumber`, `chequeamt`, `chequedate`, `current_month_amt`,"+
		            "`filepath`,s.b_name,mb.m_b_name "+
					" FROM consumption_report_details c "+  
					" INNER JOIN branch_master s ON c.branchid = s.id "+
					" INNER JOIN branch_master_main mb ON c.branchNo = mb.m_b_no "+
					" WHERE monthofpayment >=  ?"+
					" AND monthofpayment <=  ?"+
					" AND c.branchNo = ? ";
			
	try {
		
		 preparedStatement = con.prepareStatement(query);
	 
		 preparedStatement.setDate(1, new java.sql.Date(StartDate.getTime() ));
		 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
		 preparedStatement.setInt(3, branchNo);
	
		 resultSet = preparedStatement.executeQuery();
		 while(resultSet.next())
		 {
			    Consumption consumption1 = new Consumption();
          	  
          	    consumption1.setUserName(resultSet.getString("empname"));
	          	consumption1.setNumber(resultSet.getString("number"));
	          	consumption1.setRelationship_no(resultSet.getString("relationnumber"));
	          	consumption1.setIsptype(resultSet.getString("isptype"));
	          	consumption1.setContype(resultSet.getString("typename"));
	          	consumption1.setMonthlyAmtPaid(resultSet.getString("monthlycharges"));
	          	consumption1.setBranchLocation(resultSet.getString("b_name"));
	          	consumption1.setBranchName(resultSet.getString("m_b_name"));
	          	consumption1.setBillfromdate(resultSet.getString("billfromdate"));
	          	consumption1.setBilltodate(resultSet.getString("billtodate"));
	          	consumption1.setMonthOfPayment(resultSet.getString("monthofpayment"));
	          	consumption1.setInvoiceno(resultSet.getString("invoiceno"));
	          	consumption1.setInvoiceamt(resultSet.getString("invoiceamt"));
	          	consumption1.setInvoicedate(resultSet.getString("invoicedate"));
	          	consumption1.setChequenumber(resultSet.getString("chequenumber"));
	          	consumption1.setChequeamt(resultSet.getString("chequeamt"));
	          	consumption1.setChequedate(resultSet.getString("chequedate"));
	          	consumption1.setCurrent_month_amt(resultSet.getString("current_month_amt"));
	          	consumption1.setStatus(resultSet.getString("number_status"));
	          	consumption1.setType(resultSet.getString("type"));
	          	
	          	
				consumption.add(consumption1);
  }
		 
	} catch (Exception e) {
				e.printStackTrace();

		 }
		 finally {
			 con.close();
			}
	return consumption;
}

public static int viewIspOutage1(String circuitid,Date startDate,Date endDate,String to,String from) throws SQLException {
	
	int result = 0;
	
	Connection con = null;
	 Connection2 dbConn = new Connection2();
	 con = dbConn.getConnection2();
    
     PreparedStatement preparedStatement = null;
	 ResultSet resultSet = null;
	 
	
    String query =null;
    if(circuitid.equals("All")){
    	query = "SELECT *,u.full_name,sb.b_name,mb.m_b_no,sb.b_no,mb.m_b_name FROM `circuitid_details` c " +
				"INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id " +
				"INNER JOIN branch_master sb ON sb.id=c.branch_id " +
				"INNER JOIN branch_master_main mb ON mb.m_b_no=sb.b_no " +
				"where " +
				" c.callLoggeddate >=? " +
				" And c.callLoggeddate <=? " + 
				" And c.status='Completed'" + 
				" Order by mb.m_b_no ";
    }
    else{
		 query = "SELECT *,u.full_name,sb.b_name,mb.m_b_no,sb.b_no,mb.m_b_name FROM `circuitid_details` c " +
						"INNER JOIN leavemanagement.user u ON u.emp_id=c.initiator_id " +
						"INNER JOIN branch_master sb ON sb.id=c.branch_id " +
						"INNER JOIN branch_master_main mb ON mb.m_b_no=sb.b_no " +
						"where " +
						" c.callLoggeddate >=? " +
						" And c.callLoggeddate <=? " +
						" And c.circuit_Id=? " +
						" And c.status='Completed'" +
					   //"And c.linktype_id=?" +
						" Order by c.circuit_Id ";
    }
	try{
		
		
			 preparedStatement = con.prepareStatement(query);
			 
		  if(circuitid.equals("All")){
			     preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
				 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
		  }
		  else{
			 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
			 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
			 preparedStatement.setString(3, circuitid);
		  }
		
		     resultSet = preparedStatement.executeQuery();
		     
				    HSSFWorkbook xlsFile = new HSSFWorkbook(); // create a workbook
				    // CreationHelper helper = xlsFile.getCreationHelper();
				    Sheet sheet = xlsFile.createSheet("ISPReport"); // add a sheet to your workbook
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
		            
		        
				    Cell cell1 = row.createCell(0);
				    cell1.setCellValue("ISP Outage No");
				    cell1.setCellStyle(style);
				    
				    Cell cell2 = row.createCell(1);
				    cell2.setCellValue("Circuit Id");
				    cell2.setCellStyle(style);
	
				    Cell cell3 = row.createCell(2);
				    cell3.setCellValue("Link Type");
				    cell3.setCellStyle(style);
				    
				    Cell cellx3 = row.createCell(3);
				    cellx3.setCellValue("ISP Name");
				    cellx3.setCellStyle(style);
				    
				    Cell cell4 = row.createCell(4);
				    cell4.setCellValue("Initiator");
				    cell4.setCellStyle(style);
				    
				    Cell cell5 = row.createCell(5);
				    cell5.setCellValue("Branch");
				    cell5.setCellStyle(style);
				    
				    Cell cell6 = row.createCell(6);
				    cell6.setCellValue("Location");
				    cell6.setCellStyle(style);
				    
				    Cell cell7 = row.createCell(7);
				    cell7.setCellValue("Trouble Ticket No");
				    cell7.setCellStyle(style);
			     
				    Cell cell8 = row.createCell(8);
				    cell8.setCellValue("Link Down date");
				    cell8.setCellStyle(style);
	
				    Cell cell9 = row.createCell(9);
				    cell9.setCellValue("Link Down Time");
				    cell9.setCellStyle(style);
				    
				    Cell cell10 = row.createCell(10);
				    cell10.setCellValue("Call Logged date");
				    cell10.setCellStyle(style);
				    
				    Cell cell11 = row.createCell(11);
				    cell11.setCellValue("Call Logged Time");
				    cell11.setCellStyle(style);
				    			    
				    Cell cell12 = row.createCell(12);
				    cell12.setCellValue("Reason");
				    cell12.setCellStyle(style);
				    
				    Cell cell13 = row.createCell(13);
				    cell13.setCellValue("Link Restart Date");
				    cell13.setCellStyle(style);
				    
				    Cell cell14 = row.createCell(14);
				    cell14.setCellValue("Link Restart Time");
				    cell14.setCellStyle(style);
				    
				    Cell cell15 = row.createCell(15);
				    cell15.setCellValue("Outage Report");
				    cell15.setCellStyle(style);
				    
				    Cell cell16 = row.createCell(16);
				    cell16.setCellValue("Total Down Time(H:M)");
				    cell16.setCellStyle(style);
				    
				    Cell cell17 = row.createCell(17);
				    cell17.setCellValue("Report");
				    cell17.setCellStyle(style);
	         
			    
		  int i =1;   
		  while(resultSet.next()){
			
				   row = sheet.createRow((short)i);
				   
				   Cell cell1161 = row.createCell(0);
   			       cell1161.setCellValue(resultSet.getString("ispoutageno"));
   			       cell1161.setCellStyle(style0);
   			       
   			       Cell cell1162 = row.createCell(1);
			       cell1162.setCellValue(resultSet.getString("circuit_Id"));
			       cell1162.setCellStyle(style0);
			       
			       Cell cell1163 = row.createCell(2);
   			       cell1163.setCellValue(resultSet.getString("linktype_id"));
   			       cell1163.setCellStyle(style0);
   			       
   			       Cell cell116x3 = row.createCell(3);
			       cell116x3.setCellValue(resultSet.getString("isp_name"));
			       cell116x3.setCellStyle(style0);
   			       
   			       Cell cell1164 = row.createCell(4);
			       cell1164.setCellValue(resultSet.getString("full_name"));
			       cell1164.setCellStyle(style0);
			       
			       Cell cell1165 = row.createCell(5);
   			       cell1165.setCellValue(resultSet.getString("m_b_name"));
   			       cell1165.setCellStyle(style0);
   			       
   			       Cell cell1166 = row.createCell(6);
			       cell1166.setCellValue(resultSet.getString("b_name"));
			       cell1166.setCellStyle(style0);
			       
			       Cell cell1167 = row.createCell(7);
   			       cell1167.setCellValue(resultSet.getString("ttno"));
   			       cell1167.setCellStyle(style0);
   			       
   			       Cell cell1168 = row.createCell(8);
			       cell1168.setCellValue(resultSet.getString("connectionDowndate"));
			       cell1168.setCellStyle(style0);
			       
			       Cell cell1169 = row.createCell(9);
   			       cell1169.setCellValue(resultSet.getString("linkdowntime"));
   			       cell1169.setCellStyle(style0);
   			      			       
			       Cell cell11611 = row.createCell(10);
   			       cell11611.setCellValue(resultSet.getString("callLoggeddate"));
   			       cell11611.setCellStyle(style0);
   			       
   			       Cell cell11612 = row.createCell(11);
			       cell11612.setCellValue(resultSet.getString("calllogtime"));
			       cell11612.setCellStyle(style0);
			       
			       Cell cell11613 = row.createCell(12);
   			       cell11613.setCellValue(resultSet.getString("reason"));
   			       cell11613.setCellStyle(style0);
   			       
   			       Cell cell11614 = row.createCell(13);
			       cell11614.setCellValue(resultSet.getString("conRestoreddate"));
			       cell11614.setCellStyle(style0);
			       
			       Cell cell11615 = row.createCell(14);
   			       cell11615.setCellValue(resultSet.getString("linkrestoredtime"));
   			       cell11615.setCellStyle(style0);
   			       
   			       Cell cell11616 = row.createCell(15);
			       cell11616.setCellValue(resultSet.getString("totaldowntime"));
			       cell11616.setCellStyle(style0);
			       
			       Cell cell11617 = row.createCell(16);
   			       cell11617.setCellValue(resultSet.getString("outagereport"));
   			       cell11617.setCellStyle(style0);
   			                          
                   if(resultSet.getString("Remark").equals("Good")){
                	 
                	   CellStyle style1 = xlsFile.createCellStyle();
                	   style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
                	   style1.setAlignment(style.ALIGN_CENTER);
                	   style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
   			           style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
   			           Font font1 = xlsFile.createFont();
   		               font1.setColor(IndexedColors.GREEN.getIndex());
   		               style1.setFont(font1);
   		            
	                   Cell cell116 = row.createCell(17);
	   			       cell116.setCellValue("Good");
	   			       cell116.setCellStyle(style1);
                   }
                   if(resultSet.getString("Remark").equals("Satisfactory")){
                	   
                	   CellStyle style1 = xlsFile.createCellStyle();
                	   style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
                	   style1.setAlignment(style.ALIGN_CENTER);
                	   style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
                	   style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
   			           Font font1 = xlsFile.createFont();
   		               font1.setColor(IndexedColors.BLUE.getIndex());
   		               style1.setFont(font1);
   		               
	                   Cell cell116 = row.createCell(17);
	   			       cell116.setCellValue("Satisfactory");
	   			       cell116.setCellStyle(style1);
                   }
                   if(resultSet.getString("Remark").equals("Worst")){
                	   
                	   CellStyle style1 = xlsFile.createCellStyle();
                	   style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
                	   style1.setAlignment(style.ALIGN_CENTER);
                	   style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
                	   style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
   			           Font font1 = xlsFile.createFont();
   		               font1.setColor(IndexedColors.RED.getIndex());
   		               style1.setFont(font1);
   		               
	                   Cell cell116 = row.createCell(17);
	   			       cell116.setCellValue("Worst");
	   			       cell116.setCellStyle(style1);
                   }
                   if(resultSet.getString("Remark").equals("Poor")){
                	   
                	   CellStyle style1 = xlsFile.createCellStyle();
                	   style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
                	  // style1.setAlignment(style.ALIGN_CENTER);
                	   style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
                	   style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
   			           style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
   			           Font font1 = xlsFile.createFont();
   		               font1.setColor(IndexedColors.BLACK.getIndex());
   		               style1.setFont(font1);
   		               
	                   Cell cell116 = row.createCell(17);
	   			       cell116.setCellValue("Poor");
	   			       cell116.setCellStyle(style1);
                   }
            i++;
		}
				     FileOutputStream fos = new FileOutputStream("temp.xls");
				     xlsFile.write(fos);
				     fos.close();
				     // Switch to using a `FileDataSource` (instead of ByteArrayDataSource)
				     DataSource fds = new FileDataSource("temp.xls");
		  				   
				     String sub="ISP Report For Circuit Id:"+circuitid+"  From date: "+new java.sql.Date(startDate.getTime())+" To  To date: "+new java.sql.Date(endDate.getTime());
				     String body="";
				     result=new SendExcelFileOnEmail().sendEmail(from ,to ,fds ,sub ,body,"ISPOutageReport.xls");		
					
	          }
		  		 catch (Exception e) {
		         e.printStackTrace();

            }
      finally {
	    con.close();
	    }
   return result;
  }



public static int ViewBranchWise(int branchNo,Date startDate,Date endDate,String to,String from) throws SQLException {
	
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
				    
				  /*  Cell cell2 = row.createCell(1);
				    cell2.setCellValue("Location");
				    cell2.setCellStyle(style);*/
				    
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
				   
                    /*Cell cell241 = row.createCell(0);
				    cell241.setCellValue(resultSet.getString("b_name"));
				    cell241.setCellStyle(style0);*/
				    
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
				  
		 if(type.equals("Select") && branchNo == 0 ){	
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
				" Group by c.number c.branchNo ";

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
				 " order by c.branchNo";
		  }
				  
		 else if(!type.equals("Select") && branchNo == 0 ){
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
				" AND c.typename = ? "+
				" Group by c.number order by c.branchNo";

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
				 " AND c.typename = ? order by c.branchNo";
		 }
				  
		 else if(!type.equals("Select") && branchNo != 0 ){	  
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
		       
			    if(type.equals("Select") && branchNo == 0 ){
			    	 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime()));
				 }
			    else if(!type.equals("Select") && branchNo == 0 ){
			    	 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement.setDate(2, new java.sql.Date(endDate.getTime())); 
					 preparedStatement.setString(3, type);
			    }
			    else if(!type.equals("Select") && branchNo != 0 ){		 
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
		        if(type.equals("Select") && branchNo == 0 ){
		          	 preparedStatement1.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement1.setDate(2, new java.sql.Date(endDate.getTime()));
				 }
		        else if(!type.equals("Select") && branchNo == 0 ){
		        	 preparedStatement1.setDate(1, new java.sql.Date(startDate.getTime()));
					 preparedStatement1.setDate(2, new java.sql.Date(endDate.getTime()));  
					 preparedStatement1.setString(3, type);
		        }
		        else if(!type.equals("Select") && branchNo != 0 ){	 
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
  }
@SuppressWarnings("deprecation")
public static int viewphotoCopierForEmail(int branchNo,Date startDate,Date endDate,String to,String from) throws SQLException {
	
				  String branch=null;
				  int i =5;int result = 0;
				  
				  int a1=0,a2=0,a3=0,a4=0,a5=0,a6=0,a7=0,a8=0,a9=0,a10=0,a11=0,a12=0;
				  
				  DecimalFormat nf = new DecimalFormat("#.##");
			      nf.setMaximumFractionDigits(2);
			      nf.setMinimumFractionDigits(2);
			  
				  Connection con = null;
				  Connection con2 = null;
				  Connection2 dbConn = new Connection2();
				  con = dbConn.getConnection2();
				  con2 = dbConn.getConnection2();
			   
			      PreparedStatement preparedStatement = null;
				  ResultSet resultSet = null;
				  ResultSet resultSet1 = null;
				  PreparedStatement preparedStatement2 = null;
				  ResultSet resultSet2 = null;
		 
				  String  query = " SELECT a.`modelno`, a.`serialno`, a.`agreementno`, a.`vendorname`, a.`vendortype`, a.`machinetype`, "+
				                  " a.`branch_id`, a.`branch_no`, a.`cheque_no`, a.`chequeAmt`, a.`cheque_date`, a.`month_of_payment`,"+
				                  " a.`rentamt`, a.`taxamt`, a.`total_amt`, a.`closingdate`, a.`openingdate`, a.`empid`,"+
				                  " a.`createddate`, a.`installeddate`, a.`agreementdate`, a.`agreementsdate`, a.`agreementedate`,"+
				                  " b.`photo_type`, b.`closing_balance`, b.`opening_balance`, b.`total_copies`, b.`free_copies`,"+
				                  " b.`extra_copies`, b.`per_copy_cost`, b.`charged_amt`, b.`invoice_no`, b.`invoice_date`, "+
				                  " b.`invoice_amt`,mb.m_b_name,b1.b_name,MONTH(month_of_payment) as month,a.`rcgst_per`,a.`rcgst_amt`,"+
				                  " a.`rsgst_per`,a.`rsgst_amt`,a.`rinvoice_no`,a.`rinvoice_date`,a.`rinvoice_Amt`,b.`cgst_per`,b.`cgst_amt`, "+
				                  " b.`sgst_per`,b.`sgst_amt`FROM `photocopier_details` a "+
				                  " INNER JOIN photocopy_summary b ON b.ph_id=a.ph_id "+
					              " INNER JOIN branch_master b1 ON b1.id=a.branch_id "+
					              " INNER JOIN branch_master_main mb ON mb.m_b_no=a.branch_no "+
					              " where branch_no=? AND month_of_payment >= ? AND month_of_payment <=? order by a.month_of_payment";

                  String query2 = " SELECT MONTH(`month_of_payment`) as month,SUM(`rentamt`) as rent,"+
						          " SUM(`total_amt`) as totalamt  FROM `photocopier_details` a "+
						          " where branch_no=? AND month_of_payment >= ? AND month_of_payment <=? group by MONTH(`month_of_payment`)";
	                  
                   try{
		
						    preparedStatement = con.prepareStatement(query);
						    preparedStatement.setInt(1, branchNo);
						    preparedStatement.setDate(2, new java.sql.Date(startDate.getTime()));
						    preparedStatement.setDate(3, new java.sql.Date(endDate.getTime()));
						    resultSet = preparedStatement.executeQuery();
						    // resultSet1 = preparedStatement.executeQuery();
					     
						    preparedStatement2 = con2.prepareStatement(query2);
						    preparedStatement2.setInt(1, branchNo);
							preparedStatement2.setDate(2, new java.sql.Date(startDate.getTime()));
							preparedStatement2.setDate(3, new java.sql.Date(endDate.getTime()));
							 
					        resultSet2 = preparedStatement2.executeQuery();
					     
					        HSSFWorkbook xlsFile = new HSSFWorkbook(); // create a workbook
				            // CreationHelper helper = xlsFile.getCreationHelper();
				        								     
				            Sheet sheet = xlsFile.createSheet("PhotoCopierReport"); // add a sheet to your workbook
				            Row row;// = sheet.createRow((short)4);
				         
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
					        style1.setAlignment(style1.ALIGN_CENTER);
					        style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
					        style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
					        style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
					        style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
					        style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
					        Font fontx = xlsFile.createFont();
				            fontx.setColor(IndexedColors.RED.getIndex());
				            style1.setFont(fontx);
				            
				            CellStyle style3 = xlsFile.createCellStyle();
					        style3.setFillForegroundColor(IndexedColors.WHITE.getIndex());
					        // style3.setAlignment(style3.ALIGN_CENTER);
					        style3.setFillPattern(CellStyle.SOLID_FOREGROUND);
					        style3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
					        style3.setBorderTop(HSSFCellStyle.BORDER_THIN);
					        style3.setBorderRight(HSSFCellStyle.BORDER_THIN);
					        style3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
					        Font font3 = xlsFile.createFont();
				            font3.setColor(IndexedColors.BLUE.getIndex());
				            style3.setFont(font3);
				            
				            row = sheet.createRow((short)0);
				 			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 36));
				 			//row = sheet.createRow((short)1);
				 			Cell cell101 = row.createCell(0);
				 			cell101.setCellValue("Month Wise Summary");
				 			cell101.setCellStyle(style1);
			 			
				 			
			 			row = sheet.createRow((short)1);
			 			
			 			Cell cc = row.createCell(7);
			 			cc.setCellValue("January");
			 			cc.setCellStyle(style);
						
						Cell jj = row.createCell(8);
						jj.setCellValue("February");
						jj.setCellStyle(style);
						
						Cell hh = row.createCell(9);
						hh.setCellValue("March");
						hh.setCellStyle(style);
						
						Cell uu = row.createCell(10);
						uu.setCellValue("Aprial");
						uu.setCellStyle(style);
						
						Cell yy = row.createCell(11);
						yy.setCellValue("May");
						yy.setCellStyle(style);
						
						Cell tt = row.createCell(12);
						tt.setCellValue("June");
						tt.setCellStyle(style);
						
						Cell rr = row.createCell(13);
						rr.setCellValue("July");
						rr.setCellStyle(style);
						
						Cell ee = row.createCell(14);
						ee.setCellValue("August");
						ee.setCellStyle(style);
						
						Cell ww = row.createCell(15);
						ww.setCellValue("September");
						ww.setCellStyle(style);
						
						Cell aaq = row.createCell(16);
						aaq.setCellValue("October");
						aaq.setCellStyle(style);
						
						Cell ss = row.createCell(17);
						ss.setCellValue("November");
						ss.setCellStyle(style);
						
						Cell xx = row.createCell(18);
						xx.setCellValue("December");
						xx.setCellStyle(style);
						
			 			
			 	 row = sheet.createRow((short)2);
			     while(resultSet2.next()){
					 		
					if(resultSet2.getString("month").equals("1")){ 
						
						   Cell cell1162 = row.createCell(7);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("2")){ 
						
						   Cell cell1162 = row.createCell(8);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("3")){ 
						
						   Cell cell1162 = row.createCell(9);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("4")){ 
						
						   Cell cell1162 = row.createCell(10);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("5")){ 
						
						   Cell cell1162 = row.createCell(11);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("6")){ 
						
						   Cell cell1162 = row.createCell(12);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("7")){ 
						
						   Cell cell1162 = row.createCell(13);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("8")){ 
						
						   Cell cell1162 = row.createCell(14);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("9")){ 
						
						   Cell cell1162 = row.createCell(15);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("10")){ 
						
						   Cell cell1162 = row.createCell(16);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("11")){ 
						
						   Cell cell1162 = row.createCell(17);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					}
					if(resultSet2.getString("month").equals("12")){ 
						
						   Cell cell1162 = row.createCell(18);
						   String aa=resultSet2.getString("totalamt");
						   float total=Float.parseFloat(aa);
						   cell1162.setCellValue(nf.format(total));
						   cell1162.setCellStyle(style3);
					  }
					
			         }
		      
			            row = sheet.createRow((short)3);
			            sheet.addMergedRegion(new CellRangeAddress(3, 3, 0, 36));
			 			//row = sheet.createRow((short)1);
			 			Cell cell1vv01 = row.createCell(0);
			 			cell1vv01.setCellValue("");
			 			cell1vv01.setCellStyle(style1);
			            
			 			row = sheet.createRow((short)4);
			 			
					    Cell cell1 = row.createCell(0);
					    cell1.setCellValue("Branch");
					    cell1.setCellStyle(style);
					    
					    Cell cell2 = row.createCell(1);
					    cell2.setCellValue("Location");
					    cell2.setCellStyle(style);

					    Cell cell3 = row.createCell(2);
					    cell3.setCellValue("Vendor Name");
					    cell3.setCellStyle(style);
					    
					    Cell cell11 = row.createCell(3);
					    cell11.setCellValue("Model");
					    cell11.setCellStyle(style);
					    
					    Cell cell21 = row.createCell(4);
					    cell21.setCellValue("Serial No");
					    cell21.setCellStyle(style);

					    Cell cell31 = row.createCell(5);
					    cell31.setCellValue("Machine Type");
					    cell31.setCellStyle(style);
					    
					    Cell cell111 = row.createCell(6);
					    cell111.setCellValue("Month Of Payment");
					    cell111.setCellStyle(style);
					    
					    Cell cell211 = row.createCell(7);
					    cell211.setCellValue("Closing Meter Date");
					    cell211.setCellStyle(style);

					    Cell cell4 = row.createCell(8);
					    cell4.setCellValue("Opening Meter Date");
					    cell4.setCellStyle(style);
					    
					    Cell cell12 = row.createCell(9);
					    cell12.setCellValue("Photo Type");
					    cell12.setCellStyle(style);
					    
					    Cell cell5 = row.createCell(10);
					    cell5.setCellValue("closing balance");
					    cell5.setCellStyle(style);
					    
					    Cell cell6 = row.createCell(11);
					    cell6.setCellValue("opening balance");
					    cell6.setCellStyle(style);
					    
					    Cell cell7 = row.createCell(12);
					    cell7.setCellValue("No.Of Prints");
					    cell7.setCellStyle(style);
				     
					    Cell cell8 = row.createCell(13);
					    cell8.setCellValue("Free Copies");
					    cell8.setCellStyle(style);

					    Cell cell9 = row.createCell(14);
					    cell9.setCellValue("Extra Copies(X1)");
					    cell9.setCellStyle(style);
					    
					    Cell cell10 = row.createCell(15);
					    cell10.setCellValue("PerCopy Cost(X2)");
					    cell10.setCellStyle(style);
					    
					    Cell cell33 = row.createCell(16);
					    cell33.setCellValue("ChargedAmt(A)=(X1*X2)");
					    cell33.setCellStyle(style);
					    							
					    Cell cell33s = row.createCell(17);
					    cell33s.setCellValue("Charged CGST %");
					    cell33s.setCellStyle(style);
					    
					    Cell cell33a = row.createCell(18);
					    cell33a.setCellValue("Charged CGST Amt(B)");
					    cell33a.setCellStyle(style);
					    
					    Cell cell33x = row.createCell(19);
					    cell33x.setCellValue("Charged SGST %");
					    cell33x.setCellStyle(style);
					    
					    Cell cell33q = row.createCell(20);
					    cell33q.setCellValue("Charged SGST Amt(C)");
					    cell33q.setCellStyle(style);
					        
					    Cell cell121 = row.createCell(21);
					    cell121.setCellValue("Rental Amt(D)");
					    cell121.setCellStyle(style);
					    
					    Cell cell3x3s = row.createCell(22);
					    cell3x3s.setCellValue("Rental CGST %");
					    cell3x3s.setCellStyle(style);
					    
					    Cell cell3x3a = row.createCell(23);
					    cell3x3a.setCellValue("Rental CGST Amt(E)");
					    cell3x3a.setCellStyle(style);
					    
					    Cell cell3x3x = row.createCell(24);
					    cell3x3x.setCellValue("Rental SGST %");
					    cell3x3x.setCellStyle(style);
					    
					    Cell cell3x3q = row.createCell(25);
					    cell3x3q.setCellValue("Rental SGST Amt(F)");
					    cell3x3q.setCellStyle(style);
					    
					    Cell cell14 = row.createCell(26);
					    cell14.setCellValue("Total(A+B+C+D+E+F)");
					    cell14.setCellStyle(style);
					    
					    Cell cell06 = row.createCell(27);
					    cell06.setCellValue("Rent Invoice No");
					    cell06.setCellStyle(style);
					    
					    Cell cell07 = row.createCell(28);
					    cell07.setCellValue("Rent Invoice Amount");
					    cell07.setCellStyle(style);
					    
					    Cell cell08 = row.createCell(29);
					    cell08.setCellValue("Rent Invoice Date");
					    cell08.setCellStyle(style);
					    
					    Cell cell06r = row.createCell(30);
					    cell06r.setCellValue("Invoice No");
					    cell06r.setCellStyle(style);
					    
					    Cell cell07r = row.createCell(31);
					    cell07r.setCellValue("Invoice Amount");
					    cell07r.setCellStyle(style);
					    
					    Cell cell08r = row.createCell(32);
					    cell08r.setCellValue("Invoice Date");
					    cell08r.setCellStyle(style);
					    
					    Cell cell15 = row.createCell(33);
					    cell15.setCellValue("Cheque No");
					    cell15.setCellStyle(style);
					    
					    Cell cell16 = row.createCell(34);
					    cell16.setCellValue("Cheque Amount");
					    cell16.setCellStyle(style);
					    
					    Cell cell0 = row.createCell(35);
					    cell0.setCellValue("Cheque Date");
					    cell0.setCellStyle(style);
					    
					    Cell cell01 = row.createCell(36);
					    cell01.setCellValue("Installed Date");
					    cell01.setCellStyle(style);
					    
		                String machinetype=null;
		       while(resultSet.next()){
			               
		      	            machinetype=resultSet.getString("machinetype");
					        branch=resultSet.getString("m_b_name");
				
			          if(resultSet.getString("month").equals("1")){	
				
							row = sheet.createRow((short)i);
						if(a1 == 0){
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cellq101 = row.createCell(0);
						    cellq101.setCellValue("Month Of January");
						    cellq101.setCellStyle(style1);
						    
						    a1++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						    
					  if(machinetype.equals("Mono")){   
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
					}if(resultSet.getString("month").equals("2")){	
						
						row = sheet.createRow((short)i);
					if(a2 == 0){
						sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
					    i++;
					    row = sheet.createRow((short)i);
					    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
					    Cell cell10a1 = row.createCell(0);
					    cell10a1.setCellValue("Month Of February");
					    cell10a1.setCellStyle(style1);
					    
					    a2++;
					    i++;
					    row = sheet.createRow((short)i);
					}
					    
					    
					if(machinetype.equals("Mono")){   
						  
				        Cell cell24 = row.createCell(0);
					    cell24.setCellValue(resultSet.getString("m_b_name"));
					    cell24.setCellStyle(style0);
					    
					    Cell cell25 = row.createCell(1);
					    cell25.setCellValue(resultSet.getString("b_name"));
					    cell25.setCellStyle(style0);
					    
					    Cell cell26 = row.createCell(2);
					    cell26.setCellValue(resultSet.getString("vendorname"));
					    cell26.setCellStyle(style0);
					    
					    Cell cell27 = row.createCell(3);
					    cell27.setCellValue(resultSet.getString("modelno"));
					    cell27.setCellStyle(style0);
				     
					    Cell cell28 = row.createCell(4);
					    cell28.setCellValue(resultSet.getString("serialno"));
					    cell28.setCellStyle(style0);

					    Cell cell29 = row.createCell(5);
					    cell29.setCellValue(resultSet.getString("machinetype"));
					    cell29.setCellStyle(style0);
					    
					    Cell cell210 = row.createCell(6);
					    cell210.setCellValue(resultSet.getString("month_of_payment"));
					    cell210.setCellStyle(style0);
					    
					    Cell cell1211 = row.createCell(7);
					    cell1211.setCellValue(resultSet.getString("closingdate"));
					    cell1211.setCellStyle(style0);
					   
		                Cell cell124 = row.createCell(8);
					    cell124.setCellValue(resultSet.getString("openingdate"));
					    cell124.setCellStyle(style0);
								    	  
					    Cell cell212 = row.createCell(9);
					    cell212.setCellValue(resultSet.getString("photo_type"));
					    cell212.setCellStyle(style0);
					    
					    Cell cell125 = row.createCell(10);
					    cell125.setCellValue(resultSet.getString("closing_balance"));
					    cell125.setCellStyle(style3);
					    
					    Cell cell126 = row.createCell(11);
					    cell126.setCellValue(resultSet.getString("opening_balance"));
					    cell126.setCellStyle(style3);
					    
					    Cell cell217 = row.createCell(12);
					    cell217.setCellValue(resultSet.getString("total_copies"));
					    cell217.setCellStyle(style3);
				     
					    Cell cell218 = row.createCell(13);
					    cell218.setCellValue(resultSet.getString("free_copies"));
					    cell218.setCellStyle(style3);

					    Cell cell219 = row.createCell(14);
					    cell219.setCellValue(resultSet.getString("extra_copies"));
					    cell219.setCellStyle(style3);
					    
					    Cell cell2110 = row.createCell(15);
					    String aa=resultSet.getString("per_copy_cost");
						float total=Float.parseFloat(aa);
						cell2110.setCellValue(nf.format(total));
					    cell2110.setCellStyle(style3);
					    
					    Cell cell2111 = row.createCell(16);
					    String aa1=resultSet.getString("charged_amt");
						float total1=Float.parseFloat(aa1);
						cell2111.setCellValue(nf.format(total1));
					    cell2111.setCellStyle(style3);
					    
					    Cell cell2111s = row.createCell(17);
					    String aax1=resultSet.getString("cgst_per");
						float total1s=Float.parseFloat(aax1);
						cell2111s.setCellValue(nf.format(total1s));
					    cell2111s.setCellStyle(style3);

					    Cell cell2111a = row.createCell(18);
					    String aax2=resultSet.getString("cgst_amt");
						float total1a=Float.parseFloat(aax2);
						cell2111a.setCellValue(nf.format(total1a));
					    cell2111a.setCellStyle(style3);
					    
					    Cell cell2111d = row.createCell(19);
					    String aax3=resultSet.getString("sgst_per");
						float total1d=Float.parseFloat(aax3);
						cell2111d.setCellValue(nf.format(total1d));
					    cell2111d.setCellStyle(style3);
					    
					    Cell cell2111z = row.createCell(20);
					    String aax4=resultSet.getString("sgst_amt");
						float total1z=Float.parseFloat(aax4);
						cell2111z.setCellValue(nf.format(total1z));
					    cell2111z.setCellStyle(style3);
				   
					    Cell cell224 = row.createCell(21);
					    String aa2=resultSet.getString("rentamt");
						float total2=Float.parseFloat(aa2);
						cell224.setCellValue(nf.format(total2));
					    cell224.setCellStyle(style3);
					    
					    Cell cell2111sa = row.createCell(22);
					    String aax1a=resultSet.getString("rcgst_per");
						float total1sa=Float.parseFloat(aax1a);
						cell2111sa.setCellValue(nf.format(total1sa));
					    cell2111sa.setCellStyle(style3);

					    Cell cell2111aa = row.createCell(23);
					    String aax2a=resultSet.getString("rcgst_amt");
						float total1aa=Float.parseFloat(aax2a);
						cell2111aa.setCellValue(nf.format(total1aa));
					    cell2111aa.setCellStyle(style3);
					    
					    Cell cell2111da= row.createCell(24);
					    String aax3a=resultSet.getString("rsgst_per");
						float total1da=Float.parseFloat(aax3a);
						cell2111da.setCellValue(nf.format(total1da));
					    cell2111da.setCellStyle(style3);
					    
					    Cell cell2111za = row.createCell(25);
					    String aax4a=resultSet.getString("rsgst_amt");
						float total1za=Float.parseFloat(aax4a);
						cell2111za.setCellValue(nf.format(total1za));
					    cell2111za.setCellStyle(style3);
					    
					    Cell cell251 = row.createCell(26);
					    String aa4=resultSet.getString("total_amt");
						float total4=Float.parseFloat(aa4);
						cell251.setCellValue(nf.format(total4));
					    cell251.setCellStyle(style3);
					    
					    Cell cell213 = row.createCell(27);
					    cell213.setCellValue(resultSet.getString("rinvoice_no"));
					    cell213.setCellStyle(style0);
					    
					    Cell cell214 = row.createCell(28);
					    String aa5=resultSet.getString("rinvoice_Amt");
						float total5=Float.parseFloat(aa5);
						cell214.setCellValue(nf.format(total5));
					    cell214.setCellStyle(style0);
					    
					    Cell cell215 = row.createCell(29);
					    cell215.setCellValue(resultSet.getString("rinvoice_date"));
					    cell215.setCellStyle(style0);
					    
					    Cell cell21c3 = row.createCell(30);
					    cell21c3.setCellValue(resultSet.getString("invoice_no"));
					    cell21c3.setCellStyle(style0);
					    
					    Cell cell21c4 = row.createCell(31);
					    String aac5=resultSet.getString("invoice_amt");
						float totalc5=Float.parseFloat(aac5);
						cell21c4.setCellValue(nf.format(totalc5));
					    cell21c4.setCellStyle(style0);
					    
					    Cell cell21z5 = row.createCell(32);
					    cell21z5.setCellValue(resultSet.getString("invoice_date"));
					    cell21z5.setCellStyle(style0);
				 
					    Cell cell261 = row.createCell(33);
					    cell261.setCellValue(resultSet.getString("cheque_no"));
					    cell261.setCellStyle(style0);
					    
					    Cell cell271 = row.createCell(34);
					    String aa6=resultSet.getString("chequeAmt");
						float total6=Float.parseFloat(aa6);
						cell214.setCellValue(nf.format(total6));
						cell271.setCellStyle(style0);
				     
					    Cell cell281 = row.createCell(35);
					    cell281.setCellValue(resultSet.getString("cheque_date"));
					    cell281.setCellStyle(style0);

					    Cell cell291 = row.createCell(36);
					    cell291.setCellValue(resultSet.getString("installeddate"));
					    cell291.setCellStyle(style0);
		           }	    
				  if(!(machinetype.equals("Mono"))){  
				        
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
					    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
					  
				        Cell cell24 = row.createCell(0);
					    cell24.setCellValue(resultSet.getString("m_b_name"));
					    cell24.setCellStyle(style0);
					    
					    Cell cell25 = row.createCell(1);
					    cell25.setCellValue(resultSet.getString("b_name"));
					    cell25.setCellStyle(style0);
					    
					    Cell cell26 = row.createCell(2);
					    cell26.setCellValue(resultSet.getString("vendorname"));
					    cell26.setCellStyle(style0);
					    
					    Cell cell27 = row.createCell(3);
					    cell27.setCellValue(resultSet.getString("modelno"));
					    cell27.setCellStyle(style0);
				     
					    Cell cell28 = row.createCell(4);
					    cell28.setCellValue(resultSet.getString("serialno"));
					    cell28.setCellStyle(style0);

					    Cell cell29 = row.createCell(5);
					    cell29.setCellValue(resultSet.getString("machinetype"));
					    cell29.setCellStyle(style0);
					    
					    Cell cell210 = row.createCell(6);
					    cell210.setCellValue(resultSet.getString("month_of_payment"));
					    cell210.setCellStyle(style0);
					    
					    Cell cell1211 = row.createCell(7);
					    cell1211.setCellValue(resultSet.getString("closingdate"));
					    cell1211.setCellStyle(style0);
					   
		                Cell cell124 = row.createCell(8);
					    cell124.setCellValue(resultSet.getString("openingdate"));
					    cell124.setCellStyle(style0);
								    	  
					    Cell cell212 = row.createCell(9);
					    cell212.setCellValue(resultSet.getString("photo_type"));
					    cell212.setCellStyle(style0);
					    
					    Cell cell125 = row.createCell(10);
					    cell125.setCellValue(resultSet.getString("closing_balance"));
					    cell125.setCellStyle(style3);
					    
					    Cell cell126 = row.createCell(11);
					    cell126.setCellValue(resultSet.getString("opening_balance"));
					    cell126.setCellStyle(style3);
					    
					    Cell cell217 = row.createCell(12);
					    cell217.setCellValue(resultSet.getString("total_copies"));
					    cell217.setCellStyle(style3);
				     
					    Cell cell218 = row.createCell(13);
					    cell218.setCellValue(resultSet.getString("free_copies"));
					    cell218.setCellStyle(style3);

					    Cell cell219 = row.createCell(14);
					    cell219.setCellValue(resultSet.getString("extra_copies"));
					    cell219.setCellStyle(style3);
					    
					    Cell cell2110 = row.createCell(15);
					    String aa=resultSet.getString("per_copy_cost");
						float total=Float.parseFloat(aa);
						cell2110.setCellValue(nf.format(total));
					    cell2110.setCellStyle(style3);
					    
					    Cell cell2111 = row.createCell(16);
					    String aa1=resultSet.getString("charged_amt");
						float total1=Float.parseFloat(aa1);
						cell2111.setCellValue(nf.format(total1));
					    cell2111.setCellStyle(style3);
				   
					    Cell cell2111s = row.createCell(17);
					    String aax1=resultSet.getString("cgst_per");
						float total1s=Float.parseFloat(aax1);
						cell2111s.setCellValue(nf.format(total1s));
					    cell2111s.setCellStyle(style3);

					    Cell cell2111a = row.createCell(18);
					    String aax2=resultSet.getString("cgst_amt");
						float total1a=Float.parseFloat(aax2);
						cell2111a.setCellValue(nf.format(total1a));
					    cell2111a.setCellStyle(style3);
					    
					    Cell cell2111d = row.createCell(19);
					    String aax3=resultSet.getString("sgst_per");
						float total1d=Float.parseFloat(aax3);
						cell2111d.setCellValue(nf.format(total1d));
					    cell2111d.setCellStyle(style3);
					    
					    Cell cell2111z = row.createCell(20);
					    String aax4=resultSet.getString("sgst_amt");
						float total1z=Float.parseFloat(aax4);
						cell2111z.setCellValue(nf.format(total1z));
					    cell2111z.setCellStyle(style3);
				   
					    Cell cell224 = row.createCell(21);
					    String aa2=resultSet.getString("rentamt");
						float total2=Float.parseFloat(aa2);
						cell224.setCellValue(nf.format(total2));
					    cell224.setCellStyle(style3);
					    
					    Cell cell2111sa = row.createCell(22);
					    String aax1a=resultSet.getString("rcgst_per");
						float total1sa=Float.parseFloat(aax1a);
						cell2111sa.setCellValue(nf.format(total1sa));
					    cell2111sa.setCellStyle(style3);

					    Cell cell2111aa = row.createCell(23);
					    String aax2a=resultSet.getString("rcgst_amt");
						float total1aa=Float.parseFloat(aax2a);
						cell2111aa.setCellValue(nf.format(total1aa));
					    cell2111aa.setCellStyle(style3);
					    
					    Cell cell2111da= row.createCell(24);
					    String aax3a=resultSet.getString("rsgst_per");
						float total1da=Float.parseFloat(aax3a);
						cell2111da.setCellValue(nf.format(total1da));
					    cell2111da.setCellStyle(style3);
					    
					    Cell cell2111za = row.createCell(25);
					    String aax4a=resultSet.getString("rsgst_amt");
						float total1za=Float.parseFloat(aax4a);
						cell2111za.setCellValue(nf.format(total1za));
					    cell2111za.setCellStyle(style3);
					    
					    Cell cell251 = row.createCell(26);
					    String aa4=resultSet.getString("total_amt");
						float total4=Float.parseFloat(aa4);
						cell251.setCellValue(nf.format(total4));
					    cell251.setCellStyle(style3);
					    
					    Cell cell213 = row.createCell(27);
					    cell213.setCellValue(resultSet.getString("rinvoice_no"));
					    cell213.setCellStyle(style0);
					    
					    Cell cell214 = row.createCell(28);
					    String aa5=resultSet.getString("rinvoice_Amt");
						float total5=Float.parseFloat(aa5);
						cell214.setCellValue(nf.format(total5));
					    cell214.setCellStyle(style0);
					    
					    Cell cell215 = row.createCell(29);
					    cell215.setCellValue(resultSet.getString("rinvoice_date"));
					    cell215.setCellStyle(style0);
					    
					    Cell cell213c = row.createCell(30);
					    cell213c.setCellValue(resultSet.getString("invoice_no"));
					    cell213c.setCellStyle(style0);
					    
					    Cell cell214q = row.createCell(31);
					    String aa5q=resultSet.getString("invoice_amt");
						float total5q=Float.parseFloat(aa5q);
						cell214q.setCellValue(nf.format(total5q));
					    cell214q.setCellStyle(style0);
					    
					    Cell cell215w = row.createCell(32);
					    cell215.setCellValue(resultSet.getString("invoice_date"));
					    cell215w.setCellStyle(style0);
				 
					    Cell cell261 = row.createCell(33);
					    cell261.setCellValue(resultSet.getString("cheque_no"));
					    cell261.setCellStyle(style0);
					    
					    Cell cell271 = row.createCell(34);
					    String aa6=resultSet.getString("chequeAmt");
						float total6=Float.parseFloat(aa6);
						cell214.setCellValue(nf.format(total6));
						cell271.setCellStyle(style0);
				     
					    Cell cell281 = row.createCell(35);
					    cell281.setCellValue(resultSet.getString("cheque_date"));
					    cell281.setCellStyle(style0);

					    Cell cell291 = row.createCell(36);
					    cell291.setCellValue(resultSet.getString("installeddate"));
					    cell291.setCellStyle(style0);
				        }
					   }
						if(resultSet.getString("month").equals("3")){	
							
							row = sheet.createRow((short)i);
						if(a3 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cells101 = row.createCell(0);
						    cells101.setCellValue("Month Of March");
						    cells101.setCellStyle(style1);
						    
						    a3++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}
						if(resultSet.getString("month").equals("4")){	
							
							row = sheet.createRow((short)i);
						if(a4 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cella101 = row.createCell(0);
						    cella101.setCellValue("Month Of April");
						    cella101.setCellStyle(style1);
						    
						    a4++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						    
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}
						if(resultSet.getString("month").equals("5")){	
							
							row = sheet.createRow((short)i);
						if(a5 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cell10q1 = row.createCell(0);
						    cell10q1.setCellValue("Month Of May");
						    cell10q1.setCellStyle(style1);
						    
						    a5++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						    
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}if(resultSet.getString("month").equals("6")){	
						
						row = sheet.createRow((short)i);
						if(a6 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cell1w01 = row.createCell(0);
						    cell1w01.setCellValue("Month Of June");
						    cell1w01.setCellStyle(style1);
						
						a6++;
						i++;
						row = sheet.createRow((short)i);
						}
						
						
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
				 }
						if(resultSet.getString("month").equals("7")){	
							
							row = sheet.createRow((short)i);
						if(a7 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cell1gq01 = row.createCell(0);
						    cell1gq01.setCellValue("Month Of July");
						    cell1gq01.setCellStyle(style1);
						    
						    a7++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						    
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}if(resultSet.getString("month").equals("8")){	
						
						row = sheet.createRow((short)i);
						if(a8 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						Cell cell101s = row.createCell(0);
						cell101s.setCellValue("Month Of August");
						cell101s.setCellStyle(style1);
						
						a8++;
						i++;
						row = sheet.createRow((short)i);
						}
						
						
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}
						if(resultSet.getString("month").equals("9")){	
							
							row = sheet.createRow((short)i);
						if(a9 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cell10v1 = row.createCell(0);
						    cell10v1.setCellValue("Month Of September");
						    cell10v1.setCellStyle(style1);
						    
						    a9++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						    
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}if(resultSet.getString("month").equals("10")){	
						
						row = sheet.createRow((short)i);
						if(a10 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						Cell cell10b1 = row.createCell(0);
						cell10b1.setCellValue("Month Of October");
						cell10b1.setCellStyle(style1);
						
						a10++;
						i++;
						row = sheet.createRow((short)i);
						}
						
						
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}
						if(resultSet.getString("month").equals("11")){	
							
							row = sheet.createRow((short)i);
						if(a11 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						    sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    Cell cell10h1 = row.createCell(0);
						    cell10h1.setCellValue("Month Of November");
						    cell10h1.setCellStyle(style1);
						    
						    a11++;
						    i++;
						    row = sheet.createRow((short)i);
						}
						    
						    
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					  }
						}
						if(resultSet.getString("month").equals("12")){	
						
						row = sheet.createRow((short)i);
						if(a12 == 0){
							sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						    i++;
						    row = sheet.createRow((short)i);
						sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 36));
						Cell cell10a1 = row.createCell(0);
						cell10a1.setCellValue("Month Of December");
						cell10a1.setCellStyle(style1);
						
						a12++;
						i++;
						row = sheet.createRow((short)i);
						}
						
						
						if(machinetype.equals("Mono")){   
							  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
						    
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell21c3 = row.createCell(30);
						    cell21c3.setCellValue(resultSet.getString("invoice_no"));
						    cell21c3.setCellStyle(style0);
						    
						    Cell cell21c4 = row.createCell(31);
						    String aac5=resultSet.getString("invoice_amt");
							float totalc5=Float.parseFloat(aac5);
							cell21c4.setCellValue(nf.format(totalc5));
						    cell21c4.setCellStyle(style0);
						    
						    Cell cell21z5 = row.createCell(32);
						    cell21z5.setCellValue(resultSet.getString("invoice_date"));
						    cell21z5.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
			           }	    
					  if(!(machinetype.equals("Mono"))){  
					        
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 0, 0));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 1, 1));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 2, 2));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 3, 3));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 4, 4));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 5, 5));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 6, 6));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 7, 7));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 8, 8));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 21, 21));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 26, 26));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 27, 27));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 28, 28));
						    sheet.addMergedRegion(new CellRangeAddress(i, i+2, 29, 29));
						  
					        Cell cell24 = row.createCell(0);
						    cell24.setCellValue(resultSet.getString("m_b_name"));
						    cell24.setCellStyle(style0);
						    
						    Cell cell25 = row.createCell(1);
						    cell25.setCellValue(resultSet.getString("b_name"));
						    cell25.setCellStyle(style0);
						    
						    Cell cell26 = row.createCell(2);
						    cell26.setCellValue(resultSet.getString("vendorname"));
						    cell26.setCellStyle(style0);
						    
						    Cell cell27 = row.createCell(3);
						    cell27.setCellValue(resultSet.getString("modelno"));
						    cell27.setCellStyle(style0);
					     
						    Cell cell28 = row.createCell(4);
						    cell28.setCellValue(resultSet.getString("serialno"));
						    cell28.setCellStyle(style0);

						    Cell cell29 = row.createCell(5);
						    cell29.setCellValue(resultSet.getString("machinetype"));
						    cell29.setCellStyle(style0);
						    
						    Cell cell210 = row.createCell(6);
						    cell210.setCellValue(resultSet.getString("month_of_payment"));
						    cell210.setCellStyle(style0);
						    
						    Cell cell1211 = row.createCell(7);
						    cell1211.setCellValue(resultSet.getString("closingdate"));
						    cell1211.setCellStyle(style0);
						   
		                    Cell cell124 = row.createCell(8);
						    cell124.setCellValue(resultSet.getString("openingdate"));
						    cell124.setCellStyle(style0);
									    	  
						    Cell cell212 = row.createCell(9);
						    cell212.setCellValue(resultSet.getString("photo_type"));
						    cell212.setCellStyle(style0);
						    
						    Cell cell125 = row.createCell(10);
						    cell125.setCellValue(resultSet.getString("closing_balance"));
						    cell125.setCellStyle(style3);
						    
						    Cell cell126 = row.createCell(11);
						    cell126.setCellValue(resultSet.getString("opening_balance"));
						    cell126.setCellStyle(style3);
						    
						    Cell cell217 = row.createCell(12);
						    cell217.setCellValue(resultSet.getString("total_copies"));
						    cell217.setCellStyle(style3);
					     
						    Cell cell218 = row.createCell(13);
						    cell218.setCellValue(resultSet.getString("free_copies"));
						    cell218.setCellStyle(style3);

						    Cell cell219 = row.createCell(14);
						    cell219.setCellValue(resultSet.getString("extra_copies"));
						    cell219.setCellStyle(style3);
						    
						    Cell cell2110 = row.createCell(15);
						    String aa=resultSet.getString("per_copy_cost");
							float total=Float.parseFloat(aa);
							cell2110.setCellValue(nf.format(total));
						    cell2110.setCellStyle(style3);
						    
						    Cell cell2111 = row.createCell(16);
						    String aa1=resultSet.getString("charged_amt");
							float total1=Float.parseFloat(aa1);
							cell2111.setCellValue(nf.format(total1));
						    cell2111.setCellStyle(style3);
					   
						    Cell cell2111s = row.createCell(17);
						    String aax1=resultSet.getString("cgst_per");
							float total1s=Float.parseFloat(aax1);
							cell2111s.setCellValue(nf.format(total1s));
						    cell2111s.setCellStyle(style3);

						    Cell cell2111a = row.createCell(18);
						    String aax2=resultSet.getString("cgst_amt");
							float total1a=Float.parseFloat(aax2);
							cell2111a.setCellValue(nf.format(total1a));
						    cell2111a.setCellStyle(style3);
						    
						    Cell cell2111d = row.createCell(19);
						    String aax3=resultSet.getString("sgst_per");
							float total1d=Float.parseFloat(aax3);
							cell2111d.setCellValue(nf.format(total1d));
						    cell2111d.setCellStyle(style3);
						    
						    Cell cell2111z = row.createCell(20);
						    String aax4=resultSet.getString("sgst_amt");
							float total1z=Float.parseFloat(aax4);
							cell2111z.setCellValue(nf.format(total1z));
						    cell2111z.setCellStyle(style3);
					   
						    Cell cell224 = row.createCell(21);
						    String aa2=resultSet.getString("rentamt");
							float total2=Float.parseFloat(aa2);
							cell224.setCellValue(nf.format(total2));
						    cell224.setCellStyle(style3);
						    
						    Cell cell2111sa = row.createCell(22);
						    String aax1a=resultSet.getString("rcgst_per");
							float total1sa=Float.parseFloat(aax1a);
							cell2111sa.setCellValue(nf.format(total1sa));
						    cell2111sa.setCellStyle(style3);

						    Cell cell2111aa = row.createCell(23);
						    String aax2a=resultSet.getString("rcgst_amt");
							float total1aa=Float.parseFloat(aax2a);
							cell2111aa.setCellValue(nf.format(total1aa));
						    cell2111aa.setCellStyle(style3);
						    
						    Cell cell2111da= row.createCell(24);
						    String aax3a=resultSet.getString("rsgst_per");
							float total1da=Float.parseFloat(aax3a);
							cell2111da.setCellValue(nf.format(total1da));
						    cell2111da.setCellStyle(style3);
						    
						    Cell cell2111za = row.createCell(25);
						    String aax4a=resultSet.getString("rsgst_amt");
							float total1za=Float.parseFloat(aax4a);
							cell2111za.setCellValue(nf.format(total1za));
						    cell2111za.setCellStyle(style3);
						    
						    Cell cell251 = row.createCell(26);
						    String aa4=resultSet.getString("total_amt");
							float total4=Float.parseFloat(aa4);
							cell251.setCellValue(nf.format(total4));
						    cell251.setCellStyle(style3);
						    
						    Cell cell213 = row.createCell(27);
						    cell213.setCellValue(resultSet.getString("rinvoice_no"));
						    cell213.setCellStyle(style0);
						    
						    Cell cell214 = row.createCell(28);
						    String aa5=resultSet.getString("rinvoice_Amt");
							float total5=Float.parseFloat(aa5);
							cell214.setCellValue(nf.format(total5));
						    cell214.setCellStyle(style0);
						    
						    Cell cell215 = row.createCell(29);
						    cell215.setCellValue(resultSet.getString("rinvoice_date"));
						    cell215.setCellStyle(style0);
						    
						    Cell cell213c = row.createCell(30);
						    cell213c.setCellValue(resultSet.getString("invoice_no"));
						    cell213c.setCellStyle(style0);
						    
						    Cell cell214q = row.createCell(31);
						    String aa5q=resultSet.getString("invoice_amt");
							float total5q=Float.parseFloat(aa5q);
							cell214q.setCellValue(nf.format(total5q));
						    cell214q.setCellStyle(style0);
						    
						    Cell cell215w = row.createCell(32);
						    cell215.setCellValue(resultSet.getString("invoice_date"));
						    cell215w.setCellStyle(style0);
					 
						    Cell cell261 = row.createCell(33);
						    cell261.setCellValue(resultSet.getString("cheque_no"));
						    cell261.setCellStyle(style0);
						    
						    Cell cell271 = row.createCell(34);
						    String aa6=resultSet.getString("chequeAmt");
							float total6=Float.parseFloat(aa6);
							cell214.setCellValue(nf.format(total6));
							cell271.setCellStyle(style0);
					     
						    Cell cell281 = row.createCell(35);
						    cell281.setCellValue(resultSet.getString("cheque_date"));
						    cell281.setCellStyle(style0);
			
						    Cell cell291 = row.createCell(36);
						    cell291.setCellValue(resultSet.getString("installeddate"));
						    cell291.setCellStyle(style0);
					     }
						}
					     i++;
					}
		  		  
				    FileOutputStream fos = new FileOutputStream("temp.xls");
				    xlsFile.write(fos);
				    fos.close();
				  
				    // Switch to using a `FileDataSource` (instead of ByteArrayDataSource)
				    DataSource fds = new FileDataSource("temp.xls");
		  				   
				    String sub="Photo Copier Report for Branch: "+branch+"  From date: "+new java.sql.Date(startDate.getTime())+" To  To date: "+new java.sql.Date(endDate.getTime());
				    String body="";
				    result=new SendExcelFileOnEmail().sendEmail(from ,to ,fds ,sub ,body,"PhotoCopierReport.xls");		
					
	               }
		  		      catch (Exception e) {
		               e.printStackTrace();

                 }
                finally {
	                 con.close();
	            }
          return result;
  }
public static List<Mpls> MplsReport(int branchNo, Date startDate,Date endDate,String circuitid) throws SQLException {
	
		      DecimalFormat nf = new DecimalFormat("#.##");
	          nf.setMaximumFractionDigits(2);
	          nf.setMinimumFractionDigits(2);
	         
	          Connection con = null;
		      Connection2 dbConn = new Connection2();
		      con = dbConn.getConnection2();
	    
		      PreparedStatement preparedStatement = null;
			  ResultSet resultSet = null;
			  
			  List<Mpls> mplss = new ArrayList<Mpls>();
			
		    String query = null;
      if(!circuitid.equals("Select")){
    	  
		    query = " SELECT c.*,s.b_name,mb.m_b_name,u.user_name,MONTH(bill_date) as month FROM `mpls_details` c"+ 
		            " INNER JOIN  `leavemanagement`.`user` u ON c.emp_id = u.emp_id "+
					" INNER JOIN branch_master s ON c.branch_id = s.id "+
					" INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no "+
					" WHERE bill_date >=  ? AND bill_date <=  ? "+
					" AND c.branch_no = ? AND  circuit_Id = ? Order by MONTH(bill_date) ";
        }
      else{
    	  
    	    query = " SELECT c.*,s.b_name,mb.m_b_name,u.user_name,MONTH(bill_date) as month FROM `mpls_details` c"+ 
		            " INNER JOIN  `leavemanagement`.`user` u ON c.emp_id = u.emp_id "+
					" INNER JOIN branch_master s ON c.branch_id = s.id "+
					" INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no "+
					" WHERE bill_date >=  ? AND bill_date <=  ? "+
					" AND c.branch_no = ?   Order by MONTH(bill_date) ";
      }
      
      
		  try {
			
				 preparedStatement = con.prepareStatement(query);
		 if(!circuitid.equals("Select")){
				 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime() ));
				 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
				 preparedStatement.setInt(3, branchNo);
				 preparedStatement.setString(4, circuitid);
		 }
		 else{
				 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime() ));
				 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
				 preparedStatement.setInt(3, branchNo);
				
		 }
			     resultSet = preparedStatement.executeQuery();
				
				 while(resultSet.next())
				 {
				    Mpls mpls = new Mpls();
			 
				    mpls.setBranchLocation(resultSet.getString("b_name"));
				    mpls.setBranchName(resultSet.getString("m_b_name"));
				    mpls.setBranchNo(resultSet.getInt("branch_no"));
				    mpls.setUserName(resultSet.getString("user_name"));
				    mpls.setLinktype_id(resultSet.getString("linktype_id"));
				    mpls.setCircuit_Id(resultSet.getString("circuit_Id"));
				    mpls.setIsp_name(resultSet.getString("isp_name"));
				    mpls.setLanpool(resultSet.getString("lanpool"));
				    mpls.setWanpool(resultSet.getString("wanpool"));
				    mpls.setAcc_relation_no(resultSet.getString("acc_relation_no"));
				    mpls.setBandwidth(resultSet.getString("bandwidth"));
				    mpls.setMedia(resultSet.getString("media"));
				    mpls.setArc(resultSet.getString("arc"));
				    mpls.setOtc(resultSet.getString("otc"));
				    mpls.setPo_number(resultSet.getString("po_number"));
				    mpls.setPo_date(resultSet.getDate("po_date"));
				    mpls.setBill_refno(resultSet.getString("bill_refno"));
				    mpls.setBill_date(resultSet.getDate("bill_date"));
				    mpls.setBill_fdate(resultSet.getDate("bill_fdate"));
				    mpls.setBill_tdate(resultSet.getDate("bill_tdate"));
				    mpls.setAmount(resultSet.getFloat("amount"));
				    mpls.setTds_amt(resultSet.getFloat("tds_amt"));
				    mpls.setTax_amt(resultSet.getFloat("cgst_amount"));
				    mpls.setTax_amt1(resultSet.getFloat("sgst_amount"));
				    mpls.setTds_per(resultSet.getFloat("tds_percentage"));
				    mpls.setTax_per(resultSet.getFloat("tax_percentage"));
				    mpls.setTax_per1(resultSet.getFloat("tax_percentage1"));
				    mpls.setTotal_invoice_amt(resultSet.getFloat("total_invoice_amt"));
				    mpls.setTotal_pay_amt(resultSet.getFloat("total_pay_amt"));
				    /*mpls.setInvoiceno(resultSet.getString("invoice_no"));
				    mpls.setInoviceAmt(resultSet.getFloat("invoice_amt"));
				    mpls.setInvoiceDate(resultSet.getString("invoice_date"));*/
				    mpls.setChequeno(resultSet.getString("cheque_no"));
				    mpls.setChequeAmt(resultSet.getFloat("cheque_amt"));
				    mpls.setChequeDate(resultSet.getString("cheque_date"));
				    mpls.setMonth(resultSet.getString("month"));
				    
				    String path=resultSet.getString("invoice_file");
				    String filename=path.substring(path.lastIndexOf("/")+1);;
				    
				    mpls.setPath(path);
				    mpls.setFilename(filename);
				    	
				    mplss.add(mpls);
	      }
			 
		 } catch (Exception e) {
					e.printStackTrace();
	
			 }
			 finally {
				 con.close();
				}
		return mplss;
	}
public static List<Mpls> branchTotal(int branchNo, Date startDate,Date endDate,String circuitid) throws SQLException {
	
    DecimalFormat nf = new DecimalFormat("#.##");
    nf.setMaximumFractionDigits(2);
    nf.setMinimumFractionDigits(2);
   
    Connection con = null;
    Connection2 dbConn = new Connection2();
    con = dbConn.getConnection2();

    PreparedStatement preparedStatement = null;
	  ResultSet resultSet = null;
	  
	  List<Mpls> mplss = new ArrayList<Mpls>();
	
     String query = null;
     
     if(!circuitid.equals("Select")){
    	 
			  query = " SELECT Round(SUM(`amount`),2) amount,Round(SUM(`tds_amt`),2) tds_amt,Round(SUM(`cgst_amount`),2) tax_amt,Round(SUM(`sgst_amount`),2) tax_amt1,"+
					  " Round(SUM(`total_invoice_amt`),2) total_invoice_amt,Round(SUM(`total_pay_amt`),2) total_pay_amt FROM `mpls_details` "+
					  " WHERE bill_date >= ? AND bill_date <= ? AND branch_no = ? AND circuit_Id = ?";
     }
     else{
    	 
    	  query = " SELECT Round(SUM(`amount`),2) amount,Round(SUM(`tds_amt`),2) tds_amt,Round(SUM(`cgst_amount`),2) tax_amt,Round(SUM(`sgst_amount`),2) tax_amt1,"+
				  " Round(SUM(`total_invoice_amt`),2) total_invoice_amt,Round(SUM(`total_pay_amt`),2) total_pay_amt FROM `mpls_details` "+
				  " WHERE bill_date >= ? AND bill_date <= ? AND branch_no = ?  ";
     }
     try {
	
			 preparedStatement = con.prepareStatement(query);
	 if(!circuitid.equals("Select")){
			 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
			 preparedStatement.setString(4, circuitid);
	 }
	 else{
			 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime() ));
			 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
			 preparedStatement.setInt(3, branchNo);
			
	 }
			 
		     resultSet = preparedStatement.executeQuery();
			
			 while(resultSet.next())
			 {
				    Mpls mpls = new Mpls();
			 
				    mpls.setAmount(resultSet.getFloat("amount"));
				    mpls.setTds_amt(resultSet.getFloat("tds_amt"));
				    mpls.setTax_amt(resultSet.getFloat("tax_amt"));
				    mpls.setTax_amt1(resultSet.getFloat("tax_amt1"));
				    mpls.setTotal_invoice_amt(resultSet.getFloat("total_invoice_amt"));
				    mpls.setTotal_pay_amt(resultSet.getFloat("total_pay_amt"));
				    mplss.add(mpls);
		}
			 
		} catch (Exception e) {
					e.printStackTrace();
		
			 }
			 finally {
				 con.close();
				}
		return mplss;
		}

public static List<Payment> paymetReport(int branchId, Date startDate,Date endDate) throws SQLException {
	
			DecimalFormat nf = new DecimalFormat("#.##");
		    nf.setMaximumFractionDigits(2);
		    nf.setMinimumFractionDigits(2);
		    
		    float amount=0;
		    Connection con = null;
		    Connection2 dbConn = new Connection2();
		    con = dbConn.getConnection2();
		
		      PreparedStatement preparedStatement = null;
			  ResultSet resultSet = null;
			  
			  List<Payment> payments = new ArrayList<Payment>();			
		      String query = null;
		      query =   " SELECT DISTINCT s.b_name,mb.m_b_name,u.full_name,`po_number`, `po_date`, `vendorName`, `item_name`, `per_item_amt`, "+
			            " `quantity`, `cgst_per`, `cgst_amt`, `sgst_per`, `sgst_amt`, `amount`, `total_amt`, `cheque_no`, `tds_per`, `tds_amt`, "+
			            " `payment_date`, `delivery_date`, `bill_no`, `bill_date`, `remarks`, `file_path`, `igst_per`, `igst_amt` "+
			            " FROM procurement_payment c "+  
						" INNER JOIN branch_master s ON c.branchId = s.id"+
						" INNER JOIN leavemanagement.user u ON c.initiator = u.emp_id"+
						" INNER JOIN branch_master_main mb ON c.initiator_Branch = mb.m_b_no"+
						" WHERE po_date >=  ?"+
						" AND po_date <=  ?"+
						" AND c.initiator_Branch = ?"+
						" Order by c.branchNo";		
		     try {
			
					 preparedStatement = con.prepareStatement(query);
			 
					 preparedStatement.setDate(1, new java.sql.Date(startDate.getTime() ));
					 preparedStatement.setDate(2,new java.sql.Date(endDate.getTime()));
					 preparedStatement.setInt(3, branchId);
					 
				     resultSet = preparedStatement.executeQuery();
					
				     while(resultSet.next())
					 {
				    	    Payment payment = new Payment();
					
				    	    payment.setBranchName(resultSet.getString("m_b_name"));
				            payment.setBranchLocation(resultSet.getString("b_name"));
		              	    payment.setFull_name(resultSet.getString("full_name"));
			              	payment.setPo_number(resultSet.getString("po_number"));
			              	payment.setPo_date(resultSet.getDate("po_date"));
			              	payment.setVendorName(resultSet.getString("vendorName"));
			              	payment.setItem_name(resultSet.getString("item_name"));
			              	payment.setPer_item_amt(resultSet.getFloat("per_item_amt"));
			              	payment.setQuantity(resultSet.getInt("quantity"));
			              	payment.setCgst_per(resultSet.getFloat("cgst_per"));
				            payment.setCgst_amt(resultSet.getFloat("cgst_amt"));
				            payment.setSgst_per(resultSet.getFloat("sgst_per"));
				            payment.setIgst_amt(resultSet.getFloat("igst_amt"));
				            payment.setIgst_per(resultSet.getFloat("igst_per"));
				            payment.setSgst_amt(resultSet.getFloat("sgst_amt"));
				            payment.setAmount(resultSet.getFloat("amount"));
				            payment.setTotal_amt(resultSet.getFloat("total_amt"));
				            payment.setCheque_no(resultSet.getString("cheque_no"));
				            payment.setPayment_date(resultSet.getString("payment_date"));
				            payment.setDelivery_date(resultSet.getString("delivery_date"));
			              	payment.setBill_no(resultSet.getString("bill_no"));
			              	payment.setBill_date(resultSet.getString("bill_date"));
			              	payment.setRemarks(resultSet.getString("remarks"));
			              	payment.setTds_amt(resultSet.getFloat("tds_amt"));
				            payment.setTds_per(resultSet.getFloat("tds_per"));
			              	
			              	payments.add(payment);
		      }
				} catch (Exception e) {
							e.printStackTrace();
				
					 }
					 finally {
						 con.close();
						}
				return payments;
  }
}
	
