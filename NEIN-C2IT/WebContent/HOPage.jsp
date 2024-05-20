
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="banner.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%-- <img src="person.jpg" align="left" width=79 height=42 vspace=8 hspace=120 style="width: 150px; float: right;">
<img src="person.jpg" align="left" width=79 height=42 vspace=8 hspace=120 >
<img src="person.jpg" style="width: 150px; float: left;"> --%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="stylelog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
<style type="text/css">

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 250px; /* Main Menu Item widths */
border-bottom: 1px solid #ccc;
}
 
.sidebarmenu ul li{
position: relative;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
background-color: #012D58; /*background of tabs (default state)*/
}

.sidebarmenu ul li a:visited{
color: white;
}

.sidebarmenu ul li a:hover{
background-color: #ec691f;
}

/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 170px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}

.sidebarmenu a.subfolderstyle{
background: url(right.gif) no-repeat 97% 50%;
}

 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
<script type="text/javascript">

//Nested Side Bar Menu (Mar 20th, 09)
//By Dynamic Drive: http://www.dynamicdrive.com/style/

var menuids=["sidebarmenu1"] //Enter id(s) of each Side Bar Menu's main UL, separated by commas

function initsidebarmenu(){
for (var i=0; i<menuids.length; i++){
  var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul")
    for (var t=0; t<ultags.length; t++){
    ultags[t].parentNode.getElementsByTagName("a")[0].className+=" subfolderstyle"
  if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
   ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px" //dynamically position first level submenus to be width of main menu item
  else //else if this is a sub level submenu (ul)
    ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px" //position menu to the right of menu item that activated it
    ultags[t].parentNode.onmouseover=function(){
    this.getElementsByTagName("ul")[0].style.display="block"
    }
    ultags[t].parentNode.onmouseout=function(){
    this.getElementsByTagName("ul")[0].style.display="none"
    }
    }
  for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
  ultags[t].style.visibility="visible"
  ultags[t].style.display="none"
  }
  }
}

if (window.addEventListener)
window.addEventListener("load", initsidebarmenu, false)
else if (window.attachEvent)
window.attachEvent("onload", initsidebarmenu)

</script>
<script type="text/javascript" language="javascript">
 window.onload=blinkOn;
 
function blinkOn()
{
  document.getElementById("blink").style.color="#ec691f"
  setTimeout("blinkOff()",1000)
}
 
function blinkOff()
{
  document.getElementById("blink").style.color="#2f4377"
  setTimeout("blinkOn()",1000)
}
 
function popitup2(url) {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
 
</script>



<title>Welcome to HO</title>

</head>

<body background =".gif" >

<!-- <body bgcolor="" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
 -->
 <body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<form>
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
    <td bgcolor="#ec691f"><strong><font size ="4" color="#ec691f"><b>.</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET (CS-SOFT)</font></strong></td></tr>
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<%-- <td width="1118" align="left"><font color="blue"> 
<%= session.getAttribute( "NpostingCo" ) %>-BRANCH</font>
</td> --%>
<td width="1118" align="right"> 
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>



<table width="1000" height="310" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="360" align="justify" valign="top"></td>
    <td width="360" align="justify" valign="top"></td>
  <td width="60" align="justify" valign="top"></td>
    <td width="760" align="justify" valign="top">

<%--
String username = (String)session.getAttribute("USER");
if(username==null) { // session expired
// FORWARD WITH ANY WAY YOU WANT

// I don't know about this one. I usually use the forward tag
RequestDispatcher rd = context.getRequestDispatcher("/demo/inner.jsp");
rd.forward(request,response);
} 

--%>

 <%--
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = logout.jsp");
--%> 

<%--
session.setMaxInactiveInterval(1);
--%>

<!------------------------------------------------------------------------- >
 The session timeout is: <%--=session.getMaxInactiveInterval()%>  
<%  
session.setMaxInactiveInterval(3);  
%>  
<p>  
The session timeout has been set to: <%=session.getMaxInactiveInterval()--%> 
<!-------------------------------------------------------------------------->


<!--<font style="text-decoration: blink;">-->

Welcome : <%= session.getAttribute( "Nname" ) %>

<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	response.sendRedirect("loginho.jsp?msg=1");
}
%>
<br>
<div class="sidebarmenu">
<ul id="sidebarmenu1">


 <li><a href="CheckList_PageOne_HO.jsp?msg=1">CHECK LIST</a>
  <ul>
  <li><a href="CheckList_PageOne_HO.jsp?msg=1">CREATE CHECK LIST</a></li>
  <li><a href="CheckSheetSelection.jsp?msg=1">VIEW CHECK LIST</a></li>
  <!-- 
    <li><a href="cs_BranchDayWise.jsp?msg=1">VIEW CHECK LIST</a></li>
  <li><a href="PaymentCL_HO.jsp?msg=1">SEND CHECK LIST</a></li> -->
 
  </ul>
  </li>
 <li><a href="HOPage.jsp?msg=1">IMS REPORT</a>
  <ul>
  <li><a href="ims_HO_Back.jsp?msg=1">CREATE IMS</a></li>
  <li><a href="imsSelection.jsp?msg=1">VIEW IMS</a></li>
<!--   <li><a href="PaymentCL_HO.jsp?msg=1">SEND CHECK LIST</a></li> -->
 
  </ul>
  </li>
  <li><a href="complainPageStatus.jsp?msg=1">COMPLAINTS</a></li>
<!--  
  <li><a href="HOPage.jsp?msg=1">REPORTS</a>
  <ul>

  <li><a href="PCL_PDF_HO.jsp?msg=1">PRINT PAYMENT COVERING LETTER</a></li> 
  </ul>
  </li> -->
</ul>
  <a href="change_pwdHO.jsp?msg=1" onclick="return popitup2('change_pwdHO.jsp?msg=1')" id="hiderow"><font size=2>Change Password</font></a>
</div>







</td>

<%-- <table width="100%" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr> --%>
	
		
		<td width="350" height="258" align="justify" valign="middle">
		<img vspace="15" src="images/check.jpg" width="530" height="200" border="">
		
	<!--<center><strong><a href="adminlink.jsp?msg = 1"><font size=2>ADMINISTRATOR CLICK HERE</font></a></strong>
	</center>
	
	
	--></td>
		
		
		
		
		
		
</tr>
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="loginho.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
</td> 
</tr> 
</table> 






<div id="layer05_holder">


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 


 
</div>
 </div> <!--end wrapper-->
</form>
</body>
</html>