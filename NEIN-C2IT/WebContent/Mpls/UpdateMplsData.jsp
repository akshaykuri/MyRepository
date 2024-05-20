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
			 String invoiceDate=null,chequedate=null,path=null,file=null,fromdate1=null,todate1=null,branchId1=null,isp_name=null;
		     int branchNo=0,branchId=0,month=0,mplsid=0,bNo=0,x=0;
		     float amount=0,tax=0,tax1=0,tds=0,totalAmt=0,totalPayment=0,invoiceAmt=0,chequeAmt=0,finalAmt=0,tds_per=0,tax_per=0,tax_per1=0;
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
		
		 if(name.equals("b_id"))
		 {
			 String branch=value;
			 branchId=Integer.parseInt(branch);
		 }
		 if(name.equals("xvalue"))
		 {
			 String xvalue=value;
			 x=Integer.parseInt(xvalue);
		 }
		 if(name.equals("b_no"))
		 {
			 String bno=value;
			 bNo=Integer.parseInt(bno);
		 }
		 if(name.equals("initiator"))
		 {
			 empid=value;
		 }
		 if(name.equals("isp_name"))
		 {
			 isp_name=value;
		 }
		 if(name.equals("b_no"))
		 {
			 String branch_no=value;
			 branchNo=Integer.parseInt(branch_no);
		 }
		 if(name.equals("mplsid"))
		 {
			 String mplsid1=value;
			 mplsid=Integer.parseInt(mplsid1);
		 }
		 if(name.equals("circuitid"))
		 {
			 circuitId=value;
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
		 
		 /* if(name.equals("invoiceno")) 
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
		 if(name.equals("file")) 
		 {
			 file=value;
		 }
		 if(name.equals("from")) 
		 {
			 fromdate1=value;
		 }
		 if(name.equals("to")) 
		 {
			 todate1=value;
		 }
		 if(name.equals("bid")) 
		 {
			 branchId1=value;
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
			 
			 int j=0;
			 
			 if(filenameList.get(j) == ""){
         		path=file;
         	}
         	else{
         		path=path+"/"+filenameList.get(j);
         	}   
			    st1=con1.createStatement();
			    i1=st1.executeUpdate(" UPDATE `mpls_details` SET `circuit_Id`='"+circuitId+"',`linktype_id`='"+linktype+"',`lanpool`='"+lanpool+"',`branch_id`='"+branchId+"', "+
						             " `wanpool`='"+Wanpool+"',`acc_relation_no`='"+Account_Relationship+"',`bandwidth`='"+Bandwidth+"',`media`='"+Media+"',"+
						             " `arc`='"+ARC+"',`otc`='"+OTC+"',`po_number`='"+pono+"',`po_date`='"+podate+"',`bill_refno`='"+billref+"',`branch_no`='"+bNo+"',"+
						             " `bill_date`='"+billdate+"',`bill_fdate`='"+fromdate+"',`bill_tdate`='"+todate+"',`amount`='"+amount+"',`tds_amt`='"+tds+"',"+
						             " `cgst_amount`='"+tax+"',`sgst_amount`='"+tax1+"',`total_invoice_amt`='"+totalAmt+"',`total_pay_amt`='"+totalPayment+"',"+
						             " `cheque_no`='"+chequeNo+"',`cheque_amt`='"+chequeAmt+"',`tax_percentage1`='"+tax_per1+"',"+
						             " `cheque_date`='"+chequedate+"',`invoice_file`='"+path+"',`tds_percentage`='"+tds_per+"',"+
						             "`tax_percentage`='"+tax_per+"',`isp_name`='"+isp_name+"'  WHERE `mpls_id`='"+mplsid+"' ");
				                   
			    
		      }
		 
		     catch(Exception el)
			 {
			  out.println("Update__error"+el.getMessage());
		     }
			 }
		 if(x == 1){
			      response.sendRedirect("../OtherPage.jsp?msg=1"); 
		     }
		 else{
			 response.sendRedirect("ViewMpls1.jsp?fromdate="+fromdate1+"&todate="+todate1+"&branchNo="+branchId1);
		     }
		 
			   
		     }
			 catch (Exception e){
			 out.println(e.getMessage());
			 }

	%>

