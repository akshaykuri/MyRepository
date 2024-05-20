<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import="java.util.Date" %>
<%@page import="java.sql.*" %> 
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="net.sf.jasperreports.view.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@include file="../banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<jsp:useBean id="currentTime" class="CON2.CurrentTime" />
<html>
<head>
<meta charset="ISO-8859-1">
<title>NEIN-C2IT</title>
<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Font-->
<link rel="stylesheet" type="text/css" href="../css/opensans-font.css">
<link rel="stylesheet" type="text/css" href="../fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- datepicker -->
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.min.css">
<!-- Main Style Css -->
<link rel="stylesheet" href="../css/styleNew.css"/>
<!-- Main CSS-->
<link href="../css/main.css" rel="stylesheet" media="all">
</head>

<script type="text/javascript">  
function sendInfo(v)  
{ 
//alert("empid :"+v);
if (typeof XMLHttpRequest != "undefined")
{    
xmlHttp= new XMLHttpRequest();    
}
else if (window.ActiveXObject)
{    
xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
} 
if (xmlHttp==null)
{   
alert("Browser does not support XMLHTTP Request");   
return;     
}      
var url="getEmployee.jsp";  
url +="?EMP_NO=" +v;
//alert(url);
xmlHttp.onreadystatechange = getInfo;  
xmlHttp.open("GET", url, true);   
xmlHttp.send(null);    
}

function getInfo()
{
var str2=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
{
     document.getElementById("resultFromAjax2").innerHTML=str2;
     document.getElementById("fname").value=document.getElementById("p1").value;
     document.getElementById("fname").readOnly=true;
     document.getElementById("iddesignation").value=document.getElementById("p2").value;
     document.getElementById("iddesignation").readOnly=true;
     document.getElementById("idbranch").value=document.getElementById("p3").value;
     document.getElementById("idbranch").readOnly=true;
     document.getElementById("iddepart").value=document.getElementById("p4").value;
     document.getElementById("iddepart").readOnly=true;
     document.getElementById("rofficer").value=document.getElementById("p5").value;
     document.getElementById("rofficer").readOnly=true;
     document.getElementById("iddeptadminP").value=document.getElementById("p8").value;
	 document.getElementById("iddeptadminP11").value=document.getElementById("p9").value;
}
else
{
     document.getElementById("resultFromAjax2").innerHTML=str2;
     document.getElementById("fname").value="";
     document.getElementById("iddesignation").value=""; 
     document.getElementById("idbranch").value="";
     document.getElementById("iddepart").value="";
     document.getElementById("rofficer").value="";
     document.getElementById("iddeptadminP").value="";
     document.getElementById("iddeptadminP11").value="";
     document.getElementById("idrodesg").value="";
	 document.getElementById("idroname").value="";
	 document.getElementById("idromail").value="";
     document.getElementById("idempid1").value="";
	 document.getElementById("idlevelno").value="";
}
}
</script>

<body>
<div class="page-content">
<div class="wizard-heading">NEIN APPLICATION FORM</div>
<div class="wizard-v6-content">
<div class="wizard-form">

<form class="form" id="form" action="#" method="post">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null; %>
<%
//NEINApplicationFormBack.jsp

Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");

%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
	 <br />
<%
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn6=null,conED=null,conET=null,conINT=null,conBC=null,conGR=null;
Statement st1= null,st2=null,st3=null,st4=null,st6=null,stED=null,stET=null,stINT=null,stBC=null,stGR=null;
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs6=null,rsED=null,rsET=null,rsINT=null,rsBC=null,rsGR=null;
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 

cn6 = con.getConnection2();
st6=cn6.createStatement();
rs6 = st6.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");


%>

<div id="form-total">


<!-- SECTION 1 (Employee details) -->
<h2>
<p class="step-icon"><span>1</span></p>
<span class="step-text">Employee Details</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Employee Details</h3>
<span>1/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" onkeypress="return isNumber(event)" onkeyup="sendInfo(this.value);" onchange="getFormDetails(this)" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control" required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control" required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control" value="<%=Name%>" required readonly>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
<label class="special-label-1"><span class="label">Employee Type</span><br><br>
<label class="radio-container">
	<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
<span class="checkmark"></span>
</label>
<label class="radio-container">
<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
<span class="checkmark"></span>
</label>
</label>
</div>
<div class="form-holder">
<label class="special-label-1"><span class="label">Employee Contract Type</span><br><br>
<label class="radio-container">
	<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
<span class="checkmark"></span>
</label>
<label class="radio-container">
	<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
<span class="checkmark"></span>
</label>
</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
<label class="special-label-1"><span class="label">Request</span><br><br>
<label class="radio-container">
	<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
<span class="checkmark"></span>
</label>
<label class="radio-container">
	<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
<span class="checkmark"></span>
</label>
</label>
</div>

<div class="form-holder">
	<label for="time" class="special-label-1">Requested Branch </label>
	<select name="req_Branch" id="reqB" class="form-control">
		<option value="-">-- Select --</option>
