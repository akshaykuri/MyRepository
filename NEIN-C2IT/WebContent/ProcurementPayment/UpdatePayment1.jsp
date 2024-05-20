<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import="CON2.Connection2"%>
<%@page import = "java.sql.*" %>
<%@page language="java"%> 

 <%
   			  String msg=null;
			  			 
			  String id1=request.getParameter("id");
			  int id=Integer.parseInt(id1);
			  String chequeNo=request.getParameter("chequeNo");
			  String payMentDate=request.getParameter("payMentDate");
			  
			  float tds_per =Float.parseFloat(request.getParameter("tds"));
			  float tds_amt =Float.parseFloat(request.getParameter("tds_amt"));
			  float totalPayment =Float.parseFloat(request.getParameter("total_amt"));
			  
			  int i1=0;
        try{    
        	 Connection conn = null;
		      
        	 Statement st1=null;
		     ResultSet rs=null;
		
	            st1=conn.createStatement();
		        i1=st1.executeUpdate(" UPDATE `procurement_payment` SET `cheque_no`='"+chequeNo+"',`payment_date`='"+payMentDate+"', "+
		    		                 "`tds_per`='"+tds_per+"',`tds_amt`='"+tds_amt+"',`total_amt`='"+totalPayment+"' WHERE `id`='"+id+"' ");   
			              
								      if(i1 == 1){
									    	   
									    	 msg = "Payment__Data__Updated__successfully::";
									   }
									  else{
									     msg = "Payment__Data__Not__Updated__Try_Again";
									   } 
				           }
		 
					   catch(Exception el)
					   {
					    out.println("Updating__error"+el.getMessage());
					   }
		            
				      response.sendRedirect("../OtherPage.jsp?msg="+msg);
				      
	%>

