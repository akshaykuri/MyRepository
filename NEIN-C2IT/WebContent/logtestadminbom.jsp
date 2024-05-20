<%@page import="CON2.DbUtil"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import= "CON2.Connection2" %> 
<%@page import= "CON2.ConnectionLMS" %> 
<%@page import="java.io.*" %>     

<%
	String name = request.getParameter( "t1" );
	String IPADDRESS 	= request.getRemoteAddr();;
	System.out.println("IPADDRESS====>"+IPADDRESS);
	session.setAttribute( "theName", name );
%>

<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ADMIN</title>
	</head>
	<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
		<div id="wrapper">
			<img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="30" width="100" align="right">
<%
int f=0;
Connection cn =null,lms=null;
PreparedStatement psmt=null;
Statement st = null,stlms=null; 
ResultSet rs = null,rslms=null; 
Statement stlms1=null; 
ResultSet rslms1=null; 
String sn=null;
String sn1=null;
String msg=null;
String desg=null,realname=null,branchname= null,Initiator=null,adminwho=null,noo=null,dept_name=null,EmpNo=null,AdminRights=null;
String newinsUser=null;
String emailLms=null,emp_idLms=null;
try{
	lms = conlms.getConnectionlms();
	stlms=lms.createStatement();
	String uid = request.getParameter("t1");
	String pwd = request.getParameter("t2");
	rslms = stlms.executeQuery("SELECT email,emp_id FROM user WHERE emp_id='"+uid+"' AND password='"+pwd+"'");
	if(rslms.next()){
		 emailLms = rslms.getString("email");
		 emp_idLms = rslms.getString("emp_id");
	}

	System.out.println("Emp LMS "+emp_idLms+"  EMAIL HRMS"+emailLms);	
	if(((emailLms!=null) && emp_idLms!=null) ||(uid!=null) && (pwd!=null)){
		cn = con.getConnection2();
		st=cn.createStatement();
		System.out.println("INSIDE IF Emp LMS "+emp_idLms+"  EMAIL LMS"+emailLms);
		String n = request.getParameter("t1");
		String p = request.getParameter("t2");
		System.out.println("n value "+n);
		System.out.println("uid value "+uid);
		System.out.println("p value "+p);
		System.out.println("pwd value  "+pwd);

		if((emp_idLms==null)||(emp_idLms.equals(null))||(emp_idLms.equals("null"))||(emp_idLms.equals(""))){
			System.out.println("if ********************************************");
			rs = st.executeQuery("select * from login INNER JOIN branch_master_main ON(SUBSTR(login.city,-2,2)=branch_master_main.m_b_no) where (UID = '"+n+"' and UPWD = '"+p+"')");
		}else{
			System.out.println("else  ********************************************");
			rs = st.executeQuery("select * from login INNER JOIN branch_master_main ON(SUBSTR(login.city,-2,2)=branch_master_main.m_b_no) where ((Nno = '"+emp_idLms+"') OR (Nmail = '"+emp_idLms+"')) OR (UID = '"+n+"' and UPWD = '"+p+"')");
		}

		while(rs.next()){
			sn=rs.getString("UID");
			sn1=rs.getString("UPWD");
			desg = rs.getString("post");
			realname = rs.getString("Nname");
			branchname = rs.getString("city");
			Initiator = rs.getString("Nmail");
			adminwho = rs.getString("admin");
			noo = rs.getString("m_b_no");
			dept_name = rs.getString("DEPT_NAME");
			System.out.println("DEPT NAME :"+dept_name);
			EmpNo = rs.getString("Nno");
			AdminRights = rs.getString("rights");
			newinsUser = rs.getString("newinsUser");
			System.out.println("inside While Full Name: "+realname);
		}

		System.out.println("inside While uid: "+uid);
		System.out.println("inside While uid: "+EmpNo);
		System.out.println("inside While pwd: "+pwd);
		System.out.println("inside While pwd: "+Initiator);

		if((uid.equals(EmpNo)) || n.equals(sn) && p.equals(sn1)){
			session.setAttribute("Nname",realname);
			session.setAttribute("city",branchname);
			session.setAttribute("NpostingCo",branchname);
			String emailLms1="",ndesgLms=""; 
			stlms1=lms.createStatement();

			rslms1 = stlms1.executeQuery("SELECT DISTINCT rr.role_code,u.email FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id WHERE ( u.emp_id ='"+EmpNo+"' ) AND u.employee_status = 'yes' ");
			if(rslms1.next()){
				emailLms1 = rslms1.getString("email");
				ndesgLms=rslms1.getString(1);
				System.out.println("HO LOGIN Name emailLms1emailLms1: "+emailLms1);
				System.out.println("HO LOGIN Name ndesgndesgndesg: "+ndesgLms);
			}
	  
			session.setAttribute("desg",ndesgLms);
			session.setAttribute("Nmail",emailLms1);
			session.setAttribute("admin",adminwho);
			session.setAttribute("m_b_no",noo);
			session.setAttribute("b_no",noo);
			session.setAttribute("EmpNo",EmpNo);
			session.setAttribute("emp_no",EmpNo);
			session.setAttribute("AdminRights",AdminRights);
			session.setAttribute("newinsUser",newinsUser);
			System.out.println("NO: "+session.getAttribute( "m_b_no" ));
			
			psmt = cn.prepareStatement("insert into useraudittrial(empID,systemIP,action,date,time,empName) values(?,?,?,current_date(),current_time(),?)");
			psmt.setString(1,EmpNo);
			psmt.setString(2,IPADDRESS);
			psmt.setString(3,"Approval Login");
			psmt.setString(4,EmpNo+" - "+realname.toUpperCase());
			psmt.executeUpdate();

			response.sendRedirect("adminPage.jsp?msg=1");
			
			session.setAttribute("Refresh",30);
		}else if(dept_name == null || dept_name.equals("NULL")){
			msg="__You__Are__Not__Authorized__To__Login";
			response.sendRedirect("adminlink.jsp?msg="+msg);	
		}
	}else{
		msg="__Please__Enter__Valid__Username__&__Password";
		response.sendRedirect("adminlink.jsp?msg="+msg);	
	}
}catch(SQLException ex){
	ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rslms,stlms,lms);
}
%>
			<form>
				<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr align="center">
						<td bgcolor="skyblue"><strong><font size ="5" color="black"><b>CONCERN DATA BASE AS IT IS NOT INITIALISE PROPERLY </b><br /></font></strong></td>
					</tr>
				</table>
			</form>
	
			<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118">
				<tr>
					<td width="1000" align="left">
						<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a> <address>HOME</address>
					</td>
					<td width="115" align="right">
						<a href="adminlink.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address>BACK</address>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>