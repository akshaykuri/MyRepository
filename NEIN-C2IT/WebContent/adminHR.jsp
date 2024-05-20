<%@ page import="java.sql.*"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%@ include file="banner.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINISTRATOR</title>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" />
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />

<script type="text/javascript" src="js/layout.js"></script>
<script type="text/javascript" src="API/Js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script language="javascript"   type="text/javascript" src="js/popWindowAtCenter.js"></script>

<script  type="text/javascript">
<% 
String msg[] = request.getQueryString().toString().split("=");
String disp = msg[1].toString();
disp = disp.replace("%20", "");
disp = disp.replace("%27", "");
disp = disp.replace("__","  ");
%>

msg = "<%=disp%>";
if(msg!="1"){
	alert(msg); 
}
</script>


<script type="text/javascript">
ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});

</script>

<script language="javascript">
function openRoutingPDF(){
	var ref = window.open('helpPages/C2IT  Approval Flow Matrix Jan 2023.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	ref.addEventListener('exit', function(event) { alert(event.type); });
}
	
function openHelpPDF(){
	var ref = window.open('https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	ref.addEventListener('exit', function(event) { alert(event.type); });
}
</script>

<script language="javascript">
window.onload=blinkOn;
function blinkOn(){
	document.getElementById("blink").style.color="#ec691f";
	setTimeout("blinkOff()",1000);
}

function blinkOff(){
	document.getElementById("blink").style.color="#2f4377";
	setTimeout("blinkOn()",1000);
}

function appFunction(obj){
	document.getElementById("req").value=obj;
	document.form.method="post";
	document.form.action="SingleApplicationForm/FormLocalApproval/NEINApplicationLocalAdmin.jsp?msg=1";
	document.form.submit();
}

function appFunctionIT(obj){
	document.getElementById("req").value=obj;
	document.getElementById("pageName").value="../../adminHR.jsp";
	document.form.method="post";
	document.form.action="SingleApplicationForm/updateForm/NEINFormInitUpdateIT.jsp?msg=1";
	document.form.submit();
}

function Pendingrequest(obj){
	document.getElementById("req").value=obj;
    document.form.method="post";
    document.form.action="Audit/Pending.jsp?t=request&msg=1";
    document.form.submit();
}

function Pendingrequirements(obj){
	document.getElementById("req").value=obj;
    document.form.method="post";
    document.form.action="Audit/Pending.jsp?t=upload&msg=1";
    document.form.submit();
}

function PendingUAT(obj){
	document.getElementById("req").value=obj;
    document.form.method="post";
    document.form.action="Audit/Pending.jsp?t=uat&msg=1";
    document.form.submit();
}

function PendingINC(obj){
	document.getElementById("req").value=obj;
    document.form.method="post";
    document.form.action="IncidentLog/FormLocalApproval/IncidentLogLocalAdmin.jsp?msg=1";
    document.form.submit();
}

function PendingCAR(obj){
	document.getElementById("req").value=obj;
    document.form.method="post";
    document.form.action="BOMAUDIT/FormLocalApproval/bomAuditLocalAdminApproval.jsp?msg=1";
    document.form.submit();
}

function osdFunction(obj){
	document.getElementById("req").value=obj;
	document.form.method="post";
	document.form.action="ITFORMS/FormLocalApproval/ITclearanceLocalAdmin.jsp?msg=1";
	document.form.submit();
} 
</script>

<%
session.setMaxInactiveInterval(20*60);
String AdminName=null,desg=null,emp_no=null;
emp_no = (String) session.getAttribute("EmpNo");
AdminName = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));

if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg1=null;
	msg1="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("adminlinkHR.jsp?msg="+msg1);
}
%>
</head>

<style>
.div1{
	max-height: 115px;
	overflow-y: scroll;
	width: auto;
	padding-bottom: 1px;
}
.div1 table{
	border-collapse: separate;
	border-top: 3px solid;
	margin-left: 10px;
}

.div1 td, th{
	border: 1px solid;
	border-top-width: 0px;
	white-space: wrap;
}
.div1 thead{
	position: sticky;
	top: 0;
	height: 30px;
	border: 2px solid;
}

.div1::-webkit-scrollbar{
	width: 7px;
}

.div1::-webkit-scrollbar-track{
	background: #2f4377;
}

