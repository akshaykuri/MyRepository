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
				<th class="blueth1">Isp Outage No</th>
				<th class="blueth1">Circuit Id</th>
				<th class="blueth1">Link Type</th>
				<th class="blueth1">ISP Name</th>
			    <th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Trouble Ticket No</th>
				<th class="blueth1" colspan="2">Connection DownTime</th>
				<th class="blueth1">Reason</th>
				<th  class="blueth1"colspan="2">Call Logged Time</th>
				<th class="blueth1" colspan="2">Connection Restored Time</th>
				<th class="blueth1">Outage Report </th>
				<th class="blueth1">Status</th>
				
			</tr>
			</thead>
			  <tbody class="blueBody">
			  <%int number=0;%>
			<c:forEach var="ispOutage" items="${ispOutageDetails}">
			
		<tr >
			<td><%=++number%></td>
			<td >${ispOutage.ispOutageId}</td>	
			<td >${ispOutage.circuitId}</td>		
			<td >${ispOutage.linkType}</td>
			<td >${ispOutage.isp_name}</td>
			<td >${ispOutage.branchName}</td>
			<td >${ispOutage.branchLocation}</td>
			<td >${ispOutage.troubleTicketNo}</td>
			<td >${ispOutage.connectionDowndate}</td><td >${ispOutage.linkdowntime}</td>
			<td >${ispOutage.reason}</td>			
		    <td >${ispOutage.callLoggeddate}</td><td >${ispOutage.calllogtime}</td>
			<td>${ispOutage.conRestoreddate}</td><td >${ispOutage.linkrestoredtime}</td>
			<td>${ispOutage.outageReport}</td>
			<td class="bluetd2">${ispOutage.remarks}</td>
		</tr>
			
			</c:forEach>
			  </tbody>
    </table>
  
</form>
<br>


		
</body>
</html>