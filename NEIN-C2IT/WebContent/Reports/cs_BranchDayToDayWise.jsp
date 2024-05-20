<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
    <%@ include file="../../banner.jsp" %>
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>BRANCH WISE REPORT</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico">
<link rel='stylesheet' type='text/css' href='../css/homePage.css' />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
</head>
<script  type="text/javascript">

<% 
    String msg2[] = request.getQueryString().toString().split("=");
    String disp = msg2[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg2 = "<%=disp%>";

     if(msg2!="1")
		{
           alert(msg2);
		}
</script>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	String msg4=null;
	msg4="Session__Time__Out__\\n Login__Again";
	response.sendRedirect("../adminlink.jsp?msg="+msg4);
}
%>
<script type="text/javascript">

 function link1() {
   			 //document.form.action="PoBranchDayExcel";
   			  document.form.action="cs_BranchDayToDayWiseBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="cs_BranchDayToDayWiseBack.jsp?msg=1";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function datedatewise4()
 {
 document.form.action="cs_BranchDayToDayWiseBack.jsp";
 document.form.method="post";
 document.form.submit();
 }
 function datedatewise4excel()
 {
 document.form.action="cs_BranchDayToDayWiseBackExcel.jsp";
 document.form.method="post";
 document.form.submit();
 }

 function validate4()
 {	/* var p1=document.form.branch4;  */var y1=document.form.date4;var y2=document.form.date44;
  /* if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
   */if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select From Date!"); y1.focus(); return false; }
  if ((y2.value==null)||(y2.value=="NULL"))
				{ alert("Select  To Date!"); y2.focus(); return false; }
    else
	return true;
 }
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"   >
<div id="wrapper">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
    
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">COMPLAINT LOG REPORT</font></strong></td>
</tr>
 
  <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>

<br />




<form name="form" method="post" action="cs_BranchDayToDayWiseBack.jsp">
<%-- %>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
	 
	 
<%
String tot_val = null;
Connection cn9 = null,cn11=null,cn12=null,cn13=null;
Statement st9 = null,st11=null,st12=null,st13=null; 
ResultSet rs9 = null,rs11=null,rs12=null,rs13=null;
cn9 = con.getConnection2();
st9=cn9.createStatement();
cn11 = con.getConnection2();
st11=cn11.createStatement();
cn12 = con.getConnection2();
st12=cn12.createStatement();
cn13 = con.getConnection2();
st13=cn13.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
rs9 = st9.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");
Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();
rs10 = st10.executeQuery("Select DISTINCT cm_date FROM complain_master_item");

rs11 = st11.executeQuery("SELECT DISTINCT p_type FROM prob_master ORDER BY p_type");

rs12 = st12.executeQuery("Select DISTINCT emp from complain_master_item WHERE emp not in ('-1') and emp not in ('null') ORDER BY emp ASC");
%>	 
<table align="center">
<tr>
<th>SELECT  DATE </th>
</tr>
</table>

<br>
<br>	 
	 

		 <table align="center" width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="5">
     <font size ="3" color="white">FROM DATE - TO DATE REPORT</font>
   </td>
  </tr>
   <tr>
<!-- <td colspan="5"><font size="2">SELECT BRANCH NAME AND DATES</font> </td> -->
</tr>
  
    
   <tr>
      <td ><label>From Date:</label><input type="text"    name="date4" style="width: 6em" value="NULL" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
     
     <td><label>To Date:</label><input type="text"    name="date44" style="width: 6em" value="NULL" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
      
	</tr>
	<tr>
	
	<td colspan="5">
	  <label>Select Branch</label>
      <select  name="req1"  id="hiderow">     <option value="">SELECT</option> 
                                                
										        <%while(rs9.next()){ %> 
										          <option ><%=rs9.getString(1)%> </option>
										        <%} %> 
										        </select>
      </td>
	</tr>
	
	<tr>
	<td colspan="5">
	<label>Select Type Of Problem</label>
      <select  name="req2"  id="hiderow">     <option value="">SELECT</option> 
										        <%while(rs11.next()){ %> 
										 
										        <option ><%=rs11.getString(1)%></option>
										         <%-- <option ><%=rs9.getString(1)+" - "+rs9.getString(2)%></option> --%>
										      
										        <%} %> 
										        </select>
      </td>
	</tr>
	
		<tr>
	<td colspan="5">
	<label>Select IT Support</label>
      <select  name="req3"  id="hiderow">     <option value="">SELECT</option> 
										        <%while(rs12.next()){ %> 
										 
										        <option ><%=rs12.getString(1)%></option>
										         <%-- <option ><%=rs9.getString(1)+" - "+rs9.getString(2)%></option> --%>
										      
										        <%} %> 
										        </select>
      </td>
	</tr>
		<tr>
	<td colspan="5">
	<label>Select Status</label>
      <select  name="complaintStatus"  id="hiderow">     
      <option value="">SELECT</option> 
	   <option value="Resolved">Resolved</option>
	   <option value="Pending">Pending</option>
		</select>
      </td>
	</tr>
	
	<tr>
	<td colspan="5">
	<label>Hardware/Software</label>
      <select  name="hw_sw"  id="hw_sw">     
      <option value="">SELECT</option> 
	  
	   <option value="SOFTWARE">SOFTWARE</option>
	    <option value="HARDWARE">HARDWARE</option>
	    <option value="HARDWARE/SOFTWARE">HARDWARE/SOFTWARE</option>
		</select>
      </td>
	</tr>
	
	 
	<tr>
	<!-- <td align="center">
	
	<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
	<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
	 -->
	 <td align=center >
		<!-- <INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return (validate4() && datedatewise4());"> -->
		<div id="formsubmitbutton"> <INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return (validate4() && datedatewise4() && ButtonClicked());"></div>
     					   <div id="buttonreplacement" style="margin-left:30px; display:none;"><img src="http://www.willmaster.com/images/preload.gif" alt="loading..." /></div>
		
		</td>
		<td>
		
		
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validate4() && datedatewise4excel());">
</td>
	</tr>
</table>
	<!-- <table width="280" align="center" border="0" cellpadding="3" cellspacing="1" >
	<tr align="center">
	 <td align=center>
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button1 onclick="return OnButton1();">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button2 onclick="return link1()">
</td>
	</tr>
	
	</table> -->
	
	

	
	
	
	</form>

	
	<br>
<br>
<br>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../adminbom.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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