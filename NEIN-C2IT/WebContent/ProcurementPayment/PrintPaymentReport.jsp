<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
     <%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.blue2{  border:2px solid #1ABC9C; border-collapse:separate; width:90%; overflow-y: auto; margin:auto; }
.blueHead1{ background:#1ABC9C; color:white; }
.blueth1{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; }
.blueth2{ border: 1px solid black;padding: 5px; background-color: #1ABC9C;color: white; text-align: center;}
.bluetd1{ text-align: center;border: 1px solid black; }
.bluetd2{ border: 1px solid black;padding: 1px solid black;; background-color: #FAEBD7;color: red;text-align: center;}
.bluetd3{ border: 1px solid black;padding: 1px solid black;; color: blue;text-align: center;}
</style>
</head>
<body id="bodylen">
<table class ="blue2" border="1" id="mytable">
			<thead class="blueHead1">
			<tr class="bluetr1">
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
				<th >TDS per %</th>
				<th >TDS Amt</th>
				<th >Total Amount</th>
				<th >Delivery Date</th>
				<th >Bill No</th>
				<th >Bill Date</th>
				<th >Cheque No</th>
				<th >Payment Date</th>
				<th >Remarks</th>
			   
			</tr>
			</thead>
			  <tbody class="blueBody1">
			  <%int number=0;%>
			<c:forEach var="payment" items="${paymetReportMonthWise}">
			
			<tr >
			<td ><%=++number%></td>
						<td >${payment.branchName}</td>
					    <td >${payment.branchLocation}</td>
						<td >${payment.full_name}</td>
						<td >${payment.po_number}</td>
						<td >${payment.po_date}</td>
						<td >${payment.vendorName}</td>
						<td >${payment.item_name}</td>
						<td >${payment.per_item_amt}</td>
						<td >${payment.quantity}</td>
						<td >${payment.amount}</td>
						<td >${payment.igst_per}</td>
						<td >${payment.igst_amt}</td>
						<td >${payment.cgst_per}</td>
						<td >${payment.cgst_amt}</td>
						<td >${payment.sgst_amt}</td>
						<td >${payment.sgst_per}</td>
						<td >${payment.tds_per}</td>
						<td >${payment.tds_amt}</td>
						<td class="bluetd3">${payment.total_amt}</td>
						<td >${payment.delivery_date}</td>
						<td >${payment.bill_no}</td>		
						<td >${payment.bill_date}</td>
						<td >${payment.cheque_no}</td>		
						<td >${payment.payment_date}</td>
						<td >${payment.remarks}</td>	
			</tr>
			</c:forEach>
			
			<tr >
			<td colspan="19" align="center">Grand Total</td>
			<td class="bluetd2">${totalAmount}</td>
			
			</tr>
			
			</tbody>
			</table>
	
</body>
</html>