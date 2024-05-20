<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
    <%@ include file="../../banner.jsp" %>
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><head><title>NEIN-C2IT</title>
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />
<link rel='stylesheet' type='text/css' href='../../css/headerColor.css' />
<link rel="shortcut icon" href="../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
</style>
</head>
	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
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
function form1()
{
	
document.form.action="AccessCardAdmin.jsp?msg=1";
document.form.method="post";
document.form.submit();
}
function form2()
{
	
document.form2.action="AccessCardLocalAllAdmin.jsp?msg=1";
document.form2.method="post";
document.form2.submit();
}
</script>

<script type="text/javascript">
function validate1()
{  var p1=document.form.req;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Access Card Number!"); p1.focus(); return false; }
 
	else
	return true;
}
function validate2()
{  var p1=document.form2.req2;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Access Card Number!"); p1.focus(); return false; }
 
	else
	return true;
}
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: hidden; overflow-y: hidden;">
<div id="wrapper">
<!--  <table >
<tr>
<td>
<img src="../../images/nippon.gif" height="35" width="220"> </td>
<td align="right">
<img src="../../images/cs-soft.jpg" height="30" width="100" hspace="796" ></td>
</table> 
 -->
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../../images/nippon.gif" height="35" width="220"> </td>
       
    </tr>
   <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	C2IT (CONNECT TO IT) </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">ACCESS CARD FORM</font></strong></td>
</tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>


<br />
<br />

<table align="center">
<tr>

<td width="40%">

<form name="form" method="post" action="AccessCardAdmin.jsp?msg=1">
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
ResultSet rs9 = null;Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;Connection cn99 = null;
Statement st99 = null; 
ResultSet rs99 = null;Connection cn100 = null;
Statement st100 = null; 
ResultSet rs100 = null;
try{
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
/* rs9 = st9.executeQuery("SELECT DISTINCT form4_no FROM form4_accesscard  ORDER BY form4_no"); */
//rs9 = st9.executeQuery("SELECT DISTINCT form4_no FROM form4_accesscard_item WHERE emp='"+AdminName+"' and desg='"+desg+"' and status='Pending' AND form4_no LIKE 'NEIN/CS/Acard%' ORDER BY form4_no ASC");
rs9 = st9.executeQuery("SELECT DISTINCT form4_no FROM form4_accesscard WHERE Approval_emp='"+AdminName+"' and Approval_desg='"+desg+"' and Approval_sttatuss='Pending' AND form4_no LIKE 'NEIN/CS/Acard%' ORDER BY form4_no ASC");

cn10 = con.getConnection2();
st10=cn10.createStatement();

//rs10 = st10.executeQuery("Select DISTINCT YEAR(cm_date) from complain_master_item WHERE cm_date IS NOT NULL ORDER BY YEAR(cm_date) DESC");
%>	 
<table align="center">
<tr>
<th>SELECT ACCESS CARD FORM NUMBER</th>
</tr>
</table>

<br>
<br>	 
	 

	<table align="center" width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="2">
     <font size ="3" color="white">PENDING FORMS</font>
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
		<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return(validate1() && form1());">
		
</td>
	</tr>

</table>

	
	
	
	</form>

	</td>
	<td width="20%">
	
	</td>
	<td width="40%">
	

<form name="form2" method="post" action="AccessCardLocalAllAdmin.jsp?msg=1">
<%-- %>	 <form action="POMonthWiseBack.jsp"> 
	<form action="POWiseBack.jsp">--%>
<%
	 String b_no=null;
	 
	 b_no = (String) session.getAttribute("b_no");

	%>	 
	 
<%


cn99 = con.getConnection2();
st99=cn99.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT substr(pordernon,6,2) from po ORDER BY substr(pordernon,6,2) ASC");
/* rs9 = st9.executeQuery("SELECT DISTINCT form4_no FROM form4_accesscard  ORDER BY form4_no"); */
//rs99 = st99.executeQuery("SELECT DISTINCT form4_no FROM form4_accesscard WHERE i_b_no='"+b_no+"' AND form4_no LIKE 'NEIN/CS/Acard%' ORDER BY idextend DESC");
rs99 = st99.executeQuery("SELECT DISTINCT form4_no,full_name FROM form4_accesscard WHERE form4_no LIKE 'NEIN/CS/Acard%' ORDER BY id DESC");

cn100 = con.getConnection2();
st100=cn100.createStatement();

//rs10 = st10.executeQuery("Select DISTINCT YEAR(cm_date) from complain_master_item WHERE cm_date IS NOT NULL ORDER BY YEAR(cm_date) DESC");
%>	 
<table align="center">
<tr>
<th>SELECT ACCESS CARD FORM NUMBER</th>
</tr>
</table>

<br>
<br>	 
	 

	<table align="center" width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" colspan="2">
     <font size ="3" color="white">ALL FORMS</font>
   </td>
  </tr>
   <tr>
<td colspan="2"><font size="2">SELECT FORM NUMBER</font> </td>
</tr>
  
    
   <tr><!--<th>BRANCH:</th>
	--><td>
	  <label>NUMBER:</label>
      <select  name="req2"  id="hiderow">     <option value="NULL">SELECT</option> 
                                                
										        <%while(rs99.next()){ %> 
										        
										       <option ><%=rs99.getString(1)%> - <%=rs99.getString(2)%></option>
										        <%} %> 
										        </select>
      </td>
  
     
      
	</tr>
	
	<tr>
<td align=center colspan="2">
		<INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate2() && form2());">
		
</td>
	</tr>

</table>

		<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs10,st10,cn10);
	DbUtil.closeDBResources(rs99,st99,cn99);
	DbUtil.closeDBResources(rs100,st100,cn100);
  }
	%>
	
	
	</form>
	</td>
	</tr>
	</table>
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
   <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>




</body>
</html>