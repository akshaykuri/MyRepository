<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
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
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<script type="text/javascript" src="Js/tableHeaderFix.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<style type="text/css">
	.blue2{  border:2px solid #1ABC9C; border-collapse:separate; width:90%; overflow-y: auto; margin:auto; }
	.blueHead1{ background:#1ABC9C; color:white; }
	.blueth1{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white;text-align: center; }
	.bluetd1{ text-align: center;border: 1px solid black; }
	.amt{ border: 1px solid black;padding: 1px solid black;; background-color: #FAEBD7;color: #0000FF;text-align: center;}
	.amt1{border: 1px solid black;padding: 1px solid black;; background-color: #DCDCDC;color: #0000FF;text-align: center;}
	.amt2{border: 1px solid black;padding: 1px solid black;; background-color: #F0FFFF;color: #0000FF;text-align: center;}
	.amt3{border: 1px solid black;padding: 1px solid black;; background-color: #F5F5DC;color: #0000FF;text-align: center;}
	.amt4{border: 1px solid black;padding: 1px solid black;; background-color: #F5F5DC;color: red;text-align: center;}
	.month{border: 1px solid black;padding: 1px solid black;; background-color: #ADD8E6;color: #0000FF ;text-align: center;font-weight: bold;}
</style> 

</head>

<body background="images/u.jpg">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="images/nippon.gif" height="35" width="220"> </td>
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
   <!-- <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="right"> 
	<a href="OtherPage.jsp?msg=1"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="3">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="javascript:history.back()"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="3">BACK</font></address> 
	</td> 
	</tr> 
	</table>  -->
  
<form action="callForReport"  method="get">
<%
  response.setContentType("text/html;charset=UTF-8"); 
  PrintWriter out1 = response.getWriter();

  String branch=request.getParameter("branch");
  String fromdate1=request.getParameter("fromdate");
  String todate=request.getParameter("todate");
  
  
%>
<input type="hidden" name="view" value="PhotoCopierExcel">
<input type="hidden" name="branch" value="<%=branch%>">
<input type="hidden" name="fromdate" value="<%=fromdate1%>">
<input type="hidden" name="todate" value="<%=todate%>">
		<table align="center" border="0" width="1200" style="margin-left:110px;">
			<tr>    
				<td align="left"><input type="submit" value="ExportToExcel" class="hollow">
				</td>
			</tr>
		</table>
</form> <br>
<table class="blue2" border="1" id="photoCopierReport" style="margin-left:110px;">
			<thead class="blueHead1">
			<tr ><td colspan="43" class="month">Month of January</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number1=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">
		
		<!--  Month of Jan Month of Jan -->  
		
		<c:if test="${photo1.month == 1}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	    </c:forEach> 
	    
	     <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 1}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 1}">
	     <tr >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	   
	         <!--  Month of Feb Month of Feb --> 
	 <thead class="blueHead1">
	        <tr ><td colspan="43" class="month">Month of February</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number2=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">        
	         
	         <c:if test="${photo1.month == 2}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	      </c:forEach>   
	        <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 2}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 2}">
	     <tr >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	      <thead class="blueHead1">
			<tr ><td colspan="43" class="month">Month of March</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number3=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">
		
		<!--  Month of Jan Month of Jan --> 
		
		<c:if test="${photo1.month == 3}">
			  <c:forEach var="photo2" items="${photocopier2}">
	         <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">  
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	        <c:set var="flag" value="${1000}"/> 
	         </c:if>
	    </c:forEach> 
	   <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 3}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 3}">
	     <tr >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	 <thead class="blueHead1">
	        <tr ><td colspan="43" class="month">Month of Aprial</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number4=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">        
	         
	         <c:if test="${photo1.month == 4}">
			  <c:forEach var="photo2" items="${photocopier2}">
	         <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	      </c:forEach>   
	     <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 4}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 4}">
	     <tr >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	      <thead class="blueHead1">
			<tr ><td colspan="43" class="month">Month of May</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number5=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">
		
		<!--  Month of Jan Month of Jan --> 
		
		<c:if test="${photo1.month == 5}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	    </c:forEach> 
	     <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 5}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 5}">
	     <tr  >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	 <thead class="blueHead1">
	        <tr ><td colspan="43" class="month">Month of June</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number6=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">        
	         
	         <c:if test="${photo1.month == 6}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	      </c:forEach>   
	     <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 6}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 6}">
	     <tr  >
	                  
		             <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	      <thead class="blueHead1">
			<tr ><td colspan="43" class="month">Month of July</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number7=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">
		
		<!--  Month of Jan Month of Jan --> 
		
		<c:if test="${photo1.month == 7}">
			  <c:forEach var="photo2" items="${photocopier2}">
	         <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	          </c:forEach>


	    <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 7}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 7}">
	     <tr  >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27"  class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	     
	 <thead class="blueHead1">
	        <tr ><td colspan="43" class="month">Month of August</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number8=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">        
	         
	         <c:if test="${photo1.month == 8}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	      </c:forEach>   
	      
