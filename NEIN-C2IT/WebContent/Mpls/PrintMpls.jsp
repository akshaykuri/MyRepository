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
	.bluetd3{ border: 1px solid black;padding: 1px solid black;background-color: #F0FFFF;color: #0000FF;text-align: center;}
	.bluetd4{ text-align: center;border: 1px solid black; background-color: #F8F8FF;color: #9370DB;}
	.month{border: 1px solid black;padding: 1px solid black;color: #000000 ;text-align: center;font-weight: bold;}
</style>

</head>
<body id="bodylen">

<table class ="blue2" border="1" id="mytable">
			<thead class="blueHead1">
			<tr >
				<th class="blueth1">SL No.</th>
				<th class="blueth1">Branch</th>
				<th class="blueth1">Location</th>
				<th class="blueth1">Circuit Id</th>
				<th class="blueth1">Link Type</th>
				<th class="blueth1">ISP Name</th>
				<th class="blueth1">LAN Pool</th>
				<th class="blueth1">WAN Pool</th>
				<th class="blueth1">Account/Relationship No</th>
				<th class="blueth1">BandWidth</th>
				<th class="blueth1">Media</th>
				<th class="blueth1">ARC</th>
				<th class="blueth1">OTC</th>
				<th class="blueth1">PO No</th>
				<th class="blueth1">PO date</th>
				<th class="blueth1">Bill Ref No</th>
				<th class="blueth1">Bill date</th>
				<th class="blueth1">From Date</th>
				<th class="blueth1">To Date</th>
				<th class="blueth1">Amount(A)</th>
				<th class="blueth1">TDS %</th>
				<th class="blueth1">TDS Amount(B)</th>
				<th class="blueth1">CGST %</th>
				<th class="blueth1">CGST Amount(C)</th>
				<th class="blueth1">SGST %</th>
				<th class="blueth1">SGST Amount(D)</th>
				<th class="blueth1">Total Invoice Amount(E=A+C+D)</th>
				<th class="blueth1">Total Payable/Less TDS(F=E-B)</th>
			<!--	<th class="blueth1">Invoice No</th>
				<th class="blueth1">Invoice Amount</th>
				<th class="blueth1">Invoice Date</th> -->
				<th class="blueth1">Cheque No</th>
				<th class="blueth1">Cheque Amount</th>
				<th class="blueth1">Cheque Date</th>
			   
				
			</tr>
			</thead>
			  <tbody >
			  <%int number1=0;%>
			  <c:forEach var="mpls" items="${mpls}">	
					  <tr >
							<td ><%=++number1%></td>
							<td >${mpls.branchName}</td>
						    <td >${mpls.branchLocation}</td> 
							<td class="bluetd3">${mpls.circuit_Id}</td>
							<td class="bluetd3">${mpls.linktype_id}</td>
							<td class="bluetd3">${mpls.isp_name}</td>
							<td >${mpls.lanpool}</td>
							<td >${mpls.wanpool}</td>
							<td >${mpls.acc_relation_no}</td>
							<td >${mpls.bandwidth}</td>
							<td >${mpls.media}</td>
							<td >${mpls.arc}</td>
							<td >${mpls.otc}</td>
							<td >${mpls.po_number}</td>
							<td >${mpls.po_date}</td>
							<td class="bluetd4">${mpls.bill_refno}</td>
							<td class="bluetd4">${mpls.bill_date}</td>
							<td class="bluetd4">${mpls.bill_fdate}</td>
							<td class="bluetd4">${mpls.bill_tdate}</td>
							<td class="bluetd2">${mpls.amount}</td>
							<td class="bluetd2">${mpls.tds_per}%</td><td class="bluetd2">${mpls.tds_amt}</td>
							<td class="bluetd2">${mpls.tax_per}%</td><td class="bluetd2">${mpls.tax_amt}</td>
							<td class="bluetd2">${mpls.tax_per1}%</td><td class="bluetd2">${mpls.tax_amt1}</td>
							<td class="bluetd2">${mpls.total_invoice_amt}</td>
							<td class="bluetd3">${mpls.total_pay_amt}</td>
						<!--	<td >${mpls.invoiceno}</td>
							<td >${mpls.inoviceAmt}</td>
							<td >${mpls.invoiceDate}</td> -->
							<td >${mpls.chequeno}</td>
							<td >${mpls.chequeAmt}</td>
							<td >${mpls.chequeDate}</td>
					</tr>
					</c:forEach>	
					<c:forEach var="mpls" items="${branchTotal}">	
					  <tr >
							<td colspan="19">Total Amount</td>
							<td class="bluetd2">${mpls.amount}</td>
							<td ></td>
							<td class="bluetd2">${mpls.tds_amt}</td>
							<td ></td>
							<td class="bluetd2">${mpls.tax_amt}</td>
							<td ></td>
							<td class="bluetd2">${mpls.tax_amt1}</td>
							<td class="bluetd2">${mpls.total_invoice_amt}</td>
							<td class="bluetd3">${mpls.total_pay_amt}</td>						
					</tr>
					</c:forEach>	 
</tbody>
</table>

</body>
</html>