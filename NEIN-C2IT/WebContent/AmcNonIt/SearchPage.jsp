<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="CON2.DbUtil"%>

<%@page language="java"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../banner.jsp" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<title>Search page</title>

<script type="text/javascript">
$(document).ready(function() {
	           
	      $("#fromdate").datepicker({dateFormat: 'yy-mm-dd'});	
	      $("#todate").datepicker({dateFormat: 'yy-mm-dd'});
       }); 
	
</script>
<script language="javascript" type="text/javascript">
	function Validation()
	{ 		
		 //alert("hiiiiiiiiiii");
		 var fromdate = document.getElementById("#fromdate").value; 
		 var todate = document.getElementById("#todate").value;
	  
		
	  if(fromdate ==''){		
            alert("select fromdate");
            return false;
       }  
	  if(todate ==''){		
          alert("select todate");
          return false;
     }  
	 
		return true;
	}
	
</script>
</head>

<body background="../images/u.jpg">
<form method="post" name="form1" action="ViewPage.jsp?result=0">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
         <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
     
    </tr>
 
         <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">AMC NON IT</font></strong></td>
</tr>
        
         <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
   </table>
<br><br>
 <div align="center"> 
          Asset Number:
            <input type="text" name="assetno" id="assetno" >&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
          PO Number:
           <input type="text" name="pono" id="pono">
        <br><br> From Date:<input type="text" name="fromdate" id="fromdate" required>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        To Date:<input type="text" name="todate" id="todate" required>
        <input type="hidden" name="msg" id="msg" value="1">
        <br><br> <input type="submit" value="Submit" ></div><br><br> <br><br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
	<tr> 
	<td width="1000" align="left"> 
	<a href="../HOME.jsp?msg=1"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
	</td> 
	<td width="115" align="right"> 
	<a href="../OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
	</td> 
	</tr> 
</table>  
  <br>
  <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
  </table>
</form>
</body>
</html>