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
			 
			 String empno=null,empname=null,location=null,branch=null,filepath1=null,group_name=null,monthofpayment1=null;
			 String chequenumber=null,chequedate=null,branchNo1=null,path=null,empid=null,status1=null,no_status=null,fromdate=null,todate=null;
			 String billfromdate=null,billtodate=null,monthofpayment=null,invoicenumber=null,invoicedate=null,filename=null,type=null;;
		     int branchid=0,branchNo=0,id1=0,month=0,month1=0;
		     float monthlycharges=0,invoiceamt=0,chequeamt=0,currentmonthamount=0;		  
		     String []fileName=null;
		     ArrayList<String> relationnumber = new ArrayList<String>();
		     ArrayList<String> number = new ArrayList<String>();
		     ArrayList<String> typename = new ArrayList<String>();
		     ArrayList<String> isptype = new ArrayList<String>();
		     ArrayList<Float> amount = new ArrayList<Float>();
		     
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
		
		 if(name.equals("relationnumber"))
		 {
			 String relationnumber1=value;
			        relationnumber.add(relationnumber1);
		 }
		 if(name.equals("number"))
		 {
			 String number1=value;
			 number.add(number1);
		 }
		 if(name.equals("typename"))
		 {
			 String typename1=value;
			 typename.add(typename1);
		 }
		 if(name.equals("isptypename"))
		 {
			 String isptype1=value;
			 isptype.add(isptype1);
		 }		 
		 if(name.equals("amount"))
		 {
			 
			 String amount1=value;
			 float amount2=(float) 0;
				try
				{  
				  if(amount1 != null) amount2 = Float.parseFloat(amount1); 	
				}
				catch (NumberFormatException e)
				{ amount2 = (float) 0; }
					 
			 amount.add(amount2);
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
		 if(name.equals("monthofpayment1"))
		 {
			 monthofpayment1=value;
			 //System.out.println("date ::"+monthofpayment);
			  String str1[] =monthofpayment1.split("-");
			  month1 = Integer.parseInt(str1[1]);
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
		 if(name.equals("initiatorId"))
		 {
			 empid=value;
		 }
		 if(name.equals("group_name"))
		 {
			 group_name=value;
		 }
		 
		 if(name.equals("fromdate"))
		 {
			   fromdate=value;
			 
		 }	
		 if(name.equals("todate"))
		 {
			   todate=value;
		 }	
		 if(name.equals("branch"))
		 {
			 branch=value;
			 branchNo = Integer.parseInt(branch);
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
		 File savedFile = new File("E:/neinSoft/files/C2IT/Consumption/"+group_name+"/"+empid+"/"+monthofpayment);
		 path="E:/neinSoft/files/C2IT/Consumption/"+group_name+"/"+empid+"/"+monthofpayment;
		
		 if(!savedFile.exists()) 
		 {
		  savedFile.mkdirs();
		  savedFile.setWritable(true);
		
			 }
		File  insertFile = new File("E:/neinSoft/files/C2IT/Consumption/"+group_name+"/"+empid+"/"+monthofpayment+"/"+itemName);
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
			 path="E:/neinSoft/files/C2IT/Consumption/"+group_name+"/"+empid+"/"+monthofpayment;
			 if(!itemName.isEmpty()){
			     path=path+"/"+itemName;
			    }
			 else{
				 path=path+"/"+filename;
			 }
			st1=con1.createStatement();
			
		for(int xz=0;xz < number.size();xz++){ 	
			
			i=st1.executeUpdate("UPDATE `consumption_report_details` SET `billfromdate`='"+billfromdate+"',`billtodate`='"+billtodate+"',"+
					            "`monthofpayment`='"+monthofpayment+"',`invoiceno`='"+invoicenumber+"',`chequeamt`='"+amount.get(xz)+"',"+
					            "`invoicedate`='"+invoicedate+"',`chequenumber`='"+chequenumber+"',`invoiceamt`='"+amount.get(xz)+"',"+
					            "`current_month_amt`='"+amount.get(xz)+"',`chequedate`='"+chequedate+"',`filepath`='"+path+"'"+
					            " WHERE `group_name`='"+group_name+"' AND monthofpayment ='"+monthofpayment1+"' AND `relationnumber`='"+relationnumber.get(xz)+"' AND number ='"+number.get(xz)+"'");
    						
		    	           msg = "data__Updated__successfully::";        
		 
		 }
		 }
		 catch(Exception el)
		 {
		 out.println("Inserting__error"+el.getMessage());
		 }
		 } 
	       response.sendRedirect("ViewConsumptionDataCard1.jsp?msg="+msg+"&fromdate="+fromdate+"&todate="+todate+"&branch="+branchNo);
		   
		 }
		 
		 catch (Exception e){
		 out.println(e.getMessage());
		 }


	%>

