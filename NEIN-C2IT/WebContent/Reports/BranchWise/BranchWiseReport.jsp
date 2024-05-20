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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<link rel="shortcut icon" type="../../image/x-icon" href="../../images/favicon.ico">
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<body background =".jpg" >

<head><title>COMPANY WISE REPORT</title>
</head>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<script type="text/javascript">
function yearWise1()
{
	
document.form.action="cs_BranchYearWiseBack.jsp?msg=1";
//document.form.action="b_yearWiseRoughForExcel.jsp";
document.form.method="post";
document.form.submit();
}
function yearWise1excel()
{
document.form.action="cs_BranchYearWiseBackExcel.jsp?msg=1";
//document.form.action="b_yearWiseExcelRough.jsp";
document.form.method="post";
document.form.submit();
} 
function monthWise2()
{
document.form.action="cs_BranchMonthWiseBack.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function monthWise2excel()
{
document.form.action="cs_BranchMonthWiseBackExcel.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function datewise3()
{
document.form.action="cs_BranchDayWiseBack.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function datewise3excel()
{
document.form.action="cs_BranchDayWiseBackExcel.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function datedatewise4()
{
document.form.action="cs_BranchDayToDayWiseBack.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function datedatewise4excel()
{
document.form.action="cs_BranchDayToDayWiseBackExcel.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
</script>
 <script language="javascript" type="text/javascript">

 function validate1()
 {  var p1=document.form.branch1; var y1=document.form.year1;
  if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
  if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select  Year!"); y1.focus();return false; }
	else
	return true;
 }
 function validate2()
 {	var p1=document.form.branch2; var y1=document.form.month2;
  if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
  if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select  Month!"); y1.focus(); return false; }
    else
	return true;
 }
 function validate3()
 {	var p1=document.form.branch3; var y1=document.form.date3;
  if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
  if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select Date!"); y1.focus(); return false; }
    else
	return true;
 }
 function validate4()
 {	var p1=document.form.branch4; var y1=document.form.date4;var y2=document.form.date44;
  if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
  if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select From Date!"); y1.focus(); return false; }
  if ((y2.value==null)||(y2.value=="NULL"))
				{ alert("Select  To Date!"); y2.focus(); return false; }
    else
	return true;
 }
</script>
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("adminlink.jsp?msg="+msg2);
	//response.sendRedirect("adminlink.jsp?msg=1");
}


//String b_no2=null;

//b_no2 = (String)session.getAttribute("b_no");

//System.out.println("Sesion converting :"+b_no2);

%>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">

<div id="wrapper">
<table>
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>Sales LogiX</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">BRANCH WISE REPORTS</font></strong></td></tr>
</table>

<br />
<br />

<%
String b_no=null;
b_no = (String) session.getAttribute("branch_no");
System.out.println("Branch Number :"+b_no);
%>


<form name="form" method="post" onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');">
 
	 
<%

String tot_val = null;
Connection cn9 = null,cn99=null,cn2=null,cn3=null,cn4=null;
Statement st9 = null,st99=null,st2=null,st3=null,st4=null; 
ResultSet rs9 = null,rs99=null,rs2=null,rs3=null,rs4=null;
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master WHERE b_no='"+b_no+"' ORDER BY b_name");
rs9 = st9.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");
cn99 = con.getConnection2();
st99=cn99.createStatement();
rs99 = st99.executeQuery("Select DISTINCT YEAR(cm_date) from complain_master_item WHERE cm_date IS NOT NULL ORDER BY YEAR(cm_date) DESC");

%>	 

<table id="albums" border="0" cellpadding="0" cellspacing="0"><tr>
<td width="15%" align="center">
	 
 <table  width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="2">
     <font size ="3" color="white">YEAR WISE REPORT</font>
   </td>
  </tr>
   <tr>
<td colspan="2"><font size="2">SELECT BRANCH NAME AND YEAR</font> </td>
</tr>
  
    
   <tr><!--<th>BRANCH:</th>
	--><td>
	  <label>Name:</label>
      <select  name="branch1"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs9.next()){ %> 
										        
										        <%-- <option><%=rs9.getString("customer")%> </option> --%>
										        <option ><%=rs9.getString(1)+" - "+rs9.getString(2)%> </option>
										        <%} %> 
										        </select>
      </td>
      <td>
	  <label>Year:</label>
      <select  name="year1"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs99.next()){ %> 
										       
										        <option><%=rs99.getString(1)%> </option>
										        <%} %> 
										        </select>
      </td>
     
      
	</tr>
	
	<tr>
<td align=center colspan="2">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button1 onclick="return (validate1() && yearWise1());">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button11 onclick="return (validate1() && yearWise1excel());">
</td>
	</tr>
	<%
	cn2 = con.getConnection2();
	st2=cn2.createStatement();
	rs2 = st2.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");
   %>
</table>
</td>
<td width="15%">
 <table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="2">
     <font size ="3" color="white" >MONTH WISE REPORT</font>
   </td>
  </tr>
   <tr>
<td colspan="2"><font size="2">SELECT BRANCH NAME AND MONTH</font> </td>
</tr>
  
    
   <tr><td>
	  <label>Name:</label>
      <select  name="branch2"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs2.next()){ %> 
										          <option ><%=rs2.getString(1)+" - "+rs2.getString(2)%> </option>
										        <%} %> 
										        </select>
      </td>
      
     <td>
	  <label>Month:</label>
      <select  name="month2"  id="hiderow">      <option value="NULL">SELECT</option> 
										    <option value="1" >JAN</option>
										    <option value="2" >FEB</option>
										    <option value="3" >MAR</option>
										    <option value="4" >APRIL</option>
										    <option value="5" >MAY</option>
										    <option value="6" >JUNE</option>
										    <option value="7" >JULY</option>
										    <option value="8" >AUG</option>
										    <option value="9" >SEPT</option>
										    <option value="10" >OCT</option>
										    <option value="11" >NOV</option>
										    <option value="12" >DEC</option>
										        </select>
      </td>
      
	</tr>
	
	<tr>
	
	 <td align=center colspan="2">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button2 onclick="return ( validate2() && monthWise2());">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button22 onclick="return ( validate2() && monthWise2excel());">
</td>
	</tr>
</table>



	</td>
	</tr>
<tr>
<td height="20"></td>
</tr>
	<tr >
	<td width="10%" align="center">
	
		<%
	cn3 = con.getConnection2();
	st3=cn3.createStatement();
	rs3 = st3.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");
	
	%>
	 <table  width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="3">
     <font size ="3" color="white" >DATE WISE REPORT</font>
   </td>
  </tr>
   <tr>
<td colspan="2"><font size="2">SELECT BRANCH NAME AND DATE</font> </td>
</tr>
  
    
   <tr><td>
	  <label>Name:</label>
      <select  name="branch3"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs3.next()){ %> 
										        <option ><%=rs3.getString(1)+" - "+rs3.getString(2)%> </option>
										        <%} %> 
										        </select>
      </td>
      
     <td><label>Date:</label><input type="text"    name="date3" style="width: 6em" value="NULL" id="idCalendar" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar'))">					        
	</td>
      
	</tr>
	
	<tr>
	<td align=center colspan="3">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button3 onclick="return ( validate3() && datewise3());">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button33 onclick="return ( validate3() && datewise3excel());">
</td>
	</tr>
</table>
	
	
	</td>
		<%
	cn4 = con.getConnection2();
	st4=cn4.createStatement();
	rs4 = st4.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");
	
	%>
	<td width="5%">
	 <table  width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="5">
     <font size ="3" color="white">TO DATE - FROM DATE REPORT</font>
   </td>
  </tr>
   <tr>
<td colspan="5"><font size="2">SELECT BRANCH NAME AND DATES</font> </td>
</tr>
  
    
   <tr><td>
	  <label>Select</label>
      <select  name="branch4"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs4.next()){ %> 
										          <option ><%=rs4.getString(1)+" - "+rs4.getString(2)%> </option>
										        <%} %> 
										        </select>
      </td>
      <td><label>From Date:</label><input type="text"    name="date4" style="width: 6em" value="NULL" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
     
     <td><label>To Date:</label><input type="text"    name="date44" style="width: 6em" value="NULL" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
      
	</tr>
	
	<tr>
	<!-- <td align="center">
	
	<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
	<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
	 -->
	 <td align=center colspan="5">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( validate4() && datedatewise4());">
		
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validate4() && datedatewise4excel());">
</td>
	</tr>
</table>
	
	</td>
	</tr>
	</table>
	
	
	</form>

	
	<br>
<br>
<br>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../../OperationPage.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 
</div>


</div>

</body>
</html>