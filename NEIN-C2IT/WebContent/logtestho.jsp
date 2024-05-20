<%@page import="CON2.DbUtil"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import= "CON2.Connection2" %> 
<%@page import= "CON2.ConnectionLMS" %> 
<%@page import="java.io.*" %>   
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 

<%
	String name = request.getParameter( "tho" );
	String IPADDRESS 	= request.getRemoteAddr();;
	System.out.println("IPADDRESS====>"+IPADDRESS);
	session.setAttribute( "theName", name );
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>HO</title>
	</head>
<%
int f=0;
PreparedStatement psmt=null;
Connection cn =null,lms=null; 
Statement st = null,stlms=null,stlms1=null; 
ResultSet rs = null,rslms=null,rslms1=null; 
String sn=null;
String msg=null;
String sn1=null;
String desg = null,realname = null,city=null,Initiator=null,noo=null,Subcity=null,emp_no=null;
String admin=null;
String emailLms=null,emp_idLms=null,department=null;
try{
	lms = conlms.getConnectionlms();
	stlms=lms.createStatement();
	String uid = request.getParameter("tho");
	String pwd = request.getParameter("t2");
	rslms = stlms.executeQuery("SELECT email,emp_id FROM user WHERE emp_id='"+uid+"' AND password='"+pwd+"'");
	if(rslms.next()){
		emailLms = rslms.getString("email");
		emp_idLms = rslms.getString("emp_id");
	}

	System.out.println("Emp LMS "+emp_idLms+"  EMAIL LMS"+emailLms);
	System.out.println("Emp uid "+uid+"  pwd "+pwd);

	if(((emailLms!=null) && emp_idLms!=null) ||((uid!=null) && (pwd!=null))){
		cn = con.getConnection2();
		System.out.println("------------------"+cn);
		st=cn.createStatement();
		String n = request.getParameter("tho");
		String p = request.getParameter("t2");
		String q = request.getParameter("nameee");

		rs = st.executeQuery("SELECT n.idd,n.Npwd,n.Npost,n.Nname,n.NpostingCo,b.m_b_no,n.Nmail,n.admin,a.assignedLocation,n.EMP_NO,a.depart FROM nentryho n INNER JOIN branch_master_main b ON(substr(n.NpostingCo,-2,2)=b.m_b_no) INNER JOIN assigned_master a ON(n.Nname=a.Locname) where (n.EMP_NO = '"+emp_idLms+"') || (n.idd = '"+n+"' and n.Npwd = '"+p+"') LIMIT 1");
		System.out.println("HO LOGIN ID Name: "+n);
		while(rs.next()){
			sn=rs.getString(1);
			sn1=rs.getString(2);
			desg = rs.getString(3);
			realname = rs.getString(4);
			city =rs.getString(5);
			noo = rs.getString(6);
			Initiator = rs.getString(7);
			admin = rs.getString(8);
			Subcity =rs.getString(9);
			emp_no = rs.getString(10);
			department = rs.getString(11);
		}

		if((n.equals(sn) && p.equals(sn1))  || (uid.equals(emp_no))){
			session.setAttribute("desg",desg);
			session.setAttribute("Nname",realname);
			session.setAttribute("NpostingCo",city);
			session.setAttribute("city",city);
			session.setAttribute("b_no",noo);
			session.setAttribute("admin",admin);

			String emailLms1="";
			stlms1=lms.createStatement();
			rslms1 = stlms1.executeQuery("SELECT email FROM user WHERE emp_id='"+emp_no+"' ");
			if(rslms1.next()){
				emailLms1 = rslms1.getString("email");
				System.out.println("HO LOGIN Name emailLms1emailLms1: "+emailLms1);
			}

			session.setAttribute("Nmail",emailLms1);
			session.setAttribute("SubCity",Subcity);
			session.setAttribute("department",department);
			session.setAttribute("empid",emp_no);
			session.setAttribute("emp_no",emp_no);

			System.out.println(" STATUS:    NAME : "+session.getAttribute( "Nname" )+"    DESIGNATION : "+session.getAttribute( "desg" )+"    CITY : "+session.getAttribute( "NpostingCo" )+"NOO : "+session.getAttribute( "b_no" )+"department :"+session.getAttribute( "department" ));
			
			psmt = cn.prepareStatement("insert into useraudittrial(empID,systemIP,action,date,time,empName) values(?,?,?,current_date(),current_time(),?)");
			psmt.setString(1,emp_no);
			psmt.setString(2,IPADDRESS);
			psmt.setString(3,"Admin Login");
			psmt.setString(4,emp_no+" - "+realname.toUpperCase());
			psmt.executeUpdate();

			response.sendRedirect("OtherPage.jsp?msg=1");
		}else{
			msg="__Sorry__Please__Enter__Valid__Username__&__Password";
			System.out.println("HO  "+n+" Entered Wrong PWD: "+p);
			response.sendRedirect("loginho.jsp?msg="+msg);
		}
	}else{
		msg="__Sorry__Please__Enter__Valid__Username__&__Password";
		response.sendRedirect("loginho.jsp?msg="+msg);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,cn);
}
%>
	<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
		<div id="wrapper">
			<img src="images/nippon.gif" height="35" width="220"> <img src="images/.jpg" height="30" width="100" align="right">
			<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
				<tr align="center">
					<td bgcolor="#ec691f"><strong><font size ="5" color="white"><b>NEIN-C2IT</b><br /></font></strong></td>
				</tr>
				<tr align="center">
					<td bgcolor="#2f4377"><strong><font size ="5" color="white"></font></strong></td>
				</tr>
			</table>

<br /><br /><br /><br /><br />

			<table width="1120" height="63" border="0" cellpadding="0" cellspacing="0" ID="Table1">
				<tr>
					<td align="right" valign="top">
						<table width="290" height="100%" border="0" cellpadding="0"  cellspacing="0" ID="Table2">
							<tr>
								<td height="11" align="right" valign="top">
									<img src="bullet_button.gif" width="11" height="11" border="0"><a><span class="link12b">-ENTER VALID ID and PASSWORD</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
									<img src="bullet_button.gif" width="11" height="11" border="0"><a><span class="link12b">-try again</span></a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

<br>

			<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
				<tr>
					<td width="1000" align="left"> 
						<a href="HOME.jsp"><img src="home12.jpg" border="0" height="45" width="45"></a> <address>HOME</address>
					</td>
					<td width="115" align="right">
						<a href="loginho.jsp?msg=1"><img src="bakk.png" border="0" height="45" width="45"></a><address>BACK</address>
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