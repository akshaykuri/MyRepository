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
<%@include file="../../banner.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "con1" class="CON2.ConnectionLMS" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>View Form</title>
<link rel='stylesheet' type='text/css' href='../../../css/style2.css' />
<link rel="shortcut icon" type="image/x-icon" href="../../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../../../css/Calender.css" title="style" />
<script type="text/javascript" src="../../../js/Calendar.js"></script>
<script type="text/javascript" src="../../../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../../../js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../../../js/onSubmitWait.js"></script>

<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg2=null;
	msg2="Session__Time__Out__ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}
%>

<style>
textarea{
	border: 1px solid #000; /* You can adjust the border thickness and color as needed */
	resize: both;
}
</style>

<script>
function validate() {
	let lvl = document.getElementById("lvlNo").value;
	if(lvl == 0){
		let sno			=	document.getElementById("sno").value;
		let stat		=	document.getElementsByName("status");
		let apprName	=	document.getElementsByName("mailingCheckClarificationStart");
		let finalRemarks=	document.getElementById("finalRemarks");
		let appName,verStatus,verRemarks;
		for(let z=1; z<=sno; z++){
			appName		=	document.getElementById("app_name"+z);
			verStatus	=	document.getElementById("verStatus"+z);
			verRemarks	=	document.getElementById("verRemarks"+z);
			if(appName.value == "" || appName.value == null || appName.value == "-" || appName.value == "null" || appName.value == "NULL"){
				alert("Please enter Application Name.");
				appName.focus();
				return false;
			}else if(!verStatus.checked){
				alert("Please select the Verification Status for Application - "+appName.value+".");
				verStatus.focus();
				return false;
			}else if(verRemarks.value == "" || verRemarks.value == null || verRemarks.value == "-" || verRemarks.value == "null" || verRemarks.value == "NULL"){
				alert("Please enter Verification Remarks for Application - "+appName.value+".");
				verRemarks.focus();
				return false;
			}
		}
		if(finalRemarks.value == "" || finalRemarks.value == null || finalRemarks.value == "-" || finalRemarks.value == "NULL" || finalRemarks.value == "null"){
			alert("Please enter Final Remarks");
			finalRemarks.focus();
			return false;
		}
		if(!stat[0].checked){
			alert("Please select Send for further Approval.");
			stat[0].focus();
			return false;
		}else if(!apprName[0].checked){
			alert("Please select the Approver.");
			apprName[0].focus();
			return false;			
		}
	}
}
</script>

<script>
function nextApprover(){
	document.getElementById("appRow").style.display="table-row";
}
</script>

<script>
function sync(val){
	var parts = val.split(",");
	var part1 = parts[0];
	var part2 = parts[1];
	var part3 = parts[2];
	var part4 = parts[3];
	var part5 = parts[4];
	var part6 = parts[5];
	if(val!=""){
		document.getElementById("idempid1").value=part1;
		document.getElementById("idroname").value=part2;
		document.getElementById("idrodesg").value=part3;
		document.getElementById("idromail").value=part4;
		document.getElementById("idlevelno").value=part5;
		document.getElementById("idbranchCode").value=part6;
	}else{
		document.getElementById("idempid1").value="";
		document.getElementById("idroname").value="";
		document.getElementById("idrodesg").value="";
		document.getElementById("idromail").value="";
		document.getElementById("idlevelno").value="";
		document.getElementById("idbranchCode").value="";
	}
}
</script>

</head>

<body style="margin-top: 10px;margin-left: 50px;margin-right: 50px;">

<form action="bomAuditLocalAdminApprovalBack.jsp" method="post" name="form" enctype="multipart/form-data">

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;text-align: center;" colspan="4"><font size="5"><b><label>C2IT Access Review Report Form</label></b></font></td>
	</tr>
</table>

<%
String bNo		=	(String) session.getAttribute("b_no");
String emp_no	=	(String) session.getAttribute("EmpNo");

Connection cn1=null,cn2=null;
Statement st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null;
ResultSet rs1=null,rs2=null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null;

int slno=0,sno=0;
String reqNo="",reqDate="",empID="",Name="",city="",desg="",dept="",email_id="",reqRem="",appName="",appDesg="",appStatus="",listOfApps="",appRemarks="",appDate="";
String bName="",brCode="",brName="";
reqNo = request.getParameter("req");

