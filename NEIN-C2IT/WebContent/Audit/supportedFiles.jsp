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
Connection cn1 = null;
Statement st1= null;
ResultSet rs1 = null;
String req=null;
String path=null,filename=null;%>
<h3 align="center">SUPPORTED FILES</h3>
<br/>
<br/>
<table width="895" style="margin-left: auto;margin-right: auto;" align="center">
<tr>
		  <td height="20"  width="25" align=center><font size="2" color="black"><b>FILE NAME</b></font></td>
		  <td  width="120" align=center><font size="2" color="black"><b>FILE PATH</b></font></td>
<!-- 		  <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
		 <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>UPLOADED BY</b></font></td> -->
</tr>
<%
req=request.getParameter("f");
cn1=con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select path,filename from file_paths where form_no='"+req+"'");
while(rs1.next()){
	path=rs1.getString(1);
	filename=rs1.getString(2); %>
	<tr>
<td ><font size="2" color="black"><b><%=filename %></b></font></td>
		  <td width><font size="2" color="black"><b><%=path %></b></font></td>
		  <%} %>
		  </tr>
</table>
</body>
</html>