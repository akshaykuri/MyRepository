<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>


<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">
<form>

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>NEWINS</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white"></font></strong></td></tr>
</table>

<br>
<br>


<br>
<br><br>
<br><pre></pre>
<p></p>

<center><font size=4 ><b>
<%
Connection cn = null,conn=null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null; 
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();
try{
String msg = null;
String name=request.getParameter("name");
String EmpNo=request.getParameter("EmpNo");

String adminName = request.getParameter("adminName");
String adminMail = request.getParameter("adminMail");

String Designation=request.getParameter("Designation");
String Mail_id=request.getParameter("Mail_id");

System.out.println("Name :  : "+name);

rs2 = st2.executeQuery("SELECT name FROM ho_finance_account_master WHERE name ='"+name+"'");
if(rs2.next()){
	           msg = "'"+name+"'__Details__Is__Already__Exist";
              }

else{
int i=st.executeUpdate("insert into ho_finance_account_master(Name,emp_id,Designation,Mail_id) values('"+name+"','"+EmpNo+"','"+Designation+"','"+Mail_id+"')");
           
postMail.postMail(adminMail,adminName,"pass1234",Mail_id," USER ID FOR C2IT PROJECT  :  " +name, "Welcome To C2IT Software: "+name+"  <br><br><b>Your details is inserted in master to User NEWINS Approval Routine<br><br><b><u> Open the following URL in Internet Explorer/Firefox </u> </b><br> Local LAN (Within Office) -  http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br> Public Domain (Outside Office) - http://203.124.152.2:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
System.out.println("THIS IS WORKING 2");

msg = "'"+name+"'__DETAILS__SAVED__SUCCESSFULLY";
}
response.sendRedirect("createUserNewinsAccounts.jsp?msg=" +msg);
%></b>
</font>
</center></form></div>
	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,conn);
	

  }
	%>
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
<a href="createFormUser.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> 




</body>
</html>
