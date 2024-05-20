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

<br/>
<h2 align="center">BRANCH WISE REQUIREMENTS</h2>
<table style="margin-left: auto;margin-right: auto;" align="center" border="2">
<tr>
<td>


<%
req=request.getParameter("f");
cn1=con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("SELECT * FROM `branch_master_main` WHERE m_b_no in('90','10','30','31','40','20','54','51')");
while(rs1.next()){
	b_no=rs1.getString("m_b_no");
	b_name=rs1.getString("m_b_name");
%>
<br/>
<table width="895"  style="margin-left: auto;margin-right: auto;" align="center">
<tr>
<td align="center" bgcolor="lightgrey" colspan="5"><%=b_name %></td>
</tr>
<tr bgcolor="lightgrey" >
<td width="67" align="center"><font size="3"><b>Name</b></font></td>
<td width="67" align="center"><font size="3"><b>Designation</b></font></td>
<td width="67" align="center"><font size="3"><b>Suggestions</b></font></td>
<td width="67" align="center"><font size="3"><b>Date</b></font></td>
<td width="67" align="center"><font size="3"><b>Files</b></font></td>
</tr>
<%
cn2=con.getConnection2();
st2=cn2.createStatement();
rs2=st2.executeQuery("SELECT * FROM branch_requirements where form_no='"+req+"' And levelno='01' And Branch='"+b_no+"' order by  `id` ASC");
while(rs2.next()){
	form_no=rs2.getString("form_no");
	empName=rs2.getString("emp");
	empDesg=rs2.getString("desg");
	empMail=rs2.getString("mail");
	empId=rs2.getString("empid");
	remarks=rs2.getString("remarks");
	Date=rs2.getString("Date");
	
	
		


%>

<tr>
<td width="67"><%=empName %></td>
<td width="67"><%=empDesg %></td>
<td width="67"><%=remarks%></td>
<%-- <td><%=b_name%></td> --%>
<td width="67"><%=Date %></td>
<td width="67">
<% 

cn3=con.getConnection2();
st3=cn3.createStatement();
rs3=st3.executeQuery("SELECT * FROM file_paths where form_no='"+req+"' And empid='"+empId+"'");
while(rs3.next()){
	size++;
	fileName=rs3.getString("filename");	
	filePath=rs3.getString("Path");
	
%>
<%if(size==1){ %>
<div style="width:100%; overflow:auto"><font size="2" color="black"><a href="downloadfile.jsp?f=<%=filePath%>"><%=fileName%></a></font>
<%} %>
<%if(size>=2){ %>
<font size="2" color="black"><a href="downloadfile.jsp?f=<%=filePath%>"><%=fileName%></a></font>

<%} 
}%>
</div>
</td>
<%


}
%>
</tr>
</table>
<%} %>
<br/>

</td>
</tr>
</table>
	

</body>
</html>