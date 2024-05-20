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
			 
			 String empno=null,empname=null,location=null,number=null,relationnumber=null,isptype=null,typename=null,filepath1=null;
			 String chequenumber=null,chequedate=null,branchNo1=null,path=null,empid=null,status1=null,no_status=null,fromdate=null,todate=null;
			 String billfromdate=null,billtodate=null,monthofpayment=null,invoicenumber=null,invoicedate=null,filename=null,type=null;;
		     int branchid=0,branchNo=0,id1=0;
		     float monthlycharges=0,invoiceamt=0,chequeamt=0,currentmonthamount=0;		  
		     String []fileName=null;
		     
		     
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
		 if(name.equals("branchNo"))
		 {
			 branchNo1=value;
			 branchNo=Integer.parseInt(branchNo1);
		 }
		 if(name.equals("empno"))
		 {
			 empno=value;
		 }
		 if(name.equals("type"))
		 {
			 type=value;
		 }
		 if(name.equals("initiatorId"))
		 {
			 empid=value;
		 }
		 if(name.equals("monthlycharges"))
		 {
				if(item.getString().isEmpty()){
					monthlycharges=0;
				   }
				else{
					monthlycharges =Float.parseFloat(item.getString());						
	  		       }
		 }
		 if(name.equals("invoiceamt"))
		 {
				if(item.getString().isEmpty()){
					invoiceamt=0;
				   }
				else{
					invoiceamt =Float.parseFloat(item.getString());						
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
		 if(name.equals("currentmonthamount"))
		 {
				if(item.getString().isEmpty()){
					currentmonthamount=0;
				   }
				else{
					currentmonthamount =Float.parseFloat(item.getString());						
	  		       }
		 }
		 
		 if(name.equals("empname"))
		 {
			 empname=value;
		 }
		 
		 if(name.equals("number"))
		 {
			 number=value;
		 }
		 if(name.equals("relationnumber"))
		 {
			 relationnumber=value;
		 }
		 if(name.equals("isptype"))
		 {
			 isptype=value;
			 
		 }
		 
		 if(name.equals("typename"))
		 {
			 typename=value;
		 }
		 
		 if(name.equals("billfromdate"))
		 {
			 billfromdate=value;
		 }
		 
		 if(name.equals("billtodate")) 
		 {
			 billtodate=value;
		 }
		 if(name.equals("monthofpayment"))
		 {
			 monthofpayment=value;
		 }
		 if(name.equals("invoicenumber"))
		 {
			 invoicenumber=value;
		 }
		 
		 if(name.equals("invoicedate"))
		 {
			 invoicedate=value;
		 }
		 
		 if(name.equals("chequenumber")) 
		 {
			 chequenumber=value;
		 }
		 if(name.equals("chequedate"))
		 {
			 chequedate=value;
		 }
		 if(name.equals("status"))
		 {
			 no_status=value;
		 }	
		 if(name.equals("id"))
		 {
			 String  id=value;
			 id1=Integer.parseInt(id);
		 }	
		 if(name.equals("fromdate"))
		 {
			   fromdate=value;
			 
		 }	
		 if(name.equals("todate"))
		 {
			   todate=value;
		 }	
		 if(name.equals("filepath"))
		 {
			 filepath1=value;
			 filename=filepath1.substring(filepath1.lastIndexOf("/")+1);
			 
		 }	
		 }
      else
		 {
		 try
		 {	
		 itemName = item.getName();
		 filenameList.add(itemName);
		 File savedFile = new File("E:/neinSoft/files/C2IT/Consumption/"+empid+"/"+monthofpayment+"/"+number+"/"+empno);
		 path="E:/neinSoft/files/C2IT/Consumption/"+empid+"/"+monthofpayment+"/"+number+"/"+empno;
		
		 if(!savedFile.exists()) 
		 {
		  savedFile.mkdirs();
		  savedFile.setWritable(true);
		
			 }
		File  insertFile = new File("E:/neinSoft/files/C2IT/Consumption/"+empid+"/"+monthofpayment+"/"+number+"/"+empno+"/"+itemName);
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
             int i=0;
			  
			if(chequenumber.isEmpty() || chequedate.isEmpty() || invoicenumber == "" || invoicedate == "" || (filename.isEmpty() && itemName.isEmpty()) ){
				status1="Pending";
			}
			else{
				status1="Completed";
			}
			 path="E:/neinSoft/files/C2IT/Consumption/"+empid+"/"+monthofpayment+"/"+number+"/"+empno;
			 if(!itemName.isEmpty()){
			     path=path+"/"+itemName;
			    }
			 else{
				 path=path+"/"+filename;
			 }
			st1=con1.createStatement();
			i=st1.executeUpdate("UPDATE `consumption_report_details` SET `billfromdate`='"+billfromdate+"',`billtodate`='"+billtodate+"',"+
					            "`monthofpayment`='"+monthofpayment+"',`invoiceno`='"+invoicenumber+"',`invoiceamt`='"+invoiceamt+"',"+
					            "`invoicedate`='"+invoicedate+"',`chequenumber`='"+chequenumber+"',`chequeamt`='"+chequeamt+"',"+
					            "`chequedate`='"+chequedate+"',`current_month_amt`='"+currentmonthamount+"',`filepath`='"+path+"',"+
					            "`status`='"+status1+"',type='"+type+"' WHERE `id`='"+id1+"'");
    						
		    	           msg = "data__Updated__successfully::";        
		 
		 }
		 catch(Exception el)
		 {
		 out.println("Inserting__error"+el.getMessage());
		 }
		 } 
	       response.sendRedirect("ViewConsumption1.jsp?msg="+msg+"&fromdate="+fromdate+"&todate="+todate+"&branch="+branchNo);
		   
		 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

