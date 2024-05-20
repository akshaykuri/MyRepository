<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../banner.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script language="javascript"   type="text/javascript" src="jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico">


<title>Insert title here</title>
<script  type="text/javascript">
    <% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
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
    width: 80%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
.modal-body 
    {
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
 <style>
.dynatable {
	border: solid 1px #000; 
    border-collapse: collapse;
	}
.dynatable td {
	border: solid 1px #000; 
	padding: 2px 10px;
	width: 100px;
	text-align: center;
	}
.dynatable .prototype {
	display:none;
	}
</style>
</head>


<script>

function validatefield()
    {
	var  p;
	var formNo=document.getElementById("formNo").value;
	//alert("allopt1 :"+allopt1.checked);
	if(formNo=="")
		{
		alert("Please enter Form No...");
		return false;
		}
	return true;
   }
</script>  
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 
function callFunForPrint()
   {
	//alert("heeeeee");
	var formNo=document.getElementById("formNo").value;
	document.form.action="ITclearanceLocalAllAdmin.jsp";
	document.form.method="post";
	document.form.submit();
   }
function callforUpdate()
    {
	//alert("heeeeee1111");
	var formNo=document.getElementById("formNo").value;
	document.form.action="ITclearanceupdateView.jsp";
	document.form.method="post";
	document.form.submit();  
    }
   
function callFunForDownload()
   {
	//alert("heeeeee");
	//var formNo=document.getElementById("formNo").value;
	document.form.action="../OSDReportGen";
	document.form.method="post";
	document.form.target="POPUPW";
	document.form.onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');";
	document.form.submit();
	
	
   }


</script>


</head>
<body>
<form   name="form" method="post"   >
<input type="hidden" id="idflag" name="idflag" value="0"/>
<br><br>
 <table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/logo.png" height="35" width="220"> </td>
        
    </tr>
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">OSD FORM REPORT</font></strong></td>
</tr>
 
<tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br><br> <br> <br> 
 <div class="modal-content">

    <div class="modal-body">
<br><br> 
<center>
<table class="dynatable" width="75%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
        <tr>
          <center><td colspan="9"><font size="3" face="Swiss" id="hiderow">ENTER FORM NO</font></td></center> 
        </tr>
         <tr>
             <td><font size="2" face="Swiss" id="hiderow">Form No :<font color=red>*</font></font></td>
             <td><input type="text" name="formNo" maxlength="99" id="formNo"  value="" size=30 /></td>
         </tr>
	 
   </table>
</center>
	                          	 <br>
	                          	 <center>
	                          	
			                     <!--   <input style="font-size:1" type="button" value="UPDATE VIEW" onclick="return ( validatefield() && callforUpdate());" />
			                       <input style="font-size:1" type="button" value="SEND  VIEW" onclick="return ( validatefield() &&callFunForPrint());" /> -->
			                       <input style="font-size:1" type="button" value="DOWNLOAD REPORT" onclick="return ( validatefield() &&callFunForDownload());" />
	                               
		                          <input type="button" onclick="history.go(-1)" value="CANCLE" />
		                             </center>
		                             <br>

    </div>
</div>
<br><br> <br> <br> <br> 
 <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../adminbom.jsp?msg=1"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 
<td width="115" align="right"> 
<a href="../adminbom.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table>       
                
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>

<div id="resultFromAjax2" style="display:none;">
        
</div>

</body>
</html>