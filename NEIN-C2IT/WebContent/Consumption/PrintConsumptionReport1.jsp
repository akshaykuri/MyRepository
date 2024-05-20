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
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Type</th>
				<th class="blueth1">User Name</th>
				<th class="blueth1">Number</th>
				<th class="blueth1">Relationship Number</th>
				<th class="blueth1">ISP Network Type</th>
				<th class="blueth1">Consumption Type</th>
				<th class="blueth1">Monthly Rental Charges+Tax</th>
				<th class="blueth1">Bill From Date</th>
				<th class="blueth1">Bill To Date</th>
				<th class="blueth1">Month Of Payment</th>
				<th class="blueth1">Current Month Payment</th>
				<th class="blueth1">Status</th>
				<th class="blueth1">Invoice Number</th>
				<th class="blueth1">Invoice Amount </th>
				<th class="blueth1">Invoice Date</th>
				<th class="blueth1">cheque Number</th>
				<th class="blueth1">cheque Amount</th>
				<th class="blueth1">cheque Date</th>
			   
			</tr>
			</thead>
			  <tbody class="blueBody1">
			  <%int number=0;%>
			<c:forEach var="consumption" items="${consumption1}">
			
			<tr >
			<td class="bluetd1"><%=++number%></td>
			<td class="bluetd1">${consumption.branchName}</td>
			<td class="bluetd1">${consumption.branchLocation}</td>
			<td class="bluetd1">${consumption.type}</td>
			<td class="bluetd1">${consumption.userName}</td>
			<td class="bluetd2">${consumption.number}</td>
			<td class="bluetd1">${consumption.relationship_no}</td>
			<td class="bluetd2">${consumption.isptype}</td>
			<td class="bluetd2">${consumption.contype}</td>
			<td class="bluetd2">${consumption.monthlyAmtPaid}</td>
			<td class="bluetd1">${consumption.billfromdate}</td>
			<td class="bluetd1">${consumption.billtodate}</td>
			<td class="bluetd2">${consumption.monthOfPayment}</td>
			<td class="bluetd2">${consumption.current_month_amt}</td>
			<td class="bluetd1">${consumption.status}</td>
			<td class="bluetd1">${consumption.invoiceno}</td>
			<td class="bluetd1">${consumption.invoiceamt}</td>
			<td class="bluetd1">${consumption.invoicedate}</td>
			<td class="bluetd1">${consumption.chequenumber}</td>
			<td class="bluetd1">${consumption.chequeamt}</td>
			<td class="bluetd1">${consumption.chequedate}</td>
			
			</tr>
			
			</c:forEach>
			</tbody>
			</table>
	
</body>
</html>