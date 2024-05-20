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
				<th >Location</th>
				<th >Initiator</th>
				<th >Month</th>
				<th >Total Newins Id's Used</th>				
			</tr>
			</thead>
			  <tbody class="blueBody1">
			  <%int number=0;%>
			<c:forEach var="newins" items="${newinsMonthWiseUsed}">			
			<tr >
			            <td ><%=++number%></td>
						<td >${newins.branchName}</td>
					    <td >${newins.branchLocation}</td>
						<td >${newins.empName}</td>
						<td >${newins.month}</td>
						<td >${newins.total_used}</td>
						
			</tr>
			</c:forEach>			
						
			</tbody>
			</table>
	
</body>
</html>