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

String sname=request.getParameter("sname");


String msg = null;
PreparedStatement psmt1=null;
rs = st2.executeQuery("select sname from systemuserbackupswlist where sname='"+sname+"'");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "...'"+sname+"'__IS__ALREADY EXIST.......";
}

else{
psmt1 = cn.prepareStatement("insert into systemuserbackupswlist(sname) values(?)");
//int i=st.executeUpdate("insert into prob_master(p_type,bkLocation) values('"+p_type+"','"+bkLocation+"')");

psmt1.setString(1,sname);



int i = psmt1.executeUpdate();


//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+sname+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("softwaremaster.jsp?msg=" +msg);
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



 <button onclick="window.location.href='ProblemType_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


