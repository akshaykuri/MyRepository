
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
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<script type="text/javascript">
</script>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__","  ");
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
<%
Object city_no=null;
String city= null;
city_no = session.getAttribute("b_no");
city = (String) session.getAttribute("city");
System.out.println("System Check Sheet Branch Number :"+city_no);
%>
</head>

<body background =".gif" >

<body bgcolor="" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" >

<form>
<!--<div id="blink">
<p> <img src="images/nip.gif" height="20" width="20">

<label><font size="5" ><b>PO-SOFT</b></font></label>

</p></div>
<div id="blink">
<p> <img src="images/nippon.gif" height="40" width="230">
</p></div>
-->
<div id="id">
 <table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>

</table>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	CHECK SHEET(CS-SOFT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white"><%=city %></font></strong></td>
</tr>
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


Welcome : <%= session.getAttribute( "Nname" ) %>

<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(20*60);

if(session==null||session.getAttribute( "Nname" )==null)
{
	//response.sendRedirect("loginho.jsp?msg=1");
	
	String msg2=null;
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("loginho.jsp?msg="+msg2);
}
%>
<br>
<div class="sidebarmenu">
<ul id="sidebarmenu1">
 
   <!-- <li><a href="UserCheckList.jsp?msg=1">CHECK LIST</a> -->
   <li><a href="CheckListAdmin.jsp?msg=1">CHECK LIST</a>
  <ul>

  <li><a href="CheckListAdmin.jsp?msg=1">CREATE CHECK LIST</a></li>
  <li><a href="CheckSheetSelectionAdminBranch.jsp?msg=1">VIEW CHECK LIST</a></li>
   
  <!-- 
    <li><a href="cs_BranchDayWise.jsp?msg=1">VIEW CHECK LIST</a></li>
  <li><a href="PaymentCL_HO.jsp?msg=1">SEND CHECK LIST</a></li> -->
 
  </ul>
  </li>
  

 <li><a href="UserCheckList.jsp?msg=1">IMS REPORT</a>
  <ul>
  <li><a href="ims_Branch_BackAdmin.jsp?msg=1">CREATE IMS</a></li>
<!--   <li><a href="ims_Branch_BackPractice.jsp?msg=1">CREATE IMS PRACTICCE </a></li> -->
  <li><a href="imsSelectionBranchAdmin.jsp?msg=1">VIEW IMS</a></li>
<!--   <li><a href="PaymentCL_HO.jsp?msg=1">SEND CHECK LIST</a></li> -->
 
  </ul>
  </li>
  <li><a href="complainDateWiseAdmin.jsp?msg=1">COMPLAINTS</a></li>

</ul>
 <!--  <a href="change_pwdHO.jsp?msg=1" onclick="return popitup2('change_pwdHO.jsp?msg=1')" id="hiderow"><font size=2>Change Password</font></a> -->
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
<a href="adminbom.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
</td> 
</tr> 
</table> 






<div id="layer05_holder">


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 


 
</div>
 </div> <!--end wrapper-->
</form>
</body>
</html>