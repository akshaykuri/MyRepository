<%@page import="CON2.DbUtil"%>
<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<%response.setContentType("application/x-download"); 
response.setHeader("Content-Disposition", "attachment; filename=ApplicationFormReportExcel.xls");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<jsp:useBean id="dateFormat" class="CON2.DateFormat" />
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" />
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>BRANCH DATE TO DATE WISE CRM</title>
<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
<style type="text/css"> 
td{
    text-align: center;
}
textarea.special { 
font-family:arial; 
font-size:11px; 
overflow: auto;
}
select {
    font-size:0.8em;
}
input[type="text"][readonly],
textarea[readonly] {
  background-color: #ccc;
}
</style>
<script language="javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
function popitup(url) {
	newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
} 
</script>
</head>
<%!
Connection conn = null;
Statement st;
ResultSet rs;
String req,req2,req3;
String total_val=null;
Connection2 dbConn = new Connection2();
Object logInName = null,desg=null,realname=null,city=null,Initiator=null;         
String applicationNo=null,initiator=null,initiatorDesg=null,forBranch=null,SentBy=null,SentByDesg=null,SentByRemarks=null,datee=null;
String forfullname=null,forDesignation=null,forReportingOfficer=null,requestOption=null;
%>
<%
req = request.getParameter("appForm");
req2 = request.getParameter("dateNE");
req3 = request.getParameter("dateNEE");    
String reqResult =null;

String[] dateString = req2.split("-");
if (dateString[1].equals("Jan"))
{
 dateString[1]="01";
}
if (dateString[1].equals("Feb"))
{
 dateString[1]="02";
}
if (dateString[1].equals("Mar"))
{
 dateString[1]="03";
}
if (dateString[1].equals("Apr"))
{
 dateString[1]="04";
}
if (dateString[1].equals("May"))
{
 dateString[1]="05";
}
if (dateString[1].equals("Jun"))
{
 dateString[1]="06";
}
if (dateString[1].equals("Jul"))
{
 dateString[1]="07";
}
if (dateString[1].equals("Aug"))
{
 dateString[1]="08";
}
if (dateString[1].equals("Sep"))
{
 dateString[1]="09";
}
if (dateString[1].equals("Oct"))
{
 dateString[1]="10";
}
if (dateString[1].equals("Nov"))
{
 dateString[1]="11";
}
if (dateString[1].equals("Dec"))
{
 dateString[1]="12";
}
    
