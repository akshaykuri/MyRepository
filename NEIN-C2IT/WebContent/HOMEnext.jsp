
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.Calendar" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%-- <img src="person.jpg" align="left" width=79 height=42 vspace=8 hspace=120 style="width: 150px; float: right;">
<img src="person.jpg" align="left" width=79 height=42 vspace=8 hspace=120 >
<img src="person.jpg" style="width: 150px; float: left;"> --%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="stylelog.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
<script type="text/javascript">
</script>
<script type="text/javascript">
var bookmark_url="http://localhost:8080/Checksheet/HOME.jsp";
var text_description="CS SOFT";
function addBookmark1()
{
window.external.AddFavorite(bookmark_url,text_description);
}
function two(){
	window.sidebar.addPanel(text_description,bookmark_url,"");
	}

</script>
<style type="text/css">

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 210px; /* Main Menu Item widths */
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


      function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1,resizable=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>


 <script type = "text/javascript" >
function changeHashOnLoad() {
     window.location.href += "#";
     setTimeout("changeHashAgain()", "50"); 
}
 
function changeHashAgain() {
  window.location.href += "1";
}
 
var storedHash = window.location.hash;
window.setInterval(function () {
    if (window.location.hash != storedHash) {
         window.location.hash = storedHash;
    }
}, 50);
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
 
 
 
</script>

<title>CS-SOFT</title>

</head>



<body bgcolor="" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100" onload="changeHashOnLoad(); ">


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
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">IT CHECK SHEET (CS-Soft)</font></strong></td></tr>
<!--  <tr align="right"><td><blink onclick="addBookmark1()" ondblclick="two()" style="font-size:2ex;color: blue;">Click to Bookmark</blink></td>
 </tr> -->
</table>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><font color="blue"> 
<script>

//Time of day message script- by javascriptkit.com
//Visit JavaScript Kit (http://javascriptkit.com) for script
//Credit must stay intact for use

var Digital=new Date()
var hours=Digital.getHours()

//Configure message below to your own.
if (hours>=5&&hours<=11) //MESSAGE FOR MORNING
document.write('<font color="#2f4377"><b>GOOD MORNING</b></font>')
else if (hours==12) //MESSAGE FOR NOON
document.write('<font color="#2f4377"><b>GOOD AFTERNOON</b></font>')
else if (hours>=13&&hours<=16) //MESSAGE FOR AFTERNOON
document.write('<font color="#2f4377"><b>GOOD AFTERNOON</b></font>')
else if (hours>=17&&hours<=20) //MESSAGE FOR EVENING (6pm-8pm)
document.write('<font color="#2f4377"><b>GOOD EVENING</b></font>')
else if (hours>=21&&hours<=11) //MESSAGE FOR NIGHT (9pm-11pm)
document.write('<font color="#2f4377"><b>Glad to see you this time of the night</b></font>')
else //MESSAGE FOR LATE NIGHT, EARLY MORNING (12pm-4am)
document.write('<font color="#2f4377"><b>Wow, thanks for choosing to visit CS-SOFT over sleep!</b></font>')

</script></font>
</td>
<td width="1118" align="right"> 
<blink onclick="addBookmark1()" ondblclick="two()" style="font-size:2ex;color: blue;">Click to Bookmark</blink>
</td> 
</tr> 
</table>

<%-- <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"> 
%><a href="javascript:top.window.close(),close1()"><img src="logout-icon.png" height="35" width="35" title="LOGOUT"></a>
%><a href="check123.jsp" onclick="return popitup('check123.jsp')" id="hiderow"><font size=2>LOGOUT</font></a>

<script>

//Time of day message script- by javascriptkit.com
//Visit JavaScript Kit (http://javascriptkit.com) for script
//Credit must stay intact for use

var Digital=new Date()
var hours=Digital.getHours()

//Configure message below to your own.
if (hours>=5&&hours<=11) //MESSAGE FOR MORNING
document.write('<font color="#2f4377"><b>GOOD MORNING</b></font>')
else if (hours==12) //MESSAGE FOR NOON
document.write('<font color="#2f4377"><b>GOOD AFTERNOON</b></font>')
else if (hours>=13&&hours<=16) //MESSAGE FOR AFTERNOON
document.write('<font color="#2f4377"><b>GOOD AFTERNOON</b></font>')
else if (hours>=17&&hours<=20) //MESSAGE FOR EVENING (6pm-8pm)
document.write('<font color="#2f4377"><b>GOOD EVENING</b></font>')
else if (hours>=21&&hours<=11) //MESSAGE FOR NIGHT (9pm-11pm)
document.write('<font color="#2f4377"><b>Glad to see you this time of the night</b></font>')
else //MESSAGE FOR LATE NIGHT, EARLY MORNING (12pm-4am)
document.write('<font color="#2f4377"><b>Wow, thanks for choosing to visit CS-SOFT over sleep!</b></font>')

</script>
</td>

 <td width="1118" align="right"> 
<a href="javascript:top.window.close(),close1()"><img src="logout-icon.png" height="35" width="35" title="LOGOUT"></a>
<a href="check123.jsp" onclick="return popitup('check123.jsp')" id="hiderow"><font size=2>LOGOUT</font></a>

<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table> --%>


<table width="1000" height="0" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="360" align="justify" valign="top"></td>
    <td width="360" align="justify" valign="top"></td>
   
  <td width="60" align="justify" valign="top"></td>
 <td width="560" align="justify" valign="top">
  

<img vspace="15" src="images/complain.jpg" width="193" height="180" border="1">



<br>
<!-- <strong><a href="complainPage.jsp?msg=1"><font size=2><blink>COMPLAINS ? CLICK HERE</blink></font></a></strong> -->

	<strong >
<!-- <img  src="images/mail.jpg" width="35" height="" border="1"> -->
	<a href="complainPage.jsp?msg=1"><font size=2>LOG COMPLAINTS</font></a></strong>

</td>

<%-- <table width="100%" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr> --%>
	
		
		<td width="400" height="230" align="justify" valign="middle">
		<img vspace="15" src="images/HOME.jpg" width="530" height="180" border="1">
		
	   <center>
		<strong ><a href="loginho.jsp?msg=1"><font size=2>SYSTEM ADMIN CLICK HERE</font></a></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong><a href="adminlink.jsp"><font size=2>ADMINISTRATOR CLICK HERE</font></a></strong>
	</center>
		</td>
</tr>
</table>









<div id="layer05_holder">
<BR>

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377" align="center"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</font></strong></td>
    
  </tr>
</table> 


 

 </div> <!--end wrapper--></div>
</form>
</body>
</html>