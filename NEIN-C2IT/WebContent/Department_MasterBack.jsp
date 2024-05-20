<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>DEPARTMENT MASTER PAGE</title>

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
String msg = null;
PreparedStatement psmt1=null;
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();

String depart_name=request.getParameter("dept_name");
String depart_detail=request.getParameter("dept_detail");


rs = st2.executeQuery("select dept_name from department_master where dept_name='"+depart_name+"'");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "...'"+depart_name+"'__IS__ALREADY EXIST.......";
}

else{

//int i=st.executeUpdate("insert into printer_master(printer_name,printer_detail,bkLocation) values('"+printer_name+"','"+printer_detail+"','"+bkLocation+"')");
psmt1 = cn.prepareStatement("insert into department_master(dept_name,dept_detail) values(?,?)");
//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");
psmt1.setString(1,depart_name);
psmt1.setString(2,depart_detail);



int i = psmt1.executeUpdate();
msg = "'"+depart_name+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("Department.jsp?msg=" +msg);
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



 <button onclick="window.location.href='Department.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


