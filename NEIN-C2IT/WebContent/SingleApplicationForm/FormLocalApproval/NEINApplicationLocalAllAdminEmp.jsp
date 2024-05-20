<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<%@include file="../../banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" />
<jsp:useBean id="currentTime" class="CON2.CurrentTime" />

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Application Form</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
<script language="javascript" type="text/javascript" src="../../js/Calendar.js"></script>
<script language="javascript" type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
<script language="javascript" type="text/javascript" src="../../js/FormsHelp.js"></script>
<script language="javascript" type="text/javascript" src="../../js/onSubmitWait.js"></script>
<script language="javascript" type="text/javascript">
function popitup(url) {
newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
if(window.focus){
	newwindow.focus();
}
return false;
}
</script>

<script language="javascript">
function printit(){  
if(window.print){
    window.print() ;  
}else{
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);
}
}
</script>
<%
session.setMaxInactiveInterval(20*60);
//session.setAttribute("Nname",null);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../adminHR.jsp?msg="+msg2);
	System.out.println(msg2);
}
%>

<script  type="text/javascript">
<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

<script type="text/javascript">
function hiddenTables(obj){
	var type=obj;
	if(type[0].value=="Email ID" && type[0].checked==true){
		var email 		= document.getElementById("requestForCheck_email");
		var emdt		= document.getElementById("email_details");
		if(email.checked==true){
			emdt.style.display 		= "inline";
			emdt.style.visibility 	= "visible";
		}else{
			emdt.style.display 		= "none";
			emdt.style.visibility	= "hidden";
		}
	}
	if(type[1].value=="Domain Account" && type[1].checked==true){
		var domain		= document.getElementById("requestForCheck_dom");
		var dmdt		= document.getElementById("dom_details");
		if(domain.checked==true){
			dmdt.style.display = "inline";
		}else{
			dmdt.style.display = "none";			
		}
	}
	if(type[2].value=="Biometric / Access Card" && type[2].checked==true){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt		= document.getElementById("bio_details");
		if(biometric.checked==true){
			biodt.style.display = "inline";
		}else{
			biodt.style.display = "none";			
		}
	}
	if(type[3].value=="Shared Folder" && type[3].checked==true){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt		= document.getElementById("sha_details");
		if(shared.checked==true){
			shadt.style.display = "inline";
		}else{
			shadt.style.display = "none";			
		}
	}
	if(type[4].value=="Internet Access / FTP Access" && type[4].checked==true){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt		= document.getElementById("int_details");
		if(internet.checked==true){
			intdt.style.display = "inline";
		}else{
			intdt.style.display = "none";			
		}
	}
	if(type[5].value=="NEWINS" && type[5].checked==true){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt		= document.getElementById("new_details");
		if(newins.checked==true){
			newdt.style.display = "inline";
		}else{
			newdt.style.display = "none";			
		}
	}
	if(type[6].value=="NExAS" && type[6].checked==true){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt		= document.getElementById("nex_details");
		if(nexas.checked==true){
			nexdt.style.display = "inline";
		}else{
			nexdt.style.display = "none";			
		}
	}
	if(type[7].value=="GS-NET" && type[7].checked==true){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt		= document.getElementById("gs_details");
		if(gsnet.checked==true){
			gsdt.style.display = "inline";
		}else{
			gsdt.style.display = "none";			
		}
	}
	if(type[8].value=="Internal Application" && type[8].checked==true){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt		= document.getElementById("inter_details");
		if(internal.checked==true){
			interdt.style.display = "inline";
		}else{
			interdt.style.display = "none";			
		}
	}
	if(type[9].value=="USB Access" && type[9].checked==true){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt		= document.getElementById("usb_details");
		if(usb.checked==true){
			usbdt.style.display = "inline";
		}else{
			usbdt.style.display = "none";			
		}
	}
	if(type[10].value=="VPN Access" && type[10].checked==true){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt		= document.getElementById("vpn_details");
		if(vpn.checked==true){
			vpndt.style.display = "inline";
		}else{
			vpndt.style.display = "none";			
		}
	}if(type[11].value=="HardDisk / PenDrive" && type[11].checked==true){
		var hd 		= document.getElementById("requestForCheck_hard");
		var hddt		= document.getElementById("hard_details");
		if(hd.checked==true){
			hddt.style.display = "inline";
		}else{
			hddt.style.display = "none";			
		}
	}if(type[12].value=="Any Other Asset" && type[12].checked==true){
		var as 		= document.getElementById("requestForCheck_assets");
		var asdt		= document.getElementById("asset_details");
		if(as.checked==true){
			asdt.style.display = "inline";
		}else{
			asdt.style.display = "none";			
		}
	}
	if(type[13].value=="NEx-GLOW" && type[13].checked==true){
		var gl 		= document.getElementById("requestForCheck_glow");
		var gldt		= document.getElementById("glow_details");
		if(gl.checked==true){
			gldt.style.display = "inline";
		}else{
			gldt.style.display = "none";			
		}
	}
}
</script>

