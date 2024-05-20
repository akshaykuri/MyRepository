<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@ include file="../../../banner.jsp" %>
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<link rel="shortcut icon" type="../../image/x-icon" href="../../images/faviconnnnn.ico">
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />
<body background =".jpg" >
<head><title>DATE TO DATE WISE REPORT</title>
</head>
<script type="text/javascript">
function statusWise()//IT CLEARANCE
{
document.form.action="ItClearanceReport.jsp";
document.form.method="post";
document.form.submit();
}
function statusWiseExcel()
{
document.form.action="ItClearanceReportExcel.jsp";
document.form.method="post";
document.form.submit();
}

function Branch()//DOMAIN REPORT
{
document.form.action="DomainReport.jsp";
document.form.method="post";
document.form.submit();
}
function BranchExcel()
{
document.form.action="DomainReportExcel.jsp";
document.form.method="post";
document.form.submit();
}
function company()//Lotus Notes
{
document.form.action="LotusReport.jsp";
document.form.method="post";
document.form.submit();
}
function companyExcel()
{
document.form.action="LotusExcelReport.jsp";
document.form.method="post";
document.form.submit();
}
function salesExecutive()//ACCESS CARD REPORT
{
document.form.action="AccessCardReport.jsp";
document.form.method="post";
document.form.submit();
}
function salesExecutiveExcel()
{
document.form.action="AccessCardExcelReport.jsp";
document.form.method="post";
document.form.submit();
}
function SalesExecutiveProduct()//SHARED FOLDER
{
document.form.action="SharedFolderReport.jsp";
document.form.method="post";
document.form.submit();
}
function SalesExecutiveProductExcel()
{
document.form.action="SharedFolderExcelReport.jsp";
document.form.method="post";
document.form.submit();
}

function ServiceProduct()//INTERNET ACCESS
{
document.form.action="InternetReport.jsp";
document.form.method="post";
document.form.submit();
}
function ServiceProductExcel()
{
document.form.action="InternetExcelReport.jsp";
document.form.method="post";
document.form.submit();
}

function Newins()//Newins
{
document.form.action="NewinsReport.jsp";
document.form.method="post";
document.form.submit();
}
function NewinsExcel()
{
document.form.action="NewinsExcelReport.jsp";
document.form.method="post";
document.form.submit();
}
function LT()//Lotus Traveler
{
document.form.action="LotusTravelerReport.jsp";
document.form.method="post";
document.form.submit();
}
function LTTExcel()
{
document.form.action="LotusTravelerExcelReport.jsp";
document.form.method="post";
document.form.submit();
}

function NX()//NExAS form
{//alert("her");
document.form.action="NExASformReports.jsp";
document.form.method="post";
document.form.submit();
}
function NXExcel()
{//alert("her1111");
document.form.action="NExASformReportsExcelRepor.jsp";
document.form.method="post";
document.form.submit();
}

function GSNET1()//GSNET form
{//alert("her");
document.form.action="GSNETformReports.jsp";
document.form.method="post";
document.form.submit();
}
function GSNETExcel()
{//alert("her1111");
document.form.action="GSNETformReportsExcelRepor.jsp";
document.form.method="post";
document.form.submit();
}
</script>
<script language="javascript" type="text/javascript">
function StatusWise()//IT CLEARANCE
{	
var p1=document.form.branch1; 
var y1=document.form.date1;
var y2=document.form.date11;
if ((p1.value==null)||(p1.value=="NULL")||(p1.value==""))
{
	alert("Select Branch For IT Clearance Form!");
	p1.focus(); 
	return false; 
}
if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
{ 
	 alert("Select From Date For IT Clearance Form!"); 
	 y1.focus(); 
	 return false; 
}
if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
{ 
	alert("Select To Date For IT Clearance Form!"); 
	y2.focus(); 
	return false; 
}
else{
	return true;
}
}
 
function ValidateApp(obj)
{
var p1=document.form.appForm; 
var y1=document.form.dateNE;
var y2=document.form.dateNEE;
if((p1.value==null)||(p1.value=="NULL")||(p1.value==""))
{
alert("Select Branch for Application Form!"); 
p1.focus(); 
return false; 
}
if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
{ 
alert("Select From Date for Application Form!"); 
y1.focus(); 
return false; 
}
if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
{ 
alert("Select To Date for Application Form!"); 
y2.focus(); 
return false; 
}
if(obj=="DISPLAY"){
	document.form.action="AppFormReport.jsp";
	document.form.method="post";
	document.form.submit();
}else{
	document.form.action="AppFormReportExcel.jsp";
	document.form.method="post";
	document.form.submit();
}
}

