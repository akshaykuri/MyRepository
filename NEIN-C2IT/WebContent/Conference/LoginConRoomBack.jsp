<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import= "CON2.Connection2" %> 
<%@page import= "CON2.ConnectionLMS" %> 
<%@ page import="java.io.*" %>   
<%@ page import = "java.util.ResourceBundle" %>
<%
   String name = request.getParameter( "tho" );
   session.setAttribute( "theName", name );
%>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HO</title>
</head>
<body>


<%
int f=0,flag=0;
Connection cn =null,lms=null; 
Statement st = null,stlms=null; 
ResultSet rs = null,rslms=null; 
String sn=null;
String msg=null;
String sn1=null;
String emailLms=null,emp_idLms=null,password=null,fullname,rights,bno,deptid;
String desg = null,DESG_NO=null,realname = null,city=null,Initiator=null,noo=null,admin=null,newinsUser=null,deptName=null,subDept=null,emp_no=null;
try
    {
	lms = conlms.getConnectionlms();
	stlms=lms.createStatement();
	String uid = request.getParameter("t1");
	String pwd = request.getParameter("t2");
	//rslms = stlms.executeQuery("SELECT email,emp_id,password FROM user WHERE emp_id='"+uid+"' AND password='"+pwd+"'");
	rslms = stlms.executeQuery("SELECT u.`full_name`,u.email,u.emp_id,u.password,b.branch_type_code,r.rights,d.department_id FROM user u INNER JOIN branchmaster b ON b.branch_id=u.branch_id INNER JOIN user_rights r ON r.user_id=u.user_id INNER JOIN department d ON d.department_id=u.department_id WHERE u.emp_id='"+uid+"' AND u.password='"+pwd+"'");
	
	if(rslms.next())
	     {  System.out.println("Hereeeeeeeeeeeeeee");
		 flag=1;
		 emailLms = rslms.getString("email");
		 emp_idLms = rslms.getString("emp_id");
		 password = rslms.getString("password");
		 fullname = rslms.getString("full_name");
		 bno = rslms.getString("branch_type_code");
		 deptid=rslms.getString("department_id");
		 rights=rslms.getString("rights");
		 
		 System.out.println("Hereeeeeeeeeeeeeee"+deptid);

		 session.setAttribute("empid",emp_idLms);
		 session.setAttribute("fullname",fullname);
		 session.setAttribute("bno",bno);
		 session.setAttribute("rights",rights);
		 session.setAttribute("deptid",deptid);
	     }    	
     if(flag==1)
	     {  System.out.println("Hereeeeeeeeeeeeeee1111");
		 response.sendRedirect("ConRoomHome.jsp?msg=1");	
		 }
	 else
	     {
     	 msg="__Sorry__Please__Enter__Valid__Username__&__Password";
		 response.sendRedirect("LoginConRoom.jsp?msg="+msg);	
	     }
    }catch(Exception e)
       {
	   e.printStackTrace();
      }
finally {
	 DbUtil.closeDBResources(rs,st,cn);
	 DbUtil.closeDBResources(rslms,stlms,lms);
}
%>

<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">

<div id="wrapper">
<img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="30" width="100" align="right">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="5" color="white"><b>NEIN-C2IT</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="5" color="white">ERROR</font></strong></td></tr>
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
<a href="LoginConRoom.jsp?msg=1"><img src="bakk.png" border="0" height="45" width="45"></a><address>BACK</address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#2f4377"><strong><font size ="3" color="white"> NIPPON EXPRESS (INDIA) PRIVATE LIMITED </font></strong></td>
    
  </tr>
</table> 






</div>
</body>
</html>

