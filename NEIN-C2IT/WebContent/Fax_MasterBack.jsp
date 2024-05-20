<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>FAX MASTER PAGE</title>

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

String fax_name=request.getParameter("fax_name");
String fax_detail=request.getParameter("fax_detail");
String fxLocation=request.getParameter("fxLocation");
String msg = null;
PreparedStatement psmt1=null;
rs = st2.executeQuery("select fax_name from fax_master where fax_name='"+fax_name+"' AND fxLocation='"+fxLocation+"'");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "...'"+fax_name+"'__IS__ALREADY EXIST.......";
}

else{

//int i=st.executeUpdate("insert into fax_master(fax_name,fax_detail,fxLocation) values('"+fax_name+"','"+fax_detail+"','"+fxLocation+"')");
psmt1 = cn.prepareStatement("insert into fax_master(fax_name,fax_detail,fxLocation) values(?,?,?)");
psmt1.setString(1,fax_name);
psmt1.setString(2,fax_detail);
psmt1.setString(3,fxLocation);

int i = psmt1.executeUpdate();
//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+fax_name+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("Fax_Master.jsp?msg=" +msg);

%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,null);

			}%>
<br>
<br />
<br />



 <button onclick="window.location.href='Fax_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


