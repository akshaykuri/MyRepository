<%@page import="CON2.DbUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import="java.util.ResourceBundle"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../../../banner.jsp" %>
<jsp:useBean id ="con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="C2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Files</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
<!-- 	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->

<link rel="shortcut icon" href="../images/faviconnnnn.ico" />
	
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/FormsHelp.js"></script>
     <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>


<body>
<%! 
Connection cn1 = null,cn2=null,cn3=null;
Statement st1= null,st2=null,st3=null;
ResultSet rs1 = null,rs2=null,rs3=null;
String req=null;
int size=0;
String b_no=null,b_name=null,form_no=null,empName=null,empDesg=null,empMail=null,empId=null,remarks=null,Date=null,fileName=null,filePath=null;%>

<br>
<h2 align="center">UAT DEVELOPMENT SUGGESTIONS</h2>
<br/>
<table width="895"  style="margin-left: auto;margin-right: auto;" align="center">
<tr bgcolor="lightgrey" >
<td width="67" align="center"><font size="3"><b>Name</b></font></td>
<td width="67" align="center"><font size="3"><b>Designation</b></font></td>
<td width="67" align="center"><font size="3"><b>Suggestions</b></font></td>
<td width="67" align="center"><font size="3"><b>Date</b></font></td>
</tr>

<%
req=request.getParameter("f");
cn1=con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("SELECT * FROM `uat_changes` where form_no='"+req+"'");
while(rs1.next()){
	form_no=rs1.getString("form_no");
	empName=rs1.getString("empname");
	empDesg=rs1.getString("empdesg");
	empMail=rs1.getString("empmail");
	remarks=rs1.getString("Changes");
	Date=rs1.getString("Date");
%>


<tr>
<td width="67"><%=empName %></td>
<td width="67"><%=empDesg %></td>
<td width="67"><%=remarks%></td>
<%-- <td><%=b_name%></td> --%>
<td width="67"><%=Date %></td>


<%
}%>

</tr>

</table>

	

</body>
</html>