<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>TYPE MASTER PAGE</title>

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

String NAME=request.getParameter("DESIGNATION");
String no=request.getParameter("DESG_NO");

String msg = null;
rs = st2.executeQuery("select NAME from prob_type_master_main_2 where NAME='"+NAME+"'");
if(rs.next()){
	
	out.println(".........'"+NAME+"' IS ALREADY EXIST.......");
	//msg = "...'"+DESIGNATION+"'__IS__ALREADY EXIST.......";
}

else{

int i=st.executeUpdate("insert into prob_type_master_main_2(NAME,no) values('"+NAME+"','"+no+"')");

out.println("................................\n '"+NAME+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

//msg = "'"+DESIGNATION+"'__SAVED__SUCCESSFULLY\\nasdasdasd";

}
//response.sendRedirect("NewDesignation.jsp?msg=" +msg);
%>
<%

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally {
	//DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs2,st,cn );
	DbUtil.closeDBResources(rs,st2,null);
	
}
%>
<br>
<br />
<br />



 <button onclick="window.location.href='SubTypeMaster.jsp?msg=1'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


