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
PreparedStatement psmt=null;
try{
cn = con.getConnection2();
st=cn.createStatement();
st2=cn.createStatement();
String msg = null;

String barcode_name=request.getParameter("barcode_name");
String barcode_detail=request.getParameter("barcode_detail");
String brLocation=request.getParameter("brLocation");


rs = st2.executeQuery("select barcode_name from barcode_master where barcode_name='"+barcode_name+"' AND brLocation='"+brLocation+"'");
if(rs.next()){
	
	//out.println(".........'"+b_name+"' IS ALREADY EXIST.......");
	 msg = "...'"+barcode_name+"'__IS__ALREADY EXIST.......";
}

else{

//int i=st.executeUpdate("insert into barcode_master(barcode_name,barcode_detail,brLocation) values('"+barcode_name+"','"+barcode_detail+"','"+brLocation+"')");
psmt = cn.prepareStatement("insert into barcode_master(barcode_name,barcode_detail,brLocation) values(?,?,?)");
psmt.setString(1,barcode_name);
psmt.setString(2,barcode_detail);
psmt.setString(3,brLocation);

int i =psmt.executeUpdate();
//out.println("................................\n '"+barcode_name+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");
msg = "BARCODE__SAVED__SUCCESSFULLY";
}

response.sendRedirect("Barcode_Master.jsp?msg=" +msg);
}
catch (Exception e) {
	 System.out.println(e);
}
finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,null);
	DbUtil.closeDBResources(null,psmt,null);
	}	
%>

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

 <button onclick="window.location.href='Barcode_Master.jsp'">OK</button>
</b>
</font>
</center>
</div>




</body>
</html>


