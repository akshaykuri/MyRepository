
<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="banner.jsp" %> 
    <%@page import="CON2.DbUtil"%>
    <%@ page import="java.io.*"%>
<%@page language="java"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CON2.Connection2"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<%@page language="java"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu-v.css" />
<script type="text/javascript" src="../js/layout.js"></script>
<script type="text/javascript" src="../API/Js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script language="javascript"   type="text/javascript" src="../js/popWindowAtCenter.js"></script>



<script type="text/javascript">
</script>
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


<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});

</script>
<script type="text/javascript" language="javascript">
function openPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	     //  var ref = window.open('http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	     var ref = window.open('http://localhost:8180/NEIN-C2IT/ITSupportHelpPage.jsp', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}
function openHelpPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	       var ref = window.open('http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/Conference.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   //  var ref = window.open('http://localhost:8180/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}
</script>
<script type="text/javascript" language="javascript">
 window.onload=blinkOn;
 var t=null,y=null;
function blinkOn()
{
   t = document.getElementById("blink").style.color="#FF0000";
  
  setTimeout("blinkOff()",1000);
}
 
function blinkOff()
{
   y = document.getElementById("blink").style.color="white";
  setTimeout("blinkOn()",1000);
}
function blinkOff1()
{
  y= document.getElementById("blink").style.color="black";
  setTimeout("blinkOff()",1000);
}
function blinkOff2()
{
	 document.getElementById("blink").style.color="black";
	setTimeout("blinkOff1()",100000000);
	clearTimeout(y);
}
</script>

<%
String city_no=null;
String city= null,department=null;
String rights=null;
rights=(String) session.getAttribute("rights");
city_no = (String) session.getAttribute("bno");

%> 


<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   style="overflow-x: hidden; overflow-y: hidden;">
<form>
<div id="id">
 <table>
<tr>
<td>
<%-- <%System.out.println("NAME : "+session.getAttribute( "Nname" )+"  CITY :"+session.getAttribute("city")+"   ADMIN:"+session.getAttribute("admin")+"   B_NO :"+session.getAttribute("b_no"));%>
 --%><tr>
<td>
<img src="../images/nippon.gif" height="35" width="220"> </td>

</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">CONFERENCE/MEETING BOOKING</font></strong></td>
</tr>
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 

<tr>
<td width="1118" align="right"> 
<!--<a href="javascript:top.window.close(),close1()"><img src="logout-icon.png" height="35" width="35" title="LOGOUT"></a>
-->
<!-- <a href="logout.jsp"><font size=2>LOGOUT</font></a> -->
<a href="#" onclick="openHelpPDF()"><img width="30" src="../images/help3.jpg"><font size ="2">Help</font></a>
<a class="a_link" href="../HOME.jsp"><img width="30" src="../images/icon_log.png"><font size ="2">Logout</font></a>
</td> 
</tr> 
</table>


<br />
<table width="920" height="63" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="360" align="justify" valign="top"></td>
    <td width="560" align="justify" valign="top">
<!--<font style="text-decoration: blink;">
-->
<font > Welcome :<%=session.getAttribute("fullname")%><input type="hidden" name="empid" id="empid" value="<%=session.getAttribute("empid")%>" /> </font>&nbsp;&nbsp; 
<%--
System.out.println("Session Result : "+session.getAttribute("b_no"));
--%>
</font>

<br />
<br>

<div id="smoothmenu2" class="ddsmoothmenu-v">
 <ul id="sidebarmenu1">
 
       <li><a href="#">Room Booking</a>
			<ul>
				<li><a href="ConRoomBooking.jsp?msg=1">Booking Page</a></li>
				<!-- <li><a href="ViewBooking.jsp?msg=1">View Bookings</a></li> -->
				<li><a href="viewindividualbooking.jsp?msg=1">View Your Booking</a></li>
				<li><a href="CancelBooking.jsp?msg=1">Cancel Your Booking</a></li>
			</ul>
		</li>
		
<!-- 		<li><a href="#">Video Conferance Booking</a>
		 	 <ul>
				<li><a href="../VideoConfernce/VideoConBooking.jsp?msg=1">Booking Page</a></li>
				<li><a href="../VideoConfernce/viewindividualbooking.jsp?msg=1">View Your Booking</a></li>
				<li><a href="../VideoConfernce/CancelBooking.jsp?msg=1">Cancel Your Booking</a></li>
			</ul>
		</li> -->
		
		
		<li><a href="ViewBooking.jsp?msg=1">Calendar</a></li>
		
		 <li><a href="#">Room Booking Reports</a>
			 <ul>
				<li><a href="Searchpage.jsp?msg=1">View Bookings</a></li>
				<li><a href="SearchAmenities.jsp?msg=1">View Amenities</a></li>
				<li><a href="SearchWebex.jsp?msg=1">View&nbspWebex&nbspInformation</a></li>
				<li><a href="SearchCancelBooking.jsp?msg=1">View&nbspCancelledBookings</a></li>
			</ul>
		 </li>
		
		<!-- <li><a href="#">Video Conferance Reports</a>
			 <ul>
				<li><a href="../VideoConfernce/Searchpage.jsp?msg=1">View Bookings</a></li>
		    	<li><a href="../VideoConfernce/SearchCancelBooking.jsp?msg=1">View&nbspCancelledBookings</a></li>
			</ul>
		 </li>
		  -->
		 
		 
		 
	 <%	 if((rights !=null) && (rights.equals("1")))            
	{%>
	 	<li><a href="#">Masters</a>
	          <ul>
	             <li><a href="BookingMaster.jsp?msg=1">Room Type Master</a></li>
	             <li><a href="vcBranchMaster.jsp?msg=1">VC Branch Master</a></li>
	             <li><a href="AmenitiesMaster.jsp?msg=1">Amenities Master</a></li>
	         </ul>
	    </li> 
	  <%} %> 
	</ul>
	</li>
	
	 </div>
	 </td>
	

  
		<td width="360" height="11" align="justify" valign="bottom">
		<img src="../images/booking.jpg" width="400" height="250" border="0"></td>
</tr>
</table>





<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address> 
</td> 
 
<td width="115" align="right"> 
<a href="LoginConRoom.jsp?msg = 1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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