.div1::-webkit-scrollbar-thumb{
	background: #8ec300;
	border-radius: 5px;
}

.div1::-webkit-scrollbar-thumb:hover{
	background: #8ec300;
}

.div1{
	scrollbar-width: thin;
	scrollbar-color: #2f4377 #8ec300;
}

.div1::-moz-scrollbar{
	width: 12px;
}

.div1::-moz-scrollbar-track{
	background-color: #8ec300;
}

.div1::-moz-scrollbar-thumb{
	background-color: #2f4377;
}
</style>

<body bgcolor="#FFFFFF" leftmargin="90" rightmargin="80" marginwidth="70" marginheight="6">
<div id="id">
<div id="wrapper">
<form name="form">

<%System.out.println("NAME : "+session.getAttribute( "Nname" )+"  CITY :"+session.getAttribute("city")+"   ADMIN:"+session.getAttribute("admin")+"   B_NO :"+session.getAttribute("b_no"));%>
<table>
	<tr>
		<td>
			<img src="images/nippon.gif" height="35" width="220">
		</td>
	</tr>
</table>

<table width="1220" align="center" border="0" cellspacing="0" cellpadding="0">
	<tr align="center">
		<td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br /></font></strong></td>
	</tr>
	<tr align="center">
		<td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">APPLICATION FORMS</font></strong></td>
	</tr>
</table>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1220">
	<tr>
		<td width="1118" align="right">
			<a href="#" onclick="openRoutingPDF()"><img width="30" ><font size ="2">Form Approval Routing</font></a>
			<a href="#" onclick="openHelpPDF()"><img width="30" src="images/help3.jpg"><font size ="2">Help</font></a>
			<a class="a_link" href="logout.jsp"><img width="30" src="images/icon_log.png"><font size ="2">Logout</font></a>
		</td>
	</tr>
</table>

<table border="0" cellpadding="0" cellspacing="" ID="Table1" class="menutab">
	<tr>
		<td width="360" align="justify" valign="top"></td>
		<td width="560" align="justify" valign="top">
			<font size="3"> Welcome :</font><font size="2"><%= session.getAttribute( "Nname" ) %></font>
			<br />
			<br>

<div id="smoothmenu2" class="ddsmoothmenu-v">
 <ul id="sidebarmenu1">
<!-- <li><a href="#">DSC Form</a>
<ul>
<li><a href="DSC/DSCUserPage.jsp?msg=1">Create</a></li>
<li><a href="DSC/FormLocalApproval/DSCSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="DSC/FormLocalApproval/DSCSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li> -->

<li><a href="#">NEIN Application Form</a>
<ul>
<%
//SingleApplicationForm/NEINApplicationForm.jsp?msg=1
System.out.println("emp_no====>"+emp_no);%>
<li><a href="#">Create</a>
<ul>
<li><a href="SingleApplicationForm/NEINApplicationForm.jsp?msg=1">On Roll Employees</a></li>
<li><a href="SingleApplicationForm/NEINApplicationFormContract.jsp?msg=1">Contract Employees</a></li>
</ul>
</li>
<!-- <li><a href="SingleApplicationForm/FormLocalApproval/NEINApplicationFormLocalAdmin.jsp?msg=1">Pending Request</a></li> -->
<%if(emp_no.equalsIgnoreCase("1665") || emp_no.equalsIgnoreCase("2114")){%>
<li><a href="#">Update</a>
<ul>
<li><a href="SingleApplicationForm/updateForm/NEINFormUpdateFilter.jsp?msg=1">On Roll Employees</a></li>
<li><a href="SingleApplicationForm/updateForm/NEINFormUpdateFilterCont.jsp?msg=1">Contract Employees</a></li>
</ul>
</li>
<%}%>
<li><a href="SingleApplicationForm/updateForm/NEINFormInitUpdateFilter.jsp?msg=1">Update By Initiator</a></li>
<li><a href="#">View all / Status</a>
<ul>
<li><a href="SingleApplicationForm/FormLocalApproval/NEINApplicationFormLocalAllAdmin.jsp?msg=1">Form Wise</a></li>
<li><a href="#">Employee Wise</a>
<ul>
<li><a href="SingleApplicationForm/FormLocalApproval/NEINApplicationFormLocalAllAdminEmp.jsp?msg=1">On Roll Employees</a></li>
<li><a href="SingleApplicationForm/FormLocalApproval/NEINApplicationFormLocalAllAdminContEmp.jsp?msg=1">Contract Employees</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li><a href="#">Outstanding Dues & Handover Report</a>
<ul>
<li><a href="ITFORMS/ITclearance.jsp?msg=1">Create</a></li>
<!-- <li><a href="ITFORMS/ITclearanceTest.jsp?msg=1">Create Testing</a></li> -->
<!-- <li><a href="ITFORMS/FormLocalApproval/ITclearanceSelectLocalAdmin.jsp?msg=1">Pending Request</a></li> -->
<li><a href="ITClearanceUpdate/ItClearanceReportForm.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">OSD Report</a></li>
<li><a href="ITFORMS/FormLocalApproval/ITclearanceSelectAllLocalAdmin.jsp?msg=1">View all / Status</a></li>
<!-- <li><a href="#" onclick="openPDF()" >Help ?</a></li> -->
</ul>
</li>
<li><a href="#">Development Form</a>
<ul>
<li><a href="Audit/NewForm.jsp?msg=1">Create</a></li>
<!-- <li><a href="Audit/PendingRequirements.jsp?msg=1">Upload Requirements</a></li> -->
<!-- <li><a href="Audit/SelectPending.jsp?msg=1">Pending Request</a> -->
<!-- <li><a href="Audit/PendingUAT.jsp?msg=1">Pending UAT</a> -->
<li><a href="Audit/SelectView.jsp?f=Software">Software View/Status</a>
<li><a href="Audit/SelectView.jsp?f=Hardware">Hardware View/Status</a>
</ul>
</li>

