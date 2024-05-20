<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<style type="text/css">
	.blue2{  border:2px solid #1ABC9C; border-collapse:separate; width:90%; overflow-y: auto; margin:auto; }
	.blueHead1{ background:#1ABC9C; color:white; }
	.blueth1{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; }
	.blueth2{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; text-align: center;}
	.bluetd1{ text-align: center;border: 1px solid black; }
	.bluetd2{ border: 1px solid black;padding: 1px solid black;; background-color: #FAEBD7;color: #0000FF;text-align: center;}
	.bluetd3{ border: 1px solid black;padding: 1px solid black;background-color: #F0FFFF;color: #0000FF;text-align: center;}
	.bluetd4{ text-align: center;border: 1px solid black; background-color: #F8F8FF;color: #9370DB;}
</style>

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
				<th >Location</th>
				<th >Circuit Id</th>
				<th >Link Type</th>
				<th >ISP Name</th>
				<th >LAN Pool</th>
				<th >WAN Pool</th>
				<th >Account/Relationship No</th>
				<th >BandWidth</th>
				<th >Media</th>
				<th >ARC</th>
				<th >OTC</th>
				<th >PO No</th>
				<th >PO date</th>
				<th >Bill Ref No</th>
				<th >Bill date</th>
				<th >From Date</th>
				<th >To Date</th>
				<th class="blueth1">Amount(A)</th>
				<th class="blueth1">TDS %</th>
				<th class="blueth1">TDS Amount(B)</th>
				<th class="blueth1">CGST %</th>
				<th class="blueth1">CGST Amount(C)</th>
				<th class="blueth1">SGST %</th>
				<th class="blueth1">SGST Amount(D)</th>
				<th class="blueth1">Total Invoice Amount(E=A+C+D)</th>
				<th class="blueth1">Total Payable/Less TDS(F=E-B)</th>
				<!-- <th >Invoice No</th>
				<th >Invoice Amount</th>
				<th >Invoice Date</th> -->
				<th >Cheque No</th>
				<th >Cheque Amount</th>
				<th >Cheque Date</th>
				<th >Invoice File</th>
				<th >Edit/Update</th>
			   
				
			</tr>
			</thead>
			  <tbody >
			  <%int number=0;%>
			  
             <%              
				              NumberFormat nf = NumberFormat.getInstance();
				              nf.setMaximumFractionDigits(2);
				              nf.setMinimumFractionDigits(2);
				             
                              response.setContentType("text/html;charset=UTF-8"); 
				              PrintWriter out1 = response.getWriter();
				            
				              String branch=request.getParameter("branchNo");
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
   							    
   						        query = " SELECT *,s.b_name,mb.m_b_name FROM `mpls_details` c"+  
   										" INNER JOIN branch_master s ON c.branch_id = s.id "+
   										" INNER JOIN branch_master_main mb ON c.branch_no = mb.m_b_no "+
   										" WHERE bill_date >=  ? AND bill_date <=  ? "+
   										" AND c.branch_no = ? Order by MONTH(bill_date) ";
   										
   										prds = con.prepareStatement(query);
   										prds.setDate(1, new java.sql.Date(startDate.getTime() ));
   										prds.setDate(2,new java.sql.Date(endDate.getTime()));
   										prds.setInt(3, branchId);
   										rs1 = prds.executeQuery();
   							
                              %>
                
	              <% while(rs1.next()){ 
	            	     String path=rs1.getString("invoice_file");
			             String filename=path.substring(path.lastIndexOf("/")+1);
	              
	              %>
	              
					      <tr class="bluetd1">
							<td ><%=++number%></td>
							<td ><%=rs1.getString("m_b_name")%></td>
						    <td ><%=rs1.getString("b_name")%></td> 
							<td class="bluetd3"><%=rs1.getString("circuit_Id")%></td>
							<td class="bluetd3"><%=rs1.getString("linktype_id")%></td>
							<td class="bluetd3"><%=rs1.getString("isp_name")%></td>
							<td ><%=rs1.getString("lanpool")%></td>
							<td ><%=rs1.getString("wanpool")%></td>
							<td ><%=rs1.getString("acc_relation_no")%></td>
							<td ><%=rs1.getString("bandwidth")%></td>
							<td ><%=rs1.getString("media")%></td>
							<td ><%=rs1.getString("arc")%></td>
							<td ><%=rs1.getString("otc")%></td>
							<td ><%=rs1.getString("po_number")%></td>
							<td ><%=rs1.getString("po_date")%></td>
							<td class="bluetd4"><%=rs1.getString("bill_refno")%></td>
							<td class="bluetd4"><%=rs1.getString("bill_date")%></td>
							<td class="bluetd4"><%=rs1.getString("bill_fdate")%></td>
							<td class="bluetd4"><%=rs1.getString("bill_tdate")%></td>
							<td class="bluetd2"><%=rs1.getString("amount")%></td>
							<td class="bluetd2"><%=rs1.getString("tds_percentage")%>%</td>
							<td class="bluetd2"><%=rs1.getString("tds_amt")%></td>
							<td class="bluetd2"><%=rs1.getString("tax_percentage")%>%</td>
							<td class="bluetd2"><%=rs1.getString("cgst_amount")%></td>
							<td class="bluetd2"><%=rs1.getString("tax_percentage1")%>%</td>
							<td class="bluetd2"><%=rs1.getString("sgst_amount")%></td>
							<td class="bluetd2"><%=rs1.getString("total_invoice_amt")%></td>
							<td class="bluetd3"><%=rs1.getString("total_pay_amt")%></td>
							<%-- <td ><%=rs1.getString("invoice_no")%></td>
							<td ><%=rs1.getString("invoice_amt")%></td>
							<td ><%=rs1.getString("invoice_date")%></td> --%>
							<td ><%=rs1.getString("cheque_no")%></td>
							<td ><%=rs1.getString("cheque_amt")%></td>
							<td ><%=rs1.getString("cheque_date")%></td>
							<td ><a href="DownloadFile.jsp?f=<%=path%>"><%=filename%></a></td>
							<td ><a href="EditMpls.jsp?id=<%=rs1.getString("mpls_id")%>&fromdate=<%=fromdate1%>&todate=<%=todate1%>&branchId=<%=branchId%>">Edit/Update</a></td>						  
						</tr>
						 <%}%>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                       
		                     con.close();
                            	}%>
               
</table><br>
<form action="../callForReport" method="get" style="margin-left:110px;">
<input type="hidden" name="view" value="mplsreport">
<input type="hidden" name="branch" value="<%=branchId%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate1%>">
		<table align="center" border="0" width="1200">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
	</form>
	<br>	

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