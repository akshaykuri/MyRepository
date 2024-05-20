<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>PROBLEM MASTER PAGE</title>

<script type="text/javascript">
function btnClick() { 
         close(); 
}
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80" topmargin="50" bottommargin="40" marginwidth="50" marginheight="100">
<div id="wrapper">


<br>
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

String cin_no=request.getParameter("cin_no");
String emp_code=request.getParameter("emp_code");
String owner_name = request.getParameter("owner_name");
String branch = request.getParameter("branch");
String department = request.getParameter("department");
String scopeWork = request.getParameter("scopeWork");
String Rofficer = request.getParameter("Rofficer");
String Designation = request.getParameter("Designation");
String createdBy = request.getParameter("sessionName");
//String status = request.getParameter("status"); 

String msg = null;
PreparedStatement psmt1=null;
rs = st2.executeQuery("select cin_no from  dsc_owner_master where cin_no='"+cin_no+"'");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "...'"+cin_no+"'__DETAILS__IS__ALREADY EXIST.......";
}

else{
psmt1 = cn.prepareStatement("insert into dsc_owner_master(cin_no,emp_code,owner_name,branch,department,scopeWork,Designation,rofficer,createdBy) values(?,?,?,?,?,?,?,?,?)");
//int i=st.executeUpdate("insert into prob_master(p_type,bkLocation) values('"+p_type+"','"+bkLocation+"')");

psmt1.setString(1,cin_no);
psmt1.setString(2,emp_code);
psmt1.setString(3,owner_name);
psmt1.setString(4,branch);
psmt1.setString(5,department);
psmt1.setString(6,scopeWork);
psmt1.setString(7,Designation);
psmt1.setString(8,Rofficer);
psmt1.setString(9,createdBy);
//psmt1.setString(10,status);


int i = psmt1.executeUpdate();


//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+cin_no+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("DSC_Master.jsp?msg=" +msg);
%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,st,cn);
			DbUtil.closeDBResources(rs2,st2,null);
			
			} %>
<br>
<br />
<br />



 <button onclick="window.location.href='DSC_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