<%while(rs6.next()){%>     
		<option value="<%=rs6.getString(1)%>"><%=rs6.getString(2)%></option> 
<%}%>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 2 (Email ID) -->
<h2>
<p class="step-icon"><span>2</span></p>
<span class="step-text">Email ID</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Email ID</h3>
<span>2/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 3 (Domain Account) -->
<h2>
<p class="step-icon"><span>3</span></p>
<span class="step-text">Domain Account</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Domain Account</h3>
<span>3/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 4 (Biometric / Access Card) -->
<h2>
<p class="step-icon"><span>4</span></p>
<span class="step-text">Biometric / Access Card</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Biometric / Access Card</h3>
<span>4/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 5 (Shared Folder) -->
<h2>
<p class="step-icon"><span>5</span></p>
<span class="step-text">Shared Folder</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Shared Folder</h3>
<span>5/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 6 (Internet Access / FTP Access) -->
<h2>
<p class="step-icon"><span>6</span></p>
<span class="step-text">Internet Access / FTP Access</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Internet Access / FTP Access</h3>
<span>6/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 7 (NEWINS) -->
<h2>
<p class="step-icon"><span>7</span></p>
<span class="step-text">NEWINS</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>NEWINS</h3>
<span>7/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 8 (NExAS) -->
<h2>
<p class="step-icon"><span>8</span></p>
<span class="step-text">NExAS</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>NExAS</h3>
<span>8/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>


<!-- SECTION 9 (GS-NET) -->
<h2>
<p class="step-icon"><span>9</span></p>
<span class="step-text">GS-NET</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>GS-NET</h3>
<span>9/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 10 (Internal Application) -->
<h2>
<p class="step-icon"><span>10</span></p>
<span class="step-text">Internal Application</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Internal Application</h3>
<span>10/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 11 (USB Access) -->
<h2>
<p class="step-icon"><span>11</span></p>
<span class="step-text">USB Access</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>USB Access</h3>
<span>11/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 12 (VPN Access) -->
<h2>
<p class="step-icon"><span>12</span></p>
<span class="step-text">VPN Access</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>VPN Access</h3>
<span>12/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 13 (HardDisk / PenDrive) -->
<h2>
<p class="step-icon"><span>13</span></p>
<span class="step-text">HardDisk / PenDrive</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>HardDisk / PenDrive</h3>
<span>13/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>
</section>

<!-- SECTION 14 (Any Other Asset) -->
<h2>
<p class="step-icon"><span>14</span></p>
<span class="step-text">Any Other Asset</span>
</h2>
<section>
<div class="inner">
<div class="form-heading">
<h3>Any Other Asset</h3>
<span>14/14</span>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="ecode" name="emp_code" required>
		<span class="label">Employee Code</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="fname" name="full_name" required>
		<span class="label">Full Name</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="idbranch" name="branch" required>
		<span class="label">Branch </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="depart" id="iddepart" class="form-control"  required>
		<span class="label">Department</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="iddesignation" name="designation" required>
		<span class="label">Designation </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="reporting_officer" id="rofficer" class="form-control"  required>
		<span class="label">Reporting Officer</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" class="form-control" id="sow" name="scopeOfWork" required>
		<span class="label">Scope Of Work </span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input type="text" name="requestBy" id="req" class="form-control"  required>
		<span class="label">Requested By</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOptionper" type="radio" name="employeeOption" value="Permanent"/>Permanent
		<input id="employeeOptiontemp" type="radio" name="employeeOption" value="Probation"/>Probation
		<span class="label">Employee Type</span>
	</label>
</div>
<div class="form-holder">
	<label class="form-row-inner">
		<input id="employeeOption1on" type="radio" name="employeeOption1" value="On Roll"/>On Roll
		<input id="employeeOption1con" type="radio" name="employeeOption1" value="Contract"/>Contract
		<span class="label">Employee Contract Type</span>
	</label>
</div>
</div>

<div class="form-row">
<div class="form-holder">
	<label class="form-row-inner">
		<input type="radio" name="requestOption" value="New" id="requestOptionnew"/>New
		<input type="radio" name="requestOption" value="Change" id="requestOptionchange"/>Change
		<span class="label">Request</span>
	</label>
</div>
<div class="form-holder form-holder-2">
	<label for="date" class="special-label"><span class="label">Requested Branch</span></label>
	<select name="month" id="month" class="form-control">
		<option value="-" selected>--Select--</option>
	</select>
</div>
</div>
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</section>

</div>
</form>

</div>
</div>
</div>

<div id="resultFromAjax3" style="display:none;"></div>
<div id="resultFromAjaxdeptAdmin" style="display:none;"></div>
<div id="resultFromAjax21" style="display:none;"></div>
<div id="resultFromAjax2" style="display:none;"></div>
<div id="resultFromAjax22" style="display:none;"></div>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery.steps.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/main.js"></script>

</body>
</html>