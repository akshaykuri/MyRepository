<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
    <%@ include file="../../banner.jsp" %>
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>NEIN-C2IT</title>
<link rel="shortcut icon" href="../images/faviconnnnn.ico" />
<link rel='stylesheet' type='text/css' href='../css/headerColor.css' />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>C2IT REPORT DETAILS</title>
<link rel="stylesheet" type="text/css" href="css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="js/Calendar.js"></script>
<style type="text/css">
div#id
 {
  width:100px;
  height:100px;
 }
 #mreport{
 border-collapse:collapse;

 }
 
 #logreport{
 border-collapse:collapse;

 }
 #incireport{
  border-collapse:collapse;

  }
 
</style>
</head>
<script type="text/javascript">
function osd(obj){

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../ITFORMS/FormLocalApproval/ITclearanceLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}

 

function dom(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../DomainUser/FormLocalApproval/DomainUserLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}
function Email(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../LOTUS/FormLocalApproval/LotusLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}
function Biometric(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../AccessCard/FormLocalApproval/AccessCardLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}
function Shared(obj){


    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../SharedFolder/FormLocalApproval/SharedFolderAllLocalAdmin.jsp?msg=1";

    document.form.submit();

}
function Gsnet(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../GSNET/GSNETViewReportBack.jsp?msg=1";

    document.form.submit();

}
function Nexas(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../NExAS/NExASViewReportBack.jsp?msg=1";

    document.form.submit();

}
function USB(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../USB/RegistrationForSW/FormLocalApproval/RegistrationLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}
function Registration(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../RegistrationForSW/FormLocalApproval/RegistrationLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}
function Incident(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../IncidentLog/IncidentUserSelectionBack.jsp?msg=1";

    document.form.submit();

}

function Newins(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../Newins/FormLocalApproval/NewinsLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}
function Single(obj){
	

    document.getElementById("req").value=obj;

    document.form.method="post";

    document.form.action="../SingleApplicationForm/FormLocalApproval/NEINApplicationLocalAllAdmin.jsp?msg=1";

    document.form.submit();

}






</script>
<body bgcolor="" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="70" style="overflow-x: auto; overflow-y: auto;">

<div id="wrapper">
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="1000" align="left"><img src="../images/nippon.gif" height="35" width="220"> </td>
       
    </tr>
   <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b>C2IT</b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">REPORT DETAILS</font></strong></td>
</tr>
 <tr > <td bgcolor=""><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
                <font size ="2">DESG :<%=session.getAttribute("desg")%> </font></td>
 </tr>
</table>

<br />
<br />



<form name="form" method="post" action="">
<input type="hidden" name="req" id="req">
<table align="center" width="350" border="1" cellpadding="2" cellspacing="1" id="mreport">

<%
	 String AdminName=null,desg=null,EmpNo=null;
	 AdminName = (String) session.getAttribute("Nname");
	 desg = (String) session.getAttribute("desg");
	 EmpNo=(String) session.getAttribute("EmpNo");
	 System.out.println("Emp no :"+EmpNo);
	%>	 
	 
