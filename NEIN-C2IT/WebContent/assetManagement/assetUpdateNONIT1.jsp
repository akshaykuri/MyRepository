<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%-- <%@page import="CON2.DbUtil"%> --%>
 <%@ page import="java.sql.*" %>
 <%@ include file="banner.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/Calender1CSS.css" title="style" />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<title>Search Asset</title>
<script  type="text/javascript">

<% 
	System.out.println("----- NONIT Asset Update 1 ");
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","   ");
   
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
           msg=null;
		}
</script>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
     {
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
    }
</script>     
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-body {
            padding: 2px 16px;
            background-color: #D3D3D3;
            }

.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}
.modal-header {
    padding: 2px 16px;
    background-color: #D3D3D3;
    color: black;
             }
</style>

<script type="text/javascript"> // script for sysdate // body onloade(), clear of field
function cleartext() 
    {
	document.getElementById("idaNo").value= null;
   
	}
</script>

<script type="text/javascript"> // script for Search button onclic func
function validate()
         {
	     var ano = document.getElementById("idaNo").value;
	     
		 if(ano==""  )
	     {
    	 alert("Please Enter Asset No....!");
    	 return false;
	     }
		 
	  }
</script>
 </head>
 
 
 
<body onload="cleartext()">
<!-- <form action="searchAssetDisp.jsp" method="post" name="form" id="form" > -->
<form method="post" name="form" id="form" action="assetUpdatNONIT2.jsp">
<BR><BR>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
        <td width="115" align="right"><img src="../images/cs-soft.jpg" height="30" width="100" > </td>
    </tr>
 <tr align="center">
    <td bgcolor="#ec691f" colspan="2"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
</font></strong></td></tr>
<tr align="center">
<td bgcolor="#2f4377" colspan="2"><strong><font size ="4" color="white">ASSET MANAGEMENT</font></strong></td></tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>UPDATE ASSET FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
<table width="75%" border="1" style="height: 100; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
 <table width="75%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	    <table width="75%" border="0" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	     <tr>
	        <td><font size="2" face="Swiss" id="hiderow"><font color="red">*</font>Asset&nbsp; No.:</font></td>
	        <td><input type="text" name="aNo" maxlength="99" id="idaNo" value="" size=20 /></td>
	    </tr>
	    </table>
     <table width="75%" border="1" align="center" bgcolor="lightgrey">
               	<td style="size: 1">
	            <center>
			    <input style="font-size:1" type="submit" value="SEARCH" id="save1" onclick="validate()"/>
		        <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" />
		        </center>
		        </td>
          </table>
          <br>    
</table>
</center>
</div>
</div>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>                              
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
    <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    </tr>
</table> 
</form>
</body>
</html>