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
			 
			 String b_id=null,b_no=null,filename=null,machinetype=null,vendortype=null,brand=null,modelno=null,sno=null,agreementno=null,chequeNo="",vendorname=null;
		     int branchid=0,branchno=0,phid=0;
		     String empid=null,rentamt1=null,txtamt1=null,totalamt1=null,createddate=null,chequeDate1="",monthOfPayment1=null,closingdate1=null,openingdate1=null,installdate1=null;
		     float rentamt=0,totalamt=0,txtamt=0,chequeamt=0;
		     
		     String phototype1=null,closingbalance1=null,openingbalance1=null,numberofcopies1=null,freecopies1=null,extracopies1=null,percopy1=null;
		     String charged1=null,invoiceno1=null,invoiceAmt1=null,invoicedate1=null,path=null,status1=null,status2=null,file1=null;
		     
		     String []fileName=null;
		     
		     ArrayList<String> phototype = new ArrayList<String>();
		     ArrayList<String> file = new ArrayList<String>();
		     ArrayList<String> invoiceno = new ArrayList<String>();
		     ArrayList<Integer> closingbalance = new ArrayList<Integer>();
		     ArrayList<Integer> openingbalance = new ArrayList<Integer>();
		     ArrayList<Integer> numberofcopies = new ArrayList<Integer>();
		     ArrayList<Integer> freecopies = new ArrayList<Integer>();
		     ArrayList<Integer> extracopies = new ArrayList<Integer>();
		     ArrayList<Float> percopy = new ArrayList<Float>();
		     ArrayList<Float> charged = new ArrayList<Float>();
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
		
		 if(name.equals("phid"))
		 {
		     String	 phid1=value;
			 phid=Integer.parseInt(phid1);
		 }
		 
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
		
		 if(name.equals("chequeDate")) 
		 {
			 chequeDate1=value;
			 
		 }
		 if(name.equals("createddate"))
		 {
		  	 createddate=value;
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
		 if(name.equals("percopy"))
		 {
			 percopy1=value;
			 float aa=Float.parseFloat(percopy1);
	    	 percopy.add(aa); 
	    	 
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
		 if(name.equals("filepath"))
		 {
			 file1=value;
			 //System.out.println("file1  ::"+file1);
			 file.add(file1);
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
		 }
      else
		 {
		 try
		 {
			 
				
		 itemName = item.getName();
		 filenameList.add(itemName);
		 
		 File savedFile = new File("E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+createddate+"/"+sno);
		 path="E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+createddate+"/"+sno;
		 if(!savedFile.exists()) 
		 {
		  savedFile.mkdirs();
		  savedFile.setWritable(true);
		
			 }
		File  insertFile = new File("E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+createddate+"/"+sno+"/"+itemName);
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
			 
			  //System.out.println("status1 ::"+status1);
			    st1=con1.createStatement();
		        i1= st1.executeUpdate(" UPDATE `photocopier_details` SET `brand`='"+brand+"',`modelno`='"+modelno+"',`serialno`='"+sno+"',"+
                                      " `agreementno`='"+agreementno+"',`vendorname`='"+vendorname+"',`vendortype`='"+vendortype+"',"+
                                      " `cheque_no`='"+chequeNo+"',`cheque_date`='"+chequeDate1+"',`machinetype`='"+machinetype+"',"+
    		                          " `month_of_payment`='"+monthOfPayment1+"',`rentamt`='"+rentamt+"',`taxamt`='"+txtamt+"',`total_amt`='"+totalamt+"',"+
    		                          " `closingdate`='"+closingdate1+"',`openingdate`='"+openingdate1+"', status='Completed',`chequeAmt`='"+chequeamt+"' "+
    		                          " WHERE `ph_id`='"+phid+"' ");
    				        
    				       /*  int x=0;
    		                   
    		                  if(machinetype.equals("Colour")){  x=3; }  
    		                   else{ x=1; }
    		                  
    	for(int j=0;j<x;j++)
    	   {			    
    		
    		path=path+"/"+filenameList.get(j);
    		//System.out.println("path ::"+path);
    		
    		if(filenameList.get(j) == ""){
    			path=file.get(j);
    			//System.out.println("path path   "+file.get(j));
    		}
    		
    		   		 
    		 st3=con3.createStatement();
             i2= st3.executeUpdate("UPDATE `photocopy_summary` SET `serial_no`='"+sno+"', "+
                                   "`closing_balance`='"+closingbalance.get(j)+"',`opening_balance`='"+openingbalance.get(j)+"', "+
                                   "`free_copies`='"+freecopies.get(j)+"',`extra_copies`='"+extracopies.get(j)+"',`per_copy_cost`='"+percopy.get(j)+"', "+
                                   "`charged_amt`='"+charged.get(j)+"',`invoice_no`='"+invoiceno.get(j)+"',`invoice_date`='"+invoicedate.get(j)+"', "+
                                   "`invoice_amt`='"+invoiceAmt.get(j)+"', status='Completed',`total_copies`='"+numberofcopies.get(j)+"',`filepath`='"+path+"' "+
                                   " WHERE `ph_id`='"+phid+"' AND `photo_type`='"+phototype.get(j)+"' ");
             
             path="E:/neinSoft/files/C2IT/PhotoCopier/"+empid+"/"+createddate+"/"+sno;
    	   } */
    	                  
		 }
		 catch(Exception el)
		 {
		 out.println("Inserting__error"+el.getMessage());
		 }
		 }
		   // msg = "Photo Copier data Updated successfully For serial No ::"+sno;
	        response.sendRedirect("../OtherPage.jsp?msg=1"); 
		   
		 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

