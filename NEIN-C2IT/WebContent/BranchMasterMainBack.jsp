<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>MAIN BRANCH MASTER PAGE</title>

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
String msg = null;
String b_name=request.getParameter("m_b_name");
String b_no=request.getParameter("m_b_no");
String b_location=request.getParameter("m_b_location");

rs = st2.executeQuery("select m_b_name from branch_master_main where m_b_name='"+b_name+"'");
if(rs.next()){
	
	//out.println(".........'"+b_name+"' IS ALREADY EXIST.......");
	
	 msg = "...'"+b_name+"'__IS__ALREADY EXIST.......";
}

else{

int i=st.executeUpdate("insert into branch_master_main(m_b_name,m_b_no,m_b_location) values('"+b_name+"','"+b_no+"','"+b_location+"')");

//out.println("................................\n '"+b_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "SAVED__SUCCESSFULLY";
}
response.sendRedirect("BranchMasterMain.jsp?msg=" +msg);

}
catch (Exception e) {
	 System.out.println(e);
}

finally{
DbUtil.closeDBResources(null,st,cn);
DbUtil.closeDBResources(null,st2,null);
}
%>

<br>
<br />
<br />


 <button onclick="window.location.href='BranchMasterMain.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


