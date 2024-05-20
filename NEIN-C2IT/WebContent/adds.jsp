<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
     <jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
String Nnamebring=request.getParameter("Nname");
String NnamebLower=Nnamebring.replaceAll("[\\s.]", " "); 
String Nnameb= NnamebLower.toUpperCase();

System.out.println("Name 1: "+Nnameb);
System.out.println("Name 2: "+Nnamebring);

String Npwdb=request.getParameter("Npwd");
String Naddrb=request.getParameter("Naddr");
String Ncontactnob=request.getParameter("Ncontact");
String Npostb=request.getParameter("Npost");
String adminName = request.getParameter("adminName");
String adminMail = request.getParameter("adminMail");
String reportingOff = request.getParameter("reportingOff");
String Npostingcob=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");
String DESG_NO = request.getParameter("DESG_NO");
String Nno = request.getParameter("Nno");
String form_user = request.getParameter("form_user");
String department = request.getParameter("department");

System.out.println("FORM USER **************************  :"+form_user);
String assignedLocation[] = request.getParameterValues("assignedLocation");
PreparedStatement psmt2=null;
conn = con.getConnection2();
st1 = conn.createStatement();
st3 = conn.createStatement();
st4 = conn.createStatement();

rs2 = st3.executeQuery("SELECT MAIL_ID FROM emp WHERE MAIL_ID='"+Nmail+"'");

rs = st2.executeQuery("select Nname from nentryho where EMP_NO='"+Nno+"'");
if(rs.next()){
	
	//out.println(".........'"+Nnameb+"' IS ALREADY EXIST.......");
	 msg = "...'"+Nno+"'__IS__ALREADY EXIST.......";
}

else{
	
int i=st.executeUpdate("insert into nentryho(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail,DESG_NO,admin,form_user,EMP_NO,department,reportingOff) values('"+idb+"','"+Nnameb+"','"+Npwdb+"','"+Naddrb+"','"+Ncontactnob+"','IT SUPPORT','"+Npostingcob+"','"+Nmail+"','2','NormalAdmin','"+form_user+"','"+Nno+"','"+department+"','"+reportingOff+"')");
                    //int m=st.executeUpdate("insert into formUser_master(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail,DESG_NO,admin) values('"+idb+"','"+Nnameb+"','"+Npwdb+"','"+Naddrb+"','"+Ncontactnob+"','IT SUPPORT','"+Npostingcob+"','"+Nmail+"','2','NormalAdmin')");

//int j=st3.executeUpdate("insert into emp(EMP_NO,EMP_NAME,DESIGNATION,DESG_NO,DEPT_NAME,MAIL_ID,e_city) values('"+Nno+"','"+Nnameb+"','IT SUPPORT','2','IT','"+Nmail+"','"+Npostingcob+"')");
System.out.println("i value  : "+i);
			if(!rs2.next())
			{
			psmt2 = conn.prepareStatement("insert into emp(EMP_NO,EMP_NAME,DESIGNATION,DESG_NO,DEPT_NAME,MAIL_ID,e_city) values(?,?,'IT SUPPORT','2','IT',?,?)");
			psmt2.setString(1,Nno);
			psmt2.setString(2,Nnameb);
			psmt2.setString(3,Nmail);
			psmt2.setString(4,Npostingcob);
			int j = psmt2.executeUpdate();
			System.out.println("j value  : "+j);
			}
//out.println("................................'"+Nnameb+"'   INFORMATION IS   INSERTED   SUCCESSFULLY.......................");
if(form_user.equals("YES")){
	int l=st.executeUpdate("insert into formUser_master(idd,Nname,Npwd,Naddr,Ncontact,Npost,NpostingCo,Nmail,DESG_NO,admin) values('"+idb+"','"+Nnameb+"','"+Npwdb+"','"+Naddrb+"','"+Ncontactnob+"','IT SUPPORT','"+Npostingcob+"','"+Nmail+"','2','NormalAdmin')");
	System.out.println("LL value  : "+l);
   }



if(i>=0){

	try{ System.out.println("inside for try ");
		

PreparedStatement psmt=null;
System.out.println("assignedLocation.length :"+assignedLocation.length);
//Npostingcob=assignedLocation[k]
//st3.executeUpdate("insert into assigned_master(Locname,Locpost,LocID,LocPWD,assignedLocation,delet) values('"+Nnameb+"','"+Npostb+"','"+idb+"','"+Npwdb+"','"+Npostingcob+"','delet')");
for(int k=0;k<assignedLocation.length;k++)
{
	//System.out.println("inside for loop"+assignedLocation[k].length());Npostingcob
    System.out.println("inside for loop , before insert query ");
	//st1.executeUpdate("insert into assigned_master(Locname,Locpost,LocID,LocPWD,assignedLocation,delet,Nmail,department) values('"+Nnameb+"','IT SUPPORT','"+idb+"','"+Npwdb+"','"+assignedLocation[k]+"','"+Npostingcob+"','"+Nmail+"','"+department+"')");
	psmt = conn.prepareStatement("insert into assigned_master(Locname,Locpost,LocID,LocPWD,assignedLocation,delet,Nmail,depart) VALUES (?,'IT SUPPORT',?,?,?,?,?,?)");
	psmt.setString(1,Nnameb);
	psmt.setString(2,idb);
	psmt.setString(3,Npwdb);
	psmt.setString(4,assignedLocation[k]);
	psmt.setString(5,Npostingcob);
	psmt.setString(6,Nmail);
	psmt.setString(7,department);
	
	int h = psmt.executeUpdate();
	
	
	
	//System.out.println("inside for loop , after insert query ");

	//st4.executeUpdate("delete from assigned_master WHERE Locname='"+Nnameb+"' AND assignedLocation='"+Npostingcob+"' AND select(id from assigned_master WHERE Locname='"+Nnameb+"' AND assignedLocation='"+Npostingcob+"') ");
	//delete from master where id NOT IN (select max(id) from master WHERE name='Mohan' AND class='mba')
	//st4.executeUpdate("delete from assigned_master where NOT IN id (select max(id) FROM assigned_master where assignedLocation='"+Npostingcob+"' AND Locname='"+Nnameb+"')");
	//st4.executeUpdate("delete from assigned_master where NOT IN id (select id from (select max(id) from assigned_master where assignedLocation='"+Npostingcob+"' AND Locname='"+Nnameb+"') as deleted )");
 }

//st4.executeUpdate("delete from assigned_master WHERE Locname='"+Nnameb+"' AND assignedLocation='"+Npostingcob+"'");

}
	catch (Exception e) {
		// TODO: handle exception
	}
	


}



postMail.postMail(adminMail,adminName,"pass1234",Nmail," USER ID FOR C2IT PROJECT  :  " +Nnameb, "Welcome To C2IT Software : "+Nnameb+"  <br><br><b> USER ID : <font color=red>" +idb+  "</font><br> "+  " PASSWORD:<font color=red> " +Npwdb+ "</font> <br><br><b><u> Open the following URL in Firefox </u> </b><br> C2IT LINK -  http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - http://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>");
System.out.println("creation of system admin C2IT : THIS IS WORKING 2");
msg = "DETAILS__SAVED__AND__SENT__MAIL__SUCCESSFULLY";
}
response.sendRedirect("createBOMuser.jsp?msg=" +msg);
}catch (Exception e) {
	// TODO: handle exception
}
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st1,conn);
	DbUtil.closeDBResources(null,st2,null);
	DbUtil.closeDBResources(null,st3,null);
	DbUtil.closeDBResources(null,st4,null);
	
	
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
<a href="createBOMuser.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
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
