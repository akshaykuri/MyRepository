<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %>
<%@ include file="banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>IMS (DAY WISE)</title>

<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
</head>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
</script>
<script type="text/javascript">

 function link1() {
   			 document.form.action="PODayBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="ims_Branch_Back.jsp?msg=1";
   			 document.form.method="post";
   			 document.form.submit();
   			     }


</script>
<script language = "Javascript">
          
            function checkAddress(str){
              var re = /[^[a-z][A-Z][0-9]][/][(][)][.]/g
              if (re.test(str)) return false;
              return true;
            }
            
          function validate(){
              var nn=document.form.txtCalendar;
                 
            if ((nn.value==null)||(nn.value=="")){
            alert("Please Enter Date!")
            nn.focus()
            return false
            }
            if (checkAddress(nn.value)==false){
            nn.value=""
            alert("Invalid Date!");
            nn.focus()
            return false
            }
            
           
	 else
       return true;
}
</script>
<!-- <body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70"> -->
<body bgcolor="" leftmargin="80" rightmargin="80"  topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">

<div id="wrapper">
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<img src="images/nippon.gif" height="35" width="220">
</td> 
<td width="115" align="right"> 
<img src="images/cs-soft.jpg" height="30" width="100">
</td> 
</tr> 
</table>

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>IMS(DAY WISE)</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">CHECK SHEET (CS-Soft)</font></strong></td></tr>
</table>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><font color="blue"> 
<%= session.getAttribute( "NpostingCo" ) %>-BRANCH</font>
</td>
<td width="1118" align="right"> 
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>
<br />
<br />




<form name="form" method="post" onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');">
	 
<table align="center">
<tr>
<th>SELECT DAY</th>
</tr>
</table>

<br>
<br>	 
	 
  <table width="280" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#ec691f">

    
   <tr>
 <th>DAY:</th>

				<td><input type="text"  style="width: 6em"  name="txtCalendar" id="idCalendar" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
										        
			<td> <img src="images/cal.gif" id="idForDay" style="float: left;margin: 0.5em 0.5em 0.5em 0.5em;" name="imgForDate" width="16" height="16"  onclick="showCalendarControl(document.getElementById('idCalendar'))">					        


</td>
      
	</tr>
</table>
<br/>
<br/>
<br/>

<table width="280" align="center" border="0" cellpadding="3" cellspacing="1" >
	<tr align="center">
	 <td align=center>
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button1 onclick="return(validate() && OnButton1());">
		<!-- <INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button2 onclick="return (validate() && link1());"> -->
</td>
	</tr>
	
	</table>

	
	
	
	</form>

	
	<br>
<br>
<br>
<br>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="OtherPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 
</div>




</body>
</html>