<li><a href="#">Gate Pass</a>
<ul>
<!-- <li><a href="GatePass/gatePassReturn.jsp?msg=1">GATE PASS ENTERY</a></li>
<li><a href="GatePass/gatePassReport.jsp?msg=1">REPORT</a></li> -->
<li><a href="GatePass/gatePassReturn.jsp?msg=1">Create</a></li>
<li><a href="GatePass/gatePassformApprove.jsp?msg=1">Pending Request</a>
<li><a href="GatePass/viewAllGatePass.jsp?msg=1">View all / Status</a>
<li><a href="GatePass/gatePassReport.jsp?msg=1">Report</a></li>
<li><a href="GatePass/ConsolidatedReports/gatePassConsolidateReport.jsp?msg=1">Consolidated Report</a></li>
<li><a href="GatePass/reminderUpdate.jsp?msg=1">Reminder Update</a></li>
</ul>
</li>

<li><a href="#">CCD</a>
<ul>
<li><a href="#">CCD User Registration Form</a>
<ul>
<li><a href="CCDReport/RegistrationForSW/RegistrationUserPage.jsp?msg=1">Create</a></li>
<li><a href="CCDReport/RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="CCDReport/RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li>
<li><a href="#">CCD Report Form</a>
<ul>
<li><a href="CCDReport/CCDReportPage.jsp?msg=1">Create</a></li>
<li><a href="CCDReport/CCDReportformApproveSuper.jsp?msg=1">Pending Request</a> 
<li><a href="CCDReport/CCDReportViewReport.jsp?msg=1">View all / Status</a>
</ul>
</li>
</ul>
</li> 

<li><a href="#">Incident Log Form</a>
<ul>
<!-- <li><a href="IncidentLog/FormLocalApproval/IncidentLogSelectLocalAdmin.jsp?msg=1">Pending Request</a> -->
<li><a href="IncidentLog/FormLocalApproval/IncidentLogSelectLocalAllAdmin.jsp?msg=1">View all / Status</a></li>
</ul>
</li>

<li>
	<a href="#">C2IT Access Review Report Form</a>
	<ul>
		<li><a href="BOMAUDIT/Request/bomAuditRequest.jsp?msg=1">Create</a></li>
		<li><a href="BOMAUDIT/View/bomAuditView.jsp?msg=1">View All Forms</a></li>
	</ul>

</li>

<li>
	<a href="TAT_AUDIT/UAReportFilter.jsp?msg=1">User Audit Report</a>
</li>
      	
<!-- <li><a href="#">Domain User Request</a>
<ul>
<li><a href="DomainUser/DomainUserPage.jsp?msg=1">Create</a></li>
<li><a href="DomainUser/FormLocalApproval/DomainUserSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="DomainUser/FormLocalApproval/DomainUserSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li>

