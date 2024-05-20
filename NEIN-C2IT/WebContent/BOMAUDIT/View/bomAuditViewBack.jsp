<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%>
<%@page import = "java.util.Date"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.text.DateFormat"%>
<%@page import = "java.text.SimpleDateFormat"%>
<%@page import = "net.sf.jasperreports.view.*"%>
<%@page import = "net.sf.jasperreports.engine.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page import="CON2.CurrentTime"%>
<%@include file="../banner.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>View Form</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script type="text/javascript" src="../../js/Calendar.js"></script>
<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../../js/onSubmitWait.js"></script>

<script type="text/javascript">
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

<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg2=null;
	msg2="Session__Time__Out__ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}
%>

<script>
function getBranchDetails(obj){
	if(typeof XMLHttpRequest != "undefined"){
		xmlHttp= new XMLHttpRequest();
	}else if(window.ActiveXObject){
		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(xmlHttp==null){
		alert("Browser does not support XMLHTTP Request");
		return;
	}
	var url="getBranchDetails.jsp";
	url +="?branch="+obj;
	//alert(url);
	xmlHttp.onreadystatechange=getBranchDetails1;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function getBranchDetails1(){
	var tab=xmlHttp.responseText;
	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		document.getElementById("resultFromAjax").innerHTML=tab;
		document.getElementById("tabDetails").innerHTML=tab;
	}
}
</script>

</head>

<body style="margin-top: 10px;margin-left: 50px;margin-right: 50px;">
<form action="#" method="post" name="form">

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;text-align: center;" colspan="4"><font size="5"><b><label>C2IT Access Review Report Form</label></b></font></td>
	</tr>
</table>

<%
Connection cn1=null;
Statement st1=null,st2=null,st3=null;
ResultSet rs1=null,rs2=null,rs3=null;
int slno=0;
String reqNo="",reqDate="",empID="",Name="",city="",desg="",dept="",email_id="",reqRem="",appName="",appDesg="",appStatus="",appRemarks="",appDate="";
reqNo = request.getParameter("req");
try{
	int id=0,count=0;
	String new_id = null;

	cn1 = con.getConnection2();
	st1 = cn1.createStatement();
	rs1 = st1.executeQuery("select distinct requestNo,date_format(requestDate,'%d-%m-%Y') as requestDate,requestBy,requestByName,requestByBranch,requestByDesg,requestByDept,requestByMailID,requesterRemarks from c2itreviewfrommain where requestNo='"+reqNo+"'");
	if(rs1.next()){
		reqNo		=	rs1.getString("requestNo");
		reqDate		=	rs1.getString("requestDate");
		empID		=	rs1.getString("requestBy");
		Name		=	rs1.getString("requestByName");
		city		=	rs1.getString("requestByBranch");
		desg		=	rs1.getString("requestByDesg");
		dept		=	rs1.getString("requestByDept");
		email_id	=	rs1.getString("requestByMailID");
		reqRem		=	rs1.getString("requesterRemarks");
	}
%>

<%
	st2 = cn1.createStatement();
	rs2 = st2.executeQuery("select branchName,branchNo from c2itreviewfrommainitems where reqNo='"+reqNo+"' order by itemsID");
%>

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<td style="text-align: center;font-size: 20px;font-weight: bolder;" colspan="4">Initiator Details</td>
	</tr>
	<tr>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Employee Code :</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="empId" id="empId" style="width: 100%;" readonly="readonly" value="<%=empID%>" />
		</td>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Employee Name :</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="empName" id="empName" style="width: 100%;" readonly="readonly" value="<%=Name%>" />
		</td>
	</tr>
	<tr>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Employee Branch :</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="empBranch" id="empBranch" style="width: 100%;" readonly="readonly" value="<%=city%>" />
		</td>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Employee Designation :</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="empDesg" id="empDesg" style="width: 100%;" readonly="readonly" value="<%=desg%>" />
		</td>
	</tr>
	<tr>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Employee Department :</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="empDept" id="empDept" style="width: 100%;" readonly="readonly" value="<%=dept%>" />
		</td>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Employee Mail-ID :</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="empMail" id="empMail" style="width: 100%;" readonly="readonly" value="<%=email_id%>" />
		</td>
	</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<td style="text-align: center;font-size: 20px;font-weight: bolder;width: 100%;" colspan="4">Request Details</td>
	</tr>
	<tr>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Request No.</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="reqNo" id="reqNo" style="width: 100%;color: maroon;font-weight: bolder;" readonly="readonly" value="<%=reqNo%>" />
		</td>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Request Date</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="reqDate" id="reqDate" style="width: 100%;color: maroon;font-weight: bolder;" readonly="readonly" value="<%=reqDate%>" />
		</td>
	</tr>
	<tr>
		<td colspan="4"><br /></td>
	</tr>
	<tr>
		<td style="text-align: right;vertical-align: middle;width: 25%;font-weight: bolder;font-size: 15px;">Branch Code/Name :<font color="red">*</font></td>
		<td style="text-align: left;vertical-align: middle;width: 75%;" colspan="3">
			<table style="width: 100%;border: 1;">
				<tr>
<%while(rs2.next()){
	String bName = rs2.getString("branchName")+" - "+rs2.getString("branchNo");
	if(count % 3 == 0){%>
                </tr><tr>
<%}%>
					<td style="font-weight:bold;font-style:italic;width: 33%">
						<input type="radio" name="bName" id="bName" onclick="getBranchDetails(this.value);" value="<%=bName%>" />&nbsp;<%=bName%>
					</td>
<%count++;	}%>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td id="tabDetails" colspan="4"></td>
	</tr>
	<tr>
		<td style="text-align: right;vertical-align: middle;width: 25%;font-weight: bolder;font-size: 15px;">Remarks :<font color="red">*</font></td>
		<td style="text-align: left;width: 75%;" colspan="3">
			<textarea rows="3" name="remarks" id="remarks" style="width: 100%;" readonly="readonly"><%=reqRem%></textarea>
		</td>		
	</tr>
</table>

<%
st3 = cn1.createStatement();
rs3 = st3.executeQuery("select empName,empDesg,status,remarks,date_format(appDate,'%d-%m-%Y') as appDate from c2itreviewfromitem where reqNo in ('"+reqNo+"') order by item_id");
%>

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<th style="text-align: center;font-size: 20px;font-weight: bolder;width: 100%;" colspan="6">Approval Routings</th>
	</tr>
	<tr style="background-color: darkgrey;">
		<th style="text-align: center;vertical-align: middle;width: 10%;" nowrap="nowrap">Sl No.</th>
		<th style="text-align: center;vertical-align: middle;width: 25%;" nowrap="nowrap">Name</th>
		<th style="text-align: center;vertical-align: middle;width: 20%;" nowrap="nowrap">Designation</th>
		<th style="text-align: center;vertical-align: middle;width: 10%;" nowrap="nowrap">Status</th>
		<th style="text-align: center;vertical-align: middle;width: 25%;" nowrap="nowrap">Remarks</th>
		<th style="text-align: center;vertical-align: middle;width: 10%;" nowrap="nowrap">Date</th>
	</tr>
<%while(rs3.next()){
	appName		=	rs3.getString("empName");
	appDesg		=	rs3.getString("empDesg");
	appStatus	=	rs3.getString("status");
	appRemarks	=	rs3.getString("remarks");
	appDate		=	rs3.getString("appDate");
%>
	<tr>
		<td style="text-align: center;width: 10%;"><%=++slno%></td>
		<td style="text-align: left;width: 25%;"><%=appName%></td>
		<td style="text-align: left;width: 20%;"><%=appDesg%></td>
		<td style="text-align: left;width: 10%;"><%=appStatus%></td>
		<td style="text-align: left;width: 25%;"><%=appRemarks%></td>
		<td style="text-align: center;width: 10%;"><%=appDate%></td>
	</tr>
<%}%>
</table>

<table style="margin-left: auto;margin-right: auto;">
	<tr>
		<td style="size:1;text-align: center;vertical-align: middle;">
			<input type="button" value="BACK" onclick="window.location.href='../../adminHR.jsp?msg=1'" />
		</td>
   	</tr> 
</table>
<%
}catch(Exception e){
	System.out.println("here is the error in bomAuditViewBack.jsp====>"+e);
}finally{
	DbUtil.closeDBResources(rs1,st1,null);
	DbUtil.closeDBResources(rs2,st2,null);
	DbUtil.closeDBResources(rs3,st3,cn1);
}
%>
</form>
<div id="resultFromAjax" style="display:none;"></div>
</body>
</html>