try{
	int id=0,count=0;
	String new_id = null;

	cn1 = con.getConnection2();
	cn2 = con1.getConnectionlms();
	
	st1 = cn1.createStatement();
	rs1 = st1.executeQuery("select distinct requestNo,date_format(requestDate,'%d-%m-%Y') as requestDate,requestBy,requestByName,requestByBranch,requestByDesg,requestByDept,requestByMailID,listOfApplications,requesterRemarks from c2itreviewfrommain where requestNo='"+reqNo+"'");
	if(rs1.next()){
		reqNo		=	rs1.getString("requestNo");
		reqDate		=	rs1.getString("requestDate");
		empID		=	rs1.getString("requestBy");
		Name		=	rs1.getString("requestByName");
		city		=	rs1.getString("requestByBranch");
		desg		=	rs1.getString("requestByDesg");
		dept		=	rs1.getString("requestByDept");
		email_id	=	rs1.getString("requestByMailID");
		listOfApps	=	rs1.getString("listOfApplications");
		reqRem		=	rs1.getString("requesterRemarks");
	}
%>

<%
	st2 = cn1.createStatement();
	rs2 = st2.executeQuery("select branchName,branchNo from c2itreviewfrommainitems where reqNo='"+reqNo+"' and branchNo='"+bNo+"' order by itemsID");
	while(rs2.next()){
		bName  = rs2.getString("branchName")+" - "+rs2.getString("branchNo");
		brCode = rs2.getString("branchNo");
		brName = rs2.getString("branchName");
	}
%>

<%
	st3 = cn1.createStatement();
	rs3 = st3.executeQuery("select empName,empDesg,status,remarks,date_format(appDate,'%d-%m-%Y') as appDate from c2itreviewfromitem where reqNo in ('"+reqNo+"') order by item_id");
%>

<%
	String listOfAppsArr[] = listOfApps.split(",");
	int snoLen = listOfAppsArr.length;
%>

<%
	st4 = cn1.createStatement();
	rs4 = st4.executeQuery("select id,app_name from listofapplications where id in ("+listOfApps+") order by id");
%>

<%
	int lvlNo=0;
	st5 = cn1.createStatement();
	rs5 = st5.executeQuery("select levelno from c2itreviewfrommain a left outer join c2itreviewfromitem b on a.requestNo=b.reqNo where status='Pending' and presence='now' and b.empId='"+emp_no+"'");
	while(rs5.next()){
		lvlNo = rs5.getInt("levelno");
	}
%>

<%
	int maxLvl=0;
	st6 = cn1.createStatement();
	rs6 = st6.executeQuery("select max(levelno) as maxLvl from c2itreviewfrom_routing");
	if(rs6.next()){
		maxLvl = rs6.getInt("maxLvl");
	}
%>

<input type="text" name="lvlNo" id="lvlNo" value="<%=lvlNo%>" style="display: none;" />
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
		<td style="text-align: right;vertical-align: middle;width: 25%;font-weight: bolder;font-size: 15px;">Initiator Remarks :</td>
		<td style="text-align: left;width: 75%;" colspan="3">
			<textarea rows="3" name="remarks" id="remarks" style="width: 100%;" readonly="readonly"><%=reqRem%></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><br /></td>
	</tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<td style="text-align: center;font-size: 20px;font-weight: bolder;width: 100%;" colspan="4">Verification Details</td>
	</tr>
	<tr style="background-color: gray;font-size: 15px;">
		<th>Branch Name/Code</th>
		<th colspan="3">Verification Details</th>
	</tr>
	<tr>
		<td style="text-align: left;vertical-align: middle;width: 25%;font-weight:bold;font-style:italic;"><%=bName%>
			<input type="text" value="<%=brCode%>" name="brCode" id="brCode" style="display: none;"/>
			<input type="text" value="<%=brName%>" name="brName" id="brName" style="display: none;"/>
		</td>
		<td style="text-align: left;vertical-align: middle;width: 75%;" colspan="3">
			<input type="text" value="<%=snoLen%>" name="sno" id="sno" style="display: none;"/>

			<table style="width: 100%;border: 1;">
				<tr style="background-color: black;font-size: 15px;color: white">
					<th style="text-align: center;vertical-align: middle;" nowrap="nowrap">Application Name</th>
					<th style="text-align: center;vertical-align: middle;" nowrap="nowrap">Verification Status</th>
					<th style="text-align: center;vertical-align: middle;" nowrap="nowrap">Verification Remarks</th>
				</tr>
<%while(rs4.next()){
sno++;
%>
				<tr style="background-color: white;">
					<td style="font-weight:bold;font-style:italic;text-align: left;vertical-align: middle;">
						<%=rs4.getString("app_name")%>
						<input type="text" name="app_name<%=sno%>" id="app_name<%=sno%>" value="<%=rs4.getString("app_name")%>" style="display: none;" />
					</td>
					<td style="font-weight:bold;font-style:italic;text-align: center;vertical-align: middle;">
						<input type="radio" name="verStatus<%=sno%>" id="verStatus<%=sno%>" value="1" />&nbsp;&nbsp;Verified
					</td>
					<td style="text-align: left;vertical-align: middle;">
						<textarea name="verRemarks<%=sno%>" id="verRemarks<%=sno%>" style="width: 100%;height: 20px"></textarea>
					</td>
				</tr>
<%}%>
			</table>
		</td>
	</tr>
</table>

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
<%
while(rs3.next()){
	appName = rs3.getString("empName");
	appDesg = rs3.getString("empDesg");
	appStatus = rs3.getString("status");
	appRemarks = rs3.getString("remarks");
	appDate = rs3.getString("appDate");
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

<table width="100%" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<td style="width: 10%;text-align: right;vertical-align: middle;font-weight: bolder;">Final Remarks :<font color="red">*</font></td>
		<td>
			<textarea rows="3" name="finalRemarks" id="finalRemarks" style="width: 100%;"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-weight:bold;font-style:italic;text-align: left;vertical-align: middle;width: 100%;" colspan="10">
<%
lvlNo++;
st7 = cn1.createStatement();
rs7 = st7.executeQuery("select empId,levelno from c2itreviewfrom_routing where levelno='"+lvlNo+"' and empId <> '"+emp_no+"'");
%>

<%if(lvlNo == maxLvl){%>
			<input type="radio" name="status" id="status" value="Close" />&nbsp;&nbsp;Direct Approve
<%}else{%>
			<input type="radio" name="status" id="status" value="Send" onclick="return nextApprover();" />&nbsp;&nbsp;Send for further Approval
<%}%>
		</td>
	</tr>
	<tr id="appRow" style="display: none;">
		<td style="font-weight:bold;text-align: left;vertical-align: middle;width: 100%;" colspan="10">
<%
while(rs7.next()){
	st8	= cn2.createStatement();
	rs8 = st8.executeQuery("select distinct u.email as mail,u.user_name as emp,u.emp_id as empID,rr.role_code as desg,b.branch_type_code as branchCode from user u left outer join user_role ur on ur.user_id=u.user_id left outer join reporting_officers m1 ON m1.user_id = u.user_id left outer join role rr ON ur.role_id =rr.role_id left outer join branchmaster b ON b.branch_id = u.branch_id left outer join department d ON d.department_id = u.department_id left outer join user m3 ON m3.user_id = m1.manager_id left outer join user m4 ON m4.user_id = m1.manager2_id where (m1.emp_id ='"+rs7.getString("empId")+"') and u.employee_status = 'yes'");
	while(rs8.next()){
		String Mailing=rs8.getString("mail");
		String emp1= rs8.getString("emp");
		String desg1 = rs8.getString("desg");
		String empidclar = rs8.getString("empId");
		String branchCode= rs8.getString("branchCode");
		String levelno1 = rs7.getString("levelno");
		String empDesgMail = empidclar+","+emp1+","+desg1+","+Mailing+","+levelno1+","+branchCode;
%>
			<input type="radio" name="mailingCheckClarificationStart" value="<%=empDesgMail%>" onclick="sync('<%=empDesgMail%>');" />
			<input type="text" value="<%=emp1%>" readonly="readonly" />&nbsp;&nbsp;<%=Mailing%>
<%}
}%>
			<input type="text" name="empid1" id="idempid1" value="" readonly="readonly" style="display: none;" />
			<input type="text" name="emp" id="idroname" value="" readonly="readonly" style="display: none;" />
			<input type="text" name="desg" id="idrodesg" value="" readonly="readonly" style="display: none;" />
			<input type="text" name="mail1" id="idromail" value="" readonly="readonly" style="display: none;" />
			<input type="text" name="levelno" id="idlevelno" value="" readonly="readonly" style="display: none;" />
			<input type="text" name="branchCode" id="idbranchCode" value="" readonly="readonly" style="display: none;" />
		</td>
	</tr>
</table>

<table style="margin-left: auto;margin-right: auto;">
	<tr>
		<td>
			<div id="formsubmitbutton">
				<input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name="button1" onclick="return validate();" />
			</div>
			<div id="buttonreplacement" style="margin-left:30px; display:none;">
				<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
			</div>
		</td>
		<td style="size:1">
			<input type="reset" value="RESET" />
		</td>
		<td style="font-size:1">
			<input type="button" value="BACK" onclick="window.location.href='../../adminHR.jsp?msg=1'" />
		</td>
	</tr>
</table>

<br></br>
<br></br>

<%
}catch(Exception e){
	System.out.println("here is the error in bomAuditViewBack.jsp====>"+e);
}finally{
	DbUtil.closeDBResources(rs1,st1,null);
	DbUtil.closeDBResources(rs2,st2,null);
	DbUtil.closeDBResources(rs3,st3,null);
	DbUtil.closeDBResources(rs4,st4,null);
	DbUtil.closeDBResources(rs5,st5,null);
	DbUtil.closeDBResources(rs6,st6,null);
	DbUtil.closeDBResources(rs7,st7,cn1);
	DbUtil.closeDBResources(rs8,st8,cn2);
}
%>

</form>
</body>
</html>