<li><a href="#">Email Id Request</a>
<ul>
<li><a href="LOTUS/LotusPage.jsp?msg=1">Create</a></li>
<li><a href="FORMS/lotus.jsp">PAST Create</a></li>
<li><a href="LOTUS/FormLocalApproval/LotusSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="LOTUS/FormLocalApproval/LotusSelectAllLocalAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li>
      	<li><a href="#">Lotus Traveler Request</a>
      <ul>
            <li><a href="LotusTraveler/LotusTravelerPage.jsp?msg=1">Create</a></li>
      		<li><a href="LotusTraveler/FormLocalApproval/LotusSelectLocalAdmin.jsp?msg=1">Pending Request</a>
      		<li><a href="LotusTraveler/FormLocalApproval/LotusSelectAllLocalAdmin.jsp?msg=1">View all / Status</a>
      	</ul>
      	</li>
<li><a href="#">Issue of Access Card Request</a>
<ul>
<li><a href="AccessCard/AccessCardPage.jsp?msg=1">Create</a></li>
<li><a href="FORMS/access.jsp">PAST Create</a></li>
<li><a href="AccessCard/FormLocalApproval/AccessCardSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="AccessCard/FormLocalApproval/AccessCardSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li>
<li><a href="#">Shared Folder Access Request</a>
<ul>
<li><a href="SharedFolder/SharedFolderPage.jsp?msg=1">Create</a></li>
<li><a href="FORMS/floder.jsp">PAST Create</a></li>
<li><a href="SharedFolder/FormLocalApproval/SharedFolderSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="SharedFolder/FormLocalApproval/SharedFolderSelectAllLocalAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li>
          
<li><a href="#">Internet/FTP Access Request</a>
<ul>
<li><a href="InternetAccess/InternetAccessPage.jsp?msg=1">Create</a></li>
<li><a href="FORMS/internet.jsp">PAST Create</a></li>
<li><a href="InternetAccess/FormLocalApproval/InternetAccessSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="InternetAccess/FormLocalApproval/InternetAccessSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li>
      
<li><a href="#">Newin's Users Form</a>
<ul>
<li><a href="Newins/NewinsPage.jsp?msg=1">Create</a></li>
<li><a href="FORMS/newins.jsp">PAST Create</a></li>
<li><a href="Newins/FormLocalApproval/NewinsSelectLocalAdmin.jsp?msg=1">Pending Request</a> 
<li><a href="Newins/FormLocalApproval/NewinsSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li> -->
      	<!-- ///////////////////////////////////////////////////////// -->
      	
<!-- <li><a href="#">NExAS Form</a>
<ul>
<li><a href="NExAS/NExASPage.jsp?msg=1">Create</a></li>
<li><a href="NExAS/NExASformApproveSuper.jsp?msg=1">Pending Request</a> 
<li><a href="NExAS/NExASViewReport.jsp?msg=1">View all / Status</a>
</ul>
</li>
<li><a href="#">GSNET Form</a>
<ul>
<li><a href="GSNET/GSNETPage.jsp?msg=1">Create</a></li>
<li><a href="GSNET/GSNETformApproveSuper.jsp?msg=1">Pending Request</a> 
<li><a href="GSNET/GSNETViewReport.jsp?msg=1">View all / Status</a>
</ul>
</li>
<li><a href="#">TMS User Registration Form</a>
<ul>
<li><a href="TMSUser/TMSPage.jsp?msg=1">Create NEIN User</a></li>
<li><a href="TMSUser/TMSClientPage.jsp?msg=1">Create Client User</a></li>
<li><a href="TMSUser/TMSformApproveSuper.jsp?msg=1">Pending Request</a> 
<li><a href="TMSUser/TMSViewReport.jsp?msg=1">View all / Status</a>
</ul>
</li> -->
<!-- <li><a href="#">USB Access Form</a>
<ul>
<li><a href="USB/RegistrationForSW/RegistrationUserPage.jsp?msg=1">Create</a></li>
<li><a href="USB/RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="USB/RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li> -->
        
    <!--     <li><a href="#">GLOW User Form</a>
		        <ul>
		      	    <li><a href="GLOW/RegistrationForSW/RegistrationUserPage.jsp?msg=1">Create</a></li>
		      		<li><a href="GLOW/RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAdmin.jsp?msg=1">Pending Request</a>
		      		<li><a href="GLOW/RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
		      	</ul>
      	 </li> -->
      	<!-- ///////////////////////////////////////////////////// -->      	       
