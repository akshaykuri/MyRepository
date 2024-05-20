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
			 
			 String location=null,branchNo1=null,vendorName=null;
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
			     
		     
		        ArrayList<String> filenameList = new ArrayList<String>();
		     
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
		 if(name.equals("empid"))
		 {
			 empid=value;
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
			 
			 String query3 = "select max(id) from catridge_details";
			 st3 = con3.createStatement();
			 rs3 = st3.executeQuery(query3);
			 
             if(rs3.next()){
    	          id3=rs3.getInt(1); 
    	          id3=id3+1;
    	         
             }

            for(int j=0;j<printerName.size();j++){
    	   
	    	      String query1 = "select max(catridge_id) from catridge_details";
				  st1 = con1.createStatement();
				  rs1 = st1.executeQuery(query1);
				  int id=0;
				  
	              if(rs1.next()){
	    	          id=rs1.getInt(1);  
	    	          id=id+1;
	               }
    	  
              String query2=" INSERT INTO `catridge_details`(`catridge_id`, `printer_name`, `catridge_model`, `empid`, `branch_id`,"+
					        " `branch_no`, `quantity`, `cost`, `amount`, `vendor_name`, `po_number`, `invoiceno`, `invoice_amt`, "+
					        " `invoice_date`, `invoice_file`, `chequeno`, `chequeAmt`, `cheque_date`, `month_of_payment`, "+
					        " `createddate`,`totalAmt`,`id`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";   
  	        
							prds1 = con2.prepareStatement(query2);
							
							prds1.setInt(1,id);
							prds1.setString(2,printerName.get(j));
					        prds1.setString(3,cartridge.get(j));
					        prds1.setString(4,empid);
					        prds1.setInt(5,branchid);
					        prds1.setInt(6,branchNo);
					        prds1.setInt(7,quantity.get(j));
					        prds1.setFloat(8,cost.get(j));
					        prds1.setFloat(9,amount.get(j));
					        prds1.setString(10,vendorName);
					        prds1.setString(11,poNumber);
					        prds1.setString(12,invoiceno.get(j));
					        prds1.setFloat(13,invoiceAmt.get(j));
					        prds1.setString(14,invoicedate.get(j));
					        prds1.setString(15,path+"/"+filenameList.get(j));
					        prds1.setString(16,chequeno.get(j));
					        prds1.setFloat(17,chequeAmt.get(j));
					        prds1.setString(18,chequedate.get(j));
					        prds1.setString(19,monthOfPayment);
					        prds1.setString(20,date1);
					        prds1.setFloat(21,totalAmt);
					        prds1.setInt(22,id3);
					       
					        i1= prds1.executeUpdate();
    				       if(i1 == 1){
    				    	   
    				    	   msg = "Catridge_data_inserted_successfully::";
    				          }
    				       else{
    				    	   msg = "Catridge_data_Not_inserted";
    				        }
                   }
                            
		    }
			 catch(Exception el)
			 {
			 out.println("Inserting error"+el.getMessage());
			 }
			 }
			    
		        response.sendRedirect("InsertCatridgeDetails.jsp?msg="+msg);
			   
			 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

