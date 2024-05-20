<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<form>
<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>USER ADMINISTRATION</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">PURCHASE ORDER MANAGMENT SYSTEM (PO-SOFT)</font></strong></td></tr>
</table>

<br>
<br>


<br>
<br><br>
<br><pre></pre>
<p></p>

<center><font size=4 ><b>
<%
Connection cn = null,cn2=null; 
Statement st = null,st2=null; 
ResultSet rs = null; 
cn = con.getConnection2();
st=cn.createStatement();


cn2 = con.getConnection2();
st2 = cn2.createStatement();


String idb=request.getParameter("idd");
String Nnameb=request.getParameter("Nname");
String Npwdb=request.getParameter("Npwd");
String Naddrb=request.getParameter("Naddr");
String Ncontactnob=request.getParameter("Ncontact");
String Npostb=request.getParameter("Npost");
String Npostingcob=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");

String msg = null;
rs = st2.executeQuery("select idd from nentrymaa where idd='"+idb+"'");
if(rs.next()){
	
	//out.println(".........'"+idb+"' IS ALREADY EXIST.......");
	 msg = "...'"+idb+"'__IS__ALREADY EXIST.......";
}

else{
int i=st.executeUpdate("insert into nentrymaa(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail) values('"+idb+"','"+Nnameb+"','"+Npwdb+"','"+Naddrb+"','"+Ncontactnob+"','"+Npostb+"','"+Npostingcob+"','"+Nmail+"')");

//out.println("................................'"+Nnameb+"'   INFORMATION IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+Nnameb+"'__SAVED__SUCCESSFULLY";
}
response.sendRedirect("MaaUser.jsp?msg=" +msg);
%></b>
</font>
</center></form></div>

<br>
<br />
<br />
<br />
<br />
<br />


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a> 
<address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="MaaUser.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"><marquee> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </marquee> </font></strong></td>
    
  </tr>
</table> 




</body>
</html>
