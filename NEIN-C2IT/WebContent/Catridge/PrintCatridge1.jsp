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
.blueth2{ border: 1px solid black;padding: 5px; background-color: #F0F8FF;color: #0000FF; text-align: center;}
.bluetd1{ text-align: center;border: 1px solid black; }
.bluetd2{ border: 1px solid black;padding: 1px solid black;; background-color: #FAEBD7;color: #0000FF;text-align: center;}
.bluetd3{ border: 1px solid black;padding: 1px solid black;; color: Red;text-align: center;}
</style>

</head>
<body id="bodylen">
<table class ="blue2" border="1" id="mytable">
			<thead class="blueHead1">
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Cartridge Model</th>
				<th class="blueth1">Quantity</th>
				<th class="blueth1">Cost</th>
				<th class="blueth1">Amount</th>
				<th class="blueth1">Vendor Name</th>
				<th class="blueth1">Invoice Number</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">Cheque Number</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
				<th class="blueth1">PO Number</th>
				<th class="blueth1">Purchase Date</th>
				
			</tr>
			</thead>
			  <tbody class="blueBody1">
			  <%int number=0;%>
			<c:forEach var="MonthWiseDetails" items="${MonthWiseDetails}">
			
			<tr >
			<td class="bluetd1"><%=++number%></td>
			<td class="bluetd1">${MonthWiseDetails.branchLocation}</td>
			<td class="bluetd1">${MonthWiseDetails.catridgeModel}</td>
			<td class="bluetd2">${MonthWiseDetails.quantity}</td>
			<td class="bluetd2">${MonthWiseDetails.cost}</td>
			<td class="bluetd2">${MonthWiseDetails.amount}</td>
			<td class="bluetd1">${MonthWiseDetails.vendorName}</td>
			<td class="bluetd1">${MonthWiseDetails.invoiceno}</td>
			<td class="bluetd1">${MonthWiseDetails.inoviceAmt}</td>
			<td class="bluetd1">${MonthWiseDetails.invoiceDate}</td>
			<td class="bluetd1">${MonthWiseDetails.chequeno}</td>
			<td class="bluetd1">${MonthWiseDetails.chequeAmt}</td>
			<td class="bluetd1">${MonthWiseDetails.chequeDate}</td>
			<td class="bluetd1">${MonthWiseDetails.poNumber}</td>
			<td class="bluetd1">${MonthWiseDetails.monthOfPayment}</td>
			
			</tr>
			
			</c:forEach>
			</tbody>
			</table>
	
</body>
</html>