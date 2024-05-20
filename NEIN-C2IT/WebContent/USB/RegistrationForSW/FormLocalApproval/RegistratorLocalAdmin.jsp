<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>CCD</title>
	<link rel='stylesheet' type='text/css' href='../../../css/style2.css' />
<!-- 	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->

<link rel="shortcut icon" href="../../../images/faviconnnnn.ico" />
	
	<link rel="stylesheet" type="text/css" href="../../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../../js/Calendar.js"></script>
<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../../js/FormsHelp.js"></script>
     <script language="javascript"   type="text/javascript" src="../../../js/onSubmitWait.js"></script>
	<!-- Help Page pop up ends -->


 <script language="javascript" type="text/javascript">
	
   function validate()
   {//txtmail_msg
   var d1 = document.form.txtmail_msg;
   var d2 = document.form.mail1;
   var ff=document.form.empid1;
   //alert(ff.value);
   //alert(d2.value);
  if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	   {
       alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
       document.getElementsByName("mmdradio")[0].focus();
       return false;
       } 
  
  if(ff.value=="" && d2.value=="")
	  { //alert("main");
      if (((d2.value==null)||(d2.value=="")) && !document.getElementsByName("mmdradio")[1].checked)
           {
           alert("Please select the next approver name !");
           d2.focus();
           return false;
           }
      
	  }
  if(ff.value=="Final1" && d2.value=="")
	  {
	   //alert("else");
	   var un = document.form.ITusername;
	   var pw=document.form.ITpassword;
	   if (un.value=="")
	         {
	         alert("Enter User Name !");
	         un.focus();
	         return false;
	         }
	   if (pw.value=="")
             {
             alert("Enter Password !");
             pw.focus();
             return false;
             }
	  }
  if (d1.value=="")
  {
  alert("Enter Remarks !");
  d1.focus();
  return false;
  }
else
 return true;
  
   }
</script>

<script type="text/javascript">


</script>
<script type="text/javascript">
function showTR()
	{
	var status = document.getElementById('idstatus').value;
	
	//alert("status is  "+status);
	if (status!="true")
	    {
	    alert("you are not authorized person");
	    return false;
	    }
	else
	    {
		document.getElementById('idApprovedd').style.display="table-row";
	   	document.getElementById('idApprovedd').style.visibility="visible";
	 	return true;
	    }
	}
function hideTR()
{

var status = document.getElementById('idstatus').value;

//alert("status is  "+status);

if (status!="true")
{
alert("you are not authorized person");

return false;
}
else
 {

 document.getElementById('idApprovedd').style.hidden="table-row";
 document.getElementById('idApprovedd').style.visibility="hidden";
 
 return true;
 
 }
}
function sync(val)
{
//alert(val);
var parts = val.split(",");
var part1 = parts[0]; 
var part2 = parts[1]; 
var part3 = parts[2]; 
var part4 = parts[3];  
var part5 = parts[4]; 
if(val!="")
	  {
	  document.getElementById("idrodesg").value=part3;
    document.getElementById("idroname").value=part2;
    document.getElementById("idromail").value=part4;
    document.getElementById("idempid1").value=part1;
    document.getElementById("idlevelno").value=part5;
	  }
else
	  {
	  document.getElementById("idrodesg").value="";
    document.getElementById("idroname").value="";
    document.getElementById("idromail").value="";
    document.getElementById("idempid1").value="";
    document.getElementById("idlevelno").value="";
	  }
}

function hideHigherTR()
{
/*  document.getElementById('idApproved1').style.display="none";
 document.getElementById('idApproved1').style.visibility="hidden"; */
/*  document.getElementById('idPwd1').style.display="none";
 document.getElementById('idPwd1').style.visibility="hidden"; */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.visibility="visible";
 alert("Select Designation And Name");
}
 function showHigherTR()
{
/*  document.getElementById('idApproved1').style.display="table-row";
 document.getElementById('idApproved1').style.visibility="visible"; */

 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.display="none";
 alert("Mail Will Be Sent To IT (Head Office)");
}
</script>
<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
	
{	
String msg=null;
msg="Session__Time__out__Login__In__Again ";
response.sendRedirect("../adminlink.jsp?msg="+msg);
}
%>
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script>
	
 
</head>
<body>
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="RegistrationLocalAdminBack.jsp">

<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null,EmpNo=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rs12=null,rs11=null;
String req=null;
String empD=null;
Statement st12=null,st11=null;

