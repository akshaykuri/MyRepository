<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ include file="banner.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINISTRATOR</title>

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" />
<link rel='stylesheet' type='text/css' href='css/homePage.css' />
<script type="text/javascript" src="API/Js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script language="javascript"   type="text/javascript" src="js/popWindowAtCenter.js"></script>
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<script  type="text/javascript">

<% 
    String msg2[] = request.getQueryString().toString().split("=");
    String disp = msg2[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg2 = "<%=disp%>";

     if(msg2!="1")
		{
           alert(msg2);
		}
</script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script><!--
http://stevenmcconnon.com/blog/2011/01/07/how-to-blink-text-in-all-browsers/
--><script type="text/javascript" language="javascript">
 window.onload=blinkOn;
 
function blinkOn()
{
  document.getElementById("blink").style.color="#ec691f";
  setTimeout("blinkOff()",1000);
}
 
function blinkOff()
{
  document.getElementById("blink").style.color="#2f4377";
  setTimeout("blinkOn()",1000);
}
 

 
</script>
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(30*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}


//String b_no2=null;

//b_no2 = (String)session.getAttribute("b_no");

//System.out.println("Sesion converting :"+b_no2);

%>

<%--
if(session.getAttribute("b_no")!=null)
    {  // action here
	}
else{
	//redirect
	}
--%>
<%-- <% 
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null)
{
%>
<script type="text/javascript">
alert("Session Time Out Login Again");
</script>
<%	
response.sendRedirect("HOME.jsp?msg=1");
}
%> --%>
</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"    style="overflow-x: hidden; overflow-y: hidden;">
<div id="id">
<div id="wrapper">
<form>
<table>
<tr>
<td>
<img src="images/nippon.gif" height="35" width="220"> </td>

</table> 
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 
  <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	ADMINISTRATOR </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr>
 </table>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 

<tr>
<td width="1118" align="right"> 
<!--<a href="javascript:top.window.close(),close1()"><img src="logout-icon.png" height="35" width="35" title="LOGOUT"></a>
-->
<a href="logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>


<br />
<table width="920" height="63" border="0" cellpadding="0" cellspacing="0" ID="Table1">


  <tr>
  <td width="360" align="justify" valign="top"></td>
    <td width="560" align="justify" valign="top">
<!--<font style="text-decoration: blink;">
-->
<%String SessionSuperAdmin =null;
SessionSuperAdmin = (String) session.getAttribute("AdminRights"); %>
<font > Welcome :<%= session.getAttribute( "Nname" ) %>

<%--
System.out.println("Session Result : "+session.getAttribute("b_no"));
--%>
</font>
<%--if(session.getAttribute("city").equals(null)||session.getAttribute("city").equals("null")||session.getAttribute("city").equals(""))
	{
	out.println("Session Time Out");
	
	response.sendRedirect("http://10.206.10.18:8185/CheckSheet/HOME.jsp");
        return;
    } --%>
<br />
<br>
<div id="smoothmenu2" class="ddsmoothmenu-v">
<ul id="sidebarmenu1">
<li><a href="adminbom.jsp">MASTERS</a>
<ul>

  
 

   <%
  
//mrPageForDesg
	if(session.getAttribute("m_b_no")!=null && session.getAttribute("m_b_no").equals("90") && SessionSuperAdmin.equals("5"))
		//if(session.getAttribute("b_no").toString().equals("90"))
	{
	
	%>
     <li><a href="#" style="font-size:9pt;color:darkskyblue;">CREATE USERS</a>
     <ul>
       <li><a href="createadmin.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">SUPER ADMIN</a></li>
       <li><a href="createBOMuser.jsp?msg=1" style="font-size:9pt;color:darkskyblue; ">COMPLAINT ADMIN</a></li>
       <li><a href="createFormUser.jsp?msg=1" style="font-size:9pt;color:darkskyblue; ">FORM USERS</a></li>
       <!--   <li><a href="createUserNewinsAccounts.jsp?msg=1" style="font-size:9pt;color:darkskyblue; ">A/C USERS [NEWINS]</a></li> -->
       <!--       <li><a href="Designation.jsp?msg=1" style="font-size:9pt;color:darkskyblue; ">AUTHORIZATION</a></li> -->
     </ul>
     </li>


  <li><a href="NExAS/master/createrouting.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">APPROVAL MASTER</a></li>
     <li><a href="#" style="font-size:9pt;color:darkskyblue;">NExAS MASTER</a>
         <ul>
          <li><a href="NExAS/master/NExASCostmaster.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">NExAS COST CENTER MASTER</a></li>
          <li><a href="NExAS/UploadNExASForm.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">UPLOAD NExAS FORM</a></li>
          </ul>
    </li>
 <li><a href="#" style="font-size:9pt;color:darkskyblue;">GSNET MASTER</a>
         <ul>
          <li><a href="GSNET/master/gsnetBranchCodeMaster.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">GSNET BRANCH CODE MASTER</a></li>
          <li><a href="GSNET/master/divisionMaster.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">DIVISION MASTER</a></li>
          <li><a href="GSNET/master/primaryDivisionMaster.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">PRIMARY DIVISION</a></li>
          <!-- <li><a href="GSNET/UploadNExASForm.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">UPLOAD NExAS FORM</a></li> -->
          </ul>
      </li>
      
      <li><a href="#" style="font-size:9pt;color:darkskyblue;">EMAIL ID MASTER</a>
         <ul>
          <li><a href="LOTUS/master/emaildomainMaster.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">E-MAIL DOMAIN</a></li>
          <li><a href="LOTUS/master/employeeTypeMaster.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">EMPLOYEE TYPE</a></li>
          </ul>
      </li>
      

  	<% }%>
   


   
