<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@ include file="../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>SYSTEM ADMIN WISE REPORT</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
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
   			// document.form.action="PoDayToDayExcel";
   			document.form.action="CS_ims_PersonDayBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="CS_ims_PersonDayBack.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }

</script>
<script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		 var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }

   function validate()
   {
       
       var d1=document.form.aabbcc;
       var d2=document.form.txtCalendar;
       
      
    if ((d1.value==null)||(d1.value=="NULL")||d1.value.length<=1){
   alert("Select Person Name!");
   d1.focus();
   return false;
   }
    if ((d2.value==null)||(d2.value=="NULL")||d2.value.length<=1){
 	   alert("Select Date!");
 	   d2.focus();
 	   return false;
 	   }
 

  	 
else
return true;
   }
</script>
<%
session.setMaxInactiveInterval(30*60);

if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("theName")==null||session.getAttribute("admin")==null)
{   
	String msg=null;
	msg="Session Time Out \\n Login Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
}
%>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<!-- <img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="30" width="100" align="right">
 --> <table>
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>WORK LOG</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">SYSTEM ADMIN WISE REPORT</font></strong></td></tr>
</table>

<br />
<br />



<form name="form" method="post" onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');">
<%-- 
<form action="POMonthBack.jsp" method="post" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=1100,height=300,scrollbars=1,resizable=yes,channelmode=yes');">

%>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
	 
	 
<%
String tot_val = null;
Connection cn9 = null;
Statement st9 = null; 
ResultSet rs9 = null;
cn9 = con.getConnection2();
st9=cn9.createStatement();

rs9 = st9.executeQuery("Select DISTINCT emp from complain_master_item WHERE emp not in ('-1') and emp not in ('null') ORDER BY emp ASC ");

Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();
//rs10 = st10.executeQuery("select po_date from po where po_date AS [Year])");
//rs10 = st10.executeQuery("SELECT YEAR(po_date) FROM po "); 
   			//SELECT DAY( <TIMESTAMP_FIELD> ) AS DAY, 
        	// MONTH( <TIMESTAMP_FIELD> ) AS MONTH, 
			//YEAR( <TIMESTAMP_FIELD> ) AS YEAR
			//FROM <TABLE>            SELECT id FROM TABLE WHERE YEAR(CAST(creation_date AS DATE))=2010 SELECT id FROM TABLE WHERE DATE_FORMAT( creation_date,  "%Y" ) = "2010"

//rs10 = st10.executeQuery("SELECT po_date,DATE_FORMAT(po_date,'%Y') as created_year FROM po"); 
   			//Date dt = new Date();  dt.getYear();  import java.util package
//rs10 = st10.executeQuery("Select DISTINCT substr(po_date,5,2) from po ORDER BY substr(po_date,5,2) ASC");
rs10 = st10.executeQuery("SELECT DISTINCT cm_date FROM complain_master_item ORDER BY STR_TO_DATE( cm_date , '%d/%m/%Y' ) DESC ");
%>	 
<table align="center">
<tr>
<th>SELECT SYSTEM ADMIN AND DATE</th>
</tr>
</table>

<br>
<br>	 
<table align="center" width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="6">
     <font size ="3" color="white" ><center>SYSTEM ADMIN MONTH AND YEAR WISE REPORT</center></font>
   </td>
  </tr>
   <tr>
<td colspan="4"><font size="2">SELECT SYSTEM ADMIN AND DATE</font> </td>
</tr>
   <tr><td>System Admin Name</td>
	<td>
      <select  name="aabbcc"  id="hiderow">     <option value="NULL">SELECT</option> 
										        <%while(rs9.next()){ %> 
										 
										        
										         <option ><%=rs9.getString("emp")%> </option>
										      
										        <%} %> 
										        </select>
      </td>
 <td> DATE:</td>

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
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button1 onclick="return (validate() && OnButton1());">
	    <INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button2 onclick="return (validate() && link1())"> 
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
<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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