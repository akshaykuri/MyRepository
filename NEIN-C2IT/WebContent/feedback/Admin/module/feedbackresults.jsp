
<%@page import="CON2.DbUtil"%>
<%@page import="sun.awt.resources.awt_pt_BR"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.Calendar" %> 
    <%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../../../banner.jsp" %>
<jsp:useBean id="con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="stylelog.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="../../../images/favicon.ico">
<script type="text/javascript">
</script>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script> -->

<script  type="text/javascript">

<% 
    String msg2[] = request.getQueryString().toString().split("=");
    String disp = msg2[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__","  ");
    %>
    msg2 = "<%=disp%>"; 
   /*  msg2 = "Mail Sent successfully"; */
     if(msg2!="1")
		{
           alert(msg2);
		}
</script> 
<!-- <style type="text/css">

#overlay {

position: fixed;

top: 0;

left: 0;

width: 100%;

height: 100%;

background-color: #000;

filter:alpha(opacity=70);

-moz-opacity:0.7;

-khtml-opacity: 0.7;

opacity: 0.7;

z-index: 100;

display: none;

}

.cnt223 a{

text-decoration: none;

}

.popup{

width: 100%;

margin: 0 auto;

display: none;

position: fixed;

z-index: 101;

}

.cnt223{

min-width: 600px;

width: 600px;

min-height: 150px;

margin: 100px auto;

background: #f3f3f3;

position: relative;

z-index: 103;

padding: 10px;

border-radius: 5px;

box-shadow: 0 2px 5px #000;

}

.cnt223 p{

clear: both;

color: #555555;

text-align: justify;

}

.cnt223 p a{

color: #d91900;

font-weight: bold;

}

.cnt223 .x{

float: right;

height: 35px;

left: 22px;

position: relative;

top: -25px;

width: 34px;

}

.cnt223 .x:hover{

cursor: pointer;

}

</style> -->
<%

