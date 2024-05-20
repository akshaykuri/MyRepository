<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
<body style="overflow-x:hidden ">

<form action="FrontController" method="get">
		
	<br><br>
	
   <table class ="blue2" border="1">
      <thead>
        <tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">AssetNo</th>
				<th class="blueth1">PO Number</th>
				<th class="blueth1">Vender</th>
				<th class="blueth1">AMC PO</th>
			    <th class="blueth1">AMC Vender</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Sub Branch</th>
				<th class="blueth1">AMC From Date</th>
				<th class="blueth1">AMC To Date</th>
				<th class="blueth1">AMC Expiry</th>
				<th class="blueth1">AMC Amount</th>
			</tr>
			</thead>
			  <tbody class="blueBody">
			  <%int number=0;%>
			<c:forEach var="amc" items="${amcDetails}">
			
		<tr >
			<td><%=++number%></td>
			<td >${amc.assetNo}</td>	
			<td >${amc.poNum}</td>		
			<td >${amc.vender}</td>
			<td >${amc.amcPoNum}</td>
			<td >${amc.amcVender}</td>
			<td >${amc.branch}</td>
			<td >${amc.sbranch}</td>
			<td >${amc.amcfrom}</td>
			<td >${amc.amcto}</td>			
		    <td >${amc.amcexpiry}</td>
			<td>${amc.amcamt}</td>
			
		</tr>
			
			</c:forEach>
			  </tbody>
    </table>
  
</form>
<br>


		
</body>
</html>