</head>
<body onload="hiddenTables(document.form.requestForCheck);">
<form action="#" method="post" name="form">
<%!
String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
%>
<%
String empGet = request.getParameter("emplID");
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

<textarea id="hiderow" name="theName" rows="1" cols="26" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;" colspan="4"><center><font size="3">
		<b><label>
		APPLICATION FORM</label>
		</b></font></center> 
		</td>
		</tr>
<tr style="visibility: hidden;display: none;"><td>
		<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
		<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
		<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/>
		<input type="hidden" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
		
	</tr>
		<tr>
		<td width="165"><%=Name%></td>
		<td width="165"><%=desg%></td>
		<td width="165"><%=city%></td>
		<td width="165"><%= po_date.format(new java.util.Date())%></td>
		</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
<td>
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>
<br />
<%
Connection cn1=null;
Statement st1=null;
ResultSet rs1=null;
try{
cn1 = con.getConnection2();
st1=cn1.createStatement();
boolean flagC = true;
String full_name="",branch="",dept="",desg="",ro="",sow="",reqBy="",empType="",empContType="",reqBranch="",reqFor="",emailDomain="",emailType="",reqMailID="",comProvMob="",m_m="",comProSim="",comNumber="",mobint="",intNumber="",imei1="",imei2="",emailRem="",crMail="",emailPass="",intProv="",emailAppRem="",domAcc="",domPass="",domRem="",domAppRem="",selBrBio="",bioRem="",bioAppRem="",foldRem="",foldAppRem="",intReqType="",intRem="",intAppRem="",newBR="",newReqCode="",newReqType="",newOPC="",newPass="",newlvl="",newAccess="",newBlok="",newAll="",newRem="",newAppRem="",compCode="",ccName="",ccCode="",opRange="",nexID="",NexPass="",nexReqType="",nexOptMenu="",nexRem="",nexAppRem="",gsCode="",gsPass="",gsBRCodes="",gsDiv="",gsPDiv="",gsRole="",gsRem="",gsAppRem="",interApp="",interID="",interPass="",interRem="",interAppRem="",usbFor="",usbDet="",usbRem="",usbAppRem="",vpnID="",vpnMail="",vpnMPLS="",vpnForti="",hardRem="",hardAppRem="",otherRem="",otherAppRem="",glowProject="",glowWH="",glowID="",glowPass="",glowRem="",glowAppRem="";

rs1 = st1.executeQuery("select * from neinapplicationformmain where emplCode='"+empGet+"' or emplName like '%"+empGet+"%'");
if(rs1.next()){
	flagC = false;
	full_name = rs1.getString("emplName");
	branch = rs1.getString("emplBranch");
	dept = rs1.getString("emplDept");
	desg = rs1.getString("emplDesg");
	ro = rs1.getString("emplRO");
	sow = rs1.getString("emplSOW");
	reqBy = rs1.getString("emplReqBy");
	empType = rs1.getString("emplType");
	empContType = rs1.getString("emplConType");
	reqBranch = rs1.getString("emplreqBranch");
	reqFor = rs1.getString("emplreqFor");
	emailDomain = rs1.getString("emailDomain");
	emailType = rs1.getString("emailDomain");
	reqMailID = rs1.getString("reqMailID");
	comProvMob = rs1.getString("CompanyProvMobile");
	m_m = rs1.getString("makeAndModel");
	comProSim = rs1.getString("comProvSim");
	comNumber = rs1.getString("comProvimNumber");
	mobint = rs1.getString("mobIntune");
	intNumber = rs1.getString("mobileNo");
	imei1 = rs1.getString("imei1");
	imei2 = rs1.getString("imei2");
	emailRem = rs1.getString("emailRemarks");
	crMail = rs1.getString("mailIDCreated");
	emailPass = rs1.getString("emailPassword");
	intProv = rs1.getString("intuneAccessProvided");
	emailAppRem = rs1.getString("emailAppRemarks");
	domAcc = rs1.getString("domainAccount");
	domPass = rs1.getString("domainPassword");
	domRem = rs1.getString("domainRemarks");
	domAppRem = rs1.getString("domainAppRemarks");
	selBrBio = rs1.getString("selBioBranches");
	bioRem = rs1.getString("bioRemarks");
	bioAppRem = rs1.getString("bioAppRemarks");
	foldRem = rs1.getString("folderRemarks");
	foldAppRem = rs1.getString("sharedAppRemarks");
	intReqType = rs1.getString("internetReqType");
	intRem = rs1.getString("internetRemarks");
	intAppRem = rs1.getString("internetAppRemarks");
	newBR = rs1.getString("newinsBranchCode");
	newReqCode = rs1.getString("newinsOpCode");
	newReqType = rs1.getString("newinsRequest");
	newOPC = rs1.getString("newinsOPAppCode");
	newPass = rs1.getString("newinsPassword");
	newlvl = rs1.getString("newinsLevel");
	newAccess = rs1.getString("newinsAccessedBranches");
	newBlok = rs1.getString("newinProgBlocked");
	newAll = rs1.getString("newinProgAllowed");
	newRem = rs1.getString("newinsRemarks");
	newAppRem = rs1.getString("newinsAppRemarks");
	compCode = rs1.getString("nexasCompCode");
	ccName = rs1.getString("nexasCCName");
	ccCode = rs1.getString("nexasCCCode");
	opRange = rs1.getString("nexasOPRange");
	nexReqType = rs1.getString("nexasReqType");
	nexOptMenu = rs1.getString("nexasOptionalMenu");
	nexID = rs1.getString("nexasID");
	NexPass = rs1.getString("nexasPassword");
	nexRem = rs1.getString("nexasRemarks");
	nexAppRem = rs1.getString("nexasAppRemarks");
	gsCode = rs1.getString("gsnetCode");
	gsPass = rs1.getString("gsnetPassword");
	gsBRCodes = rs1.getString("assignedGsnetBranch");
	gsDiv = rs1.getString("assignedGsnetDivName");
	gsPDiv = rs1.getString("assignedGsnetPriDiv");
	gsRole = rs1.getString("assignedGsnetUserRole");
	gsRem = rs1.getString("gsnetRemarks");
	gsAppRem = rs1.getString("gsnetAppRemarks");
	interApp = rs1.getString("internalApplication");
	interID = rs1.getString("internalID");
	interPass = rs1.getString("internalPassword");
	interRem = rs1.getString("internalRemarks");
	interAppRem = rs1.getString("internalAppRemarks");
	usbFor = rs1.getString("usbAccessFor");
	usbDet = rs1.getString("usbDetails");
	usbRem = rs1.getString("usbRemarks");
	usbAppRem = rs1.getString("usbAppRemarks");
	vpnID = rs1.getString("vpnDomainID");
	vpnMail = rs1.getString("vpnEmailID");
	vpnMPLS = rs1.getString("vpnMPLS");
	vpnForti = rs1.getString("vpnFortiToken");
	hardRem = rs1.getString("hardPenRemarks");
	hardAppRem = rs1.getString("hardPenAppRemarks");
	otherRem = rs1.getString("otherAssetRemarks");
	otherAppRem = rs1.getString("otherAssetAppRemarks");
	glowProject = rs1.getString("glowProject");
	glowWH = rs1.getString("glowWarehouse");
	glowID = rs1.getString("glowID");
	glowPass = rs1.getString("glowPass");
	glowRem = rs1.getString("glowRemarks");
	glowAppRem = rs1.getString("glowAppRemarks");
}

String nexReqType1 = "";
if(nexReqType.equalsIgnoreCase("HOAcUser")){
	nexReqType1 = "HO Acounting User";
}if(nexReqType.equalsIgnoreCase("BRAcUser")){
	nexReqType1 = "Branch Acounting User";
}if(nexReqType.equalsIgnoreCase("ITUser")){
	nexReqType1 = "IT User";
}if(nexReqType.equalsIgnoreCase("RepoDispOnly")){
	nexReqType1 = "Report display only User";
}

String nexOptMenu1 = "";
if(nexOptMenu.contains("paymentProp")) {
	nexOptMenu1+= "Payment Proposal"+", ";
}if(nexOptMenu.contains("paymentAppr")) {
	nexOptMenu1+= "Payment Approval"+", ";	
}if(nexOptMenu.contains("openCloseSch")) {
	nexOptMenu1+= "Open/Close Schedule"+", ";
}if(nexOptMenu.contains("voidCheq")) {
	nexOptMenu1+= "Void Cheque"+", ";
}if(nexOptMenu.contains("issueCheq")) {
	nexOptMenu1+= "Issue Cheque"+", ";
}if(nexOptMenu.contains("taxRepo")) {
	nexOptMenu1+= "Tax Report"+", ";
}if(nexOptMenu.contains("ExchangRateMa")) {
	nexOptMenu1+= "Exchange Rate Maintainance"+", ";
}if(nexOptMenu.contains("offsetAc")) {
	nexOptMenu1+= "Offset Account"+", ";
}if(nexOptMenu.contains("addfreeMaster")) {
	nexOptMenu1+= "Addfree master Maintainance"+", ";
}if(nexOptMenu.contains("paymentOpeBranch")) {
	nexOptMenu1+= "Payment operation of branch"+", ";
}if(nexOptMenu.contains("batchInput")) {
	nexOptMenu1+= "Batch Input"+", ";
}if(nexOptMenu.contains("SEPABACS")) {
	nexOptMenu1+= "SEPA.BACS data Download"+", ";
}

if(!nexOptMenu1.equals("")){
	nexOptMenu1 = nexOptMenu1.substring(0, nexOptMenu1.length()-2);
}
%>

<% 
if(flagC==false){
%>

<table  width="895">
<%
if(!empContType.equalsIgnoreCase("Contract")){
%>
<tr>
<td style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" value="<%=empGet%>" readonly/></td>
<td style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" value="<%=full_name%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width:23%;">Branch :</td>
<td style="text-align:left;"><input type="text" value="<%=branch%>" readonly></td>
<td style="text-align: right;width:23%;">Department :</td>
<td style="text-align:left;"><input type="text" value="<%=dept%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input type="text" value="<%=desg%>" readonly/></td>
<td style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" value="<%=ro%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;">Scope Of Work :</td>
<td style="text-align: left;"><input type="text" value="<%=sow%>" readonly/></td>
<td style="text-align: right;">Requested By :</td>
<td style="text-align:left;"><input type="text" value="<%=reqBy%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;">Employee Type</td>
<td style="text-align:left;width:23%;"><input type="text" value="<%=empType%>" readonly></td>
<td style="text-align: right;">Employee Contract Type</td>
<td style="text-align:left;width:23%;"><input type="text" value="<%=empContType%>" readonly></td>
</tr>
<%}else{%>
<tr>
<td style="text-align: right;">Employee Name :</td>
<td style="text-align:left;"><input type="text" value="<%=full_name%>" readonly></td>
<td style="text-align: right;width:23%;">Branch :</td>
<td style="text-align:left;"><input type="text" value="<%=branch%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width:23%;">Department :</td>
<td style="text-align:left;"><input type="text" value="<%=dept%>" readonly></td>
<td style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input type="text" value="<%=desg%>" readonly/></td>
</tr>
<tr>
</tr>
<tr>
<td style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" value="<%=ro%>" readonly/></td>
<td style="text-align: right;">Scope Of Work :</td>
<td style="text-align: left;"><input type="text" value="<%=sow%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;">Employee Contract Type</td>
<td style="text-align:left;width:23%;"><input type="text" value="<%=empContType%>" readonly></td>
<td style="text-align: right;">Requested By :</td>
<td style="text-align:left;"><input type="text" value="<%=reqBy%>" readonly/></td>
</tr>
<%}%>
</table>
<br />

<%
String chk1=null,chk2=null,chk3=null,chk4=null,chk5=null,chk6=null,chk7=null,chk8=null,chk9=null,chk10=null,chk11=null,chk12=null,chk13=null,chk14=null;
String[] reqFor1 = reqFor.split(",");
for(int i=0;i<reqFor1.length;i++){
	if(reqFor1[i].trim().equalsIgnoreCase("Email ID")){
		chk1="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Domain Account")){
		chk2="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Biometric / Access Card")){
		chk3="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Shared Folder")){
		chk4="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Internet Access / FTP Access")){
		chk5="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("NEWINS")){
		chk6="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("NExAS")){
		chk7="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("GS-NET")){
		chk8="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Internal Application")){
		chk9="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("USB Access")){
		chk10="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("VPN Access")){
		chk11="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("HardDisk / PenDrive")){
		chk12="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("Any Other Asset")){
		chk13="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("NEx-GLOW")){
		chk14="checked";
	}
}
%>
<table width="895">
<tr>
<td rowspan="3" style="text-align:right;width: 15%;">Request For :</td>
<td style="text-align:left;"><input type="checkbox" <%=chk1%> disabled="disabled" name="requestForCheck" id="requestForCheck_email" value="Email ID">Email ID</td>
<td style="text-align:left;"><input type="checkbox" <%=chk2%> disabled="disabled" name="requestForCheck" id="requestForCheck_dom" value="Domain Account">Domain Account</td>
<td style="text-align:left;"><input type="checkbox" <%=chk3%> disabled="disabled" name="requestForCheck" id="requestForCheck_bio" value="Biometric / Access Card">Biometric / Access Card</td>
<td style="text-align:left;"><input type="checkbox" <%=chk4%> disabled="disabled" name="requestForCheck" id="requestForCheck_sha" value="Shared Folder">Shared Folder</td>
<td style="text-align:left;"><input type="checkbox" <%=chk5%> disabled="disabled" name="requestForCheck" id="requestForCheck_int" value="Internet Access / FTP Access">Internet Access / FTP Access</td>
<tr>
<td style="text-align:left;"><input type="checkbox" <%=chk6%> disabled="disabled" name="requestForCheck" id="requestForCheck_newins" value="NEWINS">NEWINS</td>
<td style="text-align:left;"><input type="checkbox" <%=chk7%> disabled="disabled" name="requestForCheck" id="requestForCheck_nexas" value="NExAS">NExAS</td>
<td style="text-align:left;"><input type="checkbox" <%=chk8%> disabled="disabled" name="requestForCheck" id="requestForCheck_gs" value="GS-NET">GS-NET</td>
<td style="text-align:left;"><input type="checkbox" <%=chk9%> disabled="disabled" name="requestForCheck" id="requestForCheck_internal" value="Internal Application">Internal Application</td>
<td style="text-align:left;"><input type="checkbox" <%=chk10%> disabled="disabled" name="requestForCheck" id="requestForCheck_usb" value="USB Access">USB Access</td>
</tr>
<tr>
<td style="text-align:left;"><input type="checkbox" <%=chk11%> disabled="disabled" name="requestForCheck" id="requestForCheck_vpn" value="VPN Access">VPN Access</td>
<td style="text-align:left;"><input type="checkbox" <%=chk12%> disabled="disabled" name="requestForCheck" id="requestForCheck_hard" value="HardDisk / PenDrive">HardDisk / PenDrive</td>
<td style="text-align:left;"><input type="checkbox" <%=chk13%> disabled="disabled" name="requestForCheck" id="requestForCheck_assets" value="Any Other Asset">Any Other Asset</td>
<td style="text-align:left;"><input type="checkbox" <%=chk14%> disabled="disabled" name="requestForCheck" id="requestForCheck_glow" value="NEx-GLOW">NEx-GLOW</td>
<td colspan="1"></td>
</tr>
</tr>
</table>
<br />

