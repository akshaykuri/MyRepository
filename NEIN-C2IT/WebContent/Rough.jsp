<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>




<body background ="images/HOME2.jpg"  >
<script language=javascript>

if (document.all) {
//Things you can alter
yourLogo = "Welcome To ISTRAC.";  
logoFont = "Arial Black";
logoColor = "red";
//Nothing needs altering below!
yourLogo = yourLogo.split('');
L = yourLogo.length; 
TrigSplit = 360 / L;
Sz = new Array()
logoWidth = 100;
logoHeight = -30;
ypos = 0;
xpos = 0;
step = 0.03;
currStep = 0;
document.write('<div id="outer" style="position:absolute;top:0px;left:0px"><div style="position:relative">');
for (i = 0; i < L; i++) {
document.write('<div id="ie" style="position:absolute;top:0px;left:0px;'
+'width:8px;height:8px;font-family:'+logoFont+';font-size:20px;'
+'color:'+logoColor+';text-align:center">'+yourLogo[i]+'</div>');
}
document.write('</div></div>');
function Mouse() {
ypos = event.y;
xpos = event.x - 5;
}
document.onmousemove=Mouse;
function animateLogo() {
outer.style.pixelTop = document.body.scrollTop; 
for (i = 0; i < L; i++) {
ie[i].style.top = ypos + logoHeight * Math.sin(currStep + i * TrigSplit * Math.PI / 180);
ie[i].style.left = xpos + logoWidth * Math.cos(currStep + i * TrigSplit * Math.PI / 180);
Sz[i] = ie[i].style.pixelTop - ypos;
if (Sz[i] < 5) Sz[i] = 5;
ie[i].style.fontSize = Sz[i] / 1.7;
}
currStep -= step;
setTimeout('animateLogo()', 20);
}
window.onload = animateLogo;
}
function abc()
{
	windowprops="left=200,width=350,top=150,height=250";
	n=window.open('user.htm',"user",windowprops);
	n.focus();
}	
</script>






<table width="1118" align ="center">
</table>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="darkorange"><strong>PROCUREMENT PROCESS MONITORING AND ANALYSIS </strong></td>
  </tr>
</table>

<table align="center" width="1024" >
<tr><td><p><img src="images/1.jpg"   /></p></td> 
<td><p><img src="images/10.jpg"   /></p></td>
<td><p><img src="images/7.jpg"   /></p></td>
<td><p><img src="images/3.jpg"   /></p></td>
</tr>
</table>
<table width="1118" align ="center">
<tr width="1024" bgcolor="darkorange" Font align ="center" >
 
   <td><strong><a href="Home.jsp">Home</a></strong></td>
  <td><strong> <a href="IndentHistory.jsp">Indent History</a></strong></td>
  <td><strong><a href="SummaryReports.jsp">Summary Reports</a></strong></td>
  <td><strong><a href="StatisticalReport.jsp">Statistical Report </a></strong></td>
    <td><strong><a href="Graphical.jsp">Graphical </a></strong></td>
    <td><strong><a href="Alerts.jsp">Alerts</a></strong></td>
  <td><strong><a href="TrendAnalysis.jsp">Trend Analysis</a></strong></td>
  <td><strong><a href="ContactUs.jsp">Contact Us</a></strong></td>
</tr>
<tr align = "center">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor=""><strong><marquee> <font color ="sky blue">ISRO TELEMETRY TRACKING AND COMMAND NETWORK </font></marquee> </strong></td>
  </tr>
</table>
<table width="1118" align ="center"  border = "1">
<tr width="1024" bgcolor="darkorange"  align ="center" >
<td><strong>About us</strong></td>
<td><strong>ADDRESS</strong></td>
<td><strong>CONTACT US</strong></td>
</tr>
<tr align = "Jusify">

<td  width="220" height="19" bgcolor="#EEEEEE" scope="col">
<p><font size ="3"><b>The Indian Space Program was driven by the vision of Dr. vikram sarabhai ,
 considering as a father of Indian Space Program.
</b></font></p>
</td>
<td width="420"  bgcolor="#EEEEEE" scope="col" >
<p><font size ="2"><b>ISRO <br>
ISRO TELEMETRY TRACKING AND COMMAND NETWORK <br>
INDAIN SPACE RESEARCH ORGANISATION <br>
GOVERMENT OF INDIA <br>
DEPARTMENT OF SPACE <br>
A1-6,1ST CROSS<br>
PEENYA INDUSTRIAL ESTATE<br>
BANGALORE-560058<br>
EPABX NUMBERS 91-08-8094000 <br>91-80-8395129<br>
SPACENET CODE-712<br>
FAX NUMBERS 91-80-8094125<br>
GRAM - ISTRAC 
</b>
</p> 
</td>

<td width="420"  bgcolor="#EEEEEE" scope="col" >
<p><font size ="2"><b>ISRO <br>

<b><Font color = "darkorange" >MOHAMMEDFAROOQ:->9742020718</Font></b><br>

</p> 
</td>
</tr>
</table>
</tr>

<br>
<br>

<br>
<br>


<table width="12" align ="center">
<tr width="1024" bgcolor="" Font align ="center" >
<strong><a href="exit.jsp">LOG_OUT</a></strong>
</tr>
</table>
</table>
  
 
</body>
</html> 
