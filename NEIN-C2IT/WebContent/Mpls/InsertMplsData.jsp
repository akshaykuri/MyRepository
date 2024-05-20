<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import="CON2.Connection2"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@page language="java"%> 

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>

 <%
            
            Connection con1 = null,con2 = null,con3 = null;
      	    Connection2 dbConn = new Connection2();
      	    
	        con1 = dbConn.getConnection2();
	        con2 = dbConn.getConnection2();

			 Statement st2=null,st1=null,st3=null;
			 String msg=null;
			 ResultSet rs2=null,rs1=null,rs3=null;
			 PreparedStatement prds1=null,prds3=null;
			 
			 String circuitId=null,linktype=null,Wanpool=null,lanpool=null,Account_Relationship=null,Bandwidth=null,Media=null,ARC=null;
			 String OTC=null,pono=null,podate=null,empid=null,billref=null,billdate=null,fromdate=null,todate=null,invoiceNo=null,chequeNo=null;
			 String invoiceDate=null,chequedate=null,path=null,isp_name=null;
		     int branchNo=0,branchId=0,month=0;
		     float amount=0,tax=0,tax1=0,tds=0,totalAmt=0,totalPayment=0,invoiceAmt=0,chequeAmt=0,finalAmt=0,tax_per=0,tax_per1=0,tds_per=0;
		     ArrayList<String> filenameList = new ArrayList<String>();
		        
		     String ib_no=(String)session.getAttribute("b_no");
		     int ibranch=0;
		     ibranch=Integer.parseInt(ib_no);
		        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				Calendar c = Calendar.getInstance();
				
			    c.setTime(new Date());
				c.add(Calendar.DATE,0);  
				String date1 = sdf1.format(c.getTime());
		     
				 String itemName ="";
  try
   {
	 int k=0;
	 
		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 if (!isMultipart)
		 {
		 }
		 else
		 {
		 FileItemFactory factory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(factory);
		 List items = null;
		 try
		 {
		 items = upload.parseRequest(request);
		 }
		 catch (FileUploadException e)
		 {
		 e.getMessage();
		 }
		  
		 Iterator itr = items.iterator();
		 
		 
   while (itr.hasNext())
		{
		 FileItem item = (FileItem) itr.next();
		 
  if (item.isFormField())
		 {
		 String name = item.getFieldName();
		 String value = item.getString();
		
		 if(name.equals("b_id"))
		 {
			 String branch=value;
			 branchId=Integer.parseInt(branch);
		 }
		 if(name.equals("empid"))
		 {
			 empid=value;
		 }
		 if(name.equals("b_no"))
		 {
			 String branch_no=value;
			 branchNo=Integer.parseInt(branch_no);
		 }
		 if(name.equals("circuitid"))
		 {
			 circuitId=value;
		 }
		 if(name.equals("isp_name"))
		 {
			 isp_name=value;
		 }
		 
		 if(name.equals("Linktype"))
		 {
			 linktype=value;
		 }
		 
		 if(name.equals("WAN"))
		 {
			 Wanpool=value;
		 }
		 
		 if(name.equals("LAN"))
		 {
			
			 lanpool=value;
		 }
		 if(name.equals("Account_Relationship"))
		 {
			 Account_Relationship=value;
		 }
		 if(name.equals("Bandwidth"))
		 {
			 Bandwidth=value;
		 }
		 if(name.equals("Media"))
		 {
			 Media=value;
		 }
		 if(name.equals("ARC"))
		 {
			 ARC=value;
		 }
		 if(name.equals("OTC"))
		 {
			 OTC=value;
		 }
		 if(name.equals("ponumber"))
		 {
			 pono=value;
		 }
		 if(name.equals("podate"))
		 {
			 podate=value;
		 }
		 if(name.equals("billref"))
		 {
			 billref=value;
		 }
		 if(name.equals("billdate"))
		 {
			  billdate=value;
			  String str[] =billdate.split("-");
			  month = Integer.parseInt(str[1]);
		 }
		 if(name.equals("fromdate"))
		 {
			 fromdate=value;
		 }
		 if(name.equals("todate"))
		 {
			 todate=value;
		 }
		
		 if(name.equals("amount"))
		 {  
				if(item.getString().isEmpty()){
					amount=0;
				   }
				else{
					amount =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("tdsamount"))
		 {   
				if(item.getString().isEmpty()){
					tds=0;
				   }
				else{
					tds =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("tds"))
		 {   
				if(item.getString().isEmpty()){
					tds_per=0;
				   }
				else{
					tds_per =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("taxamount"))
		 {  
				if(item.getString().isEmpty()){
					tax=0;
				   }
				else{
					tax =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("taxamount1"))
		 {  
				if(item.getString().isEmpty()){
					tax1=0;
				   }
				else{
					tax1 =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("tax"))
		 {  
				if(item.getString().isEmpty()){
					tax_per=0;
				   }
				else{
					tax_per =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("tax1"))
		 {  
				if(item.getString().isEmpty()){
					tax_per1=0;
				   }
				else{
					tax_per1 =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("totalAmt"))
		 {   
				if(item.getString().isEmpty()){
					totalAmt=0;
				   }
				else{
					totalAmt =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("finalAmt"))
		 {   
				if(item.getString().isEmpty()){
					totalPayment=0;
				   }
				else{
					totalPayment =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 
		/*  if(name.equals("invoiceno")) 
		 {
		      invoiceNo=value;
		 }
		 if(name.equals("invoiceDate"))
		 {
			 invoiceDate=value;
		 }
		 
		 if(name.equals("invoiceAmt"))
		 { 
		
			 if(item.getString().isEmpty()){
				 invoiceAmt=0;
				   }
				else{
					invoiceAmt =Float.parseFloat(item.getString());						
	  		       }
		 } */
		 
		 if(name.equals("chequeno"))
		 {
			  chequeNo=value;
		 }
		 if(name.equals("chequeDate"))
		 {
			  chequedate=value;
		 }
		 if(name.equals("chequeamt"))
		 {  
				if(item.getString().isEmpty()){
					chequeAmt=0;
				   }
				else{
					chequeAmt =Float.parseFloat(item.getString());						
	  		       }
		    }
		 	
		 }
      else
		 {   
		 try
		 {	
		   itemName = item.getName();
		   filenameList.add(itemName);
		 
		   File savedFile = new File("E:/neinSoft/files/C2IT/MPLS/"+empid+"/"+billdate);
		   path="E:/neinSoft/files/C2IT/MPLS/"+empid+"/"+billdate;
		 
		  if(!savedFile.exists()) 
		  {
		    savedFile.mkdirs();
		    savedFile.setWritable(true);
		
			 }
		 File  insertFile = new File("E:/neinSoft/files/C2IT/MPLS/"+empid+"/"+billdate+"/"+itemName);
		 item.write(insertFile);
		 
		 }
		 catch (Exception e)
		 {
		 out.println("Error"+e.getMessage());
		 }
		 
		 }
		 }
   
		 try
		 { 
			 int id=0,i1=0;
			 String query1 = "select max(mpls_id) from mpls_details";
			 st1 = con1.createStatement();
			 rs1 = st1.executeQuery(query1);
			 
             if(rs1.next()){
            	  id=rs1.getInt(1); 
    	          id=id+1;
             }
             if(id == 0){
            	 id=id+1;
             }
            
             String query3 = "select mpls_id from mpls_details where circuit_Id='"+circuitId+"' AND `bill_date`='"+billdate+"'";
			 st2 = con2.createStatement();
			 rs2 = st2.executeQuery(query3);
			 
		 if(!rs2.next()){	 
            	
			       for(int j=0;j<filenameList.size();j++){
			    	   
			              String query2=" INSERT INTO `mpls_details`(`mpls_id`, `emp_id`, `circuit_Id`, `linktype_id`, `branch_id`, `branch_no`, `lanpool`, `wanpool`,"+
			            		        " `acc_relation_no`, `bandwidth`, `media`, `arc`, `otc`, `po_number`, `po_date`, `bill_refno`, `bill_date`, `bill_fdate`,"+
			            		        " `bill_tdate`, `amount`, `tds_amt`, `cgst_amount`, `total_invoice_amt`, `total_pay_amt`, "+
			            		        " `cheque_no`, `cheque_amt`, `cheque_date`, `created_date`, `invoice_file`,`tds_percentage`,`tax_percentage`,`tax_percentage1`,`sgst_amount`,`isp_name`,`initiator_Branch`) "+
			            		        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";   
			  	        
										prds1 = con2.prepareStatement(query2);
										
										prds1.setInt(1,id);
										prds1.setString(2,empid);
								        prds1.setString(3,circuitId);
								        prds1.setString(4,linktype);
								        prds1.setInt(5,branchId);
								        prds1.setInt(6,branchNo);
								        prds1.setString(7,lanpool);
								        prds1.setString(8,Wanpool);
								        prds1.setString(9,Account_Relationship);
								        prds1.setString(10,Bandwidth);
								        prds1.setString(11,Media);
								        prds1.setString(12,ARC);
								        prds1.setString(13,OTC);
								        prds1.setString(14,pono);
								        prds1.setString(15,podate);
								        prds1.setString(16,billref);
								        prds1.setString(17,billdate);
								        prds1.setString(18,fromdate);
								        prds1.setString(19,todate);
								        prds1.setFloat(20,amount);
								        prds1.setFloat(21,tds);
								        prds1.setFloat(22,tax);
								        prds1.setFloat(23,totalAmt);
								        prds1.setFloat(24,totalPayment);
								        prds1.setString(25,chequeNo);
								        prds1.setFloat(26,chequeAmt);
								        prds1.setString(27,chequedate);
								        prds1.setString(28,date1);
								        prds1.setString(29,path+"/"+filenameList.get(j));
								        prds1.setFloat(30,tds_per);
								        prds1.setFloat(31,tax_per);
								        prds1.setFloat(32,tax_per1);
								        prds1.setFloat(33,tax1);
								        prds1.setString(34,isp_name);
								        prds1.setInt(35,ibranch);
								        
								        i1= prds1.executeUpdate();
			    				       
			                       }
			       
				  }  
				  if(i1 == 1){
			    	   
			    	   msg = "MPLS__data__inserted__successfully::";
			          }
			       else{
			    	   msg = "MPLS__data__Already__Inserted__For__This__Month";
			        }
		      }
			 catch(Exception el)
			 {
			 out.println("Inserting error"+el.getMessage());
			 }
			 
			 }
		        response.sendRedirect("InsertMpls.jsp?msg="+msg);
			   
			 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

