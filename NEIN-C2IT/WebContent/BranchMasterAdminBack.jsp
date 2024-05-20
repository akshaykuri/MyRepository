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
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();
String msg = null;
String b_name=request.getParameter("b_name");
String b_no=request.getParameter("b_no");
String b_location=request.getParameter("b_location");

rs = st2.executeQuery("select b_name from branch_master where b_name='"+b_name+"'");
if(rs.next()){
	
	//out.println(".........'"+b_name+"' IS ALREADY EXIST.......");
	
	 msg = "...'"+b_name+"'__IS__ALREADY EXIST.......";
}

else{

int i=st.executeUpdate("insert into branch_master(b_name,b_no,b_location) values('"+b_name+"','"+b_no+"','"+b_location+"')");

//out.println("................................\n '"+b_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");

msg = "SAVED__SUCCESSFULLY";
}
response.sendRedirect("BranchMasterAdmin.jsp?msg=" +msg);
%>
<%}

catch (Exception e) {
		 		 System.out.println(e);
			}

finally{
			DbUtil.closeDBResources(rs,st,cn);
			DbUtil.closeDBResources(rs2,st2,null);
			}%>
<br>
<br />
<br />

<%-- 
<br />
<br />
<br />

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
  

<td width="115" align="center"> 
<a href="DescriptionPO.jsp"><img src="bakk.png" border="0" height="35" width="35"></a>
<address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 
<table>
<tr>

<%--<td><input type="button" value="pdf" onclick="link();"/></td> 

<td><input type="button" value="OK" onclick="btnClick();"/></td>
</tr>

</table>


--%>

 <button onclick="window.location.href='BranchMasterAdmin.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


