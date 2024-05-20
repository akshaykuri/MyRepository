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
    <td bgcolor="#ec691f"><strong><font size ="4" color="white"><b>USER FORM ADMINISTRATION</b><br />
    
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
Statement st = null,st2=null,st1=null,st3=null,st4=null; 
ResultSet rs = null,rs2=null; 
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();
String msg = null;
//String []assignedLocation=null;
String idb=request.getParameter("idd");
String NnamebLower=request.getParameter("Nname");
String Nnameb= NnamebLower.toUpperCase();

String Npwdb=request.getParameter("Npwd");
String Naddrb=request.getParameter("Naddr");
String Ncontactnob=request.getParameter("Ncontact");
String Npostb=request.getParameter("Npost");
String adminName = request.getParameter("adminName");
String adminMail = request.getParameter("adminMail");
String Npostingcob=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");
String DESG_NO = request.getParameter("DESG_NO");
String Nno = request.getParameter("Nno");//Nno
String deptName =request.getParameter("deptName");
String subDept = request.getParameter("subDept");
String designation = request.getParameter("designation");
String desg_no = request.getParameter("desg_no");

rs = st2.executeQuery("select Nname from formUser_master where EMP_NO='"+Nno+"'");
if(rs.next()){
	
	//out.println(".........'"+Nnameb+"' IS ALREADY EXIST.......");
	 msg = "ALREADY EXIST.......";
}

else{
int i=st.executeUpdate("insert into formUser_master(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail,DESG_NO,admin,deptName,subDept,EMP_NO) values('"+idb+"','"+Nnameb+"','"+Npwdb+"','"+Naddrb+"','"+Ncontactnob+"','"+designation+"','"+Npostingcob+"','"+Nmail+"','"+desg_no+"','NormalAdmin','"+deptName+"','"+subDept+"','"+Nno+"')");
int j=st.executeUpdate("insert into emp(EMP_NO,EMP_NAME,DESIGNATION,DESG_NO,DEPT_NAME,MAIL_ID,e_city) values('"+Nno+"','"+Nnameb+"','"+designation+"','"+desg_no+"','"+deptName+"','"+Nmail+"','"+Npostingcob+"')");
//out.println("................................'"+Nnameb+"'   INFORMATION IS   INSERTED   SUCCESSFULLY.......................");

System.out.println("i value  : "+i);
postMail.postMail(adminMail,adminName,"pass1234",Nmail," USER ID FOR C2IT APPLICATION  :  " +Nnameb, "Welcome To C2IT Software: "+Nnameb+"  <br>Application Form :<br><b> USER ID : <font color=red>" +idb+  "</font><br> "+  " PASSWORD:<font color=red> " +Npwdb+ "</font> <br><br><b><u> Open the following URL in Firefox </u> </b><br> Common link -  http://10.206.10.3:8185/NEIN/  <br> C2IT link - http://10.206.10.3:8185/NEIN-C2IT/HOME.jsp  <br><br><br><br>");
System.out.println("THIS IS WORKING 2");

msg = "DETAILS__SAVED__AND__SENT__MAIL__SUCCESSFULLY";
}
response.sendRedirect("createFormUser.jsp?msg=" +msg);

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally {
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(null,st1,conn );
	DbUtil.closeDBResources(rs2,st2,null );
	DbUtil.closeDBResources(null,st3,null );
	DbUtil.closeDBResources(null,st4,null );
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