function ValidateCompany()
{	var p1=document.form.company4; var y1=document.form.date6;var y2=document.form.date66;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
function validateSalesExecutive()//Access Card
{	var p1=document.form.person2; var y1=document.form.date4;var y2=document.form.date44;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
function validateSalesExeProduct()
{	var p1=document.form.person3; var y1=document.form.date3;var y2=document.form.date33;var d1=document.form.product3;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
/*  if ((d1.value==null)||(d1.value=="NULL"))
	{alert("Select Service Product!"); d1.focus(); return false; } */
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
function validateBranch()
{	var p1=document.form.branch2; var y1=document.form.date2;var y2=document.form.date22;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch !"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
function validateServiceProduct()//5
{	var p1=document.form.product5; var y1=document.form.date5;var y2=document.form.date55;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
function validateNewins()//5
{	var p1=document.form.newins; var y1=document.form.dateN;var y2=document.form.dateNN;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
function ValidateLT()//Lotus Traveler,NExASformReports
{	var p1=document.form.lotusTraveler; var y1=document.form.dateLT;var y2=document.form.dateLTT;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}

function ValidateNExAS()//Lotus Traveler,NExASformReports
{	var p1=document.form.nexas; var y1=document.form.dateNE1;var y2=document.form.dateNEE1;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}

function ValidateGSNET()//Lotus Traveler,NExASformReports
{	var p1=document.form.GSNET; var y1=document.form.dateGSNET;var y2=document.form.dateGSNETT;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch!"); p1.focus(); return false; }
 if ((y1.value==null)||(y1.value=="NULL")||(y1.value==""))
				{ alert("Select  From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL")||(y2.value==""))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}
//
</script>
<%
session.setMaxInactiveInterval(30*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../adminlink.jsp?msg="+msg2);
	//response.sendRedirect("adminlink.jsp?msg=1");
}
%>
<body bgcolor="" leftmargin="80" rightmargin="80">
<div id="wrapper">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center">
<td align="left">
<img src="../../images/nippon.gif" height="35" width="220"></td>
<td></td>
</tr> 
<tr align="center">
<td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
</font></strong></td>
</tr>
<tr align="center">
<td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">ALL REPORTS</font></strong></td>
</tr>
<tr><td align="left"><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>&nbsp;&nbsp;
<font size ="2">BRANCH :<%= session.getAttribute( "city" )%></font></td>
</tr>
</table>
<br />
<form name="form" method="post" onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');"> 
<%
String tot_val = null;
Connection cn9 = null,cn3=null,cnLT=null,cnNE=null,cn4=null,cn2=null,cn99=null,cnp=null,cnN=null,cnNE1=null,cnGS=null;
Statement st9 = null,st3=null,stLT=null,stNE=null,st4=null,st2=null,st99=null,stp=null,stN=null,stNE1=null,stGS=null; 
ResultSet rs9 = null,rs3=null,rsLT=null,rsNE=null,rs4=null,rs2=null,rs99=null,rsp=null,rsN=null,rsNE1=null,rsGS=null;
try{
cn9 = con.getConnection2();
st9=cn9.createStatement();
rs9 = st9.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
cnLT = con.getConnection2();
stLT=cnLT.createStatement();
rsLT = stLT.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
<%
cnNE = con.getConnection2();
stNE=cnNE.createStatement();
rsNE = stNE.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");
%>
<%
cn3 = con.getConnection2();
st3=cn3.createStatement();
rs3 = st3.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
<table id="albums" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="20%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" >Outstanding Dues & Handover Report</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr>
<td>
<label>Branch</label>
<select  name="branch1"  id="hiderow" style="width: 150px;overflow: auto;">    
<option value="NULL">SELECT</option> 
<option value="all">All</option> 
<%while(rs3.next()){ %> 
<option><%=rs3.getString(1)%> </option>
<%}%> 
</select>
</td>
<td><label>From Date:</label><input type="text" name="date1" style="width: 6em" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay" name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text" name="date11" style="width: 6em" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td>
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay" name="imgForDate3" width="" height="" onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td> 
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( StatusWise() && statusWise());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( StatusWise() && statusWiseExcel());">
</td>
</tr>
</table>	
</td>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" > APPLICATION FORM REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr>
<td>
<label>Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;
<select name="appForm" id="appForm" style="width: 150px;overflow: auto;">
<option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rsNE.next()){ %>										        
<option value="<%=rsNE.getString(1)%>"><%=rsNE.getString(2)%></option>
<%}%> 
</select>
</td>
<td><label>From Date:</label><input type="text" name="dateNE" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"><img src="../../images/cal.gif" id="idForDay" name="imgForDate2" width="" height="" onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text" name="dateNEE" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"><img src="../../images/cal.gif" id="idForDay" name="imgForDate3" width="" height="" onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name="buttonNE" onclick="return ValidateApp(this.value);">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name="buttonNE" onclick="return ValidateApp(this.value);">
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td height="20"></td>
</tr>

<tr>
<%
cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center"><font size ="3" color="white">DOMAIN FORM</font></td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr>
<td>
<label>Branch</label>
<select  name="branch2"  id="hiderow" style="width: 150px;overflow: auto;">
<option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rs4.next()){ %> 
<option ><%=rs4.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="date2" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text"    name="date22" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
<tr>
<!-- <td align="center">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
-->
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( validateBranch() && Branch());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validateBranch() && BranchExcel());">
</td>
</tr>
</table>
</td>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" >EMAIL ID REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>
<select  name="company4"  id="company4" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rs9.next()){ %> 
<option><%=rs9.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="date6" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text"    name="date66" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( ValidateCompany() && company());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( ValidateCompany() && companyExcel());">
</td>
</tr>
<%
cn2 = con.getConnection2();
st2=cn2.createStatement();
//rs2 = st2.executeQuery("SELECT DISTINCT form4_no FROM  form4_accesscard WHERE form4_no LIKE 'NEIN/CS/Acard%' ORDER BY idextend DESC");
rs2 = st2.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
</table>
</td>
</tr>

<tr>
<td height="20"></td>
</tr>

<tr>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" >ACCESS CARD REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>    
<tr><td>
<label>Branch</label>
<select  name="person2"  id="hiderow" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rs2.next()){ %> 
<option><%=rs2.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="date4" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label> To Date:</label><input type="text"    name="date44" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( validateSalesExecutive() && salesExecutive());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validateSalesExecutive() && salesExecutiveExcel());">
</td>
</tr>
</table>
</td>
<%
cn99 = con.getConnection2();
st99=cn99.createStatement();
//rs99 = st99.executeQuery("SELECT DISTINCT form5_no FROM  form5_folder WHERE form5_no LIKE 'NEIN/CS/Sfolder%' ORDER BY idextend DESC");
rs99 = st99.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="4" align="center">
<font size ="3" color="white">SHARED FOLDER REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;
<select  name="person3"  id="hiderow" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rs99.next()){ %>										        
<option><%=rs99.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="date3" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly">
<!-- </td>  <td style="visibility: hidden;">  
<img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))">--></td>
<td><label> To Date:</label><input type="text"    name="date33" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly">
<!--   </td><td style="visibility: hidden;"> 
<img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))">--></td>
</tr>
<tr>
<!-- <td align="center">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
-->
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( validateSalesExeProduct() && SalesExecutiveProduct());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validateSalesExeProduct() && SalesExecutiveProductExcel());">		
</td>
</tr>
<%
cnp = con.getConnection2();
stp=cnp.createStatement();
//rsp = stp.executeQuery("SELECT DISTINCT form6_no FROM  form6_internet WHERE form6_no LIKE 'NEIN/CS/Internet%' ORDER BY idextend DESC");
rsp = stp.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
</table>
</td>
</tr>

