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
				<th class="blueth1">Booking Number</th>
				<th class="blueth1">Booked BY</th>
				<th class="blueth1">Booking For Person</th>
				<th class="blueth1">Booked for Branch</th>
			    <th class="blueth1">Booked For Department</th>
				<th class="blueth1">Purpose</th>
				<th class="blueth1">Booked Room Type</th>
				<th class="blueth1">Meeting Type</th>
				<th class="blueth1">From Date</th>
				<th class="blueth1">To Date</th>
				<th class="blueth1">From Time</th>
				<th class="blueth1">To Time</th>
				<th class="blueth1">No Of Attendies</th>
				<th class="blueth1">Remarks</th>
			</tr>
			</thead>
			  <tbody class="blueBody">
			  <%int number=0;%>
			<c:forEach var="con" items="${conferencedetails}">
			
		<tr >
			<td><%=++number%></td>
			<td >${con.bookingNo}</td>	
			<td >${con.userName}</td>		
			<td >${con.bookingForPerson}</td>
			<td >${con.bookingForBranch}</td>
			<td >${con.bookingForDept}</td>
			<td >${con.purpose}</td>
			<td >${con.bookingRoomType}</td>
			<td >${con.meetingType}</td>
			<td >${con.fromdate}</td>			
		    <td >${con.todate}</td>
			<td>${con.fromtime}</td>
			<td>${con.totime}</td>
			<td>${con.noAttendies}</td>
			<td>${con.remarks}</td>
			
		</tr>
			
			</c:forEach>
			  </tbody>
    </table>
  
</form>
<br>


		
</body>
</html>