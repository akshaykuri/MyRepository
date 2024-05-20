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
<title>New Form</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script type="text/javascript" src="../../js/Calendar.js"></script>
<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="../../js/onSubmitWait.js"></script>

<style type="text/css">
input:focus {
	background-color: white;
}
</style>

<script>
function validate(){
	var app_name = document.getElementsByName("app_name");
	var remarks  = document.getElementById("remarks");
	var flag = false;
	for(let i=0; i<app_name.length; i++){
		if(app_name[i].checked){
			flag = true;
			break;
		}
	}
	if(flag == false){
		alert("Please select the List Of Applications!!!");
		app_name[0].focus();
		return false;
	}
	if(remarks.value=="" || remarks.value==null){
		alert("Please enter Remarks!!!");
		remarks.focus();
		return false;
	}
}
</script>

<script>
function validateRemarks() {
	var remarks = document.getElementById("remarks");
	if(/^[a-zA-Z0-9][a-zA-Z0-9\s]*$/.test(remarks.value)){
		return true;
	} else {
	    alert("Invalid input: Remarks should not start with a space or contain special characters.");
	    remarks.value="";
	    return false;
	}
}
</script>
       
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

</head>

<body>
<form action="bomAuditRequestBack.jsp" method="post" name="form">
<%!
String empID=null,Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null,dept=null;
int h=0,s=0;
%>

<%
empID	 = (String) session.getAttribute("EmpNo");
Name	 = (String) session.getAttribute("Nname");
desg	 = (String) session.getAttribute("desg");
city	 = (String) session.getAttribute("city");
b_no	 = (String) session.getAttribute("b_no");
admin	 = (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
dept	 = (String) session.getAttribute("deptName");

java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy");
%>
<br />
<div id="page-wrap">
<center>

<table width="900" cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;text-align: center;" colspan="4"><font size="5"><b><label>C2IT Access Review Report Form</label></b></font></td>
	</tr>
	<tr style="visibility: hidden;display: none;">
		<td>
			<input type="text" name="i_name" value="<%=Name%>" readonly="readonly" size="28" style="background-color: grey"/>
			<input type="text" name="i_desg" value="<%=desg%>" readonly="readonly" size="28"/>
			<input type="text" name="i_city" value="<%=city%>" readonly="readonly" size="28"/>
			<input type="text" name="i_b_no" value="<%=b_no%>" />
			<input type="text" name="i_admin" value="<%=admin%>" />
			<input type="text" name="i_email_id" value="<%=email_id%>" />
			<input type="text" name="f_date" value="<%=po_date.format(new java.util.Date())%>" readonly="readonly" size="28"/>
			<input type="text" name="r_remarks" value="extra_value" readonly="readonly"/>
		</td>
	</tr>
</table>

<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");

Connection cn1=null;
Statement st1=null,st2=null;
ResultSet rs1=null,rs2=null;

try{
	int id=0,count=0;
	String new_id = null;
	String id2=null,month="",year="";

	cn1 = con.getConnection2();
	st1 = cn1.createStatement();
	rs1 = st1.executeQuery("SELECT ifnull(max(idextend),'0'),UPPER(DATE_FORMAT(NOW(), '%b')),YEAR(NOW()) FROM c2itreviewfrommain WHERE requestNo IN(SELECT requestNo FROM c2itreviewfrommain WHERE requestByBranchNo='"+b_no+"' GROUP BY requestNo)");
	if(rs1.next()){
		try{
			id		=	rs1.getInt(1);
			month	=	rs1.getString(2);
			year	=	rs1.getString(3);
			id++;
			if(id2==null)
	 			id2=month+"/"+year+"/";
				String formattedId = String.format("%03d", id);
				new_id = id2+formattedId;
		}catch(SQLException ex){
			System.out.println(ex.toString());
		}
	}
	System.out.println("new_id======>"+new_id);
%>

<%
	st2 = cn1.createStatement();
	rs2 = st2.executeQuery("select id,app_name from listofapplications where deleteStatus<>'1' order by id");
%>

<table width="900" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
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

<table width="900" cellspacing="0" cellpadding="0" bgcolor="lightgrey" align="center">
	<tr>
		<td style="text-align: center;font-size: 20px;font-weight: bolder;width: 900;" colspan="4">Request Details</td>
	</tr>
	<tr>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Request No.</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="reqNo" id="reqNo" style="width: 100%;color: maroon;font-weight: bolder;" readonly="readonly" value="<%=new_id%>" />
		</td>
		<td style="text-align: right;width: 25%;font-weight: bolder;">Request Date</td>
		<td style="text-align: left;width: 25%;">
			<input type="text" name="reqDate" id="reqDate" style="width: 100%;color: maroon;font-weight: bolder;" readonly="readonly" value="<%=po_date.format(new java.util.Date())%>" />
		</td>
	</tr>
	<tr>
		<td colspan="4"><br /></td>
	</tr>
	<tr>
		<td style="text-align: right;vertical-align: middle;width: 25%;font-weight: bolder;font-size: 15px;">List of Applications :<font color="red">*</font></td>
		<td style="text-align: left;width: 75%;" colspan="3">
			<table style="width: 100%;border: 1;">
				<tr>
<%while(rs2.next()){	if(count % 3 == 0){%>
                </tr><tr>
<%}%>
					<td style="font-weight:bold;font-style:italic;width: 33%">
						<input type="checkbox" name="app_name" id="app_name" value="<%=rs2.getString("id")%>" />&nbsp;<%=rs2.getString("app_name")%>
					</td>
<%count++;	}%>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="text-align: right;vertical-align: middle;width: 25%;font-weight: bolder;font-size: 15px;">Remarks :<font color="red">*</font></td>
		<td style="text-align: left;width: 75%;" colspan="3">
			<textarea rows="3" name="remarks" id="remarks" oninput="validateRemarks()" style="width: 100%;"></textarea>
		</td>		
	</tr>
</table>

<table style="margin-left: auto;margin-right: auto;">
	<tr>
		<td style="size:1;text-align: center;vertical-align: middle;">
			<div id="formsubmitbutton">
				<input type="submit" value="SUBMIT" name="save1" id="save1" onclick="return validate();" />
			</div>
			<div id="buttonreplacement" style="display:none;">
				<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
			</div>
		</td>
		<td style="size:1;text-align: center;vertical-align: middle;">
			<input type="reset" value="RESET" />
		</td>
		<td style="size:1;text-align: center;vertical-align: middle;">
			<input type="button" value="BACK" onclick="window.location.href='../../adminHR.jsp?msg=1'" />
		</td>
   	</tr> 
</table>
<%
}catch(Exception e){
	System.out.println("here is the error in bomAuditRequest.jsp====>"+e);
}finally{
	DbUtil.closeDBResources(rs1,st1,null);
	DbUtil.closeDBResources(rs2,st2,cn1);
}
%>
</center>
	
</div>
</form>
</body>
</html>