<tr>
<td height="20"></td>
</tr>

<tr>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" > INTERNET ACCESS REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>
<select  name="product5"  id="hiderow" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rsp.next()){ %> 
<option><%=rsp.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="date5" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label> To Date:</label><input type="text"    name="date55" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<!-- <td align="center">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
-->
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( validateServiceProduct() && ServiceProduct());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validateServiceProduct() && ServiceProductExcel());">
</td>
</tr>
</table>
</td>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" > LOTUS TRAVELER REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;
<select  name="lotusTraveler"  id="lotus4" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rsLT.next()){ %> 
<option><%=rsLT.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="dateLT" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text"    name="dateLTT" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=buttonLT onclick="return ( ValidateLT() && LT());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=buttonLTT onclick="return ( ValidateLT() && LTTExcel());">
</td>
</tr>
<%
cnN = con.getConnection2();
stN=cnN.createStatement();
//rsp = stp.executeQuery("SELECT DISTINCT form6_no FROM  form6_internet WHERE form6_no LIKE 'NEIN/CS/Internet%' ORDER BY idextend DESC");
rsN = stN.executeQuery("SELECT m_b_name FROM branch_master_main UNION SELECT b_name FROM branch_master ORDER BY m_b_name ");
%>
</table>
</td>
</tr>

<tr>
<td height="20"></td>
</tr>

<tr>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" > NEWINS REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>
<select  name="newins"  id="hiderow" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rsN.next()){ %> 
<option><%=rsN.getString(1)%> </option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="dateN" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label> To Date:</label><input type="text"    name="dateNN" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<!-- <td align="center">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
-->
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4N onclick="return ( validateNewins() && Newins());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44N onclick="return ( validateNewins() && NewinsExcel());">
</td>
</tr>
</table>
</td>
<%
cnNE1 = con.getConnection2();
stNE1=cnNE1.createStatement();
//rsp = stp.executeQuery("SELECT DISTINCT form6_no FROM  form6_internet WHERE form6_no LIKE 'NEIN/CS/Internet%' ORDER BY idextend DESC");
rsNE1 = stNE1.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");
%>
<td width="28%" align="center">
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" > NExAS REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;
<select  name="nexas"  id="nexas" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rsNE1.next()){ %> 
<option value="<%=rsNE1.getString(1)%>"><%=rsNE1.getString(2)%></option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="dateNE1" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text"    name="dateNEE1" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=buttonNE onclick="return ( ValidateNExAS() && NX());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=buttonNEE onclick="return ( ValidateNExAS() && NXExcel());">
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td height="20"></td>
</tr>

<tr>
<td width="28%" align="center">
<%
cnGS = con.getConnection2();
stGS=cnGS.createStatement();
rsGS = stGS.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc");
%> 
<table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
<tr>
<td bgcolor="#2f4377" colspan="5" align="center">
<font size ="3" color="white" > GSNET REPORT</font>
</td>
</tr>
<tr>
<td colspan="3"><font size="2">SELECT BRANCH , FROM DATE - TO DATE</font> </td>
</tr>
<tr><td>
<label>Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;
<select  name="GSNET"  id="GSNET" style="width: 150px;overflow: auto;">     <option value="NULL">SELECT</option> 
<option value="all">All</option>
<%while(rsGS.next()){ %> 
<option value="<%=rsGS.getString(1)%>"><%=rsGS.getString(2)%></option>
<%} %> 
</select>
</td>
<td><label>From Date:</label><input type="text"    name="dateGSNET" style="width: 6em" value="" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
<td><label>To Date:</label><input type="text"    name="dateGSNETT" style="width: 6em" value="" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
<td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
</tr>
<tr>
<td align=center colspan="5">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=buttonGSNET onclick="return ( ValidateGSNET() && GSNET1());">
<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=buttonGSNETT onclick="return ( ValidateGSNET() && GSNETExcel());">
</td>
</tr>
</table>
</td>
</tr>

</table>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
DbUtil.closeDBResources(rs9,st9,cn9);
DbUtil.closeDBResources(rsp,stp,cnp);
DbUtil.closeDBResources(rsN,stN,cnN);
DbUtil.closeDBResources(rs99,st99,cn99);
DbUtil.closeDBResources(rsNE1,stNE1,cnNE1);
DbUtil.closeDBResources(rsGS,stGS,cnGS);
DbUtil.closeDBResources(rs3,st3,cn3);
DbUtil.closeDBResources(rsLT,stLT,cnLT);
DbUtil.closeDBResources(rs4,st4,cn4);
DbUtil.closeDBResources(rsNE,stNE,cnNE);
DbUtil.closeDBResources(rs2,st2,cn2);
}
%>
</form>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../images/home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../images/bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>
</body>
</html>