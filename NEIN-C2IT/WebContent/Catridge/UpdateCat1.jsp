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
<%-- <%@ include file="getcon.jsp"%> --%>

 <%
            int i1=0;int id3=0;
            int i2=0;int aa=0;
            Connection con1 = null,con2 = null,con3 = null;
      	    Connection2 dbConn = new Connection2();
	        con1 = dbConn.getConnection2();
	        con2 = dbConn.getConnection2();
	        con3 = dbConn.getConnection2();

			 Statement st2=null,st1=null,st3=null;
			 String msg=null;
			 ResultSet rs2=null,rs1=null,rs3=null;
			 PreparedStatement prds1=null,prds3=null;
			 
			 String location=null,branchNo1=null,vendorName=null,todate=null,fromdate=null;
			 String empid=null,poNumber=null,monthOfPayment=null,path=null,status1=null;
		     int branchid=0,branchNo=0;
		     float totalAmt=0;
		     String []fileName=null;
		     
			     ArrayList<String> cartridge = new ArrayList<String>();
			     ArrayList<String> printerName = new ArrayList<String>();
			     ArrayList<Float> cost = new ArrayList<Float>();
			     ArrayList<Integer> quantity = new ArrayList<Integer>();
			     ArrayList<Float> amount = new ArrayList<Float>();
			     ArrayList<String> invoiceno = new ArrayList<String>();
			     ArrayList<Float> invoiceAmt = new ArrayList<Float>();
			     ArrayList<String> invoicedate = new ArrayList<String>();
			     ArrayList<String> chequeno = new ArrayList<String>();
			     ArrayList<Float> chequeAmt = new ArrayList<Float>();
			     ArrayList<String> chequedate = new ArrayList<String>();
			     ArrayList<Integer> cid = new ArrayList<Integer>();
		     
		        ArrayList<String> filenameList = new ArrayList<String>();
		        ArrayList<String> file = new ArrayList<String>();
		     
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
			
			 if(name.equals("location"))
			 {
				 location=value;
				 branchid=Integer.parseInt(location);
			 }
			 if(name.equals("todate"))
			 {
				 todate=value;
			 }
			 if(name.equals("fromdate"))
			 {
				 fromdate=value;
				
			 }
			 if(name.equals("initiator"))
			 {
				 empid=value;
			 }
			 if(name.equals("cid"))
			 {
				 String cid1=value;
				 int cid2=Integer.parseInt(cid1);
				 cid.add(cid2); 
			 }
			 if(name.equals("branchNo"))
			 {
				 branchNo1=value;
				 branchNo=Integer.parseInt(branchNo1);
			 }
			 if(name.equals("poNumber"))
			 {
				 poNumber=value;
			 }
			 
			 if(name.equals("monthOfPayment"))
			 {
				  monthOfPayment=value;
			 }
			 
			 if(name.equals("vendorName"))
			 {
				 vendorName=value;
			 }
			 
			 if(name.equals("Cartridge"))
			 {
				 String cat=value;
				 cartridge.add(cat); 
			 }
			 if(name.equals("printername"))
			 {
				 String pname=value;
				 printerName.add(pname); 
			 }
			 
			 if(name.equals("cost"))
			 {    float cost1=0;
					if(item.getString().isEmpty()){
						cost1=0;
					   }
					else{
						cost1 =Float.parseFloat(item.getString());						
		  		       }
					cost.add(cost1); 
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
			 if(name.equals("quantity"))
			 {    int quantity1=0;
					if(item.getString().isEmpty()){
						quantity1=0;
					   }
					else{
						quantity1 =Integer.parseInt(item.getString());						
		  		       }
					quantity.add(quantity1); 
			 }
			 
			 if(name.equals("amount"))
			 {    float amount1=0;
					if(item.getString().isEmpty()){
						amount1=0;
					   }
					else{
						amount1 =Float.parseFloat(item.getString());						
		  		       }
					amount.add(amount1); 
			 }
			 
			 if(name.equals("invoiceno")) 
			 {
				String  invoiceno1=value;
				invoiceno.add(invoiceno1); 
			 }
			 if(name.equals("invoiceDate"))
			 {
				 String invoiceDate1=value;
				 invoicedate.add(invoiceDate1); 
			 }
			 
			 if(name.equals("invoiceAmt"))
			 { 
				 float invoiceAmt1=0;
				 if(item.getString().isEmpty()){
					 invoiceAmt1=0;
					   }
					else{
						invoiceAmt1 =Float.parseFloat(item.getString());						
		  		       }
				 invoiceAmt.add(invoiceAmt1); 
			 }
			 
			 if(name.equals("chequeno"))
			 {
				 String chequeno1=value;
				 chequeno.add(chequeno1); 
			 }
			 if(name.equals("chequeDate"))
			 {
				 String chequeDate1=value;
				 chequedate.add(chequeDate1); 
			 }
			 if(name.equals("chequeamt"))
			 {  
				    float chequeamt1=0;
					if(item.getString().isEmpty()){
						chequeamt1=0;
					   }
					else{
						chequeamt1 =Float.parseFloat(item.getString());						
		  		       }
					chequeAmt.add(chequeamt1); 
			 }
			 if(name.equals("path"))
			 {
				 String file1=value;
				 file.add(file1);
			 }
			 	
			 }
	      else
			 {
			 try
			 {	
			   itemName = item.getName();
			   filenameList.add(itemName);
			 
			   File savedFile = new File("E:/neinSoft/files/C2IT/Catridge/"+empid+"/"+monthOfPayment+"/"+cartridge.get(aa));
			   path="E:/neinSoft/files/C2IT/Catridge/"+empid+"/"+monthOfPayment+"/"+cartridge.get(aa);
			 
			  if(!savedFile.exists()) 
			  {
			    savedFile.mkdirs();
			    savedFile.setWritable(true);
			
				 }
			 File  insertFile = new File("E:/neinSoft/files/C2IT/Catridge/"+empid+"/"+monthOfPayment+"/"+cartridge.get(aa)+"/"+itemName);
			 item.write(insertFile);
			 aa++;
			 }
			 catch (Exception e)
			 {
			 out.println("Error"+e.getMessage());
			 }
			 
			 }
			 }
	   
			 try
			 { 
				
	            for(int j=0;j<printerName.size();j++){
	    	   
	            	path="E:/neinSoft/files/C2IT/Catridge/"+empid+"/"+monthOfPayment+"/"+cartridge.get(j);
	            	
	            	if(filenameList.get(j) == ""){
	            		path=file.get(j);
	            		
	            	}
	            	else{
	            		path=path+"/"+filenameList.get(j);
	            	}      			         
	      
	            	st1=con1.createStatement();
			        i1= st1.executeUpdate(" UPDATE `catridge_details` SET `printer_name`='"+printerName.get(j)+"',`catridge_model`='"+cartridge.get(j)+"',"+
			                              "`branch_id`='"+branchid+"',`branch_no`='"+branchNo+"',`quantity`='"+quantity.get(j)+"',`cost`='"+cost.get(j)+"',"+
			                              "`amount`='"+amount.get(j)+"',`vendor_name`='"+vendorName+"',`po_number`='"+poNumber+"',"+
			                              " `invoiceno`='"+invoiceno.get(j)+"',`invoice_amt`='"+invoiceAmt.get(j)+"',`invoice_date`='"+invoicedate.get(j)+"',"+
			                              "`invoice_file`='"+path+"',`chequeno`='"+chequeno.get(j)+"',`chequeAmt`='"+chequeAmt.get(j)+"',"+
			                              "`cheque_date`='"+chequedate.get(j)+"',`month_of_payment`='"+monthOfPayment+"',`totalAmt`='"+totalAmt+"'"+
			                              " WHERE `catridge_id`='"+cid.get(j)+"' ");   
			        
			        
	    				       if(i1 == 1){
	    				    	   
	    				    	   msg = "Catridge_data_Updated_successfully::";
	    				          }
	    				       else{
	    				    	   msg = "Catridge_data_Not_Updated";
	    				    	   i1=0;
	    				        }
	                 }
                            
		    }
			 catch(Exception el)
			 {
			 out.println("Update error"+el.getMessage());
			 }
			 }
			 response.sendRedirect("ViewCatForedit.jsp?msg="+msg+"&fromdate="+fromdate+"&todate="+todate+"&branch="+branchNo);
			 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

