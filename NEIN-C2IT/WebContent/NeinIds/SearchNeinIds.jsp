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
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />

<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script language="javascript" type="text/javascript">
	function Validation()
	{ 		 
		 var idtype = document.forms["form1"]["idtype"].value;
		 var month = document.forms["form1"]["month"].value;  
		  
		if(idtype == 'Select'){	
			 alert("Select Type Of NEIN Id");
           return false;     
		    } 
		
	    if(month == ''){		
            alert("select month");
            return false;
         }   
		return true;
	}
	  
</script>	
<title>Search page</title>

<script>
$(document).ready(function () { 
$("#month").datepicker({
	   /*  dateFormat: 'MM yy', */
	    dateFormat : 'yy-mm-dd',
	    changeMonth: true,
	    changeYear: true,
	    showButtonPanel: true,
	    minDate: -90,
	    onClose: function(dateText, inst) {
	        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	        $(this).val($.datepicker.formatDate('yy-mm-dd', new Date(year, month, 1)));
	    }
	});

	$("#month").focus(function () {
	    $(".ui-datepicker-calendar").hide();
	    $("#ui-datepicker-div").position({
	        my: "center top",
	        at: "center bottom",
	        of: $(this)
	    });
	});
});
</script>
 
</head>

<body background="../images/u.jpg">
<form method="post" name="form1" action="ViewNeinIdsForEdit.jsp">

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center">
         <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
         <!-- <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td> -->
     </tr> 
   <tr align="center">
          <td class="greenLine"><strong><font size ="4" color="white" ><b> WELCOME </b></font></strong></td>
   </tr>
   <tr align="center">
    <td class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
   </tr>
   <tr> 
      <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp;<font size ="2">DESG :<%=session.getAttribute("desg")%> </font>
  </td>
 </tr>
   </table>
<br>
<div align="center"> 
          <span style="color:red;">*</span>Select Nein Id Type: 
           <select name="idtype" id="idtype">
               <option value="Select">Select</option>
               <option value="LOTUS">LOTUS ID's</option>
               <option value="NEWINS">NEWINS ID's</option>
               <option value="SAP/NExAS">SAP/NExAS ID's</option>
               <option value="GSNET">GSNET ID's</option>
               <option value="NEXGLOW">NEXGLOW ID's</option>
               <option value="Office365">OFFICE 365 ID’s</option>
           </select>  <br><br>
           <span style="color:red;">*</span>Select Month: &nbsp;  
            <input type="text" name="month" id="month" size="20" readonly>
        <input type="hidden" name="msg" id="msg" value="1">
        <br><br> <input type="submit" value="Submit" onclick="return (Validation());"></div><br><br> <br><br>
   
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
<tr align="center"> <td class="greenLine" >&nbsp;</td></tr>
<tr align="center"><td class="blueLine" >&nbsp;</td></tr>
  </table>
</form>
</body>
</html>