<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>NEIN-C2IT</title>
<%@include file="../banner.jsp" %>
<link rel="shortcut icon" href="../images/faviconnnnn.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg">

<head>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script type="text/javascript" src="js/Calendar.js"></script>
<script type="text/javascript" src="../js/jquery.1.11.1.min.js" ></script>
<script type="text/javascript" src="../js/Calendar.js"></script>

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
disp = disp.replace("%27", " ");
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
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}
%>

<script type="text/javascript">
function validate1(){
	var p1=document.getElementById("idempID");
	var y1=document.form.date4;
	var y2=document.form.date44;
	if(p1.value=="" && y1.value=="" && y2.value==""){
		alert("Please enter the details!");
		p1.focus();
		return false;
	}else{
		return true;
	}
}

function validateBranch(){
	var y1=document.form.date4;
	var y2=document.form.date44;
	if ((y1.value==null)||(y1.value=="")){
		alert("First Select From Date!");
		y1.focus();
		return false; 
	}else{
   		return true;
	}
}
</script>

<body leftmargin="80" rightmargin="80" marginwidth="70">
<br>

	<div id="wrapper">
		<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr align="center">
				<td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
			</tr>
			<tr align="center">
				<td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br /></font></strong></td>
			</tr>
			<tr align="center">
				<td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">USER AUDIT REPORT</font></strong></td>
			</tr>
			<tr>
				<td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
			</tr>
		</table>

<br><br><br><br>

		<form name="form" method="post" action="UAReport.jsp?msg=1">
<%
String b_no=null,desg=null;
b_no = (String) session.getAttribute("b_no");
desg = (String) session.getAttribute("desg");
%>	 
			<table align="center">
				<tr>
					<th style="text-decoration: underline;font-size: 20px;">USER AUDIT REPORT</th>
				</tr>
			</table>

<br>	 

			<table align="center" width="350" border="1" cellpadding="3" cellspacing="1">
				<tr>
					<td colspan="2">Enter Employee ID :
						<input type="text" name="empID" id="idempID" value="" style="width: 180px;">
					</td>
				</tr>
				<tr>
					<td><label>From Date :</label>
						<input type="text" name="date4" style="width: 6em" value="" id="idCalendar2" onclick="validateBranch();showCalendarControl(this);" readonly>
					</td>
					<td><label>To Date :</label>
						<input type="text" name="date44" style="width: 6em" value="" id="idCalendar3" onclick="validateBranch();showCalendarControl(this)" readonly>
					</td>
				</tr>
				<tr>
					<td align=center colspan="2">
						<input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate1();">
					</td>
				</tr>
			</table>

		</form>

<br><br><br><br><br><br><br><br>

		<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118">
			<tr>
				<td width="1000" align="left">
					<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
				</td>
				<td width="115" align="right">
					<a href="../adminHR.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
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