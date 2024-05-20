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
.bluetd2{ border: 1px solid black;padding: 1px solid black;; background-color: #FAEBD7;color: #0000FF;text-align: center;}
.bluetd3{ border: 1px solid black;padding: 1px solid black;; color: Red;text-align: center;}
</style>
</head>
<body id="bodylen">
<table class ="blue2" border="1" id="mytable">
			<thead class="blueHead1">
			<tr class="bluetr1">
				<th class="blueth2">SL No.</th>
				<th class="blueth2">Branch</th>
				<!-- <th >Location</th> -->
				<th class="blueth2">Printer Name</th>
				<th class="blueth2">Cartridge Model</th>
				<th class="blueth2">Jan</th>
				<th class="blueth2">Feb</th>
				<th class="blueth2">Mar</th>
				<th class="blueth2">Apr</th>
				<th class="blueth2">May</th>
				<th class="blueth2">June</th>
				<th class="blueth2">July</th>
				<th class="blueth2">Aug</th>
				<th class="blueth2">Sep</th>
				<th class="blueth2">Oct</th>
				<th class="blueth2">Nov</th>
				<th class="blueth2">Dec</th>
				<th class="blueth2">Total</th>
			   
			</tr>
			</thead>
			  <tbody class="blueBody1">
			  <%int number=0;%>
			<c:forEach var="catridge" items="${ModelWiseDetails}">
			
			<tr >
			<td class="bluetd1"><%=++number%></td>
			<td class="bluetd1">${catridge.branchName}</td>
			<%-- <td ><%=rs1.getString("b_name")%></td> --%>
			<td class="bluetd1">${catridge.printerName}</td>
			<td class="bluetd1">${catridge.catridgeModel}</td>
			<td class="bluetd1">${catridge.amtJan}</td>
			<td class="bluetd1">${catridge.amtFeb}</td>
			<td class="bluetd1">${catridge.amtMar}</td>
			<td class="bluetd1">${catridge.amtApr}</td>
			<td class="bluetd1">${catridge.amtMay}</td>
			<td class="bluetd1">${catridge.amtJune}</td>
			<td class="bluetd1">${catridge.amtJuly}</td>
			<td class="bluetd1">${catridge.amtAug}</td>
			<td class="bluetd1">${catridge.amtSep}</td>
			<td class="bluetd1">${catridge.amtOct}</td>
			<td class="bluetd1">${catridge.amtNov}</td>
			<td class="bluetd1">${catridge.amtDec}</td>
            <td class="bluetd2">${catridge.modelWiseTotal}</td>
			</tr>
			
			</c:forEach>
			<c:forEach var="catridge" items="${MonthWiseDetails}">
			<tr>
			<td colspan="4" class="blueth2">Grand Total</td>
			<!-- <td>Grand Total</td> -->
			<td class="bluetd2">${catridge.amtJan}</td>
			<td class="bluetd2">${catridge.amtFeb}</td>
			<td class="bluetd2">${catridge.amtMar}</td>
			<td class="bluetd2">${catridge.amtApr}</td>
			<td class="bluetd2">${catridge.amtMay}</td>
			<td class="bluetd2">${catridge.amtJune}</td>
			<td class="bluetd2">${catridge.amtJuly}</td>
			<td class="bluetd2">${catridge.amtAug}</td>
			<td class="bluetd2">${catridge.amtSep}</td>
			<td class="bluetd2">${catridge.amtOct}</td>
			<td class="bluetd2">${catridge.amtNov}</td>
			<td class="bluetd2">${catridge.amtDec}</td>
		    <td class="bluetd3">${catridge.totalAmt}</td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
	
</body>
</html>