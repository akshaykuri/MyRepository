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
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>BRANCH WISE REPORT</title>
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
</head>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
<script type="text/javascript">

 function link1() {
   			 //document.form.action="PoBranchDayExcel";
   			  document.form.action="cs_BranchMonthWiseBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="cs_BranchMonthWiseBack.jsp?msg=1";
   			 document.form.method="post";
   			 document.form.submit();
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
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<div id="wrapper">
 <table >
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>WORK LOG </b><br />
    
 </font></strong></td></tr>
<tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">BRANCH WISE REPORT</font></strong></td></tr>
</table>

<br />
<br />



<form name="form" method="post" onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');">
<%-- %>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
	 
	 
<%
String tot_val = null;
Connection cn9 = null;
Statement st9 = null; 
ResultSet rs9 = null;
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
rs9 = st9.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");
Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();
rs10 = st10.executeQuery("Select DISTINCT cm_date FROM complain_master_item");
%>	 
<table align="center">
<tr>
<th>SELECT BRANCH AND DATE </th>
</tr>
</table>

<br>
<br>	 
	 
<%--   <table width="380" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#ec691f">
   
 <!--   <tr>
    <td colspan="3"><strong>SELECT BRANCH AND DAY</strong></td></tr> -->
    
   <tr><th>BRANCH:</th>
	<td>
      <select  name="aabbcc"  id="hiderow">     <option value="NULL">SELECT</option> 
										        <%while(rs9.next()){ %> 
										 
										           <option ><%=rs9.getString(1)+" - "+rs9.getString(2)%> </option>
										         <option ><%=rs9.getString(1)+" - "+rs9.getString(2)%></option>
										      
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


	
	</table> --%>
	 <table align="center" width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
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
                                                
										        <%while(rs9.next()){ %> 
										         <option ><%=rs9.getString(1)%> </option>
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
<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 
</div>




</body>
</html>