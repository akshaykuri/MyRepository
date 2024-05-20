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

<body background =".jpg" >

<head><title>BRANCH WISE REPORT</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
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
   			  document.form.action="cs_imsGroupWiseBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="cs_imsGroupWiseBack.jsp?msg=1";
   			 document.form.method="post";
   			 document.form.submit();
   			     }

</script>
 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }

   function validate()
   {
       
       
       var d2=document.form.aabbc;
       var d3=document.form.aabbc2;
    
   if ((d2.value==null)||(d2.value=="NULL"))
	{
		 alert("Select Month!");
	         d2.focus();
		 return false;
		 }
if (checkAddress(d2.value)==false)
	{
		d2.value="";
       alert("Invalid Month");
		d2.focus();
		 return false;
		 } 
if ((d3.value==null)||(d3.value=="NULL"))
{
	 alert("Select Year!");
        d3.focus();
	 return false;
	 }
if (checkAddress(d3.value)==false)
{
	d3.value="";
    alert("Invalid Year");
	d3.focus();
	 return false;
	 }
else
return true;
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



<form name="form" method="post" action="cs_imsGroupWiseBack.jsp">
<%-- %>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
	 
	 
<%
String tot_val = null;

Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();
rs10 = st10.executeQuery("Select DISTINCT cm_date FROM complain_master_item");

Connection cn11 = null;
Statement st11 = null; 
ResultSet rs11 = null;
cn11 = con.getConnection2();
st11=cn11.createStatement();
rs11 = st11.executeQuery("Select DISTINCT YEAR(cm_date) from complain_master_item  ORDER BY YEAR(cm_date) DESC");
%> 
<table align="center">
<tr>
<th>SELECT BRANCH AND DATE </th>
</tr>
</table>

<br>
<br>	 
	 
	<table align="center" width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="8">
     <font size ="3" color="white"><center>GROUP WISE REPORT</center></font>
   </td>
  </tr>
   <tr>
      
     
<tr><th>MONTH</th>
	<td><select  name="aabbc"> 
              <option value="NULL">SELECT</option> 
										    <option value="01" >JAN</option>
										    <option value="02" >FEB</option>
										    <option value="03" >MAR</option>
										    <option value="04" >APRIL</option>
										    <option value="05" >MAY</option>
										    <option value="06" >JUNE</option>
										    <option value="07" >JULY</option>
										    <option value="08" >AUG</option>
										    <option value="09" >SEPT</option>
										    <option value="10" >OCT</option>
										    <option value="11" >NOV</option>
										    <option value="12" >DEC</option>
		</select>
</td>
  <th>YEAR</th>
<td><select  name="aabbc2"> 
   <option value="NULL">SELECT</option><%while(rs11.next()){ %> 
										 <option ><%=rs11.getString(1)%></option>
										      <%} %> 
	</select>
</td>    
	</tr>


	<tr align="center"><td align=center>&nbsp;</td><td>&nbsp;</td>
	
	<!--<td><input type=submit name="button" value="DISPLAY" id="b2" onkeydown="press()" ;></td>
	-->
	<td align="center">
	</td>
	
	</tr>
      
	</tr>


	
	</table>
	
	<table width="280" align="center" border="0" cellpadding="3" cellspacing="1" >
	<tr align="center">
	 <td align=center>
		<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button1 onclick="return (validate() && OnButton1());">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button2 onclick="return (validate() && link1());">
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