String dateF = dateString[0]+"-"+dateString[1]+"-"+dateString[2];
String[] dateString2 = req3.split("-");
    if (dateString2[1].equals("Jan"))
{
 dateString2[1]="01";
}
if (dateString2[1].equals("Feb"))
{
 dateString2[1]="02";
}
if (dateString2[1].equals("Mar"))
{
 dateString2[1]="03";
}
if (dateString2[1].equals("Apr"))
{
 dateString2[1]="04";
}
if (dateString2[1].equals("May"))
{
 dateString2[1]="05";
}
if (dateString2[1].equals("Jun"))
{
 dateString2[1]="06";
}
if (dateString2[1].equals("Jul"))
{
 dateString2[1]="07";
}
if (dateString2[1].equals("Aug"))
{
 dateString2[1]="08";
}
if (dateString2[1].equals("Sep"))
{
 dateString2[1]="09";
}
if (dateString2[1].equals("Oct"))
{
 dateString2[1]="10";
}
if (dateString2[1].equals("Nov"))
{
 dateString2[1]="11";
}
if (dateString2[1].equals("Dec"))
{
 dateString2[1]="12";
}
String dateFF = dateString2[0]+"-"+dateString2[1]+"-"+dateString2[2];
%>
<body background="images/u.jpg">
<form name="form">  
<center>
<table border="1" cellspacing="1" width="1100" align="center" background="images/s.jpg">
<tr><td colspan="10" align="left"><center><b><font size="3" style="font-size: medium;">
APPLICATION REPORT</font></b></center></td></tr>
</table>
<br />
<%
Connection cn3 = null;
Statement st3= null,st2=null; 
ResultSet rs3 = null,rs2=null;
try{
%>
<table  border="1" width="1100" align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr style="background: lightgrey">
<td colspan="1" align=center><font color="black" size="2">From Date:</font></td>
<td colspan="1" align=center><font color="black" size="2"><b><%=req2%></b></font></td>
<td colspan="1" align=center><font color="black" size="2">To Date:</font></td>
<td colspan="1" align=center><font color="black" size="2"><b><%=req3%></b></font></td>
</tr>
</table>

<table  border="1" width="80%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
<td height="20" bgcolor="lightgrey"  align=center><font color="black" size="2"><b>Sl No.</b></font></td>
<td bgcolor="lightgrey" align="center" height="21"><font size="2"><b>FORM NO.</b></font></td>
<td bgcolor="lightgrey" align="center" height="21" ><font size="2"><b>REQUESTED DATE</b></font></td>
<td bgcolor="lightgrey" align="center" height="21" ><font size="2"><b>REQUESTED FOR</b></font></td>
<td bgcolor="lightgrey" align="center" height="21" ><font size="2"><b>INITIATOR NAME</b></font></td>
<td align="center" height="21" bgcolor="lightgrey"><font size="2"><b>INITIATOR DESIGNATION</b></font></td>
<td align="center" height="21" bgcolor="lightgrey"><font size="2"><b>BRANCH</b></font></td>
<td align="center" height="21" bgcolor="lightgrey"><font size="2"><b>USER NAME</b></font></td>
<td align="center" height="21" bgcolor="lightgrey"><font size="2"><b>DESIGNATION</b></font></td>
<td align="center" height="21" bgcolor="lightgrey"><font size="2"><b>REPORTING OFFICER</b></font></td>
<td align="center" height="21" bgcolor="grey"><font size="2"><b>APPROVAL ROUTINE</b></font>
<table border="1" width="80%" align="center" bgcolor="#F0F0F0" bordercolor="black">
<tr>
<td align="center" bgcolor="lightgrey" height="21" ><font size="2"><b>NAME</b></font></td>
<td align="center" bgcolor="lightgrey" height="21" ><font size="2"><b>DESIGNATION</b></font></td>
<td align="center" bgcolor="lightgrey" height="21" ><font size="2"><b>STATUS</b></font></td>
<td align="center" bgcolor="lightgrey" height="21" ><font size="2"><b>REMARKS</b></font></td>
</tr>
</table>
</td>	
</tr>			    
<%
int flag=0;
int i=0;int k=0;
conn = con.getConnection2();
st2 = conn.createStatement();
st3 = conn.createStatement();
if(req!=null && req.equals("all"))
{
rs2 = st2.executeQuery("SELECT applicationNo,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') as dateD,full_name,designation,report_officer,request_type FROM neinApplicationform WHERE applicationDate >= '"+dateF+"' AND applicationDate <= '"+dateFF+"' ORDER BY form_id ASC");
}
else
{
rs2 = st2.executeQuery("SELECT applicationNo,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') as dateD,full_name,designation,report_officer,request_type FROM neinApplicationform WHERE requested_branch='"+req+"' AND applicationDate >= '"+dateF+"' AND applicationDate <= '"+dateFF+"' ORDER BY form_id ASC");
}
while(rs2.next()){
flag=1;
k++;
applicationNo = rs2.getString("applicationNo");
initiator = rs2.getString("i_name");
initiatorDesg = rs2.getString("i_desg");
forBranch = rs2.getString("branch");
SentBy = rs2.getString("Approval_empp");
SentByDesg = rs2.getString("Approval_desgg");
SentByRemarks = rs2.getString("Approval_remarks");
datee = rs2.getString("dateD");
forfullname = rs2.getString("full_name");
forDesignation = rs2.getString("designation");
forReportingOfficer = rs2.getString("report_officer");
requestOption =rs2.getString("request_type");
i++;       	       		    		 
%>
<script>id++; </script>
<tr>
<td align="center" style="vertical-align:middle"><%=i%></td>
<td align=center height="21" style="vertical-align:middle"><font size="2"><%=applicationNo%></font> </td> 
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=datee%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=requestOption%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=initiator%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=initiatorDesg%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=forBranch%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=forfullname%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=forDesignation%></font></td>
<td align="center" height="21" style="vertical-align:middle"><font size="2"><%=forReportingOfficer%></font></td>
<td align="center" height="21" style="vertical-align:middle">
<%
rs3 = st3.executeQuery("SELECT form2_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y') FROM neinapplicationform_item WHERE form2_no = '"+applicationNo+"' ORDER BY item_id ASC   ");
while(rs3.next()){
String highemp = rs3.getString("emp");
String highDesig = rs3.getString("desg");
String highStatus = rs3.getString("status");
String highRemarks = rs3.getString("remarks");
%>
<table border="1" width="80%" align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
<td align="center"  height="21"><font size="2"><%=highemp%></font></td>
<td align="center"  height="21"><font size="2"><%=highDesig%></font></td>
<td align="center"  height="21"><font size="2"><%=highStatus%></font></td>
<td align="center"  height="21"><font size="2"><%=highRemarks%></font></td>
</tr>
<%}%>
</table>
</td>
</tr>
<%}%>	
</table> 
<font color="red" size="4">
<%
if(flag==0){
	out.println("Sorry...! Data Not Exist ");
}
%></font>
<br/>
</center>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
DbUtil.closeDBResources(rs,st,conn);
DbUtil.closeDBResources(rs3,st3,cn3);
DbUtil.closeDBResources(rs2,st2,null);
}
%>
</form>	
</body>
</html>