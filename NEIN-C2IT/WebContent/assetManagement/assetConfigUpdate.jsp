<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.*" %>
 <%@ include file="banner.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssetTrfanfer</title>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
 {	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script> 

<script>
function popitup1(url)
        {
		newwindow=window.open(url,'name','height=300,width=2000,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
	    }
</script>
<script>
function popitup2(url)
        {
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
		if (window.focus) {newwindow.focus()}
		return false;
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
	document.getElementById("idaNo1").value= "";
    }
</script>

<script type="text/javascript">  // script for Search button onclic func
function validatefunc()
         {
	     var ano = document.getElementById("idaNo").value;
	     if(ano=="Select")
	    	 {
	    	 alert("please enter asset no....");
	    	 return false;
	    	 }
	    }
</script>
<script type="text/javascript"> // script for Search button onclic func
function searchfunc1()
         {
		     var ano1 = document.getElementById("idaNo1").value;
	    	//  alert(ano1);
	     	if(ano1=="")
	         {
	          alert("please enter view asset no ....");
	          return false;
	          }
	   	 else
	    	{	
	         var f=document.form;    
		     f.method="post";    
		     f.action='assetConfigUpdateform.jsp?ano='+ano1;    
		     f.submit();
		     } 
         }
</script>
<script  type="text/javascript">

<% 
System.out.println("------------- Asset Config Update -----------------");
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
		}
</script>   
 </head>
<body onload="cleartext()">
<!-- <form action="searchAssetDisp.jsp" method="post" name="form" id="form" > -->
<form method="post" name="form" id="form" >
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
<tr> <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<br>
<div class="modal-content">
<div class="modal-header">
      <center> <h2>ASSET CONFIG UPADATE FORM</h2></center>
    </div>
    <div class="modal-body">
<center>
<br>
	    <table width="75%" border="1" style="height: 150; border: 1px solid black; padding: 5px;" cellpadding="0" bgcolor="lightgrey">
	   	     <tr>
	         <td><font size="2" face="Swiss" id="hiderow">Asset&nbsp; No.  :</font></td>
	        <td><input type="text" name="aNo1" maxlength="30" id="idaNo1" value="" size=20 /></td>
            </tr>
	        <tr>
	        <br>
		     <td colspan=2>
                 <a href="assetAllView.jsp" onclick="return popitup2('assetAllView.jsp')">ViewAllAsset</a> 		      
		        <input style="font-size:1" type="submit" value="VIEW" name="save2" id="save2" onclick="return searchfunc1()"/>
		       <input type="button" name="clearBtn" onclick="cleartext()" value="CLEAR" /></td>
		     </tr>
	    </table>
	    
       
          <br>    

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