<!-- <li><a href="#">NEIN internal s/w Registration Form</a>
<ul>
<li><a href="RegistrationForSW/RegistrationUserPage.jsp?msg=1">Create</a></li>
<li><a href="RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAdmin.jsp?msg=1">Pending Request</a>
<li><a href="RegistrationForSW/FormLocalApproval/RegistrationSelectLocalAllAdmin.jsp?msg=1">View all / Status</a>
</ul>
</li> -->
</ul>
</div>

 <!-- <a href="change_pwd_hr.jsp?msg=1" onclick="return popitup2('change_pwd_hr.jsp?msg=1')" id="hiderow"><font size=2>Change Password</font></a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="feedbackUser.jsp?msg=1" onclick="return popitup2('feedbackUser.jsp?msg=1')" id="hiderow"><font size=2>Feedback</font></a> -->
 
<br><br>
</td>
<%
//bgcolor="#2f4377"
%>
<%
String form_no=null,initiator=null,formdate=null,branch=null;
int k=0;
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("csdb");
String userNamel = dbPropertiesl.getString("csdb.username");
String passwordl = dbPropertiesl.getString("csdb.password");
String urll = dbPropertiesl.getString("csdb.url");
String driverl = dbPropertiesl.getString("csdb.driverName");
String dbNamel = dbPropertiesl.getString("csdb.dbName");
Class.forName(driverl).newInstance();
Connection conn = null;
conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);
ResultSet rsApp=null,rs=null,rs1=null;
Statement stApp = conn.createStatement();
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
String uform_no=null,uformdate=null,uinitiator=null,ubranch=null;

boolean flagtab1=true,flagtab2=true,flagtab3=true,flagtab4=true,flagtab5=true,flagtab6=true,flagtab7=true;

rsApp = stApp.executeQuery("SELECT apF.applicationNo,DATE_FORMAT(apF.applicationDate,'%d/%m/%Y') as f_date,requested_by,branch FROM neinapplicationform apF inner join neinapplicationform_item apFi on apF.applicationNo=apFi.form2_no WHERE apFi.status='Pending' AND apFi.empid='"+emp_no+"' and apFi.presence='now'");
if(rsApp.next()){
	flagtab1 = false;
}

rsApp = stApp.executeQuery("SELECT DISTINCT i.form1_no as form1_no,DATE_FORMAT(i.f_date,'%d/%m/%Y') as f_date,f.emp as requested_by,branch FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE i.empid='"+emp_no+"' and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%'");
if(rsApp.next()){
	flagtab2 = false;
}

rsApp = stApp.executeQuery("SELECT a.form_no,DATE_FORMAT(a.Date,'%d/%m/%Y') as f_date,a.empname as initiator,branch FROM audit_form a inner join auditform_item b on a.form_no=b.form_no WHERE b.Status='Pending' AND b.empid='"+emp_no+"' and b.presence='now' And b.levelno Not In('100','104')");
if(rsApp.next()){
	flagtab3 = false;
}
rsApp = stApp.executeQuery("SELECT a.form_no,DATE_FORMAT(a.Date,'%d/%m/%Y') as f_date,a.empname as initiator,a.branch FROM audit_form a inner join branch_requirements b on a.form_no=b.form_no WHERE b.Status='Pending' AND b.empid='"+emp_no+"' and b.presence='now' AND b.levelno IS NOT NULL");
if(rsApp.next()){
	flagtab4 = false;
}
rsApp = stApp.executeQuery("SELECT a.form_no,DATE_FORMAT(a.Date,'%d/%m/%Y') as f_date,a.empname as initiator,a.branch FROM audit_form a inner join development_status b on a.form_no=b.form_no WHERE b.Status='Pending' And b.Stage='UAT'  And CURRENT_DATE BETWEEN b.Start_Date And b.End_Date");
if(rsApp.next()){
	flagtab5 = false;
}
rsApp = stApp.executeQuery("SELECT form_name,form9_no,SessionName,SessionDesg,SUBSTRING(SessionCity, 1, CHAR_LENGTH(SessionCity) - 4) as SessionCityw,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,SessionName,Approval_f_date as detu FROM  form9_incident_log WHERE Approval_sttatuss='Pending' AND Approval_emp='"+AdminName+"' AND Approval_desg='"+desg+"' ORDER BY detu DESC");
if(rsApp.next()){
	flagtab6 = false;
}
rsApp = stApp.executeQuery("select a.requestNo,date_format(a.requestDate,'%d/%m/%Y') as requestDate,requestByName,requestByBranch from c2itreviewfrommain a left outer join c2itreviewfromitem b on a.requestNo=b.reqNo where status='Pending' and presence='now' and b.empId='"+emp_no+"' order by requestDate desc");
if(rsApp.next()){
	flagtab7 = false;
}
%>

