<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
    <%@ include file="../../../banner.jsp" %>
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>BRANCH WISE REPORT</title>
<link rel="stylesheet" type="text/css" href="../../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../../js/Calendar.js"></script>
<%

session.setMaxInactiveInterval(30*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../../adminlink.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}

%>
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
   			  document.form.action="cs_BranchDayToDayWiseBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="homePageMessageBack.jsp?msg=1";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function datedatewise4()
 {
 document.form.action="homePageMessageBack.jsp";
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
 {	var y1=document.form.date4;var y2=document.form.date44;
 
  if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select From Date!"); y1.focus(); return false; }
  if ((y2.value==null)||(y2.value=="NULL"))
				{ alert("Select  To Date!"); y2.focus(); return false; }
    else
	return true;
 }
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<div id="wrapper">
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../../../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../../../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
  <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>NEIN C2IT </b><br />
    
 </font></strong></td></tr>
<tr align="center">
 <td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">HOME PAGE MESSAGES</font></strong></td></tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
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
ResultSet rs9 = null;Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
try{
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
rs9 = st9.executeQuery("SELECT DISTINCT b_name,b_no FROM branch_master ORDER BY b_name");

cn10 = con.getConnection2();
st10=cn10.createStatement();
rs10 = st10.executeQuery("Select DISTINCT cm_date FROM complain_master_item");
%>	 
<table align="center">
<tr>
<th>SELECT DATE </th>
</tr>
</table>

<br>
<br>	 
	 
<%--   <table width="480"  align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#ec691f">
   
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
      
       <td><label>From Date:</label><input type="text"    name="date4" style="width: 6em" value="NULL" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
     
     <td><label>To Date:</label><input type="text"    name="date44" style="width: 6em" value="NULL" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="images/cal.gif" id="idForDay"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
      
      
	</tr>


	
	</table> --%>
		 <table align="center" width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="5">
     <font size ="3" color="white">TO DATE - FROM DATE REPORT</font>
   </td>
  </tr>

    
   <tr>
      <td><label>From Date:</label><input type="text"    name="date4" style="width: 6em" value="NULL" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay"  name="imgForDate2" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar2'))"></td>
     
     <td><label>To Date:</label><input type="text"    name="date44" style="width: 6em" value="NULL" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 <td style="visibility: hidden;"> <img src="../../images/cal.gif" id="idForDay2"  name="imgForDate3" width="" height=""  onclick="showCalendarControl(document.getElementById('idCalendar3'))"></td>
      
	</tr>
	
	<tr>
	<!-- <td align="center">
	
	<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="get_val9();"></td>
	<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button2 onclick="return Validate2()"></td>
	 -->
	 <td align=center colspan="5">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button4 onclick="return ( validate4() && OnButton1());">
		<!-- <INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validate4() && datedatewise4excel());"> -->
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
	

	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs9,st9,cn9);

	DbUtil.closeDBResources(rs10,st10,cn10);

  }
	%>
	
	
	
	</form>

	
	<br>
<br>
<br>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../../HOME.jsp"><img src="../../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../../../adminbom.jsp?msg=1"><img src="../../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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