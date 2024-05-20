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
				<th class="blueth1">Jan</th>
				<th class="blueth1">Feb</th>
				<th class="blueth1">Mar</th>
				<th class="blueth1">Apr</th>
				<th class="blueth1">May</th>
				<th class="blueth1">June</th>
				<th class="blueth1">July</th>
				<th class="blueth1">Aug</th>
				<th class="blueth1">Sep</th>
				<th class="blueth1">Oct</th>
				<th class="blueth1">Nov</th>
				<th class="blueth1">Dec</th>
				<th class="blueth1">Total</th>
			   
			</tr>
			</thead>
			  <tbody class="blueBody1">
			  <%int number=0;%>
			<c:forEach var="consumption" items="${consumption}">
			
			<tr >
			<td class="bluetd1"><%=++number%></td>
			<td class="bluetd1">${consumption.branchName}</td>
			<td class="bluetd1">${consumption.branchLocation}</td>
			<td class="bluetd1">${consumption.type}</td>
			<td class="bluetd1">${consumption.userName}</td>
			<td class="bluetd1">${consumption.number}</td>
			<td class="bluetd1">${consumption.relationship_no}</td>
			<td class="bluetd1">${consumption.isptype}</td>
			<td class="bluetd1">${consumption.contype}</td>
			<td class="blueth2">${consumption.monthlyAmtPaid}</td>
			<td class="bluetd2">${consumption.amtJan}</td>
			<td class="bluetd2">${consumption.amtFeb}</td>
			<td class="bluetd2">${consumption.amtMar}</td>
			<td class="bluetd2">${consumption.amtApr}</td>
			<td class="bluetd2">${consumption.amtMay}</td>
			<td class="bluetd2">${consumption.amtJune}</td>
			<td class="bluetd2">${consumption.amtJuly}</td>
			<td class="bluetd2">${consumption.amtAug}</td>
			<td class="bluetd2">${consumption.amtSep}</td>
			<td class="bluetd2">${consumption.amtOct}</td>
			<td class="bluetd2">${consumption.amtNov}</td>
			<td class="bluetd2">${consumption.amtDec}</td>
            <td class="bluetd2">${consumption.totalAmt}</td>
			</tr>
			
			</c:forEach>
			 <c:forEach var="consumption" items="${consumption1}">
			<tr>
			<td colspan="10" class="blueth1">Grand Total</td>
			<!-- <td>Grand Total</td> -->
			<td class="bluetd2">${consumption.amtJan}</td>
			<td class="bluetd2">${consumption.amtFeb}</td>
			<td class="bluetd2">${consumption.amtMar}</td>
			<td class="bluetd2">${consumption.amtApr}</td>
			<td class="bluetd2">${consumption.amtMay}</td>
			<td class="bluetd2">${consumption.amtJune}</td>
			<td class="bluetd2">${consumption.amtJuly}</td>
			<td class="bluetd2">${consumption.amtAug}</td>
			<td class="bluetd2">${consumption.amtSep}</td>
			<td class="bluetd2">${consumption.amtOct}</td>
			<td class="bluetd2">${consumption.amtNov}</td>
			<td class="bluetd2">${consumption.amtDec}</td>
		    <td class="bluetd3">${consumption.totalAmt}</td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
	
</body>
</html>