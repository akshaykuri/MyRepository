<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import="CON2.DbUtil"%>
<%@page import="CON2.Connection2"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "con1" class="CON2.ConnectionLMS" />
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null"){
	String msg2=null;
	msg2="Session__Time__Out__ Login__Again";
	response.sendRedirect("../../adminlinkHR.jsp?msg="+msg2);
}else{
%>

<%
Connection cn1 = con.getConnection2();
Connection cn2 = con1.getConnectionlms();
PreparedStatement psmtMain=null,psmtMain1=null,psmtItem1=null,psmtItem2=null;
Statement st1=null,st2=null,st3=null,st4=null;
ResultSet rs1=null,rs2=null,rs3=null,rs4=null;

try{
int id=0,idExtend=0;
String message=null,msg="",id2=null,month="",year="",queryMain="",queryMain1="",queryItem1="",queryItem2="",branchName="",branchCode="",empCode="",appID="",appName="",appDesg="",appMail="";

String empId 			= request.getParameter("empId");
String empName 			= request.getParameter("empName");
String empBranch 		= request.getParameter("empBranch");
String empDesg 			= request.getParameter("empDesg");
String empDept 			= request.getParameter("empDept");
String empMail 			= request.getParameter("empMail");
String reqNo 			= request.getParameter("reqNo");
String reqDate 			= request.getParameter("reqDate");
String remarks 			= request.getParameter("remarks");

String listOfAppsArr[] 	= request.getParameterValues("app_name");
String listOfApps 		= "";
String b_noArr[] 		= empBranch.split("-");
String b_no 			= b_noArr[1];
empBranch 				= b_noArr[0];
%>

<%
for(int i=0; i<listOfAppsArr.length; i++){
	listOfApps += listOfAppsArr[i]+",";
}
listOfApps = listOfApps.substring(0, listOfApps.length()-1);
%>

<%
st1 = cn1.createStatement();
rs1 = st1.executeQuery("select ifnull(max(idextend),'0'),upper(date_format(now(), '%b')),year(now()) from c2itreviewfrommain where requestNo in (select requestNo from c2itreviewfrommain where requestByBranchNo='"+b_no+"' group by requestNo)");
if(rs1.next()){
	try{
		id			=	rs1.getInt(1);
		month		=	rs1.getString(2);
		year		=	rs1.getString(3);
		id++;
		idExtend	=	id;
		if(id2==null)
 			id2=month+"/"+year+"/";
			String formattedId = String.format("%03d", id);
			reqNo = id2+formattedId;
	}catch(SQLException ex){
		System.out.println(ex.toString());
	}
}
System.out.println("reqNo======>"+reqNo);
%>

<%
//inserting into main table
queryMain = "insert into c2itreviewfrommain (idextend,requestNo,requestDate,requestBy,requestByName,requestByBranch,requestByBranchNo,requestByDesg,requestByDept,requestByMailID,listOfApplications,requesterRemarks,approveStatus,approverRemarks) values (?,?,current_timestamp(),?,?,?,?,?,?,?,?,?,?,?)";
psmtMain  = cn1.prepareStatement(queryMain);
psmtMain.setInt(1, idExtend);
psmtMain.setString(2, reqNo);
psmtMain.setString(3, empId);
psmtMain.setString(4, empName);
psmtMain.setString(5, empBranch);
psmtMain.setString(6, b_no);
psmtMain.setString(7, empDesg);
psmtMain.setString(8, empDept);
psmtMain.setString(9, empMail);
psmtMain.setString(10, listOfApps);
psmtMain.setString(11, remarks);
psmtMain.setString(12, "Pending");
psmtMain.setString(13, "Pending");
int z = psmtMain.executeUpdate();
%>

<%
//inserting initiator details into item table
queryItem1 = "insert into c2itreviewfromitem (reqNo,empId,empName,empDesg,empBranchNo,empMailId,levelNo,status,presence,appDate,remarks,clarifyCol) values (?,?,?,?,?,?,?,?,?,current_timestamp(),?,?)";
psmtItem1  = cn1.prepareStatement(queryItem1);
psmtItem1.setString(1, reqNo);
psmtItem1.setString(2, empId);
psmtItem1.setString(3, empName);
psmtItem1.setString(4, empDesg);
psmtItem1.setString(5, b_no);
psmtItem1.setString(6, empMail);
psmtItem1.setString(7, "00");
psmtItem1.setString(8, "Initiator");
psmtItem1.setString(9, "over");
psmtItem1.setString(10, remarks);
psmtItem1.setString(11, "0");
int zz = psmtItem1.executeUpdate();
%>

<%
//for getting distinct branch codes
st2 = cn1.createStatement();
rs2 = st2.executeQuery("select distinct m_b_name,m_b_no from branch_master_main");
while(rs2.next()){
	branchName = rs2.getString("m_b_name");
	branchCode = rs2.getString("m_b_no");
%>

<%
//for getting distinct branch IT employee Id's
st3 = cn1.createStatement();
rs3 = st3.executeQuery("select distinct empID from branchITforBOMAudit where empBranchNo='"+branchCode+"'");
while(rs3.next()){
	empCode = rs3.getString("empID");
%>

<%
//inserting branch wise into line item table
queryMain1 = "insert into c2itreviewfrommainitems (reqNo,branchNo,branchName) select ?,?,? where not exists (select reqNo from c2itreviewfrommainitems where reqNo=? and branchNo=? and branchName=?)";
psmtMain1  = cn1.prepareStatement(queryMain1);
psmtMain1.setString(1, reqNo);
psmtMain1.setString(2, branchCode);
psmtMain1.setString(3, branchName);
psmtMain1.setString(4, reqNo);
psmtMain1.setString(5, branchCode);
psmtMain1.setString(6, branchName);
int zzz = psmtMain1.executeUpdate();
%>

<%
//for getting distinct branch IT employee details
st4 = cn2.createStatement();
rs4 = st4.executeQuery("SELECT DISTINCT u.emp_id as appID,u.user_name as appName,rr.role_code as appDesg,u.email as appMail FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE (m1.emp_id='"+empCode+"') AND u.employee_status='yes'");
while(rs4.next()){
	appID = rs4.getString("appID");
	appName = rs4.getString("appName");
	appDesg = rs4.getString("appDesg");
	appMail = rs4.getString("appMail");
%>

<%
//inserting approver details into item table
queryItem2 = "insert into c2itreviewfromitem (reqNo,empId,empName,empDesg,empBranchNo,empMailId,levelNo,status,presence,appDate,remarks,clarifyCol) values (?,?,?,?,?,?,?,?,?,current_timestamp(),?,?)";
psmtItem2  = cn1.prepareStatement(queryItem2);
psmtItem2.setString(1, reqNo);
psmtItem2.setString(2, appID);
psmtItem2.setString(3, appName);
psmtItem2.setString(4, appDesg);
psmtItem2.setString(5, branchCode);
psmtItem2.setString(6, appMail);
psmtItem2.setString(7, "0");
psmtItem2.setString(8, "Pending");
psmtItem2.setString(9, "now");
psmtItem2.setString(10, "Pending");
psmtItem2.setString(11, "0");
int zzzz = psmtItem2.executeUpdate();
%>

<%}%>

<%}%>

<%}%>

<%
message = null;
msg = "FORM__SAVED__AND__SENT__SUCCESSFULLY......";
response.sendRedirect("../../adminHR.jsp?msg=" +msg);
%>

<%
}catch(Exception e){
	System.out.println("here is the error in bomAuditRequestBack.jsp====>"+e);
}finally{
	DbUtil.closeDBResources(rs1,st1,null);
	DbUtil.closeDBResources(rs2,st2,null);
	DbUtil.closeDBResources(rs3,st3,null);
	DbUtil.closeDBResources(rs4,st4,null);
	DbUtil.closeDBResources(null,psmtMain,null);
	DbUtil.closeDBResources(null,psmtMain1,null);
	DbUtil.closeDBResources(null,psmtItem1,cn1);
	DbUtil.closeDBResources(null,psmtItem2,cn2);
}
%>

<%}%>