%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
EmpNo=(String) session.getAttribute("EmpNo");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");
Connection cn5 = null,cn11=null; 
Statement st5 = null,st11=null,stnext=null; 
ResultSet rs5 = null,rs11=null,rsnext=null; 
try{
%>

<%
String form10_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,ITAssignedRights=null,dongleNo="",accessFor="";
String req = request.getParameter("req");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form17_usb_access WHERE form10_no='"+req+"'"); 
    while(rs100.next())
        {
	    form10_no = rs100.getString("form10_no"); 
	    f_date = rs100.getString("f_date");
	    idextend = rs100.getString("idextend");
	    branch = rs100.getString("branch");
	    depart = rs100.getString("depart");
	    full_name = rs100.getString("full_name");
	    designation = rs100.getString("designation");
	    scopeOfWork = rs100.getString("regis_mail");
	    emp_code = rs100.getString("emp_code");
	    reporting_officer = rs100.getString("Software");
	    requestOption = rs100.getString("requestOption");
	    
	    if(requestOption.equals("New"))
	    	requestOption="Enable";
	    else
	    	requestOption="Disable";
	    requestBy = rs100.getString("requestBy");
	    remarks = rs100.getString("remarks");
	    ITAssignedRights = rs100.getString("ITAssignedRights");
	    i_name = rs100.getString("i_name");
	    i_desg = rs100.getString("i_desg");
	    i_city = rs100.getString("i_city");
	    i_b_no = rs100.getString("i_b_no");
	    i_admin = rs100.getString("i_admin");
	    i_email_id = rs100.getString("i_email_id");
  	    desg = rs100.getString("desg");
	    emp = rs100.getString("emp");
	    mail = rs100.getString("mail");
	    accessFor = rs100.getString("accessFor");
	    dongleNo = rs100.getString("dongleNo");
        }
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	 <tr>
		<td ><center><font size="3">
		<b><label>USB ACCESS FORM</label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=SessionName%>" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="hidden" name="i_city" value="<%=city%>" />
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form1_no" value="<%=form10_no%>" />
		</td>
	</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td>
           <%
            String b_no=null;
            b_no = (String) session.getAttribute("b_no");
            System.out.println("b_no :"+b_no);
           %>
           <%
           cn2 = con.getConnection2();
           st2=cn2.createStatement();
           rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 
           cn4 = con.getConnection2();
           st4=cn4.createStatement();
           rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 
          %>	 
		
	<table width="895">
	   <tr>
          &nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >NAME:</td>
          <td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
      </tr>	
      <tr>
         &nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >DESIGNATION :</td>
         <td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
      </tr>	
      <tr>
         &nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
         <td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=form10_no%>" size="31" readonly="readonly"/> </td>
      </tr>
      <tr>
         <td  style="text-align: right;">Employee Code :</td>
         <td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
         <td  style="text-align: right;">Full Name :</td>
         <td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
     </tr>	
     <tr>
         &nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
         <td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
         <td  style="text-align: right;width: 175px;">Department :</td>
         <td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/></td> 
     </tr>
     <tr>
        <td  style="text-align: right;">Designation :</td>
        <td style="text-align:left;"><input name="designation" value="<%=designation%>" readonly="readonly"/></td>
        <td  style="text-align: right;">Software :</td>
        <td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>
     </tr>
     <tr>
        <td  style="text-align: right;">Mail ID :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="d_resignation" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" />
        </td>
        <td  style="text-align: right;">Requested By:</td>
        <td style="text-align:left;">
        <input type="text"  style="width: 15em"  name="d_reliving"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
		</td> 					        
    </tr>
     <tr>
        <td  style="text-align: right;">Request To :</td>
        <td style="text-align:left;"> <input type="text"  style="width: 15em"  name="d_resignation" value="<%=requestOption%>" readonly="readonly"  readonly="readonly" />
        </td>
     </tr>
      <tr>
		<td  style="text-align: right;">Access For :</td>
		<td style="text-align: left;"> 
		    <input type="text" size="29" name="dscNo" value="<%=accessFor%>" id="dscNo" maxlength="44" readonly/>
		</td>
		<td style="text-align: right;">USB Details :</td>
		<td style="text-align: left;"><input type="text" size="29" name="dscNo" value="<%=dongleNo%>" id="dscNo" maxlength="44" readonly/>	</td>		
  </tr>
</table>
<br>


<br />
<table width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		  <td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		  <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		  <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		  <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		  <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
	  </tr>
	  <%
	  String mailD=null;
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  String statusD=null,emp_no=null,levelno=null;
	  rs1 = st1.executeQuery("select form10_no,desg,emp,status,remarks,f_date,mail,empid,levelno from form17_usb_access_item WHERE form10_no='"+req+"' ORDER BY id ASC"); 
	  while(rs1.next())
	      {
		  String form10_noD= rs1.getString("form10_no");
		  String desgD= rs1.getString("desg");
		  empD= rs1.getString("emp");
		  statusD= rs1.getString("status");
		  String remarksD= rs1.getString("remarks");
		  String f_dateD= rs1.getString("f_date");
		  mailD= rs1.getString("mail");
		  
		  emp_no= rs1.getString("empid");
		  levelno= rs1.getString("levelno");
		  
		  String m = "";
		  if(rs1.getString("mail")!=null)
		   {
		    m =  rs1.getString("mail").trim();
		   }
		 %>
	   <tr>
	   	  <td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
		    <input id="idStatus" type="hidden" value="<%=statusD%>"/>
		  </td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=statusD%></font></td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		  <td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
	  </tr>
	  <%} %>
</table>

<%String flag = c2ITUtil1.getAuthorizedNameUSB(form10_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),EmpNo); %>
<%System.out.println("FLAG value --------------------- : "+flag);%>
<table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
      <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
      <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
      <input type="hidden" value="<%= session.getAttribute("form10_no") %>" id="idmrId"/>
      <input type="hidden" id="idstatus" value="<%= flag %>" />
   <tr>
    <td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(showTR());"/>Approved 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR());" />Not Approved
    </td>
   </tr> 
   <tr style="visibility: hidden;display: none;" id="idApprovedd" >
     <%ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
     
	ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
	String userNamel = dbPropertiesl.getString("leavemanagement.username");
	String passwordl = dbPropertiesl.getString("leavemanagement.password");
	String urll = dbPropertiesl.getString("leavemanagement.url");
	//String driverl = dbPropertiesl.getString("leavemanagement.driverName");
	String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
    

     
     
     
	Class.forName(driver).newInstance();
    cn5 = DriverManager.getConnection(url+dbName,userName,password); 
     Connection connhrms = null;
    
     /* String url = "jdbc:mysql://localhost:3306/";
     String dbName = "leavemanagement";
     String driver = "com.mysql.jdbc.Driver";
     String userName = "root"; 
     String password = ""; */
     String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
     connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);
     Statement nstmt = connhrms.createStatement();  
    
     String maxlevel="";
     
      cn1 = con.getConnection2();
	  st12=cn1.createStatement();
	  
      rs12= st12.executeQuery("SELECT max(levelno) FROM formapproval WHERE branch='"+i_b_no+"' and formtype='USB_ACCESS'  ORDER BY levelno ASC");
     if(rs12.next())
         { 
         maxlevel=rs12.getString(1);
         }
     System.out.println("Max Level no :"+maxlevel);
     String allopt="",dirappro="";
     st11 = cn1.createStatement();  
     //rs5 = st5.executeQuery("Select * from desg");emp_no,levelno
    rs11 = st11.executeQuery("SELECT alloptions,directApprove FROM formapproval WHERE branch='"+i_b_no+"' and empid='"+emp_no+"' and formtype='USB_ACCESS'");
     if(rs11.next())
         { 
         allopt=rs11.getString(1);
         dirappro=rs11.getString(2);
         }
     int nextlevel=0;
     st5 = cn5.createStatement(); 
     System.out.println("Current Level no :"+levelno);
     if(!levelno.equals("Creater"))
          nextlevel=Integer.parseInt(levelno)+1;
     //System.out.println("Next  Level no :"+nextlevel);
     
     /* ////////////////////////// Skeeping level code  ////////////////////////////////// */
      String nextemp="";
      stnext = cn5.createStatement(); 
      rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no+"' and levelno='"+nextlevel+"' and formtype='USB_ACCESS' ORDER BY levelno ASC");
      if(rsnext.next())
           {
    	   nextemp=rsnext.getString(5);
           }
      if(emp_no.equals(nextemp))
          {
    	  nextlevel++;
          }
     /* ////////////////////////// end Skeeping level code  ////////////////////////////////// */
     
     
     if(allopt.equals("0") || allopt.equals(""))
           {
    	  if(!levelno.equals(maxlevel))
	         {
    		 System.out.println("Next  Level no :"+nextlevel);
    	     rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no+"' and levelno='"+nextlevel+"' and formtype='USB_ACCESS' ORDER BY levelno ASC");
    	     if(rs5.next())
                {
    		     ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString(5) + "' ) AND u.employee_status = 'yes' ");
    		     if(nrs.next())
    		            { 
    		  	         nuname=nrs.getString(1);
    		             ndesg=nrs.getString(2);
    		             nmailid=nrs.getString(6);
    		            }
    		     napproval=rs5.getString(5)+","+nuname+","+ndesg+","+nmailid+","+nextlevel;
    		     napproval1=nuname+" ("+nmailid+")";
    		     System.out.println("Next approval :"+napproval); 
               %>
                  <td> 
                      <input align="left" type="radio" value="<%=napproval%>" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
                      <input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
                      <input type="hidden" name="mail12" id="iddeptadminP" value="<%=napproval%>" size="30"/>
   	              </td>
            
                                       <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail1" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
               <%}
    	     else
	             {
	    	     System.out.println("user crator section :"); %>
	    	     <input type="hidden" name="empid1" id="idempid1" value="Final1" readonly/>
                 <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                 <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                 <input type="hidden" name="mail1" id="idromail" value="" readonly/>
                 <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
                 <td class="it2" > 
                  User Name :<input type="text" name="ITusername" id="uname" maxlength="65" />
                  Password :<input type="text" name="ITpassword" id="pwd" maxlength="65" />
                  </td>
	          <%}
	              }
               else
                  {
            	   System.out.println("Direct approve section.............");
            	   String app_name=null,developer_name=null,developer_mail=null,napprovalsw="",napprovalsw1="";
            	   st2=cn2.createStatement();
            	   //rs2 = st2.executeQuery("select app_name,developer_name,developer_mail from software_owner_master WHERE app_name='"+Software+"'");
            	   rs2 = st2.executeQuery("select app_name,developer_name,developer_mail from software_owner_master where app_name='CCD'");
            	   if(rs2.next())
            	       {
            	   	   app_name = rs2.getString("app_name");
            	 	   developer_name = rs2.getString("developer_name");
            	 	   developer_mail = rs2.getString("developer_mail");
            	       }
            	   napprovalsw=developer_name+"("+developer_mail+")";
            	   napprovalsw1="Final"+","+developer_name+","+"Dy. Manager"+","+developer_mail+","+"Creater";
            	   
            	   
            	   %>
            	   
            	   <td>Send to HO(IT) for Create UserID and Password<br>
                      <input align="left" type="radio" value="<%=napprovalsw%>" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
                      <input type="text" name="mail11" id="iddeptadminP11" value="<%=napprovalsw%>" size="50" readonly/>
                      <input type="hidden" name="mail12" id="iddeptadminP" value="<%=napprovalsw1%>" size="30"/>
   	              </td>
                                       <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail1" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
                <%}
              
          }
     else
          {
    	 int curlev=Integer.parseInt(levelno);
    	 int next=0;
    	  while(curlev<=Integer.parseInt(maxlevel))
    	     {
    		  next=curlev+1;
    	     rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no+"' and levelno='"+next+"'  ORDER BY levelno ASC");
         	 if(rs5.next())
                 {
		         ResultSet nrs = nstmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + rs5.getString(5) + "' ) AND u.employee_status = 'yes' ");
		         if(nrs.next())
		              { 
		  	          nuname=nrs.getString(1);
		              ndesg=nrs.getString(2);
		              nmailid=nrs.getString(6);
		              }
		        napproval=rs5.getString(5)+","+nuname+","+ndesg+","+nmailid+","+next;
		        napproval1=nuname+" ("+nmailid+")";
		       // System.out.println("Next approval :"+napproval); 
                %>
                <td> 
                   <input align="left" name="approver" type="radio" value="<%=napproval%>" id="iddeptadminP1" onclick="sync(iddeptadminP<%=next%>.value);"/>
                   <input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
                   <input type="hidden" name="mail12" id="iddeptadminP<%=next%>" value="<%=napproval%>" size="30"/>
               </td>
              <%} 
          curlev++;
          }%>
    	 
    	  <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
          <input type="hidden" name="emp" id="idroname" value="" readonly/> 
          <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
          <input type="hidden" name="mail1" id="idromail" value="" readonly/>
          <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
    	<%}%>
  
  
  
  
  
  
  </tr>
     
  <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="120"></textarea></div></td>
  </tr>
  
 </table> 
 
 <table style="margin-left: auto;margin-right: auto;" >
    <tr>
       <td> <div id="formsubmitbutton"> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate() && ButtonClicked());" /></div></td>
      <div id="buttonreplacement" style="display:none;">
	       <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	       </div> 
      
       <td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
       <td style="font-size:1">&nbsp;&nbsp; <a href="javascript:history.back()">BACK</a></td>
   	</tr>
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
	DbUtil.closeDBResources(rs11,st11,cn11);
	DbUtil.closeDBResources(rs100,st100,cn100);

  }
%>
</center>
	
</div>


</form>	

</body>

</html>