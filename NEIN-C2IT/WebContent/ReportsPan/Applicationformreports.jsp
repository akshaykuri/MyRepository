<%@page import="CON2.DbUtil"%>
<%@page import="java.util.Date"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat" %>
<%@ include file="../../banner.jsp" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico" />
	<body background =".jpg" >

<head><title>MGMT REPORT</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/faviconnnnn.ico">
<link rel='stylesheet' type='text/css' href='../css/homePage.css' />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
</head>


<%
session.setMaxInactiveInterval(20*60);

if((session==null||session.getAttribute( "Nname" )==null)||(session.getAttribute( "NpostingCo" )==null))
{
	String msg2=null;
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("../../adminlink.jsp?msg="+msg2);
}
%>
<script language="javascript" type="text/javascript">
function validate4()
{	 var p1=document.form.branch;var y1=document.form.year;var y2=document.form.month;
 if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
  if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select Year!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL"))
				{ alert("Select Month!"); y2.focus(); return false; }
   else
	return true;
}  
</script>

<body bgcolor="" leftmargin="80" rightmargin="80"  >


<div id="wrapper">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
    
    </tr>
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">MANAGEMENT REPORT</font></strong></td>
</tr>
 
  <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>
<%-- <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><font color="blue"> 
<%= session.getAttribute( "NpostingCo" ) %>-BRANCH</font>
</td>
<!-- <td width="1118" align="right"> 
<a href="../logout.jsp"><font size=2>LOGOUT</font></a>
</td>  -->
</tr> 
</table>
<br />
<br /> --%>
<%
String AdminName=null,desg=null,empno=null,b_no=null,f=null,date=null,cdate=null;
AdminName = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
empno = (String) session.getAttribute("EmpNo");
b_no = (String) session.getAttribute("b_no");
%>
<%
Connection cn1 = null;
Statement st1 = null,st2=null; 
ResultSet rs1 = null,rs2=null;
Date d=new Date();
int year=d.getYear();
int currentyear=year+1900;
try{
	cn1 = con.getConnection2();
	st1=cn1.createStatement();
	rs1= st1.executeQuery("select * From branch_master_main where m_b_no='"+b_no+"'");

%>
<form name="form" method="post" action="reportform.jsp">

<br>
<br>	 
	 
  <table width="20%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
  <tr>
   <td bgcolor="#2f4377" ALIGN="center">
     <font size ="3" color="white">APPLICATION FORMS REPORT</font>
     </td>
     </tr>
  <%
  if(!b_no.equals("90")){
  %>
   <tr align='center'>
   <td width="30%" colspan="5">
   <label>Branch</label>
   <select name='branch'>
   <option value="NULL">SELECT</option>
   
    
                                                
										        <%while(rs1.next()){ %> 
										        
										         <option ><%=rs1.getString("m_b_name")%> </option>
										        <%}%> 
										        </select>
      
 </td>
 </tr>
 <%
 }else{
	 st2=cn1.createStatement();
		rs2= st2.executeQuery("select * From branch_master_main where m_b_no in ('90','10','31','51','30','20','54','40')"); 
	 
	 %>
 <tr align='center'>
   <td colspan="5">
   <label>Branch</label>
   <select name='branch'>
   <option value="NULL">SELECT</option>
   <option value="ALL">ALL</option> 
                                              
										        <%while(rs2.next()){ %> 
										        
										         <option ><%=rs2.getString("m_b_name")%> </option>
										        <%}%> 
										        </select>
										        <%} %>
 <tr align='center'>
   <td colspan="5">
   <label>Year</label>
   <select name='year'>
   <option value="NULL">SELECT</option> 
                                                
										       
										        
										         <option ><%=currentyear%> </option>
										        
										        </select>
   
   
 </td>
 </tr>
 <tr align='center'>
 <td colspan="5">
 <label>Month</label>
 <select name='month'>
   <option value="NULL">SELECT</option>
   
   <%SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");  
   Date d1=new Date();
   cdate=formatter.format(d1);
   System.out.println(cdate);
   String [] dateString=cdate.split("/");
   if(dateString[1].equals("Jan")){%>
    <option value="01-December">Dec</option>
    <%}else if(dateString[1].equals("Feb")){ %>                                            
	<option value="01-January">Jan</option>									       
	<%}else if(dateString[1].equals("Mar")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>
	<%}else if(dateString[1].equals("Apr")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>
	<%}else if(dateString[1].equals("May")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>									        
	<%}else if(dateString[1].equals("Jun")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<%}else if(dateString[1].equals("Jul")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<option value="01-June">Jun</option>
	<%}else if(dateString[1].equals("Aug")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<option value="01-June">Jun</option>
	<option value="01-July">Jul</option>
	<%}else if(dateString[1].equals("Sep")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<option value="01-June">Jun</option>
	<option value="01-July">Jul</option>
	<option value="01-August">Aug</option>
	<%}else if(dateString[1].equals("Oct")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<option value="01-June">Jun</option>
	<option value="01-July">Jul</option>
	<option value="01-August">Aug</option>
	<option value="01-September">Sep</option>
	<%}else if(dateString[1].equals("Nov")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<option value="01-June">Jun</option>
	<option value="01-July">Jul</option>
	<option value="01-August">Aug</option>
	<option value="01-September">Sep</option>
	<option value="01-October">Oct</option>
	<%}else if(dateString[1].equals("Dec")){ %>
	<option value="01-January">Jan</option>
	<option value="01-February">Feb</option>													        
	<option value="01-March">Mar</option>									        
	<option value="01-April">Apr</option>
	<option value="01-May">May</option>
	<option value="01-June">Jun</option>
	<option value="01-July">Jul</option>
	<option value="01-August">Aug</option>
	<option value="01-September">Sep</option>
	<option value="01-October">Oct</option>
	<option value="01-November">Nov</option>
</select>
   
   
 </td>
 </tr>
 <%}else{
		out.println("Months Working Fine");
 } %>	
      

	<tr align="center">
	   
	      
	<td align="center" colspan="2">
	<input style="background-color:#2f4377;font-weight:bold;color:white;" type="submit" align="middle" name="subpopup" value="DISPLAY" onclick="return validate4()"/>
	
	</td>
	
	</tr>
	</table>

	
	
	</form>

	
	<br>
<br>
<br>
<br>
<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	
  }
	%>






<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../adminbom.jsp?msg=1"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
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