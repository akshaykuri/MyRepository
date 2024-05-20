<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>BRANCH MASTER PAGE</title>

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
PreparedStatement psmt1=null;
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();

String server_name=request.getParameter("server_name");
String si_drive=request.getParameter("si_drive");
String hdd_space=request.getParameter("hdd_space");
String si_drive_type = request.getParameter("si_drive_type");
String drive_detail = request.getParameter("vatname");

String msg = null;

rs = st2.executeQuery("select server_name from server_details_master where server_name='"+server_name+"' AND drive='"+si_drive+"'");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "...'"+server_name+"'__with__'"+si_drive+"'__IS__ALREADY EXIST.......";
}

else{

	psmt1 = cn.prepareStatement("insert into  server_details_master(server_name,drive,hdd_space,si_drive_type,drive_detail) values(?,?,?,?,?)");
//int i=st.executeUpdate("insert into backup_master(backup_name,backup_detail,bkLocation) values('"+backup_name+"','"+backup_detail+"','"+bkLocation+"')");
psmt1.setString(1,server_name);
psmt1.setString(2,si_drive);
psmt1.setString(3,hdd_space);
psmt1.setString(4,si_drive_type);
psmt1.setString(5,drive_detail);
int i = psmt1.executeUpdate();

//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+server_name+"'__With__'"+si_drive+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("server_details_master.jsp?msg=" +msg);
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,null);
	DbUtil.closeDBResources(null,psmt1,null);
	

	}
%>

<br>
<br />
<br />



 <button onclick="window.location.href='server_master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


