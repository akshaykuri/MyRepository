<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>PHOTOCOPIER MASTER PAGE</title>

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

String photocopier_name=request.getParameter("photocopier_name");
String photocopier_detail=request.getParameter("photocopier_detail");
String bkLocation=request.getParameter("bkLocation");
String msg = null;
PreparedStatement psmt1=null;
rs = st2.executeQuery("select photocopier_name from photocopier_master where photocopier_name='"+photocopier_name+"' AND bkLocation='"+bkLocation+"' ");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "...'"+photocopier_name+"'__IS__ALREADY EXIST.......";
}

else{

//int i=st.executeUpdate("insert into photocopier_master(photocopier_name,photocopier_detail,bkLocation) values
		//('"+photocopier_name+"','"+photocopier_detail+"','"+bkLocation+"')");
psmt1 = cn.prepareStatement("insert into photocopier_master(photocopier_name,photocopier_detail,bkLocation) values(?,?,?)");
psmt1.setString(1,photocopier_name);
psmt1.setString(2,photocopier_detail);
psmt1.setString(3,bkLocation);

int i = psmt1.executeUpdate();




//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+photocopier_name+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("Photocopier_Master.jsp?msg=" +msg);
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



 <button onclick="window.location.href='Backup_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


