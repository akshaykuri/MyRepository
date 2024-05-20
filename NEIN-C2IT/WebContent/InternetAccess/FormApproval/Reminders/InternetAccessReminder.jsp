<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%> 
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
<%@ include file="../../../Session/SuperAdminSessionInSide3.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>

	<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
	<!-- <script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
		<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
        <script language="javascript"   type="text/javascript" src="../../js/onSubmitWait.js"></script>
	<!-- Help Page pop up ends -->
	
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<%-- 
	<script  type="text/javascript">

<% 
    String msg2[] = request.getQueryString().toString().split("=");
    String disp = msg2[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27"," ");
    disp = disp.replace("__","  ");
    %>
    msg2 = "<%=disp%>";

     if(msg2!="1")
		{
           alert(msg2);
		}
</script> --%>
<script  type="text/javascript">
function btnClick() { 
         close(); 
}
</script>
 <script language="javascript" type="text/javascript">
/* function onloadCheck()
{
	
	 var selectElement = document.getElementById("idit1aa");
	 var selectValue = selectElement.value;
	 var backColor = '#FFFFFF';
		    if(selectValue == 'Select'){ backColor = 'Green';}
		    else 
		    	backColor = 'lightred';
		        selectElement.style.backgroundColor = backColor;
	
} */
function validate()
{
var d1 = document.form.reminder;
   if ((d1.value==null)||(d1.value=="Select")||(d1.value==""))
				{
  				 alert("Select Remainder!");
   			         d1.focus();
   			        // d1.style.backgroundColor = d1.style.bkColor;
   			        d1.style.backgroundColor=(d1.style.backgroundColor==""?"#3333FF":"");
  				 return false;
  				 }

else
return true;
}
</script>
</head>
<body onload="onloadCheck();">

	<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn100 = null,cn1=null,cn101 = null;
Statement st100= null,st101=null,st1=null; 
ResultSet rs100 = null,rs101=null,rs1=null;
String req=null;
String empD=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,Session2b_no=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
Session2b_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");
System.out.println("DESIG : "+Sessiondesg);
System.out.println("B NO  : "+Sessionb_no);
System.out.println("B NO 2 : "+Session2b_no);
%>
	

<%

/* String req = request.getParameter("form1_no");

String req2 = request.getParameter("second");
String req22 = request.getParameter("req2");
System.out.println("req22 "+req22);
String req3 = request.getParameter("req");
String req33 = request.getParameter("req3");
System.out.println("REQ 33 "+req33);
 */

String no=request.getParameter("rss");
System.out.println("wat is the getting value  :"+no); 
/* String req4 = request.getParameter(no);
System.out.println("wat is the getting value 2 req 4 :"+req4); */



System.out.println("LOTUS REMINDER "+SessionName+"   -- FOR THE REQUEST : "+no);
cn1 = con.getConnection2();
st1 = cn1.createStatement();
rs1 = st1.executeQuery("select * from form6_internet WHERE form6_no='"+no+"'"); 
if(!rs1.next())
{
	System.out.println("LETS SEEEEEEEEEEEEEE");%>
<script  type="text/javascript">
	window.close();
	</script>
	<% 
}
else
{
	System.out.println("--------");
}

String form6_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;
String ipAddress=null,ComName=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null;

cn100 = con.getConnection2();
st100 = cn100.createStatement();
rs100 = st100.executeQuery("select * from form6_internet WHERE form6_no='"+no+"'"); 
while(rs100.next())
{
	 
	form6_no = rs100.getString("form6_no");
    f_date = rs100.getString("f_date");
    idextend = rs100.getString("idextend");

    branch = rs100.getString("branch");
    depart = rs100.getString("depart");
    full_name = rs100.getString("full_name");
    designation = rs100.getString("designation");
    scopeOfWork = rs100.getString("scopeOfWork");
    emp_code = rs100.getString("emp_code");
    reporting_officer = rs100.getString("reporting_officer");
    requestOption = rs100.getString("requestOption");
    requestBy = rs100.getString("requestBy");
    remarks = rs100.getString("remarks");
    ipAddress = rs100.getString("ipAddress");
    ComName = rs100.getString("ComName");
	   

	 i_name = rs100.getString("i_name");
	 i_desg = rs100.getString("i_desg");
	 i_city = rs100.getString("i_city");
	 i_b_no = rs100.getString("i_b_no");
	 i_admin = rs100.getString("i_admin");
	 i_email_id = rs100.getString("i_email_id");


	 desg = rs100.getString("desg");
	 emp = rs100.getString("emp");
	 mail = rs100.getString("mail");
	
	

}
String ITdesg=null,ITbno=null;
String NONITName=null,NONITmailId=null;
PreparedStatement psmt=null,psmt2=null;

%> 
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<form name="form" action="InternetAccessReminderBack.jsp" method="post"  ><center>
<label> <font color="black"><u><b>INTERNET ACCESS REQUEST-REMINDER</b></u></font> </label> 
<br/>




<table id="table3" cellspacing="1" border="1" style="border-color: lightgrey">
	<!-- <tr>
	<td ><font size="3">
		<b><center><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label> </center>
		</b></font></td>
	</tr> -->
	<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" bgcolor="grey">
<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
<input name="form_no" value="<%=form6_no%>" size="31" readonly="readonly"/> </td>
</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >INITIATOR NAME:</td>
<td style="text-align:left;" bgcolor="grey"><input name="initiator_by" value="<%=i_name%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >INITIATED FOR :</td>
<td style="text-align:left;" bgcolor="grey"><input name="initiator_for" value="<%=full_name%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/>
 
					</td> 
</tr>
<tr>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
</tr>

<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" value="<%=designation%>" readonly="readonly"/></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>


</tr>
<tr>
<td  style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;">

<input type="text"  style="width: 6em"  name="d_resignation" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" />

</td>

<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_reliving"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
	
		</td> 					        
</tr>
<tr>
<td  style="text-align: right;">IP Address :</td>
<td style="text-align:left;">

<input type="text"  style="width: 6em"  name="ipAddress" value="<%=ipAddress%>" readonly="readonly"  readonly="readonly" />

</td>

<td  style="text-align: right;">Computer Name</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_reliving"  value="<%=ComName%>" readonly="readonly" readonly="readonly" />
	
		</td> 					        
</tr>

<br></br>
<tr>
<td style="text-align: right;" bgcolor="grey">Type of Request  :</td>
<td style="text-align:left;" bgcolor="grey"> 
     <input style="" type ="text" id="idit1aa" name = "requestOption" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
     <td align="right" bgcolor="grey">Do you want Remainder for this module?  :</td>
     <td bgcolor="grey">
   <font color="white">
     <select name="reminder" >
			<option value="">Select</option>
		    <option >Yes</option> 
			<option >No</option>
	</select></font></td>
</tr>
</table>
<br>






<table width="165" align ="center" id="hiderow">
<tr>
 
<!-- <td align="left" id="hiderow"><input id="hiderow" type='submit' size="2" style="background-color:white;font-weight:bold;color:black;" value='Save' onclick='btnClick();'></td> -->
 <td><input type="submit" name="Submit" value="Update" style="background-color:white;font-weight:bold;color:black;" onclick="return validate();"/></td>

<td align="left" id="hiderow">
<input id="hiderow" type="button" style="background-color:white;font-weight:bold;color:black;" value='Cancel' onclick='btnClick();'/></td>
</tr>

</table>
</center>
</form>
</body>
</html>