<td valign="top">
<br><br>
<input type="hidden" name="req" id="req">
<input type="hidden" name="pageName" id="pageName">
<%
if(!flagtab1){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>NEIN APPLICATION FORM PENDING REQUESTS</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Form Submission Date</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Branch</font></th>
</tr>
</thead>
<tbody>
<%
int sl = 0;
String lvl="";
boolean flagApp = true;
rsApp = stApp.executeQuery("SELECT apF.applicationNo,DATE_FORMAT(apF.applicationDate,'%d/%m/%Y') as f_date,requested_by,branch,levelno FROM neinapplicationform apF inner join neinapplicationform_item apFi on apF.applicationNo=apFi.form2_no WHERE apFi.status='Pending' AND apFi.empid='"+emp_no+"' and apFi.presence='now' order by apF.applicationNo desc");
while(rsApp.next()){
flagApp = false;
lvl = rsApp.getString("levelno");
//SingleApplicationForm/FormLocalApproval/NEINApplicationLocalAdmin.jsp?req=<%=rsApp.getString("applicationNo")
%>
<tr align="center">
<td style="width: 5%;" ><%=++sl%></td>
<%if(lvl.equalsIgnoreCase("1")){%>
<td style="width: 25%;"><a href="#" onclick="appFunctionIT('<%=rsApp.getString("applicationNo")%>')"><%=rsApp.getString("applicationNo")%></a></td>
<%}else{%>
<td style="width: 25%;"><a href="#" onclick="appFunction('<%=rsApp.getString("applicationNo")%>')"><%=rsApp.getString("applicationNo")%></a></td>
<%}%>
<td style="width: 20%;"><%=rsApp.getString("f_date")%></td>
<td style="width: 30%;"><%=rsApp.getString("requested_by")%></td>
<td style="width: 20%;"><%=rsApp.getString("branch")%></td>
</tr>
<%}%>

<%
if(flagApp){
%>
	<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
	</tr>
<%
}
%>
</tbody>
</table>
</div>
<br>
<%}%>

<%
if(!flagtab2){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th class="div2" colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>OSD FORMS PENDING REQUESTS</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Form Submission Date</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Branch</font></th>
</tr>
</thead>
<tbody>
<%
String form_no1=null,initiator1=null,formdate1=null,branch1=null;
int k1=0;
ResourceBundle dbPropertiesl1 = ResourceBundle.getBundle("csdb");
String userNamel1 = dbPropertiesl.getString("csdb.username");
String passwordl1 = dbPropertiesl.getString("csdb.password");
String urll1 = dbPropertiesl.getString("csdb.url");
String driverl1 = dbPropertiesl.getString("csdb.driverName");
String dbNamel1 = dbPropertiesl.getString("csdb.dbName");
Class.forName(driverl).newInstance();
Connection conn1 = null;
conn1 = DriverManager.getConnection(urll1+dbNamel1,userNamel1,passwordl1);
ResultSet rsApp1=null;
Statement stApp1 = conn1.createStatement();


int sl1 = 0;
boolean flagApp1 = true;
rsApp1 = stApp1.executeQuery("SELECT DISTINCT i.form1_no as form1_no,DATE_FORMAT(i.f_date,'%d/%m/%Y') as f_date,f.emp as requested_by,branch FROM form1_it_clearance_item i INNER JOIN form1_it_clearance f ON(f.form1_no=i.form1_no) WHERE ((i.emp='"+AdminName+"' and i.desg='"+desg+"') or (i.empid='"+emp_no+"')) and i.status='Pending' AND f.deleted IS NULL AND i.form1_no LIKE 'NEIN/CS/IT%' ORDER BY i.form1_no desc");
while(rsApp1.next()){
flagApp1 = false;
%>
<tr align="center">
<td style="width: 5%;" ><%=++sl1%></td>
<td style="width: 25%;"><a href="#" onclick="osdFunction('<%=rsApp1.getString("form1_no")%>')"><%=rsApp1.getString("form1_no")%></a></td>
<td style="width: 20%;"><%=rsApp1.getString("f_date")%></td>
<td style="width: 30%;"><%=rsApp1.getString("requested_by")%></td>
<td style="width: 20%;"><%=rsApp1.getString("branch")%></td>
</tr>
<%}%>
<%
if(flagApp1){
%>
	<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
	</tr>
<%
}
%>
</tbody>
</table>
</div>
<br>
<%}%>

