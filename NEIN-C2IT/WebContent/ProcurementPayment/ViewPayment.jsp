<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/plain; charset=UTF-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Css/Body.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<style type="text/css">
		.blue2{  border:2px solid #1ABC9C; border-collapse:separate; width:90%; overflow-y: auto; margin:auto; }
		.blueHead1{ background:#1ABC9C; color:white; }
		.blueth1{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; }
		.blueth2{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; text-align: center;}
		.bluetd1{ text-align: center;border: 1px solid black; }
		.bluetd2{ border: 1px solid black;padding: 1px solid black; background-color: #FAEBD7;color: red;text-align: center;}
		.bluetd3{ border: 1px solid black;padding: 1px solid black;; color: blue;text-align: center;}
</style>
<script  type="text/javascript">

<% 
    String msg1=request.getParameter("msg");

    String disp = msg1;
    %>
    msg1 = "<%=disp%>";

     if(msg1!="1")
		{
           alert(msg1);
		}
</script>
</head>

<body background="../images/u.jpg">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
</td>
 </tr>
   </table>
<br>

<table class ="blue2" border="1" id="mytable" style="margin-left:110px;">
			<thead class="blueHead1">
			<tr class="blueth1">
				<th >SL No.</th>
				<th >Branch</th>
				<th >Shipping Location</th>
				<th >Initiator</th>
				<th >PO No</th>
				<th >PO Date</th>
				<th >Vendor Name</th>
				<th >Item Name</th>
				<th >Per Item Amt</th>
				<th >Quantity</th>
				<th >Amount</th>
				<th >IGST %</th>
				<th >IGST Amt</th>
				<th >CGST %</th>
				<th >CGST Amt</th>
				<th >SGST %</th>
				<th >SGST Amt</th>
				<th >TDS %</th>
				<th >TDS Amt</th>
				<th >Total Amount</th>
				<th >Delivery Date</th>
				<th >Bill No</th>
				<th >Bill Date</th>
				<th >Cheque No</th>
				<th >Payment Date</th>
				<th >Remarks</th>
				<th >File</th>
			   
			</tr>
			</thead>
			  <tbody >
			  <%int number=0;%>
			  
             <%              
				              NumberFormat nf = NumberFormat.getInstance();
				              nf.setMaximumFractionDigits(2);
				              nf.setMinimumFractionDigits(2);
				             
				              float total=0,amount=0;
                              response.setContentType("text/html;charset=UTF-8"); 
				              PrintWriter out1 = response.getWriter();
				            
				              String fileName=null;
				              String branch=request.getParameter("branch");
				     		  int branchId=Integer.parseInt(branch);
				              String fromdate1=request.getParameter("fromdate");
				              String todate1=request.getParameter("todate");
				     	      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				     	      Date startDate = null;
				     	      Date endDate =  null;
				     	      
				     	      startDate = dateFormat.parse(fromdate1);
			     		      endDate = dateFormat.parse(todate1);
				     	     
                              Connection con = null;
 	                          Statement st1=null;
 	                          String msg=null;
 	                          ResultSet rs1=null;
 	                          PreparedStatement prds=null;
 	                           	                          
                           try
                              {
                        	   Connection2 dbConn = new Connection2();
   							   con = dbConn.getConnection2();
   							 
   							 String query = null;
   						    
   							 query =    " SELECT  s.b_name,mb.m_b_name,u.full_name,`po_number`, `po_date`, `vendorName`, `item_name`, `per_item_amt`, "+
   							            " `quantity`, `cgst_per`, `cgst_amt`, `sgst_per`, `sgst_amt`, `amount`, `total_amt`, `cheque_no`, `tds_per`, `tds_amt`, "+
   							            " `payment_date`, `delivery_date`, `bill_no`, `bill_date`, `remarks`, `file_path`, `igst_per`, `igst_amt` "+
   							            " FROM procurement_payment c "+  
   										" INNER JOIN branch_master s ON c.branchId = s.id"+
   										" INNER JOIN leavemanagement.user u ON c.initiator = u.emp_id"+
   										" INNER JOIN branch_master_main mb ON c.initiator_Branch = mb.m_b_no"+
   										
   										" WHERE po_date >=  ?"+
   										" AND po_date <=  ?"+
   										" AND c.initiator_Branch = ?"+
   										" Order by c.branchNo";			
   										
   										prds = con.prepareStatement(query);
   										prds.setDate(1, new java.sql.Date(startDate.getTime() ));
   										prds.setDate(2,new java.sql.Date(endDate.getTime()));
   										prds.setInt(3, branchId);
   										rs1 = prds.executeQuery();
   								     
                              %>
                
	              <%while(rs1.next()){
	            	  String filepath1=rs1.getString("file_path");
	            	  fileName=filepath1.substring(filepath1.lastIndexOf("/")+1);
	               	  String aa=rs1.getString("total_amt");
	            	  total=Float.parseFloat(aa);
	            	  amount=amount+total;
	              %>
					<tr class="bluetd1">
						<td ><%=++number%></td>
						<td ><%=rs1.getString("m_b_name")%></td>
					    <td ><%=rs1.getString("b_name")%></td>
						<td ><%=rs1.getString("full_name")%></td>
						<td ><%=rs1.getString("po_number")%></td>
						<td ><%=rs1.getString("po_date")%></td>
						<td ><%=rs1.getString("vendorName")%></td>
						<td ><%=rs1.getString("item_name")%></td>
						<td ><%=rs1.getString("per_item_amt")%></td>
						<td ><%=rs1.getString("quantity")%></td>
						<td ><%=rs1.getString("amount")%></td>
						<td ><%=rs1.getString("igst_per")%></td>
						<td ><%=rs1.getString("igst_amt")%></td>
						<td ><%=rs1.getString("cgst_per")%></td>
						<td ><%=rs1.getString("cgst_amt")%></td>
						<td ><%=rs1.getString("sgst_per")%></td>
						<td ><%=rs1.getString("sgst_amt")%></td>
						<td ><%=rs1.getString("tds_per")%></td>
						<td ><%=rs1.getString("tds_amt")%></td>
						<td class="bluetd3"><%=rs1.getString("total_amt")%></td>
						<td ><%=rs1.getString("delivery_date")%></td>
						<td ><%=rs1.getString("bill_no")%></td>		
						<td ><%=rs1.getString("bill_date")%></td>
						<td ><%=rs1.getString("cheque_no")%></td>		
						<td ><%=rs1.getString("payment_date")%></td>
						<td ><%=rs1.getString("remarks")%></td>	
						<td ><a href="DownloadFile.jsp?f=<%=rs1.getString("file_path")%>"><%=fileName%></a></td>						  
				    </tr>
						 <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       //	DbUtil.closeDBResources(rs,st,con);
		                     con.close();
                            	}%>
                    <tr>
                    <td colspan="19" align="center">Grand Total</td>
                    <td class="bluetd2"><%=amount%></td>
                    
                    </tr>
                
</table>

<form action="../callForReport" method="get" style="margin-left:110px;">
<input type="hidden" name="view" value="payment1">
<input type="hidden" name="branch" value="<%=branchId%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
<input type="hidden" name="amount" value="<%=amount%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	

 <!--  <div align="center"><br><br>
      <input style="size: 1;" type="button" title="Back To Selection Date Page" value="GO TO BACK" onclick="window.location.href='../OtherPage.jsp?msg=1'"/>
  </div><br> -->
  <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table> 
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>

  </table>
<!-- </form> -->
</body>
</html>