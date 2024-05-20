<%@page import="CON2.DbUtil"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import= "CON2.Connection2" %> 
<%@page import= "CON2.ConnectionLMS" %> 
<%@page import="java.io.*" %>   

<%
	String name = request.getParameter( "tho" );
	String IPADDRESS 	= request.getRemoteAddr();;
	System.out.println("IPADDRESS====>"+IPADDRESS);
	session.setAttribute( "theName", name );
%>

<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "conlms" class="CON2.ConnectionLMS" /> 

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>HO</title>
	</head>
<%
int f=0;
Connection cn =null,lms=null;
PreparedStatement psmt=null;
Statement st = null,stlms=null,stlms1=null; 
ResultSet rs = null,rslms=null,rslms1=null; 
String sn=null;
String msg=null;
String sn1=null;
String emailLms=null,emp_idLms=null;
String desg = null,DESG_NO=null,realname = null,city=null,Initiator=null,noo=null,admin=null,newinsUser=null,deptName=null,subDept=null,emp_no=null;
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

	System.out.println("Emp LMS "+emp_idLms+"  EMAIL LMS"+emailLms);
	System.out.println("Emp uid "+uid+"  pwd "+pwd);
	if(((emailLms!=null) && emp_idLms!=null) ||((uid!=null) && (pwd!=null))){
		cn = con.getConnection2();
		System.out.println("-------inside if -----------"+cn);
		st=cn.createStatement();
		String n = request.getParameter("t1");
		String p = request.getParameter("t2");
		System.out.println("inside if n: "+n);
		System.out.println("inside if p: "+p);
		String q = request.getParameter("nameee");

		if((emp_idLms==null)||(emp_idLms.equals(null))||(emp_idLms.equals("null"))||(emp_idLms.equals(""))){
			System.out.println("INSIDE IF (emp_idLms==null)||(emp_idLms.equals(null))||");
			rs = st.executeQuery("SELECT idd,Npwd,Npost,Nname,NpostingCo,Nmail,admin,newinsUser,branch_master_main.m_b_no as b_no,deptName,subDept,DESG_NO,EMP_NO FROM formUser_master INNER JOIN branch_master_main ON(SUBSTR(formUser_master.NpostingCo,-2,2)=branch_master_main.m_b_no) where (idd = '"+n+"') and (Npwd = '"+p+"')");
		}else{
			System.out.println("IN SIDE ELSE (emp_idLms==null)||(emp_idLms.equals(null))||");
			rs = st.executeQuery("SELECT idd,Npwd,Npost,Nname,NpostingCo,Nmail,admin,newinsUser,branch_master_main.m_b_no as b_no,deptName,subDept,DESG_NO,EMP_NO FROM formUser_master INNER JOIN branch_master_main ON(SUBSTR(formUser_master.NpostingCo,-2,2)=branch_master_main.m_b_no) where (EMP_NO = '"+emp_idLms+"') || ((idd = '"+n+"') and (Npwd = '"+p+"')) ");
		}

		System.out.println("HO LOGIN ID Name: "+n);

		while(rs.next()){
			sn=rs.getString("idd");
			sn1=rs.getString("Npwd");
			desg = rs.getString("Npost");
			realname = rs.getString("Nname");
			city =rs.getString("NpostingCo");
			noo = rs.getString("b_no");
			Initiator = rs.getString("Nmail");
			admin = rs.getString("admin");
			newinsUser = rs.getString("newinsUser");
			deptName = rs.getString("deptName");
			subDept = rs.getString("subDept");
			DESG_NO = rs.getString("DESG_NO");
			emp_no = rs.getString("EMP_NO");
		}

		if((n.equals(sn) && p.equals(sn1)) || (uid.equals(emp_no))){
			session.setAttribute("Nname",realname);
			session.setAttribute("NpostingCo",city);
			session.setAttribute("city",city);
			session.setAttribute("b_no",noo);
			session.setAttribute("m_b_no",noo);
			String emailLms1="",ndesgLms=""; 
			stlms1=lms.createStatement();

			rslms1 = stlms1.executeQuery("SELECT DISTINCT rr.role_code,u.email FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id WHERE ( u.emp_id ='"+emp_no+"' ) AND u.employee_status = 'yes' ");
			if(rslms1.next()){
				emailLms1 = rslms1.getString("email");
				ndesgLms=rslms1.getString(1);
				System.out.println("HO LOGIN Name emailLms1emailLms1: "+emailLms1);
				System.out.println("HO LOGIN Name ndesgndesgndesg: "+ndesgLms);
			}

			session.setAttribute("Nmail",emailLms1);
			session.setAttribute("desg",ndesgLms);
			session.setAttribute("admin",admin);
			session.setAttribute("newinsUser",newinsUser);
			session.setAttribute("deptName",deptName);
			session.setAttribute("subDept",subDept);
			session.setAttribute("DESG_NO",DESG_NO);
			session.setAttribute("emp_no",emp_no);
			session.setAttribute("EmpNo",emp_no);
		    System.out.println(" STATUS:    NAME : "+session.getAttribute( "Nname" )+"    DESIGNATION ****************: "+session.getAttribute( "desg" )+"    CITY : "+session.getAttribute( "NpostingCo" )+"NOO : "+session.getAttribute( "b_no" ));

		    String req=request.getParameter("req");
	        String AppType=request.getParameter("AppType");

	        psmt = cn.prepareStatement("insert into useraudittrial(empID,systemIP,action,date,time,empName) values(?,?,?,current_date(),current_time(),?)");
			psmt.setString(1,emp_no);
			psmt.setString(2,IPADDRESS);
			psmt.setString(3,"User Login");
			psmt.setString(4,emp_no+" - "+realname.toUpperCase());
			psmt.executeUpdate();

			System.out.println("the C2IT"+AppType);
          
			if(AppType==null){
				response.sendRedirect("adminHR.jsp?msg=1");
			}else if(AppType.equals("Single")){
				response.sendRedirect("SingleApplicationForm/FormLocalApproval/NEINApplicationLocalAdmin.jsp?msg=1&fg=1&req="+req+"");
			}else if(AppType.equals("osd")){
				String levelno=request.getParameter("levelno");
				if(levelno.equals("5") || levelno.equals("9")){
					System.out.println("level5");
					response.sendRedirect("ITFORMS/FormApproval/PopupLink/ITclearanceAdmin.jsp?fg=1&rss="+req+"");
				}else{
					response.sendRedirect("ITFORMS/FormLocalApproval/ITclearanceLocalAdmin.jsp?msg=1&fg=1&req="+req+"");
				}
			}else if(AppType.equals("incident")){
				response.sendRedirect("IncidentLog/FormApproval/PopupLink/IncidentLogsAdmin.jsp?msg=1&fg=1&req="+req+"");
			}else if(AppType.equals("GatePass")){
				response.sendRedirect("GatePass/gatePassformApprove1.jsp?msg=1&fg=1&req="+req+"");
			}
		}else{
			msg="__Sorry__Please__Enter__Valid__Username__&__Password";
			response.sendRedirect("adminlinkHR.jsp?msg="+msg);	
		}
	}else{
		msg="__Sorry__Please__Enter__Valid__Username__&__Password";
		response.sendRedirect("adminlinkHR.jsp?msg="+msg);	
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rslms,stlms,lms);
}
%>

	<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70">
		<div id="wrapper">
			<img src="images/nippon.gif" height="35" width="220"> <img src="images/cs-soft.jpg" height="30" width="100" align="right">
			<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
				<tr align="center">
					<td bgcolor="#ec691f"><strong><font size ="5" color="white"><b>NEIN-C2IT</b><br /></font></strong></td>
				</tr>
				<tr align="center">
					<td bgcolor="#2f4377"><strong><font size ="5" color="white">ERROR</font></strong></td>
				</tr>
			</table>

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
						<a href="adminlinkHR.jsp?msg=1"><img src="bakk.png" border="0" height="45" width="45"></a><address>BACK</address>
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