<%
if(!flagtab3){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>PENDING REQUEST</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Requested Date</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Branch</font></th>
</tr>
</thead>
<tbody>
<%

boolean flagApp2 = true;
int k1=0;
rs=st.executeQuery("SELECT a.form_no,DATE_FORMAT(a.Date,'%d/%m/%Y') as f_date,a.empname as initiator,branch FROM audit_form a inner join auditform_item b on a.form_no=b.form_no WHERE b.Status='Pending' AND b.empid='"+emp_no+"' and b.presence='now' And b.levelno Not In('100','104')");

while(rs.next()){
	flagApp2 = false;
	form_no=rs.getString("form_no");
	formdate=rs.getString("f_date");
	initiator=rs.getString("initiator");
	branch=rs.getString("branch");
	
%>

<tr align="center">
<td style="width: 5%;" ><%=++k1%></td>
<td style="width: 25%;"><a href="#" onclick="Pendingrequest('<%=form_no %>')"  title="click for more details"><%=form_no%></a></td> 
<td style="width: 20%;"><%=rs.getString("f_date") %></td>
<td style="width: 30%;"><%=rs.getString("initiator") %></td>
<td style="width: 20%;"><%=rs.getString("branch") %></td>
</tr>

<%}
%>
<%
if(flagApp2){
%>
	<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
	</tr>
<%
}
%>
</tbody>
</table>
</div>
<br>
<%}%>


<%
if(!flagtab4){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>UPLOAD REQUIREMENTS</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Requested Date</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Branch</font></th>
</tr>
</thead>
<tbody>
<%
boolean flagApp3 = true;
int k2=0;
rs1=st1.executeQuery("SELECT a.form_no,DATE_FORMAT(a.Date,'%d/%m/%Y') as f_date,a.empname as initiator,a.branch FROM audit_form a inner join branch_requirements b on a.form_no=b.form_no WHERE b.Status='Pending' AND b.empid='"+emp_no+"' and b.presence='now' And  b.levelno IS NOT NULL");
while(rs1.next()){
	flagApp3 = false;
	uform_no=rs1.getString("form_no");
	uformdate=rs1.getString("f_date");
	uinitiator=rs1.getString("initiator");
	ubranch=rs1.getString("branch");
%>

<tr align="center">
<td style="width: 5%;" ><%=++k2%></td>
<td style="width: 25%;"><a href="#" onclick="Pendingrequirements('<%=uform_no %>')"  title="click for more details"><%=uform_no%></a></td> 
<td style="width: 20%;"><%=rs1.getString("f_date") %></td>
<td style="width: 30%;"><%=rs1.getString("initiator") %></td>
<td style="width: 20%;"><%=rs1.getString("branch") %></td>
</tr>

	<%} %>
<%
if(flagApp3){
%>
	<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
	</tr>
<%
}
%>	
</tbody>
</table>
</div>
<br>
<%}%>


<%
if(!flagtab5){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>PENDING UAT</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Requested Date</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Branch</font></th>
</tr>
</thead>
<tbody>
<%
boolean flagApp4 = true;
int k3=0;
rs1=st1.executeQuery("SELECT a.form_no,DATE_FORMAT(a.Date,'%d/%m/%Y') as f_date,a.empname as initiator,a.branch,b.Start_Date,b.End_Date FROM audit_form a inner join development_status b on a.form_no=b.form_no WHERE b.Status='Pending' And b.Stage='UAT' And CURRENT_DATE BETWEEN b.Start_Date And b.End_Date");
while(rs1.next()){
	flagApp4 = false;
	uform_no=rs1.getString("form_no");
	uformdate=rs1.getString("f_date");
	uinitiator=rs1.getString("initiator");
	ubranch=rs1.getString("branch");
	
	
	
%>  
<tr align="center">
<td style="width: 5%;" ><%=++k3%></td>
<td style="width: 25%;"><a href="#" onclick="PendingUAT('<%=uform_no %>')"  title="click for more details"><%=uform_no%></a></td> 
<td style="width: 20%;"><%=rs1.getString("f_date") %></td>
<td style="width: 30%;"><%=rs1.getString("initiator") %></td>
<td style="width: 20%;"><%=rs1.getString("branch") %></td>
</tr>
<%}%>
<%
if(flagApp4){
%>
<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
</tr>
<%
}
%>	
</tbody>
</table>
</div>
<br>
<%}%>