<div id="email_details" style="display: none;visibility: hidden;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="9" style="width:15%"><font size="3"><b>Email ID</b></font></td>
<td style="text-align: right;width: 20%;">Email Domain :</td>
<td align="left" style="width: 20%;"><input type="text" value="<%=emailDomain%>" readonly></td>
<td style="text-align: right;width:20%;">Employee Type :</td>
<td style="text-align:left;width:20%;"><input type="text" value="<%=emailType%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;">E-Mail Id Created :</td>
<td style="text-align:left;"><input type="text"  value="<%=crMail%>" readonly></td>
<td style="text-align: right;">E-Mail Id Password :</td>
<td style="text-align:left;"><input type="text" value="<%=emailPass%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;">Requested E-Mail Id :</td>
<td style="text-align:left;"><input type="text" value="<%=reqMailID%>" readonly></td>
<td style="text-align: right;">Intune Access Provided :</td>
<td style="text-align:left;"><input type="text" value="<%=intProv%>" readonly></td>
</tr>
<%
String colMob="";
if(comProvMob.equalsIgnoreCase("No")){
	colMob = "3";
}else{
	colMob="1";
}
%>
<tr>
<td style="text-align:right;">Company Provided Mobile :</td>
<td style="text-align:left;" colspan="<%=colMob%>"><input type="text" value="<%=comProvMob%>" readonly></td>
<%if(comProvMob.equalsIgnoreCase("Yes")){%>
<td style="text-align:right;">Mobile Make & Model :</td>
<td style="text-align:left;"><input type="text" value="<%=m_m%>" readonly>
<%}%>
</td>
</tr>
<%
String colSim="";
if(comProSim.equalsIgnoreCase("No")){
	colSim = "3";
}else{
	colSim="1";
}
%>
<tr>
<td style="text-align:right;">Company Provided Sim Card :</td>
<td style="text-align:left;" colspan="<%=colSim%>"><input type="text" value="<%=comProSim%>" readonly></td>
<%if(comProSim.equalsIgnoreCase("Yes")){%>
<td style="text-align:right;">Company Provided Mobile Number :</td>
<td style="text-align:left;"><input type="text" value="<%=comNumber%>" readonly></td>
<%}%>
</tr>
<%
String colINT="";
if(mobint.equalsIgnoreCase("No")){
	colINT = "3";
}else{
	colINT="1";
}
%>
<tr>
<td style="text-align: right;">Mobile Access (Intune) </td>
<td style="text-align:left;" colspan="<%=colINT%>"><input type="text" value="<%=mobint%>" readonly></td>
<%if(mobint.equalsIgnoreCase("Yes")){%>
<td style="text-align:right;">Mobile No. :</td>
<td style="text-align:left;"><input type="text" value="<%=intNumber%>" readonly></td>
<%}%>
</tr>
<%if(mobint.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:center;" colspan="4">IMEI No. ('s) :</td>		
</tr>
<tr>
<td style="text-align:right;">IMEI No 1 :</td>
<td style="text-align:left;"><input type="text" value="<%=imei1%>" readonly></td>		
<td style="text-align:right;">IMEI No 2 :</td>
<td style="text-align:left;"><input type="text" value="<%=imei2%>" readonly></td>
</tr>
<%}%>
<tr>
<td style="text-align:right;">Requester Remarks :</td>
<td style="text-align:left;"><textarea name="remarksEmail" rows="3" cols="26" readonly><%=emailRem%></textarea></td>
<td style="text-align:right;">IT Remarks :</td>
<td style="text-align:left;"><textarea name="ITremarksEmail" rows="3" cols="26" readonly><%=emailAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="dom_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>Domain Account</b></font></td>
<td style="text-align:right; width: 20%;">Domain Account :</td>
<td style="text-align:left; width: 20%;"><input type="text" value="<%=domAcc%>" readonly></td>
<td style="text-align:right; width: 20%;">Domain Password :</td>
<td style="text-align:left; width: 20%;"><input type="text" value="<%=domPass%>" readonly></td>
</tr>
<tr>
</tr>
<tr>
<td style="text-align:right; width: 20%;">Requester Remarks :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=domRem%></textarea></td>
<td style="text-align:right; width: 20%;">IT Remarks :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=domAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="bio_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>Biometric / Access Card</b></font></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;">Selected Branch ('s) :</td>
<td style="text-align:left;" colspan="3"><input type="text" value="<%=selBrBio%>" size="50" readonly></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;">Requester Remarks :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=bioRem%></textarea></td>
<td style="text-align:right; width: 20%;"">IT Remarks :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=bioAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="sha_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Shared Folder Access</b></font></td>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=foldRem%></textarea></td>
<td style="text-align:right;width: 20%;"> IT Remarks :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=foldAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="int_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internet Access / FTP Access</b></font></td>
<td style="text-align:right; width: 20%;" colspan="1">Request Type :</td>
<td colspan="3" style="text-align:left;"><input type="text" value="<%=intReqType%>" readonly></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left" style="width: 20%;"><textarea rows="3" cols="26" readonly><%=intRem%></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1">IT Remarks :</td>
<td align="left" style="width: 20%;"><textarea rows="3" cols="26" readonly><%=intAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="new_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="6" id="newin" style="width:15%"><font size="3"><b>NEWINS</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1">Requested Branch Code :</td>
<td style="text-align: left;" colspan="3"><input type="text" value="<%=newBR%>" readonly></td> 
</tr>
<tr>
<td style="text-align:right; width: 20%;">Requested NEWIN's ID / Operator Code :</td>
<td style="text-align:left;"><input type="text" value="<%=newReqCode%>" readonly/></td>
<td style="text-align:right; width: 20%;">Request  :</td>
<td style="text-align:left;"><input type="text" value="<%=newReqType%>" readonly/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;">Operator Code :</td>
<td style="text-align:left;"><input type="text" value="<%=newOPC%>" readonly/></td>
<td style="text-align:right; width: 20%;">Password  :</td>
<td style="text-align:left;"><input type="text" value="<%=newPass%>" readonly/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;">Level :</td>
<td style="text-align:left; width: 20%;"><input type="text" value="<%=newlvl%>" readonly/></td>
<td style="text-align:right; width: 20%;">Access Provided to Branche ('s) :</td>
<td style="text-align:left; width: 20%;"><input type="text" value="<%=newAccess%>" readonly/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;">Programs Blocked :</td>
<td style="text-align:left; width: 20%;"><textarea rows="3" cols="26" readonly><%=newBlok%></textarea></td>
<td style="text-align:right; width: 20%;">Programs Allowed :</td>
<td style="text-align:left;"><textarea rows="3" cols="26" readonly><%=newAll%></textarea></td>
</tr>
<%
String colNew="";
if(!newReqType.equalsIgnoreCase("Change")){
	colNew="3";
}else{
	colNew="1";
}
%>
<tr>
<%if(newReqType.equalsIgnoreCase("Change")){%>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td style="text-align:left;"><textarea rows="3" cols="26" readonly><%=newRem%></textarea></td>
<%}%>
<td style="text-align:right; width: 20%;" colspan="1">IT Remarks :</td>
<td style="text-align:left;" colspan="<%=colNew%>"><textarea rows="3" cols="26" readonly><%=newAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="nex_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="7" style="width:15%"><font size="3"><b>NExAS</b></font></td>
<td style="text-align:right; width: 20%;">Company Code :</td>
<td align="left" style="width: 20%;"><input type="text" value="<%=compCode%>" readonly></td>
<td style="text-align:right; width: 20%;">Cost Center Name:</td>
<td align="left"  style="width: 20%;"><input type="text" value="<%=ccName%>" readonly></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Cost Center Code:</td>
<td style="text-align: left;"><input type="text" value="<%=ccCode%>" readonly></td>
<td style="text-align:right; width: 20%;" colspan="1">Operation range:</td>
<td style="text-align: left;"><input type="text" value="<%=opRange%>" readonly></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Request Type <font color=red>(Please select first)</font></td>
<td align="left"><input type="text" value="<%=nexReqType1%>" readonly></td>
<td style="text-align:right; width: 20%;" colspan="1">Optional menu</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=nexOptMenu1%></textarea> </td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">NExAS User ID :</td>
<td style="text-align: left;"><input type="text" value="<%=nexID%>" readonly></td>
<td style="text-align:right; width: 20%;" colspan="1">Password :</td>
<td style="text-align: left;"><input type="text" value="<%=NexPass%>" readonly></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=nexRem%></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1">IT Remarks :</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=nexAppRem%></textarea></td>
</tr>
<tr>
<td colspan="10">
<font color=red><b><h3>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br /></h3>
</font> 
</td>
</tr>
</table>
<br />
</div>

<div id="gs_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="7" style="width:15%"><font size="3"><b>GS-NET</b></font></td>
<tr>
<td style="text-align:right; width: 20%;">User Code :</td>
<td style="text-align:left; width: 20%;"><input type="text"value="<%=gsCode%>" readonly/></td>
<td style="text-align:right; width: 20%;">Password :</td>
<td style="text-align:left; width: 20%;"><input type="text"value="<%=gsPass%>" readonly/></td>
</tr>
<tr>    
<td align="right" style="width:20%" colspan="1">Assigned GSNET Branch Code:	</td>
<td align="left" colspan="3"><textarea rows="3" cols="60" readonly><%=gsBRCodes%></textarea></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Assigned Division Name:</td>
<td align="left" colspan="3"><textarea rows="3" cols="60" readonly><%=gsDiv%></textarea></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Assigned Primary Division:</td>
<td align="left" colspan="3"><textarea rows="3" cols="60" readonly><%=gsPDiv%></textarea></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Assigned User Role :</td>
<td align="left" colspan="3"><textarea rows="3" cols="60" readonly><%=gsRole%></textarea></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=gsRem%></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1">IT Remarks :</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=gsAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="inter_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>Internal Application</b></font></td>
<td align="right" colspan="1" style="width:20%">Internal Application :</td>
<td align="left" colspan="3"><textarea rows="3" cols="60"><%=interApp%></textarea></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;">User ID :</td>
<td style="text-align:left;"><input type="text"value="<%=interID%>" readonly/></td>
<td style="text-align:right; width: 20%;">Password :</td>
<td style="text-align:left;"><input type="text"value="<%=interPass%>" readonly/></td>
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left" style="width: 20%;"><textarea rows="3" cols="26" readonly><%=interRem%></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1">IT Remarks :</td>
<td align="left" style="width:20%;"><textarea rows="3" cols="26" readonly><%=interAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="usb_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>USB Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1">Access For :</td>
<td style="text-align: left;width:20%;"><input type="text" value="<%=usbFor%>" readonly></td>
<td style="text-align:right; width: 20%;" colspan="1">USB Details:</td>
<td style="text-align: left;width:20%;"><input type="text" value="<%=usbDet%>" readonly/>	</td>		
</tr>
<tr>
<td style="text-align:right; width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left" style="width:20%;"><textarea rows="3" cols="26" readonly><%=usbRem%></textarea></td>
<td style="text-align:right; width: 20%;" colspan="1">IT Remarks :</td>
<td align="left" style="width:20%;"><textarea rows="3" cols="26" readonly><%=usbAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="vpn_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>VPN Access</b></font></td>
<td style="text-align: right;width:20%;">Domain ID :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=vpnID%>" readonly></td>
<td style="text-align: right;width: 20%;">Email ID :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=vpnMail%>" readonly></td>
</tr>
<tr>
<td style="text-align:right;" colspan="1">MPLS / NON MPLS :</td>
<td style="text-align:left;"><input type="text" value="<%=vpnMPLS%>" readonly></td>
<td style="text-align:right;" colspan="1">Forti Token Details :</td>
<td style="text-align:left;"><input type="text" value="<%=vpnForti%>" readonly></td>
</tr>
</table>
<br />
</div>

<div id="hard_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>HardDisk / PenDrive</b></font></td>
<td align="right" style="width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left"  style="width: 20%;"><textarea rows="3" cols="26" readonly><%=hardRem%></textarea></td>
<td align="right" style="width: 20%;" colspan="1">IT Remarks :</td>
<td align="left" style="width: 20%;"><textarea rows="3" cols="26" readonly><%=hardAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="asset_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Any Other Asset</b></font></td>
<td align="right" style="width: 20%;" colspan="1">Requester Remarks :</td>
<td align="left" style="width: 20%;"><textarea rows="3" cols="26" readonly><%=otherRem%></textarea></td>
<td align="right" style="width: 20%;" colspan="1">IT Remarks :</td>
<td align="left" style="width: 20%;"><textarea rows="3" cols="26" readonly><%=otherAppRem%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="glow_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>NEx-GLOW</b></font></td>
<td align="right" style="width: 20%;" colspan="1">Project :</td>
<td align="left" style="width: 20%;"><input type="text" value="<%=glowProject%>" readonly></td>
<td align="right" style="width: 20%;">Ware-House :</td>
<td align="left" style="width: 20%;"><input type="text" value="<%=glowWH%>" readonly></td>
</tr>
<tr>
<td align="right" style="width: 20%;" colspan="1">User ID :</td>
<td align="left" style="width: 20%;"><input type="text" value="<%=glowID%>" readonly></td>
<td align="right" style="width: 20%;">Password :</td>
<td align="left" style="width: 20%;"><input type="text" value="<%=glowPass%>" readonly></td>
</tr>
<tr>
<td align="right" colspan="1">Requester Remarks :</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=glowRem%></textarea></td>
<td align="right" colspan="1">IT Remarks :</td>
<td align="left"><textarea rows="3" cols="26" readonly><%=glowAppRem%></textarea></td>
</tr>
</table>
</div>
</td>
</tr>
</table>

<center>
<table style="margin-left: auto;margin-right: auto;" >
<tr>
<td style="font-size:1" id="hiderow"><input type="button" value="BACK" onclick="javascript:history.back()"/></td>
<td align="right" id="hiderow">
<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</tr>
</table> 

<%
}else{
%>
<script>
alert("Employee Details not available");
window.history.go(-1);
</script>
<%
}
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
}
	%>
</center>
	
</div>
</form>	
</body>
</html>