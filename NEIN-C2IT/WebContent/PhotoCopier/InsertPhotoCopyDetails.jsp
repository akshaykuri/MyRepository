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
            int i1=0;
            int i2=0;
            Connection con1 = null,con2 = null,con3 = null;
      	    Connection2 dbConn = new Connection2();
	        con1 = dbConn.getConnection2();
	        con2 = dbConn.getConnection2();
	        con3 = dbConn.getConnection2();

			 Statement st2=null,st1=null,st3=null;
			 String msg=null;
			 ResultSet rs2=null,rs1=null,rs3=null;
			 PreparedStatement prds1=null,prds3=null;
			 
			 String b_id=null,b_no=null,machinetype=null,vendortype=null,brand=null,modelno=null,sno=null,agreementno=null,chequeNo=null,vendorname=null;
		     int branchid=0,branchno=0;
		     String empid=null,rentamt1=null,txtamt1=null,totalamt1=null,chequeDate1=null,monthOfPayment1=null,closingdate1=null,openingdate1=null,installdate1=null;
		     float rentamt=0,totalamt=0,txtamt=0,chequeamt=0,rcgst_per=0,rcgst_Amt=0,rinvoiceAmt=0,rsgst_per=0,rsgst_Amt=0;
		     
		     String phototype1=null,closingbalance1=null,openingbalance1=null,numberofcopies1=null,freecopies1=null,extracopies1=null,percopy1=null;
		     String charged1=null,invoiceno1=null,invoiceAmt1=null,invoicedate1=null,path=null,status1=null,status2=null,rinvoiceno=null;
		     String agreementdate=null,agreementsdate=null,agreementedate=null,rinvoicedate=null;
		     
		     String []fileName=null;
		     
		     ArrayList<String> phototype = new ArrayList<String>();
		     ArrayList<String> invoiceno = new ArrayList<String>();
		     ArrayList<Integer> closingbalance = new ArrayList<Integer>();
		     ArrayList<Integer> openingbalance = new ArrayList<Integer>();
		     ArrayList<Integer> numberofcopies = new ArrayList<Integer>();
		     ArrayList<Integer> freecopies = new ArrayList<Integer>();
		     ArrayList<Integer> extracopies = new ArrayList<Integer>();
		     ArrayList<Float> percopy = new ArrayList<Float>();
		     ArrayList<Float> charged = new ArrayList<Float>();
		     
		     ArrayList<Float> cgst_per = new ArrayList<Float>();
		     ArrayList<Float> cgst_Amt = new ArrayList<Float>();
		     ArrayList<Float> sgst_per = new ArrayList<Float>();
		     ArrayList<Float> sgst_Amt = new ArrayList<Float>();
		     
		     ArrayList<Float> invoiceAmt = new ArrayList<Float>();
		     ArrayList<String> invoicedate = new ArrayList<String>();
		     
			
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
		
		 if(name.equals("bid"))
		 {
			 b_id=value;
			 branchid=Integer.parseInt(b_id);
		 }
		 if(name.equals("bno"))
		 {
			 b_no=value;
			 branchno=Integer.parseInt(b_no);
		 }
		 if(name.equals("machinetype"))
		 {
			 machinetype=value;
		 }
		 if(name.equals("vendortype"))
		 {
			 vendortype=value;
		 }
		 if(name.equals("brand"))
		 {
			 brand=value;
		 }
		 if(name.equals("modelno"))
		 {
			 modelno=value;
		 }
		 if(name.equals("sno"))
		 {
			 sno=value;
		 }
		 if(name.equals("agreementno"))
		 {
			 agreementno=value;
		 }
		 if(name.equals("chequeNo"))
		 {
			 chequeNo=value;
			 
		 }
		 if(name.equals("vendorname"))
		 {
			 vendorname=value;
		 }
		 if(name.equals("empid"))
		 {
			 empid=value;
		 }
		 if(name.equals("rentamt"))
		 {
				if(item.getString().isEmpty()){
					rentamt=0;
				   }
				else{
					rentamt =Float.parseFloat(item.getString());						
	  		       }
		 }
		 if(name.equals("txtamt"))
		 {
				if(item.getString().isEmpty()){
					txtamt=0;
				   }
				else{
					txtamt =Float.parseFloat(item.getString());						
	  		       }
		 }
		 if(name.equals("totalamt"))
		 {
				if(item.getString().isEmpty()){
					totalamt=0;
				   }
				else{
					totalamt =Float.parseFloat(item.getString());						
	  		       }
		 }
		 
		 if(name.equals("chequeamt"))
		 {
				if(item.getString().isEmpty()){
					chequeamt=0;
				   }
				else{
					chequeamt =Float.parseFloat(item.getString());						
	  		       }
		 }
		 if(name.equals("agreementdate")) 
		 {
			 agreementdate=value;
		 }
		 if(name.equals("agreementsdate")) 
		 {
			 agreementsdate=value;
		 }
		 if(name.equals("agreementedate")) 
		 {
			 agreementedate=value;
		 }
		 if(name.equals("chequeDate")) 
		 {
			 chequeDate1=value;
		 }
		 if(name.equals("monthOfPayment"))
		 {
			 monthOfPayment1=value;
		 }
		 if(name.equals("installdate"))
		 {
			 installdate1=value;
			 
		 }
		 if(name.equals("closingdate"))
		 {
			 closingdate1=value;
		 } 
		 if(name.equals("openingdate"))
		 {
			 openingdate1=value;
		 }
		
		 /* vvvvvvvvvv      vvvvvvvvvvvv */ 
		 if(name.equals("phototype"))
		 {
	    	 phototype1=value;
	    	 phototype.add(phototype1);
		 }
		 
		 
		 if(name.equals("closingbalance"))
		 {
	    	 closingbalance1=value;
	    	 int aa=Integer.parseInt(closingbalance1);
	    	 closingbalance.add(aa); 
	    	 
		 }
		 if(name.equals("openingbalance"))
		 {
			 openingbalance1=value;
	    	 int aa=Integer.parseInt(openingbalance1);
	    	 openingbalance.add(aa); 
	    	 
		 }
		 if(name.equals("numberofcopies"))
		 {
			 numberofcopies1=value;
	    	 int aa=Integer.parseInt(numberofcopies1);
	    	 numberofcopies.add(aa); 
	    	 
		 }
		 if(name.equals("freecopies"))
		 {
			 freecopies1=value; 
	    	 int aa=Integer.parseInt(freecopies1);
	    	 freecopies.add(aa); 
	    	 
		 }
		 if(name.equals("extracopies"))
		 {
			 extracopies1=value;
	    	 int aa=Integer.parseInt(extracopies1);
	    	 extracopies.add(aa); 
	    	 
		 }
		 if(name.equals("rcgst_per"))
		 {
			 String rcgst_per1=value;
			 rcgst_per=Float.parseFloat(rcgst_per1);	    	 
		 }
		 if(name.equals("rcgst_Amt"))
		 {
			 String rcgst_Amt1=value;
			 rcgst_Amt=Float.parseFloat(rcgst_Amt1);	    	 
		 }
		 if(name.equals("rsgst_per"))
		 {
			 String rsgst_per1=value;
			 rsgst_per=Float.parseFloat(rsgst_per1);	    	 
		 }
		 if(name.equals("rsgst_Amt"))
		 {
			 String rsgst_Amt1=value;
			 rsgst_Amt=Float.parseFloat(rsgst_Amt1);	    	 
		 }
		 if(name.equals("percopy"))
		 {
			 percopy1=value;
			 float aa=Float.parseFloat(percopy1);
	    	 percopy.add(aa); 
	    	 
		 }
		 if(name.equals("cgst_per"))
		 {
			 String cgst_per1=value;
			 float cgst_per0=0;
	    	 if(value.isEmpty()){
	    		 cgst_per0 = 0;
				}else{
					cgst_per0 = Float.parseFloat(cgst_per1);
				}
	    	 cgst_per.add(cgst_per0);
		 }
		 if(name.equals("cgst_Amt"))
		 {
			 String cgst_Amt1=value;
			 float cgst_Amt0=0;
	    	 if(value.isEmpty()){
	    		 cgst_Amt0 = 0;
				}else{
					cgst_Amt0 = Float.parseFloat(cgst_Amt1);
				}
	    	 cgst_Amt.add(cgst_Amt0);
		 }
		 if(name.equals("sgst_per"))
		 {
			 String sgst_per1=value;
			 float sgst_per0=0;
	    	 if(value.isEmpty()){
	    		 sgst_per0 = 0;
				}else{
					sgst_per0 = Float.parseFloat(sgst_per1);
				}
	    	 sgst_per.add(sgst_per0);
		 }
		 if(name.equals("sgst_Amt"))
		 {
			 String sgst_Amt1=value;
			 float sgst_Amt0=0;
	    	 if(value.isEmpty()){
	    		 sgst_Amt0 = 0;
				}else{
					sgst_Amt0 = Float.parseFloat(sgst_Amt1);
				}
	    	 sgst_Amt.add(sgst_Amt0);
		 }
		 if(name.equals("charged"))
		 {
			 charged1=value;
			 float aa=Float.parseFloat(charged1);
	    	 charged.add(aa); 
	    	 
		 }
		 if(name.equals("invoiceno"))
		 {
			 invoiceno1=value;
			 invoiceno.add(invoiceno1);
		 }
		 
		 
		 if(name.equals("invoicedate"))
		 {
			 invoicedate1=value;
			 invoicedate.add(invoicedate1);
			
		 } 
		 if(name.equals("rinvoiceno"))
		 {
			 rinvoiceno=value;
		 }
		 
		 
		 if(name.equals("rinvoicedate"))
		 {
			   rinvoicedate=value;
			
		 } 
		 if(name.equals("invoiceAmt"))
		 {
			  invoiceAmt1=value;
			  /*float aa=Float.parseFloat(invoiceAmt1);
	    	  invoiceAmt.add(aa);  */
	    	 float aa=0;
	    	 if(value.isEmpty()){
	    		  aa = 0;
				}else{
					aa = Float.parseFloat(invoiceAmt1);
				}
	    	 invoiceAmt.add(aa);
		 }
		 if(name.equals("rinvoiceAmt"))
		 {
			 String invoiceAmt4=value;
	    	 if(value.isEmpty()){
	    		 rinvoiceAmt = 0;
				}else{
					rinvoiceAmt = Float.parseFloat(invoiceAmt4);
				}
	    	 }
		   
		 }
      else
		 {
		 try
		 {
		 itemName = item.getName();
		 filenameList.add(itemName);
		
		 File savedFile = new File("E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+date1+"/"+sno);
		 path="E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+date1+"/"+sno;
		 if(!savedFile.exists()) 
		 {
		  savedFile.mkdirs();
		  savedFile.setWritable(true);
		
			 }
		File  insertFile = new File("E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+date1+"/"+sno+"/"+itemName);
		
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
             String query1 = "select max(ph_id) from photocopier_details";
				 st1 = con1.createStatement();
				 rs1 = st1.executeQuery(query1);
				 int id=0;
              if(rs1.next()){
          	       id=rs1.getInt(1);  
          	       id=id+1;
                 }
			if(chequeNo.isEmpty() || chequeDate1.isEmpty()){ status1="Pending"; }
			else{ status1="Completed"; }
			
              String query2=" INSERT INTO `photocopier_details`(`brand`, `modelno`, `serialno`, `agreementno`, "+
                            " `vendortype`, `machinetype`, `branch_id`, `branch_no`, `cheque_no`, `cheque_date`, "+
                            " `month_of_payment`,`rentamt`, `taxamt`, `total_amt`,`ph_id`,`vendorname`,`closingdate`,"+
                            " `openingdate`,`empid`,`status`,`createddate`,`installeddate`,`agreementdate`,`agreementsdate`,"+
                            " `agreementedate`,`chequeAmt`,`rcgst_per`,`rcgst_amt`,`rsgst_per`,`rsgst_amt`,`rinvoice_no`,"+
                            " `rinvoice_date`,`rinvoice_Amt`,`rinvoice_file`) "+
                            " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";   
                	        
    						prds1 = con2.prepareStatement(query2);
    				        prds1.setString(1,brand);
    				        prds1.setString(2,modelno);
    				        prds1.setString(3,sno);
    				        prds1.setString(4,agreementno);
    				        prds1.setString(5,vendortype);
    				        prds1.setString(6,machinetype);
    				        prds1.setInt(7,branchid);
    				        prds1.setInt(8,branchno);
    				        prds1.setString(9,chequeNo);
    				        prds1.setString(10,chequeDate1);
    				        prds1.setString(11,monthOfPayment1);
    				        prds1.setFloat(12,rentamt);
    				        prds1.setFloat(13,txtamt);
    				        prds1.setFloat(14,totalamt);
    				        prds1.setInt(15,id);
    				        prds1.setString(16,vendorname);
    				        prds1.setString(17,closingdate1);
    				        prds1.setString(18,openingdate1);
    				        prds1.setString(19,empid);
    				        prds1.setString(20,status1);
    				        prds1.setString(21,date1);
    				        prds1.setString(22,installdate1);
    				        prds1.setString(23,agreementdate);
    				        prds1.setString(24,agreementsdate);
    				        prds1.setString(25,agreementedate);
    				        prds1.setFloat(26,chequeamt);
    				        prds1.setFloat(27,rcgst_per);
    				        prds1.setFloat(28,rcgst_Amt);
    				        prds1.setFloat(29,rsgst_per);   
    				        prds1.setFloat(30,rsgst_Amt);
    				        prds1.setString(31,rinvoiceno);
    				        prds1.setString(32,rinvoicedate);
    				        prds1.setFloat(33,rinvoiceAmt);
    					    prds1.setString(34,path+"/"+filenameList.get(0));
    					    
    				        i1= prds1.executeUpdate();
    				        
    				        int x=0;
    		                   
    		                   if(machinetype.equals("Colour")){  x=4; }  
    		                   else{ x=2; }
    		                  
    	for(int j=0;j<x;j++)
    	   {	
    		if(invoiceno.get(j).isEmpty() || invoicedate.get(j).isEmpty() || filenameList.get(j).isEmpty()){ status2="Pending"; }
    		else{ status2="Completed"; }
			
    	   String query3=" INSERT INTO `photocopy_summary`(`ph_id`, `serial_no`, `photo_type`, `closing_balance`,"+
           		         " `opening_balance`, `total_copies`, `free_copies`, `extra_copies`, `per_copy_cost`, `charged_amt`,"+
           		         " `invoice_no`, `invoice_date`, `invoice_amt`,`filepath`,`status`,`createddate`,`cgst_per`,`cgst_amt`,`sgst_per`,`sgst_amt`)"+
           		         " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";   
   
						prds3 = con3.prepareStatement(query3);
				        prds3.setInt(1,id);
				        prds3.setString(2,sno);
				        prds3.setString(3,phototype.get(j));
				        prds3.setInt(4,closingbalance.get(j));
				        prds3.setInt(5,openingbalance.get(j));
				        prds3.setInt(6,numberofcopies.get(j));
				        prds3.setInt(7,freecopies.get(j));
				        prds3.setInt(8,extracopies.get(j));
				        prds3.setFloat(9,percopy.get(j));
				        prds3.setFloat(10,charged.get(j));
				        prds3.setString(11,invoiceno.get(j));
				        prds3.setString(12,invoicedate.get(j));
				        prds3.setFloat(13,invoiceAmt.get(j));
				        prds3.setString(14,path+"/"+filenameList.get(j+1));
				        prds3.setString(15,status2);
				        prds3.setString(16,date1);
				        prds3.setFloat(17,cgst_per.get(j));
				        prds3.setFloat(18,cgst_Amt.get(j));
				        prds3.setFloat(19,sgst_per.get(j));
				        prds3.setFloat(20,sgst_Amt.get(j));
				        
		                i2= prds3.executeUpdate();
    	     }
    	                 
		 }
		 catch(Exception el)
		 {
		 out.println("Inserting__error"+el.getMessage());
		 }
		 }
		    msg = "Photo__Copier__data__inserted__successfully__For__serial__No::"+sno;
	       response.sendRedirect("ViewBranchWiseModel.jsp?location="+branchno+"&msg="+msg);
		   
		 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