<%
if(!flagtab6){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>PENDING UAT</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Requested Date</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Remarks</font></th>
</tr>
</thead>
<tbody>
<%
boolean flagApp6 = true;
int k3=0;
rs1=st1.executeQuery("SELECT form9_no,SessionName,ifnull(Approval_remarks,'-') as Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y') as f_date FROM form9_incident_log WHERE Approval_sttatuss='Pending' AND Approval_emp='"+AdminName+"' AND Approval_desg='"+desg+"' ORDER BY f_date DESC");
while(rs1.next()){
	flagApp6 = false;
	uform_no=rs1.getString("form9_no");
%>  
<tr align="center">
<td style="width: 5%;"><%=++k3%></td>
<td style="width: 25%;"><a href="#" onclick="PendingINC('<%=uform_no %>')"  title="click for more details"><%=uform_no%></a></td> 
<td style="width: 20%;"><%=rs1.getString("f_date") %></td>
<td style="width: 30%;"><%=rs1.getString("SessionName") %></td>
<td style="width: 20%;"><%=rs1.getString("Approval_remarks") %></td>
</tr>
<%}%>
<%
if(flagApp6){
%>
<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
</tr>
<%
}
%>	
</tbody>
</table>
</div>
<br>
<%}%>

<%
if(!flagtab7){
%>
<div class="div1">
<table width="920" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<thead>
<tr><th colspan="10" bgcolor="#e6ffff" align="center"><font color="black"><u>C2IT Access Review Report Form</u></font></th></tr>
<tr>
<th style="width: 5%;" bgcolor="#e6ffff" ><font color="black">Sl No.</font></th>
<th style="width: 25%;" bgcolor="#e6ffff"><font color="black">Form No.</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Requested Date</font></th>
<th style="width: 20%;" bgcolor="#e6ffff"><font color="black">Requested By</font></th>
<th style="width: 30%;" bgcolor="#e6ffff"><font color="black">Requester Remarks</font></th>
</tr>
</thead>
<tbody>
<%
boolean flagApp7 = true;
int kz=0;
rs1=st1.executeQuery("select a.requestNo as reqNo,date_format(a.requestDate,'%d/%m/%Y') as requestDate,requestByName,a.requesterRemarks as remarks from c2itreviewfrommain a left outer join c2itreviewfromitem b on a.requestNo=b.reqNo where status='Pending' and presence='now' and b.empId='"+emp_no+"' order by requestDate desc");
while(rs1.next()){
	flagApp7 = false;
	uform_no=rs1.getString("reqNo");
%>  
<tr align="center">
<td style="width: 5%;"><%=++kz%></td>
<td style="width: 25%;"><a href="#" onclick="PendingCAR('<%=uform_no%>')" title="Click for more details"><%=uform_no%></a></td> 
<td style="width: 20%;"><%=rs1.getString("requestDate") %></td>
<td style="width: 20%;"><%=rs1.getString("requestByName") %></td>
<td style="width: 30%;"><%=rs1.getString("remarks") %></td>
</tr>
<%}%>
<%
if(flagApp7){
%>
<tr align="center">
	<td colspan="20"><font color="red">---- No Pending Requests Available ----</font></td>
</tr>
<%
}
%>	
</tbody>
</table>
</div>
<br>
<%}%>

</td>
</tr>
</table>
<br><br><br><br><br><br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1220"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address> 
</td> 
<td width="115" align="right"> 
<a href="adminlinkHR.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td>
</tr>
</table>
<table width="1220" align="center" border="0" cellspacing="0" cellpadding="0">
<tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>
</div>
</div>
</body>
</html>