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
            Connection con1 = null,con2 = null,con3 = null,conx = null;
      	    Connection2 dbConn = new Connection2();
	        con1 = dbConn.getConnection2();
	        con2 = dbConn.getConnection2();
	        con3 = dbConn.getConnection2();
	        conx= dbConn.getConnection2();

			 Statement st2=null,st1=null,st3=null,stx=null;
			 String msg=null;
			 ResultSet rs2=null,rs1=null,rs3=null,rsx=null;
			 PreparedStatement prds1=null,prds3=null;
			 
			 String empno=null,empname=null,location=null,number=null,relationnumber=null,isptype=null,typename=null;
			 String chequenumber=null,chequedate=null,branchNo1=null,path=null,empid=null,status1=null,no_status=null;
			 String billfromdate=null,billtodate=null,monthofpayment=null,invoicenumber=null,invoicedate=null, type=null;
		     int branchid=0,branchNo=0;
		     int month = 0, dd = 0, yer = 0;
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
		 if(name.equals("type"))
		 {
			 type=value;
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
		 if(name.equals("empid"))
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
			 //System.out.println("date ::"+monthofpayment);
			  String str[] =monthofpayment.split("-");
			  month = Integer.parseInt(str[1]);
			  //System.out.println("month ::"+month);
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
             String query1 = "select max(id) from consumption_report_details";
				 st1 = con1.createStatement();
				 rs1 = st1.executeQuery(query1);
				 int id=0;
              if(rs1.next()){
          	       id=rs1.getInt(1);  
          	       id=id+1;
                 }
			if(chequenumber.isEmpty() || chequedate.isEmpty() || invoicenumber == "" || invoicedate == "" ){
				status1="Pending";
			}
			else{
				status1="Completed";
			}
			path=path+"/"+itemName;

			 String queryx = "select type from consumption_report_details where number='"+number+"' AND `monthofpayment`='"+monthofpayment+"'";
			 stx = conx.createStatement();
			 rsx = stx.executeQuery(queryx);
			 
	 if(!rsx.next()){	 
		 
              String query2="INSERT INTO `consumption_report_details`(`id`, `initiatorId`, `empno`, `empname`, `branchid`, `branchNo`,"+
            		        "`number`, `relationnumber`, `isptype`, `typename`, `monthlycharges`, `billfromdate`, `billtodate`, "+
            		        "`monthofpayment`, `invoiceno`, `invoiceamt`, `invoicedate`, `chequenumber`, `chequeamt`, `chequedate`, "+
            		        "`current_month_amt`,`filepath`,`status`,`number_status`,`type`,`createddate`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";   
                	        
    						prds1 = con2.prepareStatement(query2);
    						
    						prds1.setInt(1,id);
    				        prds1.setString(2,empid);
    				        prds1.setString(3,empno);
    				        prds1.setString(4,empname);
    				        prds1.setInt(5,branchid);
    				        prds1.setInt(6,branchNo);
    				        prds1.setString(7,number);
    				        prds1.setString(8,relationnumber);
    				        prds1.setString(9,isptype);
    				        prds1.setString(10,typename);
    				        prds1.setFloat(11,monthlycharges);
    				        prds1.setString(12,billfromdate);
    				        prds1.setString(13,billtodate);
    				        prds1.setString(14,monthofpayment);
    				        prds1.setString(15,invoicenumber);
    				        prds1.setFloat(16,invoiceamt);
    				        prds1.setString(17,invoicedate);
    				        prds1.setString(18,chequenumber);
    				        prds1.setFloat(19,chequeamt);
    				        prds1.setString(20,chequedate);
    				        prds1.setFloat(21,currentmonthamount);
    				        prds1.setString(22,path);
    				        prds1.setString(23,status1);
    				        prds1.setString(24,no_status);
    				        prds1.setString(25,type);
    				        prds1.setString(26,date1);
    			 
		    	           i1= prds1.executeUpdate();
    	
		    	           msg = "data__inserted__successfully::";        
		 
		 }
	 else{
		   msg = "Data__Already__Entered__for__this__month::";  
	       } 
		}
		 catch(Exception el)
		 {
		 out.println("Inserting__error"+el.getMessage());
		 }
		 } 
	      response.sendRedirect("CreateConsumptionDetails.jsp?msg="+msg);
		   
		 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

