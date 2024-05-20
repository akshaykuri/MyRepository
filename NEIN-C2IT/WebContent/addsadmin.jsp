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

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
<div id="wrapper">
<form>
<img src="images/nippon.gif" height="35" width="220"> <img src="images/p2p4.jpg" height="30" width="100" align="right">



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>NEW ADMINISTRATION</b><br />
    
 </font></strong></td></tr>
 <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">PURCHASE TO PAYABLE (P2P-Soft)</font></strong></td></tr>
</table>

<br>
<br>


<br>
<br><br>
<br><pre></pre>
<p></p>

<center><font size=4 ><b>
<%
Connection cn = null,cn2=null,cn3=null; 
Statement st = null,st2=null,st3=null; 
ResultSet rs = null,rs2=null,rs3=null; 
try{
cn = con.getConnection2();
st=cn.createStatement();
String msg = null;
st2=cn.createStatement();
st3=cn.createStatement();
String NAME=request.getParameter("Nname");

System.out.println("LOWER :"+NAME);
String Nname= NAME.toUpperCase();

System.out.println("CAPS :"+Nname);

String UID=request.getParameter("UID");
String UPWD=request.getParameter("UPWD");
String adminNameLower = request.getParameter("adminName");
String adminName= adminNameLower.toUpperCase();

String adminMail = request.getParameter("adminMail");
String post=request.getParameter("post");
String city=request.getParameter("city");
String Nmail=request.getParameter("Nmail");
String Naddr=request.getParameter("Naddr");
String newinsUser = request.getParameter("newinsUser");
String Ncontact=request.getParameter("Ncontact");
String branch_no = request.getParameter("branch_no");
String right = request.getParameter("right");
String DESG_NO = request.getParameter("DESG_NO");
System.out.println("DESG NO *********   : "+DESG_NO);
String Nno = request.getParameter("Nno");
String DEPT_NAME = request.getParameter("DEPT_NAME");
rs2 = st2.executeQuery("select Nname from login where Nno='"+Nno+"'");
if(rs2.next()){
	msg = "...'"+Nno+"'__IS__ALREADY EXIST.......";
}
rs3 = st3.executeQuery("select UID from login where UID='"+UID+"'");
if(rs3.next()){
	msg = "...'"+UID+"'__IS__ALREADY EXIST.......";
}
else
{

int i=st.executeUpdate("insert into login(Nname,UID,UPWD,post,city,Nmail,DESG_NO,Nno,DEPT_NAME,admin,Naddr,Ncontact,b_no,rights,newinsUser) values('"+Nname+"','"+UID+"','"+UPWD+"','"+post+"','"+city+"','"+Nmail+"','"+DESG_NO+"','"+Nno+"','"+DEPT_NAME+"','SuperAdmin','"+Naddr+"','"+Ncontact+"','"+branch_no+"','"+right+"','"+newinsUser+"')");
int n=st.executeUpdate("insert into nentryho(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail,DESG_NO,admin,branch_no) values('"+UID+"','"+Nname+"','"+UPWD+"','"+Naddr+"','"+Ncontact+"','"+post+"','"+city+"','"+Nmail+"','"+DESG_NO+"','SuperAdmin','"+branch_no+"')");
int m=st.executeUpdate("insert into formUser_master(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail,DESG_NO,admin,branch_no,EMP_NO) values('"+UID+"','"+Nname+"','"+UPWD+"','"+Naddr+"','"+Ncontact+"','"+post+"','"+city+"','"+Nmail+"','"+DESG_NO+"','SuperAdmin','"+branch_no+"','"+Nno+"')");
int j=st.executeUpdate("insert into emp(EMP_NO,EMP_NAME,DESIGNATION,DESG_NO,DEPT_NAME,MAIL_ID,e_city) values('"+Nno+"','"+Nname+"','"+post+"','"+DESG_NO+"','"+DEPT_NAME+"','"+Nmail+"','"+city+"')");
//if((!DESG_NO.equals("NULL")) && DESG_NO.equals("7"))
	
if((!post.equals("NULL")) && (post.equals("GENERAL MANAGER") || post.equals("ASST. GENERAL MANAGER") || post.equals("JOINT GENERAL MANAGER") ) )
{ //7 GENERAL MANAGER 7 
	//System.out.println("FIRST IS WORKING ");
int k=st.executeUpdate("insert into handling_master(Locname,locpost,assignedLocation,LocID,LocPWD,delet,mailid,EMP_NO) values('"+Nname+"','"+post+"','"+city+"','"+UID+"','"+UPWD+"','"+city+"','"+Nmail+"','"+Nno+"')");
postMail.postMail(adminMail,adminName,"pass1234",Nmail," USER ID FOR C2IT PROJECT  :  " +Nname, "Welcome To C2IT Software: "+Nname+"  <br><br><b> USER ID : <font color=red>" +UID+  "</font><br> "+  " PASSWORD:<font color=red> " +UPWD+ "</font> <br><br><b><u> Open the following URL in Internet Explorer/Firefox </u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
System.out.println("THIS IS WORKING 1 ");
}

msg = "DETAIL__SAVED__AND__SENT__MAIL__SUCCESSFULLY";
postMail.postMail(adminMail,adminName,"pass1234",Nmail," USER ID FOR C2IT PROJECT  :  " +Nname, "Welcome To C2IT Software: "+Nname+"  <br><br><b> USER ID : <font color=red>" +UID+  "</font><br> "+  " PASSWORD:<font color=red> " +UPWD+ "</font> <br><br><b><u> Open the following URL in Internet Explorer/Firefox </u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
System.out.println("THIS IS WORKING 2");
}



response.sendRedirect("createadmin.jsp?msg=" +msg);
}
catch (Exception e) {
	// TODO: handle exception
}
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs3,st3,cn3);

	
	
}

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
<a href="createadmin.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
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
