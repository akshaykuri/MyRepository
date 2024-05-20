<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import= "CON2.Connection2" %> 
<%@ page import="java.io.*" %>     
<%
   String name = request.getParameter( "tbom" );
   session.setAttribute( "theName", name );
%>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOM</title>
</head>
<body>


<%
int f=0;
Connection cn =null; 
Statement st = null; 
ResultSet rs = null; 
String msg=null;
String sn=null;
String sn1=null;
String desg=null,realname=null,city=null,Initiator=null;
try
{
cn = con.getConnection2();
System.out.println("------------------"+cn);
st=cn.createStatement();
String n = request.getParameter("tbom");
String p = request.getParameter("t2");
String q = request.getParameter("nameee");
rs = st.executeQuery("select * from nentrybom where idd = '"+n+"' and Npwd = '"+p+"'");
%>

<%while(rs.next()){ %> 
<% sn=rs.getString("idd");%>
<% sn1=rs.getString("Npwd");
   desg = rs.getString("Npost");
   realname = rs.getString("Nname");
   city =rs.getString("NpostingCo");
   Initiator = rs.getString("Nmail");
 %>
<%} %> 
<% 
   if(n.equals(sn) && p.equals(sn1))
	 { 

	   session.setAttribute("desg",desg);
	   response.sendRedirect("BOMPage.jsp?msg=1");
	   session.setAttribute("Nname",realname);
	   session.setAttribute("NpostingCo",city);
	   session.setAttribute("Nmail",Initiator);
	 }
   else
   {

	  
	    msg="....Sorry... \t Please \t Enter Valid Username & Password";
		   System.out.println("Sorry  \n Please Enter Valid Username & Password");
		   response.sendRedirect("loginBOM.jsp?msg="+msg);	
			
   }
}



catch(Exception e)
{
	e.printStackTrace();
}
%>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="5" color="white"><b>MUMBAI BRANCH</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="5" color="white">PURCHASE ORDER MANAGMENT SYSTEM (PO-SOFT)</font></strong></td></tr>
</table>



<br />
<br />
<br />
<br />
<br />

<table width="1120" height="63" border="0" cellpadding="0" cellspacing="0" ID="Table1">
  <tr>
    
    <td align="right" valign="top">
    
    <table width="290" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
	<tr>
		<td height="11" align="right" valign="top">
		<img src="bullet_button.gif" width="11" height="11" border="0"><a><span class="link12b">-ENTER VALID ID and PASSWORD</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
		<img src="bullet_button.gif" width="11" height="11" border="0"><a><span class="link12b">-try again</span></a> </td>
	</tr>
	
	</table></td>
</tr>
</table>


<br>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="45" width="45"></a> <address>HOME</address>
</td> 

<td width="115" align="right"> 
<a href="loginBOM.jsp?msg=1"><img src="bakk.png" border="0" height="45" width="45"></a><address>BACK</address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED</font></strong></td>
    
  </tr>
</table> 






</div>
</body>
</html>