<c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 8}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 8}">
	     <tr >
	                  
		             <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	     
	      <thead class="blueHead1">
			<tr ><td colspan="43" class="month">Month of September</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number9=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">
		
		<!--  Month of Jan Month of Jan --> 
		
		<c:if test="${photo1.month == 9}">
			  <c:forEach var="photo2" items="${photocopier2}">
	         <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	    </c:forEach> 
	    

<c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 9}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 9}">
	     <tr  >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	     
	     
	 <thead class="blueHead1">
	        <tr ><td colspan="43" class="month">Month of October</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number10=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">        
	         
	         <c:if test="${photo1.month == 10}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	      </c:forEach>   
	      

<c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 10}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 10}">
	     <tr  >
	                  
		             <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	     
	      <thead class="blueHead1">
			<tr ><td colspan="43" class="month">Month of November</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number11=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">
		
		<!--  Month of Jan Month of Jan --> 
		
		<c:if test="${photo1.month == 11}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	    </c:forEach> 
	    

<c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 11}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 11}">
	     <tr  >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
	     
	 <thead class="blueHead1">
	        <tr ><td colspan="43" class="month">Month of December</td></tr>
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Model</th>
				<th class="blueth1">Serial No</th>
				<th class="blueth1">Machine Type</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Closing Meter Date</th>
				<th class="blueth1">Opening Meter Date</th>
				<th class="blueth1">Photo Type</th>
				<th class="blueth1">closing balance</th>
				<th class="blueth1">opening balance</th>
				<th class="blueth1">No.Of Prints</th>
				<th class="blueth1">Free Copies</th>
				<th class="blueth1">Extra Copies(X1)</th>
				<th class="blueth1">PerCopy Cost(X2)</th>
				<th class="blueth1">Charged Amt(A)=(X1*X2)</th>
				<th class="blueth1">Charged CGST %</th>
				<th class="blueth1">Charged CGST Amt(B)</th>
				<th class="blueth1">Charged SGST %</th>
				<th class="blueth1">Charged SGST Amt(C)</th>
				<th class="blueth1">RentalAmt(D)</th>
				<th class="blueth1">Rent CGST %</th>
				<th class="blueth1">Rent CGST Amt(E)</th>
				<th class="blueth1">Rent SGST %</th>
				<th class="blueth1">Rent SGST Amt(F)</th>
				<th class="blueth1">Total(A+B+C+D+E+F)</th>
				<th class="blueth1">Rent Invoice No</th>
				<th class="blueth1">Rent Invoice Amount</th>
				<th class="blueth1">Rent Invoice Date</th>
				<th class="blueth1">Rent Invoice File</th>
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">Agreement Date</th>
				<th class="blueth1">Agreement Start Date</th>
				<th class="blueth1">Agreement End Date</th>
				<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Invoice File</th>
				<th class="blueth1">Edit/Update</th>
				
			</tr>
			</thead>
			  <tbody >
			  <%int number12=0;%>
		<c:set var="flag" value="${1000}"/>
		<c:forEach var="photo1" items="${photocopier1}">        
	         
	         <c:if test="${photo1.month == 12}">
			  <c:forEach var="photo2" items="${photocopier2}">
	          <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Mono'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="2"><%=++number1%></td>
		              <td rowspan="2">${photo1.branchName} </td>
		              <td rowspan="2">${photo1.branchLocation} </td>
		              <td rowspan="2">${photo1.vendorname} </td>
		              <td rowspan="2">${photo1.modelno} </td>
		              <td rowspan="2" class="serialno">${photo1.serialno} </td>
		              <td rowspan="2">${photo1.machinetype} </td>
		              <td rowspan="2">${photo1.month_of_payment} </td>
				      <td rowspan="2">${photo1.closingdate}</td>
				      <td rowspan="2">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="2" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="2" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="2" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="2">${photo1.rinvoice_no} </td>
		              <td rowspan="2">${photo1.rinvoice_Amt} </td><td rowspan="2">${photo1.rinvoice_date} </td>
		              
		              <td rowspan="2"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="2" >${photo1.chequeNo} </td>
		              <td rowspan="2" >${photo1.chequeAmt} </td>
		              <td rowspan="2" >${photo1.chequeDate} </td>
		              <td rowspan="2" >${photo1.agreementdate} </td>
		              <td rowspan="2" >${photo1.agreementsdate} </td>
		              <td rowspan="2" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="2"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if> 
			 <c:if test = "${photo1.ph_id == photo2.ph_id && photo1.machinetype eq 'Colour'}">
	    <tr>
	    
	               <c:if test="${flag eq '1000'}">
		              <td rowspan="4"><%=++number1%></td>
		              <td rowspan="4">${photo1.branchName} </td>
		              <td rowspan="4">${photo1.branchLocation} </td>
		              <td rowspan="4">${photo1.vendorname} </td>
		              <td rowspan="4">${photo1.modelno} </td>
		              <td rowspan="4" class="serialno">${photo1.serialno} </td>
		              <td rowspan="4">${photo1.machinetype} </td>
		              <td rowspan="4">${photo1.month_of_payment} </td>
				      <td rowspan="4">${photo1.closingdate}</td>
				      <td rowspan="4">${photo1.openingdate}</td>
		            </c:if>
		              <td>${photo2.photo_type} </td>
	                  <td class="amt">${photo2.closing_balance} </td>
		              <td class="amt">${photo2.opening_balance} </td>
		              <td class="amt">${photo2.total_copies} </td>
		              <td class="amt">${photo2.free_copies} </td>
		              <td class="amt3">${photo2.extra_copies} </td>
		              <td class="amt3">${photo2.per_copy_cost} </td>
		              <td class="amt2">${photo2.charged_amt} </td>
		              <td class="amt2">${photo2.cgst_per} </td>
		              <td class="amt2">${photo2.cgst_amt} </td>
		              <td class="amt2">${photo2.sgst_per} </td>
		              <td class="amt2">${photo2.sgst_amt} </td>
		              
		           <c:if test="${flag eq '1000'}">
	                  <td rowspan="4" class="amt2">${photo1.rentamt} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rcgst_amt} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_per} </td>
		              <td rowspan="4" class="amt2">${photo1.rsgst_amt} </td>
		              <td rowspan="4" class="amt1">${photo1.total_amt} </td>
		              <td rowspan="4">${photo1.rinvoice_no} </td>
		              <td rowspan="4">${photo1.rinvoice_date} </td>
		              <td rowspan="4">${photo1.rinvoice_Amt} </td>
		              <td rowspan="4"> <a href="PhotoCopier/DownloadFile.jsp?f=${photo1.rfilepath}">${photo1.rfilename}</a></td>
		              <td rowspan="4" >${photo1.chequeNo} </td>
		              <td rowspan="4" >${photo1.chequeAmt} </td>
		              <td rowspan="4" >${photo1.chequeDate} </td>
		              <td rowspan="4" >${photo1.agreementdate} </td>
		              <td rowspan="4" >${photo1.agreementsdate} </td>
		              <td rowspan="4" >${photo1.agreementedate} </td>
		           </c:if>
		              <td >${photo2.invoice_no} </td>
		              <td >${photo2.invoice_amt} </td>
		              <td >${photo2.invoice_date} </td>
		              <td > <a href="PhotoCopier/DownloadFile.jsp?f=${photo2.filepath}">${photo2.filename}</a></td>		              
		           <c:if test="${flag eq '1000'}">
		              <td bgcolor="white" width="150" rowspan="4"><font size="3" color="blue"><a href="PhotoCopier/EditPhotoCopierDetails.jsp?phid=${photo1.ph_id}&from=<%=fromdate1%>&todate=<%=todate%>">Edit/Update</a></font></td>      
			       </c:if>
		           <c:set var="flag" value="${1001}"/>
			 </tr> 
			 </c:if>
	         </c:forEach> 
	         <c:set var="flag" value="${1000}"/>
	         </c:if>
	      </c:forEach>     
	      <c:forEach var="photo5" items="${photocopier1}">
		   <c:if test="${photo5.month == 12}">
             <c:forEach var="photo3" items="${photocopier3}">
			     <c:if test="${photo3.month == 12}">
	     <tr >
	                  
		              <c:if test="${flag eq '1000'}">
		              <td colspan="27" class="blueth1">Grand Total</td>
	                  <%-- <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
		              <td></td>
	                  <td rowspan="3" class="amt2">${photo3.rentamt} </td>
		              <td rowspan="3" class="amt2">${photo3.taxamt} </td> --%>
		              <td  class="amt4">${photo3.total_amt} </td>
		              </c:if>
		              <c:set var="flag" value="${1001}"/>
	     </tr>
	     </c:if>
	     </c:forEach>
	     </c:if>
	     </c:forEach>
  </table><br>
   <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="HOME.jsp?msg=1"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="OtherPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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