<%
String formno=null,name=null,code=null,branch=null,date=null;
Connection cn9 = null,cn8=null,cn7=null,cn6=null,cn5=null,cn4=null,cn3=null,cn2=null,cn1=null;
Statement st9 = null,st8=null,st7=null,st6=null,st5=null,st4=null,st3=null,st2=null,st1=null; 
ResultSet rs9 = null,rs8=null,rs7=null,rs6=null,rs5=null,rs4=null,rs3=null,rs2=null,rs1=null;
Connection cn10 = null,cn11=null,cn12=null;
Statement st10 = null,st11=null,st12=null; 
ResultSet rs10 = null,rs11=null,rs12=null;
try{
cn9 = con.getConnection2();
st9=cn9.createStatement();
String a=request.getParameter("f");

String []b=a.split(",");
System.out.println("The length....."+b.length);
/* String aa=b[0].substring(8,10);
System.out.println("The Substrinng......."+aa); */
if(!((b[0].substring(5,7).equals("CM"))||(b[0].substring(8,10).equals("IL")))){
	
%>
<tr bgcolor="#adad85">
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Form_Name</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Employee_Name</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Employee_Code</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Employee_Branch</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Initiated_Date</b></font></td>
</tr>	
<%
for(int i=0;i<b.length;i++){
	/* String aa=b[i].substring(8,14);
	System.out.println("The Substrinng......."+aa); */
if((b[i].substring(5,8).equals("USB"))){
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("SELECT form10_no,full_name,emp_code,branch,f_date FROM `form17_usb_access` where form10_no='"+b[i]+"'");
while(rs1.next()){
	formno=rs1.getString("form10_no");
	name=rs1.getString("full_name");
	code=rs1.getString("emp_code");
	branch=rs1.getString("branch");
	date=rs1.getString("f_date");
%>	 
<tr>
<td><font size="2"><a href="#" onclick="USB('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
<td><font size="2"><%=name%></font></td>
<td><font size="2"><%=code%></font></td>
<td><font size="2"><%=branch%></font></td>
<td><font size="2"><%=date%></font></td>
</tr>
<%}
}else if((b[i].substring(5,10).equals("NExAS"))){
	cn2=con.getConnection2();
	st2=cn2.createStatement();
	rs2 = st2.executeQuery("SELECT form_no,full_name,empid,empBranch,form_date FROM `form12_nexas` where form_no='"+b[i]+"'");
	while(rs2.next()){
		formno=rs2.getString("form_no");
		name=rs2.getString("full_name");
		code=rs2.getString("empid");
		branch=rs2.getString("empBranch");
		date=rs2.getString("form_date");
	%>
<tr>
<td><font size="2"><a href="#" onclick="Nexas('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
<td><font size="2"><%=name%></font></td>
<td><font size="2"><%=code%></font></td>
<td><font size="2"><%=branch%></font></td>
<td><font size="2"><%=date%></font></td>
</tr>
<%}
}else if((b[i].substring(5,10).equals("GSNET"))){
	cn3=con.getConnection2();
	st3=cn3.createStatement();
	rs3 = st3.executeQuery("SELECT form_no,full_name,empid,empBranch,form_date FROM `form15_gsnet` where form_no='"+b[i]+"'");
	while(rs3.next()){
		formno=rs3.getString("form_no");
		name=rs3.getString("full_name");
		code=rs3.getString("empid");
		branch=rs3.getString("empBranch");
		date=rs3.getString("form_date");
	%>
<tr>
<td><font size="2"><a href="#" onclick="Gsnet('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
<td><font size="2"><%=name%></font></td>
<td><font size="2"><%=code%></font></td>
<td><font size="2"><%=branch%></font></td>
<td><font size="2"><%=date%></font></td>
</tr>

<%
}
}
else if((b[i].substring(8,10).equals("IT"))){
cn4=con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("SELECT form1_no,full_name,emp_code,branch,f_date FROM `form1_it_clearance` where form1_no='"+b[i]+"'");
while(rs4.next()){
	formno=rs4.getString("form1_no");
	name=rs4.getString("full_name");
	code=rs4.getString("emp_code");
	branch=rs4.getString("branch");
	date=rs4.getString("f_date");
%>	 
<tr>
<td><font size="2"><a href="#" onclick="osd('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
<td><font size="2"><%=name%></font></td>
<td><font size="2"><%=code%></font></td>
<td><font size="2"><%=branch%></font></td>
<td><font size="2"><%=date%></font></td>
</tr>

<%
}
}else if((b[i].substring(8,13).equals("Email"))){
	cn5=con.getConnection2();
	st5=cn5.createStatement();
	rs5 = st5.executeQuery("SELECT form3_no,full_name,emp_code,branch,f_date FROM `form3_lotus` where form3_no='"+b[i]+"'");
	while(rs5.next()){
		formno=rs5.getString("form3_no");
		name=rs5.getString("full_name");
		code=rs5.getString("emp_code");
		branch=rs5.getString("branch");
		date=rs5.getString("f_date");
	%>	 
	<tr>
	<td><font size="2"><a href="#" onclick="Email('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
	<td><font size="2"><%=name%></font></td>
	<td><font size="2"><%=code%></font></td>
	<td><font size="2"><%=branch%></font></td>
	<td><font size="2"><%=date%></font></td>
	</tr>
<%}
}else if((b[i].substring(8,13).equals("Acard"))){
	cn6=con.getConnection2();
	st6=cn6.createStatement();
	rs6 = st6.executeQuery("SELECT form4_no,full_name,emp_code,branch,f_date FROM `form4_accesscard` where form4_no='"+b[i]+"'");
	while(rs6.next()){
		formno=rs6.getString("form4_no");
		name=rs6.getString("full_name");
		code=rs6.getString("emp_code");
		branch=rs6.getString("branch");
		date=rs6.getString("f_date");
	%>	 
<tr>
	<td><font size="2"><a href="#" onclick="Biometric('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
	<td><font size="2"><%=name%></font></td>
	<td><font size="2"><%=code%></font></td>
	<td><font size="2"><%=branch%></font></td>
	<td><font size="2"><%=date%></font></td>
	</tr>
<%
}
}else if((b[i].substring(8,14).equals("NEWINS"))){
	cn7=con.getConnection2();
	st7=cn7.createStatement();
	rs7 = st7.executeQuery("SELECT form7_no,full_name,emp_code,branch,f_date FROM `form7_newins` where form7_no='"+b[i]+"'");
	while(rs7.next()){
		formno=rs7.getString("form7_no");
		name=rs7.getString("full_name");
		code=rs7.getString("emp_code");
		branch=rs7.getString("branch");
		date=rs7.getString("f_date");
%>
<tr>
	<td><font size="2"><a href="#" onclick="Newins('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
	<td><font size="2"><%=name%></font></td>
	<td><font size="2"><%=code%></font></td>
	<td><font size="2"><%=branch%></font></td>
	<td><font size="2"><%=date%></font></td>
	</tr>

<%}
}else if((b[i].substring(8,14).equals("Domain"))){
	cn8 = con.getConnection2();
	st8=cn8.createStatement();
	rs8 = st8.executeQuery("SELECT form2_no,full_name,emp_code,branch,f_date FROM `form2_domain` where form2_no='"+b[i]+"'");
	while(rs8.next()){
		formno=rs8.getString("form2_no");
		name=rs8.getString("full_name");
		code=rs8.getString("emp_code");
		branch=rs8.getString("branch");
		date=rs8.getString("f_date"); %>
	<tr>
<td><font size="2"><a href="#" onclick="dom('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
<td><font size="2"><%=name%></font></td>
<td><font size="2"><%=code%></font></td>
<td><font size="2"><%=branch%></font></td>
<td><font size="2"><%=date%></font></td>
</tr>
<%	
}
}else if((b[i].substring(8,15).equals("Sfolder"))){
	cn9=con.getConnection2();
	st9=cn9.createStatement();
	rs9 = st9.executeQuery("SELECT form5_no,full_name,emp_code,branch,f_date FROM `form5_folder` where form5_no='"+b[i]+"'");
	while(rs9.next()){
		formno=rs9.getString("form5_no");
		name=rs9.getString("full_name");
		code=rs9.getString("emp_code");
		branch=rs9.getString("branch");
		date=rs9.getString("f_date");

%>
<tr>
	<td><font size="2"><a href="#" onclick="Shared('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
	<td><font size="2"><%=name%></font></td>
	<td><font size="2"><%=code%></font></td>
	<td><font size="2"><%=branch%></font></td>
	<td><font size="2"><%=date%></font></td>
	</tr>	
	
	<%
	
	}

}else{
	cn10=con.getConnection2();
	st10=cn10.createStatement();
	rs10 = st10.executeQuery("SELECT form10_no,full_name,emp_code,branch,f_date FROM `form10_registration` where form10_no='"+b[i]+"'");
	while(rs10.next()){
		formno=rs10.getString("form10_no");
		name=rs10.getString("full_name");
		code=rs10.getString("emp_code");
		branch=rs10.getString("branch");
		date=rs10.getString("f_date");
		%>
<tr>
	<td><font size="2"><a href="#" onclick="Registration('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
	<td><font size="2"><%=name%></font></td>
	<td><font size="2"><%=code%></font></td>
	<td><font size="2"><%=branch%></font></td>
	<td><font size="2"><%=date%></font></td>
	</tr>
<%
}
	
}
}
%>
</table>
<%
}else if((b[0].substring(5,7).equals("CM"))){
	System.out.println("Log Complaint");
%>
<table align="center" width="500" border="1" cellpadding="2" cellspacing="3" id="logreport">
<tr bgcolor="#adad85">
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Complaint_Id</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Raised_By</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Location</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Problem</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Raised_Date</b></font></td>
</tr>
<%
for(int j=0;j<b.length;j++){
cn11=con.getConnection2();
st11=cn11.createStatement();
rs11=st11.executeQuery("Select * From complain_master_item where complain_id='"+b[j]+"'");
while(rs11.next()){
	String cid=rs11.getString("complain_id");
	String reqemp=rs11.getString("cm_name");
	String Location=rs11.getString("cm_location");
	String prob=rs11.getString("cm_problem");
	String Reqdate=rs11.getString("cm_date");
	String ptype=rs11.getString("pType");
	String resemp=rs11.getString("emp");
	String Resdate=rs11.getString("cm_date2");
	String cause=rs11.getString("root_cause");
	String steps=rs11.getString("steps_taken");
%>
<tr>
<td><font size="2" color="black"><a href="LogDetails.jsp?f=<%=cid%>"><%=cid%></a></font></td>
<td><font size="2" color="black"><%=reqemp %></font></td>
<td><font size="2" color="black"><%=Location %></font></td>
<td><font size="2" color="black"><%=prob%></font></td>
<td align=center><font size="2" color="black"><%=Reqdate %></font></td>
</tr>
<%}
}
%>

</table>
<%}else if((b[0].substring(8,10).equals("IL"))){
System.out.println("Incident");%>
<table align="center" width="150" border="1" cellpadding="2" cellspacing="3" id="incireport">
<tr bgcolor="#adad85">
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Form_No</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Initiator_Name</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Location</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Date</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Remarks_GA</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Remarks_IT</b></font></td>
</tr>
<%
for(int k=0;k<b.length;k++){
	cn12=con.getConnection2();
	st12=cn12.createStatement();
	rs12=st12.executeQuery("Select * From form9_incident_log where form9_no='"+b[k]+"'");
	while(rs12.next()){
		String form=rs12.getString("form9_no");
		String iname=rs12.getString("SessionName");
		String loc=rs12.getString("SessionCity");
		String idate=rs12.getString("to_date");
		String rga=rs12.getString("Approval_remarks");
		String rit=rs12.getString("ITremark");
%>
<tr>
<td  width="100" align=left style="vertical-align:middle" ><font size="2" color="black"><a href="#" onclick="Incident('<%=form%> -<%=iname%>')"><%=form%></a></font></td>
<td  width="100" align=left style="vertical-align:middle" ><font size="2" color="black"><%=iname %></font></td>
<td  width="100" align=left style="vertical-align:middle" ><font size="2" color="black"><%=loc %></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="2" color="black"><%=idate%></font></td>
<td  width="100" align=left style="vertical-align:middle" ><font size="2" color="black"><%=rga %></font></td>
<td  width="100" align=left style="vertical-align:middle" ><font size="2" color="black"><%=rit%></font></td>
</tr>
<%}
	}
	}else{
	System.out.println("Nothing.....");
	}%>
</table>
<%
if(b[0].substring(8,16).equals("APP-FORM")){
%>
<table align="center" width="350" border="1" cellpadding="2" cellspacing="1" id="mreport">
<tr bgcolor="#adad85">
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Form_Name</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Employee_Name</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Employee_Code</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Employee_Branch</b></font></td>
<td  width="100" align=center style="vertical-align:middle" ><font size="3" color="black"><b>Initiated_Date</b></font></td>
</tr>	
<%
for(int i=0;i<b.length;i++){
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("SELECT applicationNo,full_name,employee_code,branch,applicationDate FROM `neinapplicationform` where applicationNo='"+b[i]+"'");
while(rs1.next()){
	formno=rs1.getString("applicationNo");
	name=rs1.getString("full_name");
	code=rs1.getString("employee_code");
	branch=rs1.getString("branch");
	date=rs1.getString("applicationDate");
%>	 
<tr>
<td><font size="2"><a href="#" onclick="Single('<%=formno%> -<%=name%>')"><%=formno%></a></font></td>
<td><font size="2"><%=name%></font></td>
<td><font size="2"><%=code%></font></td>
<td><font size="2"><%=branch%></font></td>
<td><font size="2"><%=date%></font></td>
</tr>
<%}
}
}%>
</table>
<%		
}
catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs1,st1,cn1);
	DbUtil.closeDBResources(rs2,st2,cn2);
	DbUtil.closeDBResources(rs3,st3,cn3);
	DbUtil.closeDBResources(rs4,st4,cn4);
	DbUtil.closeDBResources(rs5,st5,cn5);
	DbUtil.closeDBResources(rs6,st6,cn6);
	DbUtil.closeDBResources(rs7,st7,cn7);
	DbUtil.closeDBResources(rs8,st8,cn8);
	DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs10,st10,cn10);
	DbUtil.closeDBResources(rs11,st11,cn11);
	DbUtil.closeDBResources(rs12,st12,cn12);
	
	
	

  }
%>
	
	
</form>

	
	<br>
<br>
<br>
<br>
<!-- <table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../HOME.jsp"><img src="../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="javascript:history.back()"><img src="../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td>
</tr>
</table> 
 -->

<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>


</body>
</html>