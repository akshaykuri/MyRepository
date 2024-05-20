<link rel="shortcut icon" href="../../images/faviconnnnn.ico" />
<%@page import="CON2.DbUtil"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@ include file="../../banner.jsp"%>
<%@page import = "java.sql.*"%>
<%@page import="CON2.Connection2"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>NEIN-C2IT</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<head>
<title>View C2IT Access Review Report</title>
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />
<script type="text/javascript" src="js/Calendar.js"></script>

<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg2=null;
	msg2="Session__Time__Out__ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}
%>

<style type="text/css">
div#id{
	width:100px;
	height:100px;
}
</style>

</head>
<script type="text/javascript">
<%
String msg[] = request.getQueryString().toString().split("=");
String disp = msg[1].toString();
disp = disp.replace("%20", "");
disp = disp.replace("__","  ");
%>
msg = "<%=disp%>";
if(msg!="1"){
	alert(msg);
}
</script>

<script type="text/javascript">
function validate1(){
	var p1=document.form.req;
	if((p1.value==null)||(p1.value=="NULL")||(p1.value=="-")||(p1.value=="")){
		alert("Select Form Number!");
		p1.focus();
		return false; 
	}else{
		return true;
	}
}
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"   style="overflow-x: hidden; overflow-y: hidden;">
	<div id="wrapper">
		<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr align="center">
				<td width="1000" align="left">
					<img src="../../images/nippon.gif" height="35" width="220">
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="#8ec300" class="greenLine"><strong><font size="4" color="white"><b>WELCOME </b><br /></font></strong></td>
			</tr>
			<tr align="center">
				<td bgcolor="#2f4377" class="blueLine"><strong><font size="4" color="white">View C2IT Access Review Report</font></strong></td>
			</tr>
			<tr>
				<td bgcolor="">
					<font size="2">NAME :<%=session.getAttribute("Nname")%></font>&nbsp;&nbsp;<font size="2">DESG :<%=session.getAttribute("desg")%></font>
				</td>
			</tr>
		</table>
<br><br>
		<form name="form" method="post" action="bomAuditViewBack.jsp?msg=1">
<%
String b_no = (String) session.getAttribute("b_no");
String desg = (String) session.getAttribute("desg");
%>

<%
Connection cn1 = con.getConnection2();
Statement st1=null,st2=null; 
ResultSet rs1=null,rs2=null;
try{
	st1=cn1.createStatement();
	
	if(b_no.equals("90")){
	    rs1 = st1.executeQuery("select distinct a.requestNo as reqNo from c2itreviewfrommain a left outer join c2itreviewfrommainitems b on a.requestNo=b.reqNo ORDER BY branchNo DESC");
	}else{
		rs1 = st1.executeQuery("select distinct a.requestNo as reqNo from c2itreviewfrommain a left outer join c2itreviewfrommainitems b on a.requestNo=b.reqNo where branchNo='"+b_no+"' ORDER BY branchNo DESC");
	}

	st2=cn1.createStatement();
%>

			<table align="center">
				<tr>
					<th>SELECT FORM NUMBER</th>
				</tr>
			</table>

<br><br>

			<table align="center" width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
				<tr>
					<td bgcolor="#2f4377" colspan="2"><font size ="3" color="white"></font></td>
				</tr>
				<tr>
					<td><br>
						<label>SELECT FORM NUMBER:</label>
						<select name="req" id="hiderow">
							<option value="-">SELECT</option> 
<%
String i_b_no1=null,form2_noD=null;
while(rs1.next()){%>
							<option value="<%=rs1.getString("reqNo")%>"><%=rs1.getString("reqNo")%></option>
<%}%>
						</select>
					</td>
				</tr>
				<tr>
					<td align=center colspan="2"><br>
						<input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate1();">
					</td>
				</tr>
			</table>
		</form>
<%}catch(Exception e){
	System.out.println(e);
}finally{
	DbUtil.closeDBResources(rs1,st1,null);
	DbUtil.closeDBResources(rs2,st2,cn1);
}
%>

<br><br><br><br>

		<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118">
			<tr>
				<td width="1000" align="left">
					<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
				</td>
				<td width="115" align="right">
					<a href="../../adminHR.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
				</td>
			</tr>
		</table>

		<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr align="center">
				<td class="greenLine" style="font-style: italic;"></td>
			</tr>
			<tr align="center">
				<td class="blueLine" style="font-style: italic;"></td>
			</tr>
		</table>
	</div>
</body>
</html>