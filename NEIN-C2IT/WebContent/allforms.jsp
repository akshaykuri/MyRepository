<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Forms</title>
<link rel="stylesheet" href="css/Formcss.css">
<link rel="shortcut icon" href="images/favicon.ico">
<style>


.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 12px Verdana;
width: 220px; /* Main Menu Item widths */
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
width: 210px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}
</style>

<script type="text/javascript">
//Nested Side Bar Menu (Mar 20th, 09)
var menuids=["sidebarmenu1"]; //Enter id(s) of each Side Bar Menu's main UL, separated by commas

function initsidebarmenu(){
for (var i=0; i<menuids.length; i++){
  var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul");
    for (var t=0; t<ultags.length; t++){
    ultags[t].parentNode.getElementsByTagName("a")[0].className+=" subfolderstyle";
  if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
   ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px"; //dynamically position first level submenus to be width of main menu item
  else //else if this is a sub level submenu (ul)
    ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px" ;//position menu to the right of menu item that activated it
    ultags[t].parentNode.onmouseover=function()
    {
    this.getElementsByTagName("ul")[0].style.display="block";
    };
    ultags[t].parentNode.onmouseout=function()
    {
    this.getElementsByTagName("ul")[0].style.display="none";
    };
    }
  for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
  ultags[t].style.visibility="visible";
  ultags[t].style.display="none";
  }
  }
}

if (window.addEventListener)
	window.addEventListener("load", initsidebarmenu, false);
	else if (window.attachEvent)
	window.attachEvent("onload", initsidebarmenu);
</script>


</head>
<body>
<body id="bodylen">
<table id="header">
<tr><td id="logo1"><img alt="Nippon Express" src="images/nippon.gif"></td><td id="logo2"><img alt="" src=""></td></tr>
<tr class="nameal"><td id="cs1"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER </td></tr>
<tr class="nameal"><td id="cs2"> DC </td></tr>
<tr id="logout"><td><a href = "Logout">LOGOUT</a></td></tr>
</table>
<form>
<table align="center" width="1200" cellpadding="0" cellspacing="0" border="0" id="table1" style="padding-top: 25px;" >
<tr>
<td align="justify" valign="top" width="560" style="padding-left: 50px;">
<div class="sidebarmenu">
 <ul id="sidebarmenu1">
  
        <li><a href="#">IT Clearance</a>
        <ul>
      		<li><a href="FORMS/ITclearance.jsp">Create</a></li>
      		<li><a href="">View</a>
      		
      		</li>
      		
      	</ul>
      	</li>
      	<li><a href="#">Domain User</a>
      <ul>
      		<li><a href="FORMS/domain.jsp">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      	<li><a href="#">Lotus Notes</a>
      <ul>
      		<li><a href="FORMS/lotus.jsp">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      	<li><a href="#">Issue of Access Card</a>
      <ul>
      		<li><a href="FORMS/access.jsp">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      	<li><a href="#">Shared Floder Form</a>
      <ul>
      		<li><a href="FORMS/floder.jsp">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
          
          <li><a href="#">Internet Access Form</a>
      <ul>
      		<li><a href="FORMS/internet.jsp">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
      
      <li><a href="#">Newin's Users Form</a>
      <ul>
      		<li><a href="FORMS/newins.jsp">Create</a></li>
      		<li><a href="">View</a></li>
      	</ul>
      	</li>
  </ul>
  </div>
  </td><td width="100%" align="right" valign="top"><img src="images/logistics.jpg" width="590" height="280" ></td>
  </tr>
  </table>        
</form>

<table id="footer">
<tr class="nameal"><td id="cs5">NIPPON EXPRESS (INDIA) PRIVATE LIMITED - GLOBAL LOGISTICS PROVIDER</td></tr>
</table>

</body>
</html>