<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 

<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>NEIN-C2IT</title>
<link rel="shortcut icon" href="../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
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
div#id
 {
  width:100px;
  height:100px;
 }
</style>
</head>
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg2=null;
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("../../adminlink.jsp?msg="+msg2);
}
%>
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

 

  function validate1()
  {  var p1=document.form.branch1; var y1=document.form.year1;
   if ((p1.value==null)||(p1.value=="NULL"))
 				{alert("Select IT Clearance Number!"); p1.focus(); return false; }
   
 	else
 	return true;
  }
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper">
 <table >
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>NEIN C2IT </b><br />
    
 </font></strong></td></tr>
<tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">IT CLEARANCE FORM</font></strong></td></tr>
</table>
NAME :<%=session.getAttribute("Nname")%> 
    DESG :<%=session.getAttribute("desg")%>
<br />
<br />



<!-- <form name="form" method="post" action="ITclearanceAdmin.jsp?msg=1">  -->
 <form name="form" method="post" action="ITClearanceRoughMultipleMail.jsp?msg=1"> 
<%-- %>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
	<%
	 String AdminName=null,desg=null;
	 
	 AdminName = (String) session.getAttribute("Nname");
	 desg = (String) session.getAttribute("desg");
	%>
	 
	 
<%
String tot_val = null;
Connection cn9 = null;
Statement st9 = null; 
ResultSet rs9 = null;
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
rs9 = st9.executeQuery("SELECT DISTINCT form1_no FROM form1_it_clearance_item WHERE emp='"+AdminName+"' and desg='"+desg+"' and status='Pending' AND form1_no LIKE 'NEIN/CS/IT%' ORDER BY form1_no ASC");
//rs9 = st9.executeQuery("select mr_id,newStatus,mr_date FROM mr_master WHERE emp='"+AdminName+"' and desg='"+desg+"' and newStatus='Pending'");
Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();

//rs10 = st10.executeQuery("Select DISTINCT YEAR(cm_date) from complain_master_item WHERE cm_date IS NOT NULL ORDER BY YEAR(cm_date) DESC");
%>	 
<table align="center">
<tr>
<th>SELECT IT CLEARNACE FORM NUMBER</th>
</tr>
</table>

<br>
<br>	 
	
	<table align="center" width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="2">
     <font size ="3" color="white"></font>
   </td>
  </tr>
   <tr>
<td colspan="2"><font size="2">SELECT FORM NUMBER</font> </td>
</tr>
  
    
   <tr><!--<th>BRANCH:</th>
	--><td>
	  <label>NUMBER:</label>
      <select  name="req"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs9.next()){ %> 
										        
										         <option ><%=rs9.getString(1)%> </option>
										        <%} %> 
										        </select>
      </td>
  
     
      
	</tr>
	
	<tr>
<td align=center colspan="2">
		<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate1();">
		
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
<a href="../../adminbom.jsp"><img src="../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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