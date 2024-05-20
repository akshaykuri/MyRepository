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
			 
			 String empid=null,po_number=null,po_date=null,vendorName=null,	item_name=null,cheque_no=null,payment_date=null,delivery_date=null;
			 String bill_no=null,bill_date=null,remarks=null,file_path=null,path=null;
		     int branchId1=0,branchNo=0,branchId=0,quantity=0,id=0,i1=0;
		     float amount=0,per_item_amt=0,cgst_per=0,cgst_amt=0,sgst_per=0,sgst_amt=0,totalPayment=0,igst_per=0,igst_amt=0,tds_per=0,tds_amt=0;
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
		 
		/*  if(name.equals("mlocation"))
		 {
			 String branch1=value;
			 branchId1=Integer.parseInt(branch1);
		 } */
		
		 if(name.equals("location"))
		 {
			 String branch=value;
			 branchId=Integer.parseInt(branch);
		 }
		 if(name.equals("empid"))
		 {
			 empid=value;
		 }
		 /* if(name.equals("b_no"))
		 {
			 String branch_no=value;
			 branchNo=Integer.parseInt(branch_no);
		 } */
		 if(name.equals("item_desc"))
		 {
				item_name=value;
		 }
		 if(name.equals("vendorName"))
		 {
			 vendorName=value;
		 }
		 
		 if(name.equals("ponumber"))
		 {
			 po_number=value;
		 }
		 
		 if(name.equals("podate"))
		 {
			 po_date=value;
		 }
		 
		 if(name.equals("quantity"))
		 {
			 String qua=value;
			 quantity=Integer.parseInt(qua);
		 }
		 
		/*  if(name.equals("billdate"))
		 {
			  billdate=value;
			  String str[] =billdate.split("-");
			  month = Integer.parseInt(str[1]);
		 } */
		 if(name.equals("billDate"))
		 {
			 bill_date=value;
		 }
		 if(name.equals("Amount"))
		 {  
				if(item.getString().isEmpty()){
					amount=0;
				   }
				else{
					amount =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("per_itemAmt"))
		 {   
				if(item.getString().isEmpty()){
					per_item_amt=0;
				   }
				else{
					per_item_amt =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("cgst"))
		 {   
				if(item.getString().isEmpty()){
					cgst_per=0;
				   }
				else{
					cgst_per =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("cgst_amt"))
		 {  
				if(item.getString().isEmpty()){
					cgst_amt=0;
				   }
				else{
					cgst_amt =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("sgst"))
		 {   
				if(item.getString().isEmpty()){
					sgst_per=0;
				   }
				else{
					sgst_per =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("sgst_amt"))
		 {  
				if(item.getString().isEmpty()){
					sgst_amt=0;
				   }
				else{
					sgst_amt =Float.parseFloat(item.getString());						
	  		       }
		}
		 if(name.equals("igst"))
		 {   
				if(item.getString().isEmpty()){
					igst_per=0;
				   }
				else{
					igst_per =Float.parseFloat(item.getString());						
	  		       }
				
		 }
		 if(name.equals("igst_amt"))
		 {  
				if(item.getString().isEmpty()){
					igst_amt=0;
				   }
				else{
					igst_amt =Float.parseFloat(item.getString());						
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
		 if(name.equals("tds_amt"))
		 {  
				if(item.getString().isEmpty()){
					tds_amt=0;
				   }
				else{
					tds_amt =Float.parseFloat(item.getString());						
	  		       }
		}
		 
		
		 if(name.equals("total_amt"))
		 {  
				if(item.getString().isEmpty()){
					totalPayment=0;
				   }
				else{
					totalPayment =Float.parseFloat(item.getString());						
	  		       }
		}
		
		 if(name.equals("chequeNo"))
		 {
			 cheque_no=value;
		 }
		 if(name.equals("deliveryDate"))
		 {
			 delivery_date=value;
		 }
		 if(name.equals("billNo"))
		 {
			 bill_no=value;
		 }
		 if(name.equals("payMentDate"))
		 {
			 payment_date=value;
		 }
		 if(name.equals("remarks"))
		 {
			 remarks=value;
		 }
		 
		 }
      else
		 {   
		 try
		 {	
		   itemName = item.getName();
		   filenameList.add(itemName);
		 
		   File savedFile = new File("E:/neinSoft/files/C2IT/Paymet/"+empid+"/"+po_date);
		   path="E:/neinSoft/files/C2IT/Paymet/"+empid+"/"+po_date;
		 
		  if(!savedFile.exists()) 
		  {
		    savedFile.mkdirs();
		    savedFile.setWritable(true);
		
			 }
		 File  insertFile = new File("E:/neinSoft/files/C2IT/Paymet/"+empid+"/"+po_date+"/"+itemName);
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
			 
			 String query1 = "select max(id) from procurement_payment";
			 st1 = con1.createStatement();
			 rs1 = st1.executeQuery(query1);
			 
             if(rs1.next()){
            	  id=rs1.getInt(1); 
    	          id=id+1;
             }
             if(id == 0){
            	 id=id+1;
             }
            
             String query3 = "select b_no from branch_master where id='"+branchId+"'";
			 st2 = con2.createStatement();
			 rs2 = st2.executeQuery(query3);
			
		 if(rs2.next()){	 
			             branchNo=rs2.getInt("b_no");
		               }
			              String query2=" INSERT INTO `procurement_payment`(`id`, `initiator`, `branchId`, `branchNo`, `po_number`, `po_date`,"+
			            		        " `vendorName`, `item_name`, `per_item_amt`, `quantity`, `cgst_per`, `cgst_amt`, `sgst_per`, `sgst_amt`,"+
			            		        " `amount`, `total_amt`, `cheque_no`, `payment_date`, `delivery_date`, `bill_no`, `bill_date`, `remarks`,"+
			            		        " `file_path`,`initiator_Branch`,`created_date`,`igst_per`,`igst_amt`,`tds_per`,`tds_amt`) "+
			            		        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";   
			              
										prds1 = con2.prepareStatement(query2);
										
										prds1.setInt(1,id);
										prds1.setString(2,empid);
								        prds1.setInt(3,branchId);
								        prds1.setInt(4,branchNo);
								        prds1.setString(5,po_number);
								        prds1.setString(6,po_date);
								        prds1.setString(7,vendorName);
								        prds1.setString(8,item_name);
								        prds1.setFloat(9,per_item_amt);
								        prds1.setInt(10,quantity);
								        prds1.setFloat(11,cgst_per);
								        prds1.setFloat(12,cgst_amt);
								        prds1.setFloat(13,sgst_per);
								        prds1.setFloat(14,sgst_amt);
								        prds1.setFloat(15,amount);
								        prds1.setFloat(16,totalPayment);
								        prds1.setString(17,cheque_no);
								        prds1.setString(18,payment_date);
								        prds1.setString(19,delivery_date);
								        prds1.setString(20,bill_no);
								        prds1.setString(21,bill_date);
								        prds1.setString(22,remarks);
								        prds1.setString(23,path+"/"+itemName);
								       // prds1.setInt(24,ibranch);
								        
								        prds1.setInt(24,branchNo);
								        
								        prds1.setString(25,date1);
								        prds1.setFloat(26,igst_per);
								        prds1.setFloat(27,igst_amt);
								        prds1.setFloat(28,tds_per);
								        prds1.setFloat(29,tds_amt);
								        
								        i1= prds1.executeUpdate();
				         	
								        if(i1 == 1){
									    	   
									    	   msg = "Payment__Data__Inserted__successfully::";
									          }
									        else{
									    	   msg = "Payment__Data__Not__Inserted__Try__Again";
									        } 
				           }
		 
					   catch(Exception el)
					   {
					    out.println("Inserting__error"+el.getMessage());
					   }
		            }
				    }
				    catch(Exception el)
				   {
				    out.println("Inserting__error"+el.getMessage());
				   }
				   
				   response.sendRedirect("CreatePayment.jsp?msg="+msg);
				        
				     
	%>