session.setMaxInactiveInterval(30*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("../../../adminlink.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}

%>
<script type='text/javascript'>

$(function(){

var overlay = $('<div id="overlay"></div>');

overlay.show();

overlay.appendTo(document.body);

$('.popup').show();

$('.close').click(function(){

$('.popup').hide();

overlay.appendTo(document.body).remove();

return false;

});




$('.x').click(function(){

$('.popup').hide();

overlay.appendTo(document.body).remove();

return false;

});

});

</script>

<script type="text/javascript">
//var bookmark_url="http://localhost:8080/C2IT/HOME.jsp";
var bookmark_url="http://10.206.10.18:8185/NEIN-C2IT/HOME.jsp";
var text_description="NEIN-C2IT";
function addBookmark1()
{
window.external.AddFavorite(bookmark_url,text_description);
}
function two(){
	window.sidebar.addPanel(text_description,bookmark_url,"");
	}

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
<script type="text/javascript">
function editRecord(id)
{    
var f=document.form;    
f.method="post";   
/* alert("ID : "+id); */
f.action='feedbackReplyMail.jsp?id='+id;    
f.submit();
}
</script>
<script>
<!--

/*
Auto Refresh Page with Time script
By JavaScript Kit (javascriptkit.com)
Over 200+ free scripts here!
*/

//enter refresh time in "minutes:seconds" Minutes should range from 0 to inifinity. Seconds should range from 0 to 59
var limit="0:30"

if (document.images){
var parselimit=limit.split(":")
parselimit=parselimit[0]*60+parselimit[1]*1
}
function beginrefresh(){
if (!document.images)
return
if (parselimit==1)
window.location.reload()
else{ 
parselimit-=1
curmin=Math.floor(parselimit/60)
cursec=parselimit%60
if (curmin!=0)
curtime=curmin+" minutes and "+cursec+" seconds left until page refresh!"
else
curtime=cursec+" seconds left until page refresh!"
window.status=curtime
setTimeout("beginrefresh()",1000)
}
}

window.onload=beginrefresh
//-->
</script>
<title>CS-SOFT</title>
<!-- <meta http-equiv="refresh" content="30" /> -->
</head>



<!-- <body bgcolor="" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100" onload="changeHashOnLoad(); ">
 -->
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" onload="changeHashOnLoad();" >
<form name="form">





<!-- <div class='popup'>

<div class='cnt223'>

<img src='http://www.developertips.net/demos/popup-dialog/img/x.png' alt='quit' class='x' id='x' />

<p style="background: blue;background-color: blue; " >

<center><b><font size="2"> WELCOME TO  CONNECT  2IT  SOFTWARE</font></b></center> 

<br/>
<center><font color="blue">Server has been Shifted. Please use below URL</font></center>
<br/>
<br/>
<center><font color="blue" size="2"><b><u>FROM OFFICE</u></b></font></center>



<center><a href="http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp">http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp</a></center>
<br/>

<center><font color="blue" size="2"><b><u>FROM PUBLIC NETWORK</u></b></font></center>



<center><a href="http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp">http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp</a></center>

 <center> or </center>
 
 <center><a href="http://14.141.84.180:8185/NEIN-C2IT/HOME.jsp">http://14.141.84.180:8185/NEIN-C2IT/HOME.jsp</a></center>


<br/>
<br/><br/>
<br/>
<center>
<a href='' class='close'>Close</a>
</center>
</p>

</div>

</div> -->














<div id="id">
 <table>
<tr>
<td>
<img src="../../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<!-- <img src="images/c2.jpg" height="20" width="100" hspace="796" ></td> -->
<img src="../../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>WELCOME</b> <br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td></tr>

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

<table width="1000" height="0" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="30" align="justify" valign="top"></td>
    <td width="40" align="justify" valign="top"></td>
   
  <td width="90" align="justify" valign="top"></td>
<!--  <td width="960" align="justify" height="20" valign="top"> -->
 <td width="800"  align="justify" valign="bottom">
 <center>
				<table width="100%" cellspacing="1" border="2">
				<tr><td colspan="8" align="center" bgcolor="grey">DASH BOARD</td></tr>
				<tr><td colspan="8" align="center" bgcolor="lightgrey">COMPLAINT STATUS</td></tr>
				
				<tr>
				<td  width="5" align="center"  height="21" bgcolor="lightgrey"><font size="2">SL No.</font></td>
				<td  width="67" align="center"  height="21" bgcolor="lightgrey"><font size="2">NAME</font></td>
				<td  width="67" align="center"  height="21" bgcolor="lightgrey"><font size="2">DATE</font></td>
					<td width="67" align="center"  height="21" bgcolor="lightgrey"><font size="2">BRANCH</font></td>
					<td width="67" align="center"  height="21" bgcolor="lightgrey"><font size="2">ABOUT</font></td>
					<td width="67" align="center"  height="21" bgcolor="lightgrey"><font size="2">SYSTEM ADMIN</font></td>
					<td width="67" align="center"  height="21" bgcolor="lightgrey"><font size="2">REMARKS/FEEDBACK</font></td>
					<td width="8" align="center"  height="21" bgcolor="lightgrey"><font size="2">REPLY</font></td>
				</tr>
					<% 
						String cs_date;
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						Date date = new Date();
						cs_date = dateFormat.format(date);
						System.out.println("DATE"+cs_date);
						//String empp=null,status=null,notstatus=null,truestatus=null,allPending=null;
                        String name=null,date2=null,branch=null,about=null,systemAdmin=null,feedback=null,idno=null;
						int k=0;
						Connection cn02 = null;
						Statement st02 = null; 
						ResultSet rs02 = null;
						try{
						cn02 = con.getConnection2();
						st02=cn02.createStatement();
						rs02 = st02.executeQuery("SELECT id,name,feedback,date,user_mail_id,gm_mail_id,Branch,About,systemAdmin FROM feedback WHERE ReplyRemarks is null ");
						int i=0;
						while(rs02.next())
						{k++;
						name = rs02.getString("name");
							//System.out.println("emp "+empp);
							date2 = rs02.getString("date");
							branch = rs02.getString("Branch");
							about = rs02.getString("About");
							systemAdmin = rs02.getString("systemAdmin");
							feedback = rs02.getString("feedback");
							idno= rs02.getString("id");
							i++;
						%>
				<tr>
	 					<td width="42" align=center  ><font size="2" ><%=i%></font> </td> 
   					 <td width="42" align=center  ><font size="2" ><%=name%></font> </td> 
   					 <td width="67" align="center"  height="21" ><font size="2" ><%=date2%></font></td>
					<td width="67" align="center"  height="21" ><font size="2" ><%=branch%></font></td>
						<td width="67" align="center"  height="21" ><font size="2" ><%=about%></font></td>
						<td width="67" align="center"  height="21" ><font size="2" ><%=systemAdmin%></font></td>
						<td width="67" align="center"  height="21" ><font size="2" ><%=feedback%></font></td>
						<td id="hiderow"><input id="hiderow" type="button" size="2" name="edit" value="Reply" style="background-color:white;font-weight:bold;color:black;" onclick="editRecord(<%=idno%>);" ></td>
				</tr>		<%}
					
				%>
				</table>
			
					<%
}
catch (Exception e) { System.out.println(e); }
finally{

	DbUtil.closeDBResources(rs02,st02,cn02);
	
  }
	%>
<br>
<!-- <strong><a href="complainPage.jsp?msg=1"><font size=2><blink>COMPLAINS ? CLICK HERE</blink></font></a></strong> -->
	</center>
</td>

<%-- <table width="100%" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr> --%>
	
	
</tr>
</table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../../HOME.jsp"><img src="../../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../../../adminbom.jsp?msg=1"><img src="../../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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