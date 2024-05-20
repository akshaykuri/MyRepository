<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="banner.jsp" %>
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BACKUP TYPE MASTER</title>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script type="text/javascript" src="js/layout.js"></script>
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validate()
    {
	var i1=document.form.sname;
	//var i=document.getElementById("idName").value;
	//alert("Herer :"+i1.value);
	if( i1.value==null || i1.value=="")
		{
		alert("Please enter backup type name ....!");
		i1.focus();
		return false;
		}
	else
		{
		return true;
		}
    }
</script>

</head>

<body background =".jpg" >
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
		<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
   disp = disp.replace("%20", "");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>

 
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("adminlink.jsp?msg=1");
}
%>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper"><div id="id">
<table>
   <tr>
      <td> <img src="../images/nippon.gif" height="35" width="220"> </td>
      <td align="right"><img src="../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
   </tr>   
</table> 

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>BACKUP TYPE MASTER</b><br />
      </font></strong></td>
  </tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CONNECT TO IT (C2IT)</font></strong></td>
 </tr>
</table>


 
  <form name="form" method="post"  action="backupTypeMasterBack.jsp">

 <div id='right_table'>

<!-- backup_name,backup_detail -->
	<br>
	<br>
<table width="920" height="3" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="25%" align="justify" valign="top"></td>
    <td width="21%" align="justify" valign="top">
      <p> <img src="../images/soft1.jpg" height="200" width="400">
</td>
<td width="5%" align="justify" valign="top"></td>
<td width="5%" align="justify" valign="top"></td>
<td width="79%"><table width="100%" border="2" > 
<tr>
      <td align=center width=60% colspan=2  background=".jpg">
      <font color=darkblue size=3 > CREATE BACKUP TYPE MASTER</font>
     </td>
</tr>
<tr>
   <td><font size="2">NAME:</font><font color=red>*</font></td>
   <td><input type="text" size="20" name="sname" id="idName" value=""></td>
</tr>
</table>
<table width="100%" align=center border=2 background=".jpg"  bordercolor=#aaaccc>
<tr>
	<td><a href="DisplayProb.jsp" onclick="return popitup('backupTypeDisp.jsp')">View All</a> </td>
	<td><input type=submit name="button" value="SAVE" id="button" onclick="return validate();"></td>
	<td><input type="reset" value="RESET"/></td>
</tr>
</table></td>
	
		
	
</tr>

</table>
	                 </div>
	                 
	</form>
	
	



<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
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