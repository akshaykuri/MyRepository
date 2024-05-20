<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@ include file="banner.jsp" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>REFERAL add PAGE</title>
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
</head>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<div id="wrapper">
<form>

<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">






<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b> AUTHORIZATION MASTER</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">PURCHASE TO PAYABLE (P2P-Soft)</font></strong></td></tr>
</table>
<br>
<br>


<br>
<br><br>
<br>

<center><font size=4 ><b>

<%
Connection cn = null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null; 
try{
cn = con.getConnection2();
st=cn.createStatement();

st2=cn.createStatement();
String msg = null;
String EMP_NO=request.getParameter("EMP_NO");
String EMP_NAME=request.getParameter("EMP_NAME");
String DESIGNATION=request.getParameter("DESIGNATION");
String DESG_NO=request.getParameter("DESG_NO");
String DEPT_NAME=request.getParameter("DEPT_NAME");
String MAIL_ID=request.getParameter("MAIL_ID");
rs = st.executeQuery("select EMP_NO FROM emp where EMP_NO='"+EMP_NO+"'");
rs2 = st2.executeQuery("select EMP_NAME from emp where EMP_NAME='"+EMP_NAME+"'");
if(rs2.next()){
	
	//out.println(".........'"+EMP_NAME+"' IS ALREADY EXIST.........");
	 msg = "...'"+EMP_NAME+"'__IS__ALREADY EXIST.......";
}


/*  if(rs.next())
{
	out.println(" Please Enter Integer Value");
} 
 */
else
{




int i=st.executeUpdate("insert into emp(EMP_NO,EMP_NAME,DESIGNATION,DESG_NO,DEPT_NAME,MAIL_ID) values('"+EMP_NO+"','"+EMP_NAME+"','"+DESIGNATION+"','"+DESG_NO+"','"+DEPT_NAME+"','"+MAIL_ID+"')");

//out.println("................................\n '"+EMP_NAME+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+EMP_NAME+"'__SAVED__SUCCESSFULLY";
}

response.sendRedirect("Designation.jsp?msg="+msg);
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,cn);
			DbUtil.closeDBResources(rs2,st2,null);
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
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>


<td width="115" align="right"> 
<a href="Designation.jsp"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 

</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white">NIPPON EXPRESS (INDIA) PRIVATE LIMITED  </font></strong></td>
    
  </tr>
</table> </b></font></center></form>
</div>




</body>
</html>
