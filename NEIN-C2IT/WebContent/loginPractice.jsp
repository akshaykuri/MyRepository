<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="banner.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login HO</title>
<link rel="stylesheet" href="css/AllForm.css">
</head>
<body>


<script type="text/javascript">

function checkAddress(str){
	var re = /[^[a-z][A-Z][0-9]]\/[(][)][.]/g;
if (re.test(str)) return false;
return true;
}
function validateOtherValues()
{ 
var nn=document.form1.tho;

var pll=document.form1.t2;


if ((nn.value==null)||(nn.value=="")){
alert("Please Enter User Name!");
nn.focus();
return false;
}
if (checkAddress(nn.value)==false){
nn.value="";
alert("Invalid User Name!");
nn.focus();
return false;
}



if ((pll.value==null)||(pll.value=="")){
alert("Please Enter Password !");
pll.focus();
return false;
}
if (checkAddress(pll.value)==false){
pll.value="";
alert("Invalid Password!");
pll.focus();
return false;
}



else
return true;


}
</script>



<body id="bodylen">

<form method="post"  name="form1"   action="logtestho.jsp">

<div id="id">
<table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="#ec691f"><b>CS-SOFT</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">SYSTEM ADMIN LOGIN PAGE</font></strong></td></tr>
</table>




<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="right"> 
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>




 
 <br>
<table width="1118" border="0" cellpadding="0" cellspacing="0" ID="Table1">



<tr>
    <td width="360" align="justify" valign="top"></td>
  <td width="360" align="justify" valign="top"></td>
  <td width="360" align="justify" valign="top"></td>
    <td width="1" align="justify" valign="middle" height=100><img src="images/28.jpg" width="550" height="260" border=""></td>
  <td width="60" align="justify" valign="top"></td>
  
  
  
  <td width="560" align="justify"  valign="top" height="50"></td>
<td width="540" align="center" valign="top" height="50">

 <table width="100%" height=120 border="0" cellpadding="3" cellspacing="1" bgcolor="" height="80">

  <tr>

 <td colspan="3"><strong><u>USER LOGIN</u></strong></td>
 </tr>
 </table>
 <table width="100%" border="0" cellpadding="3" cellspacing="1" height="50" bgcolor="#ec691f">
 <tr>
 <td colspan="3"><strong>User Login </strong></td>
 </tr>
 <tr>
 <td width="78">Username</td>
 <td width="6">:</td>
 <td width="294"><input name="tho" type="text" id="tho"></td>
 </tr>
 <tr>
 <td>Password</td>
 <td>:</td>
 <td><input name="t2" type="password" id="t2"></td>
 </tr>
 <tr>
  <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td> 
 <!-- <input type="image"  src="login3.jpg" height="25" width="80" name="button" id="button" value="Submit" onclick="return saveroles();" onmouseout="this.className='buttons'" onmouseover="this.className='buttons buttonsHover'"/> -->
 <input type="image"  src="login3.jpg" height="25" width="80" name="button" id="button" value="Submit" onclick="return validateOtherValues();" />
<!--  <input type="submit" id="button" value="Submit" onclick="return validateOtherValues();" /> -->
 </td>
 </tr>
 <tr><td bgcolor="#ec691f" colspan="3" align="center"><font size="-2">If you forgot your password, please contact administrator</font></td></tr>

 </table>
			
</tr>

</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
 <td width="1045" align=right class="small_cont_uline">
 <a href="HOME.jsp"><img src="bakk.png" border="0" height="35" width="35" title="BACK"></a><address><font size="2">BACK</font></address>
</td>
</tr>

</table>




<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white">NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 

</div>
 </form>


</body>
</html>