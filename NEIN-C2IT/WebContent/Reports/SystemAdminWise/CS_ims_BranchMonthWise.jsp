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

 function link() {
   			 document.form.action="POMonthBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function link1() {
   			 document.form.action="CS_ims_BranchMonthWiseBackExcel.jsp";
   			 document.form.method="post";
   			 document.form.submit();
   			     }
 function OnButton1() {
   			 document.form.action="CS_ims_BranchMonthWiseBack.jsp?msg=1";
   			// document.form.action="POMonthPracticeBack.jsp";
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
       
       var d1=document.form.admin;
       var d2=document.form.year;
      
    if ((d1.value==null)||(d1.value=="NULL")||d1.value.length<=1){
   alert("Select Person Name!");
   d1.focus();
   return false;
   }
    if ((d2.value==null)||(d2.value=="NULL")||d2.value.length<=1){
    	   alert("Select Year!");
    	   d2.focus();
    	   return false;
    	   }

  	 
else
return true;
   }
</script>
<%! Object adminwho=null; %>
<%
adminwho = session.getAttribute("admin");
System.out.println("adminwho  "+adminwho);
%>


<%
session.setMaxInactiveInterval(30*60);

/* if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("theName")==null) */
 //if(session.getAttribute( "admin" )!=("SuperAdmin"))
if(!session.getAttribute("admin").equals("SuperAdmin"))
{   
	String msg=null;
	msg="Session Time Out \\n Login Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
} 
%>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">


<!--<form action="POMonthBack.jsp" method="post" target="POPUPW"    onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=1100,height=300,scrollbars=1,resizable=yes,channelmode=yes');">
--><%-- %>	 <form action="POMonthWiseBack.jsp"> 



	<form action="POWiseBack.jsp">--%>
<!-- 	<form name="form" method="post" action="CS_ims_BranchMonthWiseBack.jsp" onsubmit="return validate();">  -->
	<form name="form" method="post"> 
	<!-- <form name="form" method="post" onsubmit="POPUPW = window.open('about:blank','POPUPW',   'width=900,height=1000,location=1,status=1,scrollbars=1');"> -->

<div id="wrapper">
<img src="../../images/nippon.gif" height="35" width="220"> <img src="../../images/cs-soft.jpg" height="30" width="100" align="right">



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>WORK LOG</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">SYSTEM ADMIN WISE (MONTH)REPORT</font></strong></td></tr>
</table>

<br />
<br />

	 
	 
<%
String tot_val = null;
Connection cn9 = null;
Statement st9 = null; 
ResultSet rs9 = null;
cn9 = con.getConnection2();
st9=cn9.createStatement();
//rs9 = st9.executeQuery("Select DISTINCT emp from complain_master_item WHERE emp not in ('-1') and emp IS NOT null ORDER BY emp ASC ");
rs9 = st9.executeQuery("Select DISTINCT emp from complain_master_item WHERE emp not in ('-1') and emp not in ('null') ORDER BY emp ASC ");

//select NVL(name, 'Farook') from tablename where name  in (-1) and name is Null;
// SELECT emp,NVL(emp,'not updated') from complain_master_item 
Connection cn10 = null;
Statement st10 = null; 
ResultSet rs10 = null;
cn10 = con.getConnection2();
st10=cn10.createStatement();
rs10 = st10.executeQuery("Select DISTINCT MONTH(cm_date) from complain_master_item  ORDER BY MONTH(cm_date) ASC");
Connection cn11 = null;
Statement st11 = null; 
ResultSet rs11 = null;
cn11 = con.getConnection2();
st11=cn11.createStatement();
rs11 = st11.executeQuery("Select DISTINCT YEAR(cm_date) from complain_master_item  ORDER BY YEAR(cm_date) DESC");
%>
	 
<table align="center">
<tr>
<th>SELECT ADMIN AND YEAR</th>
</tr>
</table>

<br>
<br>	 
	 
	<table align="center" width="400" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
	
  <tr>
   <td bgcolor="#2f4377" colspan="4">
     <font size ="3" color="white">YEAR WISE REPORT</font>
   </td>
  </tr>
   <tr>
<td colspan="4"><font size="2">SELECT SYSTEM ADMIN AND YEAR</font> </td>
</tr>
  
    
   <tr>
      <td ><label>System Admin:</label></td>
<td><select  name="admin"> 
   <option value="NULL">SELECT</option> 
										        <%while(rs9.next()){ %> 
										     <option ><%=rs9.getString(1)%></option>
										    <%} %> 
										        </select>
</td>

  <td><label>YEAR</label></td>
<td><select  name="year"> 
   <option value="NULL">SELECT</option> 
	<%while(rs11.next()){ %> 
	 <option ><%=rs11.getString(1)%></option>
	<%} %> 
     </select>

</td>    
	</tr>


	
	<tr>
	<td align=center colspan="2">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="DISPLAY" name=button2 onclick="return ( validate() && OnButton1());">
		<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button22 onclick="return ( validate() && link1());">
    </td>
	</tr>
	</table>
	
	<br/>
<br/>


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