<!--     <li><a href="Designation.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">AUTHORIZATION MASTER</a></li> -->
 <li><a href="#" style="font-size:9pt;color:darkskyblue;">CHECK LIST MASTERS</a>
 <ul>
 <li><a href="#" style="font-size:9pt;color:darkskyblue;"> SERVER/HDD SPACE</a>
 <ul>
  <li><a href="CheckSheetFile/ServerHO/server_master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;"> SERVER NAME</a>
  <li><a href="CheckSheetFile/ServerHO/server_details_master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;"> HDD SPACE</a></li>
  
 </ul>
 </li>
 
 <li><a href="Backup_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">BACKUP SERVER / NAS BOX</a></li>
    <li><a href="Barcode_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">BARCODE PRINTERS / SCANNER</a></li>
     <li><a href="Fax_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">FAX MACHINE</a></li>
    <li><a href="Internet_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">ISP (INTERNET)</a></li>
    <li><a href="MPLS_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">ISP (MPLS</a></li>
    <li><a href="Photocopier_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">PHOTOCOPIER</a></li>
    <li><a href="Printer_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">PRINTER</a></li>
    
 </ul>
 </li>
    
    
     <%
//mrPageForDesg
	if(session.getAttribute("m_b_no")!=null && session.getAttribute("m_b_no").equals("90") && SessionSuperAdmin.equals("5"))
	{%>
	<li><a href="#" style="font-size:9pt;color:darkskyblue;">BRANCH MASTERS</a>
	<ul>
		<li><a href="BranchMasterMain.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">MAIN BRANCH</a></li>
    <li><a href="BranchMasterAdmin.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">SUB BRANCH</a></li>
	</ul>
	
	</li>
<!-- <li><a href="#" style="font-size:9pt;color:darkskyblue;">APPLICATION FORM</a>
	<ul>
		<li><a href="#" style="font-size:9pt;color:darkskyblue;">DELETE / PRINT MASTERS</a>
		<ul>
		<li><a href="FormDelete/itClearance.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">IT CLEARANCE </a>
		<li><a href="FormDelete/domain.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">DOMAIN USER </a>
		<li><a href="FormDelete/lotus.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">LOTUS NOTES </a>
		<li><a href="FormDelete/accessCard.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">ACCESS CARD </a>
		<li><a href="FormDelete/serverFolder.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">SHARED FOLDER  </a>
		<li><a href="FormDelete/internet.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">INTERNET / FTP  </a>
		<li><a href="FormDelete/newins.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">NEWINS USER </a>
		<li><a href="FormDelete/incident.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">INCIDENT LOG </a>
		<li><a href="FormDelete/registerForm.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">REGISTRATION FORM </a>
		</ul>
		</li>
		
   
	</ul>
	
	</li> -->
    <li><a href="#" onclick="return popitup('NewDesignation.jsp?msg=1')" style="font-size:9pt;color:darkskyblue;">DESIGNATION MASTERS</a></li>
    <li><a href="#" onclick="return popitup('groupMaster/groupmaster.jsp?msg=1')" style="font-size:9pt;color:darkskyblue;">GROUP MASTERS</a></li>
    <%} %>
   
    
    <li><a href="ProblemType_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">TYPE MASTER</a></li>
    <!--  <li><a href="Admin/DscOwner/DSC_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">DSC OWNER MASTER</a></li> -->
        <li><a href="Admin/typeProblem/ProblemType_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">CATEGORY MASTER</a></li>
        <li><a href="Department.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">DEPARTMENT MASTER</a></li>
    <!-- <li><a href="feedback/Admin/feedbackAbout_Master.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">FEEDBACK-REGARDING MASTER</a></li> -->
      <%
//mrPageForDesg
	if(session.getAttribute("m_b_no")!=null && session.getAttribute("m_b_no").equals("90") && SessionSuperAdmin.equals("5"))
	{%>
<!-- <li><a href="#" style="font-size:9pt;color:darkskyblue;">MAIL MASTER</a>
<ul>
<li><a href="feedback/Admin/editDelet/ITsupport.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">TO IT SUPPORT</a></li>
<li><a href="feedback/Admin/editDelet/FeedbackBranchDayToDayWise.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">FEEDBACK</a></li>
<li><a href="feedback/Admin/editDelet/homePageMessage.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">TO HOME PAGE</a></li>
</ul>
</li> -->
<li><a href="#" style="font-size:9pt;color:darkskyblue;">DEVELOPER</a>
<ul>
<li><a href="developer/softwareOwner/createOwner.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">CREATE S/W OWNER</a></li>
<li><a href="developer/softwareOwner/createOwner.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">CREATE SOFTWARE LIST</a></li>
</ul>
</li>
<%} %>

<li><a href="BOMAUDIT/master/listOfApplicationMaster.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">LIST OF APPLICATIONS</a></li>

</ul>

</li>


 <%
  if(session.getAttribute("m_b_no")!=null && session.getAttribute("m_b_no").equals("90") && SessionSuperAdmin.equals("5"))
	{
	%>
        <li><a href="ITClearanceUpdate/ItClearanceUpdateForm.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">OSD UPDATE</a></li>
     <% }%>
   












   
   <li><a href="#">USERPAGE</a> 
   <ul>
    <!-- <li><a href="UserCheckList.jsp?msg=1">SYSTEM ADMIN</a></li> -->
        <li><a href="adminHR.jsp?msg=1">APPLICATION FORMS</a></li>
   </ul>
     </li>  
     
  
  
  
 <%-- <% if(session.getAttribute("m_b_no")!=null && session.getAttribute("m_b_no").equals("90") && SessionSuperAdmin.equals("5"))
		//if(session.getAttribute("b_no").toString().equals("90"))
	{
	
	%>  
    
   <li><a href="OtherPage.jsp?msg=1">BACKUP CHECK LIST</a>
  <ul>
      <!--  <li><a href="SystemBackup/systemuser1.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">CREATE SYSTEM USER</a>
       <li><a href="SystemBackup/backupchecklist1.jsp?msg=1">BACKUP SCHEDULE</a></li> -->
       
       <li><a href="SystemBackup/backupverification.jsp?msg=1">BACKUP VERIFICATION</a></li>
  </ul></li>  
  
  
  <%} %> --%>
  
  
  
  
  
<!-- <li><a href="#">REPORT</a>
  <ul> -->
   
  <li><a href="#">REPORTS</a>
<!--     <ul>
    <li><a href="cs_BranchDayWise.jsp">BRANCH WISE REPORT</a></li>
       <li><a href="Reports/cs_BranchDayToDayWise.jsp">BRANCH,SYSTEM ADMIN AND PROBLEM TYPE WISE IMS REPORT</a>
          <li><a href="Reports/BranchWise/BranchWiseReport.jsp?msg=1">BRANCH WISE IMS REPORT</a>
    <ul>
    <li><a href="Reports/BranchWise/cs_BranchYearWise.jsp">YEAR WISE REPORT</a></li>
    <li><a href="Reports/BranchWise/cs_BranchMonthWise.jsp">MONTH WISE REPORT</a></li>
    <li><a href="Reports/BranchWise/cs_BranchDayWise.jsp">DAY WISE REPORT</a></li>
    <li><a href="Reports/BranchWise/cs_BranchDayToDayWise.jsp">DAY TO DAY WISE REPORT</a></li>
      <li><a href="cs_BranchDayToDayWise.jsp">DAY TO DAY WISE REPORT</a></li>
    </ul> 
    </li>
    <li><a href="#">SYSTEM ADMIN WISE IMS REPORT</a>
     <ul>
    <li><a href="Reports/SystemAdminWise/CS_ims_BranchMonthWise.jsp">YEAR WISE REPORT</a></li>
    <li><a href="Reports/SystemAdminWise/CS_ims_monthWise.jsp">MONTH WISE REPORT</a></li>
    <li><a href="Reports/SystemAdminWise/CS_ims_PersonDay.jsp">DAY WISE REPORT</a></li>
    <li><a href="Reports/SystemAdminWise/CS_ims_DayToDay.jsp">DAY TO DAY WISE REPORT</a></li>
    </ul>
    </li>
    <li><a href="CS_ims_monthWise.jsp">MONTH WISE REPORT</a></li>
    <li><a href="CS_ims_BranchMonthWise.jsp">SYSTEM ADMIN WISE (MONTH)REPORT</a></li>
    <li><a href="CS_ims_DayToDay.jsp">FROM DATE-TO DATE WISE REPORT</a></li>
    
    <li><a href="#">PROBLEM TYPE WISE IMS REPORT</a>
    <ul>
     <li><a href="Reports/ProblemTypeWise/CS_ims_ProbTypeDayToDay.jsp">DATE TO DATE WISE REPORT</a></li>
    <li><a href="Reports/ProblemTypeWise/cs_ims_ProbGroupWise.jsp">BRANCH WISE REPORT</a></li>
      <li><a href="Reports/ProblemTypeWise/cs_imsGroupWise.jsp">GROUP WISE MONTHLY REPORT</a></li>
      </ul>
      </li>
    </ul> -->
    <ul>
    <li><a href="Reports/cs_BranchDayToDayWise.jsp?msg=1">COMPLAINT REPORT</a></li>
    <li><a href="ITClearanceUpdate/ItClearanceReportForm.jsp?msg=1"  style="font-size:9pt;color:darkskyblue;">OSD REPORT</a></li>
    <li><a href="Reports/NewReport/CollageAllReports.jsp">APPLICATION FORM REPORT</a></li>
    <li><a href="IncidentLog/FormApproval/IncidentUserSelection.jsp?msg=1">INCIDENT REPORT</a></li>
    <li><a href="CheckSheetFile/Reports/CheckListSelection.jsp?msg=1">CHECKLIST REPORT</a></li>
    <li><a href="ReportsPan/Applicationformreports.jsp?msg=1">C2IT MGMT REPORT</a></li>
    
    </ul>
    </li>
   <!--  <li><a href="adminbom.jsp">APPLICATION FORMS</a>
    <ul>
    <li><a href="ITFORMS/FormApproval/ITclearanceSelectAdmin.jsp?msg=1">RESIGNED EMPLOYEE OSD CHECK LIST</a></li>

     <li><a href="ITFORMS/FormApproval/ITclearanceSelectAdminRough.jsp?msg=1">ResignationRough</a></li> 
    <li><a href="DomainUser/FormApproval/DomainUserSelectAdmin.jsp?msg=1">DOMAIN USER REQUEST</a></li>
    <li><a href="LOTUS/FormApproval/LotusSelectAdmin.jsp?msg=1">EMAIL ID REQUEST</a></li>
    <li><a href="LotusTraveler/FormApproval/LotusSelectAdmin.jsp?msg=1">LOTUS TRAVELER REQUEST</a></li>
    <li><a href="AccessCard/FormApproval/AccessCardSelectAdmin.jsp?msg=1">ACCESS CARD REQUEST</a></li>
    <li><a href="SharedFolder/FormApproval/SharedFolderSelectAdmin.jsp?msg=1">SERVER FOLDER ACCESS REQUEST</a></li>
    <li><a href="InternetAccess/FormApproval/InternetAccessSelectAdmin.jsp?msg=1">INTERNET / FTP ACCESS REQUEST</a></li>
    <li><a href="Newins/FormApproval/NewinsSelectAdmin.jsp?msg=1">NEWINS USERS REQUEST</a></li> -->
  
   
    </ul>
    
    </li>
  <!-- <li> <a href="feedback/Admin/module/feedbackresults.jsp">FEEDBACK/COMPLAINTS</a>
  <ul>
    
     <li> <a href="feedback/Admin/module/feedbackresults.jsp?msg=1">FEEDBACK/COMPLAINTS</a></li>
     <li><a href="feedback/Admin/module/FeedbackBranchDayToDayWise.jsp">FEEDBACK DAY TO DAY WISE</a></li>
  </ul>
  </li> -->
  
    
     
    
   <!--  </ul>
    </li> -->
    <!--<li><a href="DeclarationPage.jsp">PREPARE</a> 
    <li><a href="adminbom.jsp">PRINT</a>
    <ul>
       <!--  <li><a href="MRonselectPDFAdmin.jsp">MATERIAL REQUISITION</a></li> -->
</ul>


</div>
 <a href="changePwdAdmin.jsp?msg=1" onclick="return popitup2('changePwdAdmin.jsp?msg=1')" id="hiderow"><font size=2>Change Password</font></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="feedbackUser.jsp?msg=1" onclick="return popitup2('feedbackUser.jsp?msg=1')" id="hiderow"><font size=2>Feedback</font></a>

		<td width="360" height="11" align="justify" valign="bottom">
		<img src="images/admin.jpg" width="400" height="250" border="0"></td>
</tr>
</table>


<br><br><br>


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address> 
</td> 
 
<td width="115" align="right"> 
<a href="adminPage.jsp?msg=1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>
</div>

</div>
</body>
</html>