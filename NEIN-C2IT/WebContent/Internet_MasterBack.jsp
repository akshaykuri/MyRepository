<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>INTERNET MASTER PAGE</title>

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

String internet_name=request.getParameter("internet_name");
String internet_add=request.getParameter("internet_add");
String bkLocation=request.getParameter("bkLocation");
String msg = null;

rs = st2.executeQuery("select internet_name from internet_master where internet_name='"+internet_name+"' AND bkLocation='"+bkLocation+"'");
if(rs.next()){
	
	//out.println(".........'"+backup_name+"' IS ALREADY EXIST.......");
	msg = "'"+internet_name+"'__IS__ALREADY EXIST";
}

else{

//int i=st.executeUpdate("insert into internet_master(internet_name,internet_add,bkLocation) values('"+internet_name+"','"+internet_add+"','"+bkLocation+"')");
psmt1 = cn.prepareStatement("insert into internet_master(internet_name,internet_add,bkLocation) values(?,?,?)");
psmt1.setString(1,internet_name);
psmt1.setString(2,internet_add);
psmt1.setString(3,bkLocation);

int i = psmt1.executeUpdate();
//out.println("................................\n '"+backup_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "'"+internet_name+"'__SAVED__SUCCESSFULLY";

}
response.sendRedirect("Internet_Master.jsp?msg=" +msg);
%>
	<%
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(null,psmt1,null);
	
  }
	%>
<br>
<br />
<br />



 <button onclick="window.location.href='Internet_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


