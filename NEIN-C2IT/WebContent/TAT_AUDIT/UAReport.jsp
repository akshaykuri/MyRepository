<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id = "con" class="CON2.Connection2"/>
<%@page import = "java.sql.*"%>
<%@page language="java"%> 
<%@include file="../banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER AUDIT REPORT</title>

<link rel="shortcut icon" href="../images/faviconnnnn.ico" />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script type="text/javascript">
<%
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg=null;
	msg="Session__Time__Out__Login__Again";
	response.sendRedirect("../loginho.jsp?msg="+msg);
}

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

</head>

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
<br><br>

<form action="" name="form">

<table id="table1" class="table-sm table-hover" width="1118" border="1" align="center" bgcolor="white" style="border-collapse: collapse;">
	<tr bgcolor="2f4377" style="color: white;font-family: verdana;size: 2;">
		<th style="vertical-align: middle;text-align: center;" width="70" nowrap>SL NO.</th>
		<th style="vertical-align: middle;text-align: center;" width="70" nowrap>Employee ID</th>
		<th style="vertical-align: middle;text-align: center;" width="70" nowrap>System IP</th>
		<th style="vertical-align: middle;text-align: center;" width="70" nowrap>Action</th>
		<th style="vertical-align: middle;text-align: center;" width="70" nowrap>Date</th>
		<th style="vertical-align: middle;text-align: center;" width="70" nowrap>Time</th>
	</tr>
<%
Connection cn 			=	con.getConnection2();
PreparedStatement psmt=null;
ResultSet rs=null;

String empID="",datefrom="",dateto="",dateF="",dateFF="";
int sno=0,rc=0;

empID		= request.getParameter("empID");
datefrom	= request.getParameter("date4");
dateto 		= request.getParameter("date44");

if(datefrom!=""){
	String[] dateString = datefrom.split("-");
	if (dateString[1].equals("Jan")){
		dateString[1]="01";
	}else if (dateString[1].equals("Feb")){
		dateString[1]="02";
	}else if (dateString[1].equals("Mar")){
		dateString[1]="03";
	}else if (dateString[1].equals("Apr")){
		dateString[1]="04";
	}else if (dateString[1].equals("May")){
		dateString[1]="05";
	}else if (dateString[1].equals("Jun")){
		dateString[1]="06";
	}else if (dateString[1].equals("Jul")){
		dateString[1]="07";
	}else if (dateString[1].equals("Aug")){
		dateString[1]="08";
	}else if (dateString[1].equals("Sep")){
		dateString[1]="09";
	}else if (dateString[1].equals("Oct")){
		dateString[1]="10";
	}else if (dateString[1].equals("Nov")){
		dateString[1]="11";
	}else if (dateString[1].equals("Dec")){
		dateString[1]="12";
	}
	dateF = dateString[2]+"-"+dateString[1]+"-"+dateString[0];
}

if(dateto!=""){
	String[] dateString2 = dateto.split("-");
	if (dateString2[1].equals("Jan")){
		dateString2[1]="01";
	}else if (dateString2[1].equals("Feb")){
		dateString2[1]="02";
	}else if (dateString2[1].equals("Mar")){
		dateString2[1]="03";
	}else if (dateString2[1].equals("Apr")){
		dateString2[1]="04";
	}else if (dateString2[1].equals("May")){
		dateString2[1]="05";
	}else if (dateString2[1].equals("Jun")){
		dateString2[1]="06";
	}else if (dateString2[1].equals("Jul")){
		dateString2[1]="07";
	}else if (dateString2[1].equals("Aug")){
		dateString2[1]="08";
	}else if (dateString2[1].equals("Sep")){
		dateString2[1]="09";
	}else if (dateString2[1].equals("Oct")){
		dateString2[1]="10";
	}else if (dateString2[1].equals("Nov")){
		dateString2[1]="11";
	}else if (dateString2[1].equals("Dec")){
		dateString2[1]="12";
	}
	dateFF = dateString2[2]+"-"+dateString2[1]+"-"+dateString2[0];
}


String emp="",sysIP="",action="",date="",day="",time="";
psmt 	= cn.prepareStatement("select empName as emp,systemIP as sysIP,action as action,DATE_FORMAT(date, '%d-%m-%Y') as date,DAYNAME(date) AS day,DATE_FORMAT(time, '%h:%i %p') as time from useraudittrial where (empID=? OR ?='') AND (date>=? OR ?='') AND (date<=? OR ?='') order by slno");
psmt.setString(1,empID);
psmt.setString(2,empID);
psmt.setString(3,dateF);
psmt.setString(4,dateF);
psmt.setString(5,dateFF);
psmt.setString(6,dateFF);
rs 		= psmt.executeQuery();
while(rs.next()){
	emp 		= rs.getString("emp");
	sysIP 		= rs.getString("sysIP");
	action 		= rs.getString("action");
	date 		= rs.getString("date");
	day 		= rs.getString("day");
	time	 	= rs.getString("time");
%>
	<tr style="color: black;">
		<td style="vertical-align: middle;text-align: center;"><%=++sno%></td>
		<td style="vertical-align: middle;text-align: left;" nowrap>&nbsp;&nbsp;<%=emp%></td>
		<td style="vertical-align: middle;text-align: left;" nowrap>&nbsp;&nbsp;<%=sysIP%></td>
	    <td style="vertical-align: middle;text-align: left;" nowrap>&nbsp;&nbsp;<%=action%></td>
	    <td style="vertical-align: middle;text-align: left;" nowrap>&nbsp;&nbsp;<%=date%> <font style="font-weight: bold;">( <%=day%> )</font></td>
		<td style="vertical-align: middle;text-align: center;"><%=time%></td>
	</tr>
<%}%>
</table>

<br>

<table width="1118" align="center" id="hiderow">
	<tr>
		<td align="center">
			<input style="background-color:#2f4377;font-weight:bold;color:white;" type="button" value="BACK" onclick="window.location.href='UAReportFilter.jsp?msg=1'"/>
		</td>
	</tr>
</table>

<br><br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
		<td width="1000" align="left">
			<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
		</td>
		<td width="115" align="right">
			<a href="../adminHR.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="1118" class="greenLine"  align="right"></td>
	</tr>
	<tr>
		<td colspan="2" width="1118" class="blueLine" align="right"></td>
	</tr>
</table>

</form>
</body>
</html>