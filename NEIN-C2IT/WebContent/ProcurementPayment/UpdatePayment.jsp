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
			  String bill_no=null,bill_date=null,remarks=null,file_path=null,path=null,filepath=null,todate=null,fromdate=null,bno=null;
		      int branchNo=0,branchId=0,quantity=0,id=0,i1=0;
		      float amount=0,per_item_amt=0,cgst_per=0,cgst_amt=0,sgst_per=0,sgst_amt=0,totalPayment=0,igst_per=0,igst_amt=0,tds_per=0,tds_amt=0;
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
			 String branch=value;
			 branchId=Integer.parseInt(branch);
		 }
		 if(name.equals("initiator"))
		 {
			 empid=value;
		 }
		 if(name.equals("bno"))
		 {
			 bno=value;
		 }
		 if(name.equals("fromdate"))
		 {
			 fromdate=value;
		 }
		 
		 if(name.equals("todate"))
		 {
			 todate=value;
		 }
		 if(name.equals("id"))
		 {
			 String id1=value;
			 id=Integer.parseInt(id1);
		 }
		 
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
		 if(name.equals("filepath"))
		 {
			 filepath=value;
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
			
        int j=0;
			 
			 if(filenameList.get(j) == ""){
         		path=filepath;
         	}
         	else{
         		path=path+"/"+filenameList.get(j);
         	}    
			 System.out.println("path :"+path);
             String query3 = "select b_no from branch_master where id='"+branchId+"'";
			 st2 = con2.createStatement();
			 rs2 = st2.executeQuery(query3);
			
		    if(rs2.next()){	 
			             branchNo=rs2.getInt("b_no");
		               }

		          i1=st2.executeUpdate("UPDATE `procurement_payment` SET `branchId`='"+branchId+"',`branchNo`='"+branchNo+"',"+
		    		                   "`po_number`='"+po_number+"',`po_date`='"+po_date+"',`vendorName`='"+vendorName+"',"+
		    		                   "`item_name`='"+item_name+"',`per_item_amt`='"+per_item_amt+"',`quantity`='"+quantity+"',"+
		    		                   "`cgst_per`='"+cgst_per+"',`cgst_amt`='"+cgst_amt+"',`sgst_per`='"+sgst_per+"',"+
		    		                   "`sgst_amt`='"+sgst_amt+"',`amount`='"+amount+"',`total_amt`='"+totalPayment+"',"+
		    		                   "`cheque_no`='"+cheque_no+"',`payment_date`='"+payment_date+"',`delivery_date`='"+delivery_date+"',"+
		    		                   "`bill_no`='"+bill_no+"',`bill_date`='"+bill_date+"',`remarks`='"+remarks+"',"+
		    		                   "`file_path`='"+path+"',`igst_per`='"+igst_per+"',`igst_amt`='"+igst_amt+"' ,"+ 
		    		                   "`tds_per`='"+tds_per+"',`tds_amt`='"+tds_amt+"',initiator_Branch='"+branchNo+"' WHERE `id`='"+id+"'");   
			              
								      if(i1 == 1){
									    	   
									    	 msg = "Payment__Data__Updated__successfully::";
									   }
									  else{
									     msg = "Payment__Data__Not__Updated__Try__Again";
									   } 
				           }
		 
					   catch(Exception el)
					   {
					    out.println("Updating__error"+el.getMessage());
					   }
		            }
				    }
				    catch(Exception el)
				   {
				    out.println("Updating__error"+el.getMessage());
				   }
				   
				   response.sendRedirect("ViewPayment1.jsp?msg="+msg+"&fromdate="+fromdate+"&todate="+todate+"&branch="+bno);
				        
				     
	%>

