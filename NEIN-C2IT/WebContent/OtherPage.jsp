
<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="banner.jsp" %> 
    <%@page import="CON2.DbUtil"%>
    <%@ page import="java.io.*"%>
<%@page language="java"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="CON2.Connection2"%>
<jsp:useBean id="con" class="CON2.Connection2" />
<%@page language="java"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<%-- <img src="person.jpg" align="left" width=79 height=42 vspace=8 hspace=120 style="width: 150px; float: right;">
<img src="person.jpg" align="left" width=79 height=42 vspace=8 hspace=120 >
<img src="person.jpg" style="width: 150px; float: left;"> --%>

<html>
<head>
<style>

.ddsmoothmenu-v ul{
margin-left: -100%;
padding: 0;
width: 200px; /* Main Menu Item widths */
list-style-type: none;
font: bold 12px Verdana;

}
 
.ddsmoothmenu-v ul li{
 position: relative;  
 left: 200px;
 float: none;
}

/* Top level menu links style */
.ddsmoothmenu-v ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px 23px 6px 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.ddsmoothmenu-v ul li a:link, .ddsmoothmenu-v ul li a:visited, .ddsmoothmenu-v ul li a:active{
background: #012D58; /*background of menu items (default state)*/
color: white;
}


.ddsmoothmenu-v ul li a.selected{ /*CSS class that's dynamically added to the currently active menu items' LI A element*/
background: #ec691f !important; 
color: navy;
}

.ddsmoothmenu-v ul li a:hover{
background: #ec691f; /*background of menu items during onmouseover (hover state)*/
color: navy;
}

/*Sub level menu items */
.ddsmoothmenu-v ul li ul{
position: absolute;
width: 180px; /*Sub Menu Items width */
top: 0;
font-weight: normal;
visibility: hidden;
}

 
/* Holly Hack for IE \*/
* html .ddsmoothmenu-v ul li { float: left; height: 1%; }
* html .ddsmoothmenu-v ul li a { height: 1%; }
/* End */



/* ######### CSS classes applied to down and right arrow images  ######### */


.downarrowclass{
position: absolute;
top: 12px;
right: 7px;
}

.rightarrowclass{
position: absolute;
top: 6px;
right: 5px;
}

/* ######### CSS for shadow added to sub menus  ######### */

.ddshadow{ 
position: absolute;
left: 0;
top: 0;
width: 0;
height: 0;
/* background-color: #ccc; */ /* generally should be just a little lighter than the box-shadow color for CSS3 capable browsers */
}



</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" /> -->
<link href="stylelog.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/popWindowAtCenter.js"></script>
<script type="text/javascript">
</script>
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


<script type="text/javascript" src="API/Js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});

</script>
<script  type="text/javascript">
function show(nr) {
	
    document.getElementById("table1").style.display="none";
    document.getElementById("table2").style.display="none";
    document.getElementById("table3").style.display="none";
    document.getElementById("table4").style.display="none";
    document.getElementById("table5").style.display="none";
    document.getElementById("table6").style.display="none";
    document.getElementById("table7").style.display="none"; 
    document.getElementById("table8").style.display="none"; 
    document.getElementById("table"+nr).style.display="block";
}
</script>
<script type="text/javascript" language="javascript">
function openPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	     //  var ref = window.open('http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	     var ref = window.open('http://localhost:8180/NEIN-C2IT/ITSupportHelpPage.jsp', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}
function openHelpPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	       var ref = window.open('http://neinsoft.nittsu.co.in:8185/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   //  var ref = window.open('http://localhost:8180/NEIN-C2IT/helpPages/C2IT.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}
</script>
<script type="text/javascript" language="javascript">
 window.onload=blinkOn;
 var t=null,y=null;
function blinkOn()
{
   t = document.getElementById("blink").style.color="#FF0000";
  
  setTimeout("blinkOff()",1000);
}
 
function blinkOff()
{
   y = document.getElementById("blink").style.color="white";
  setTimeout("blinkOn()",1000);
}
function blinkOff1()
{
  y= document.getElementById("blink").style.color="black";
  setTimeout("blinkOff()",1000);
}
function blinkOff2()
{
	 document.getElementById("blink").style.color="black";
	setTimeout("blinkOff1()",100000000);
	clearTimeout(y);
}
</script>



<title>Welcome to HO</title>
<%
String city_no=null;
String city= null,department=null;
city_no = (String) session.getAttribute("b_no");
city = (String) session.getAttribute("city");
department = (String) session.getAttribute("department");
String[] parts = city.split("-");
String part1 = parts[0]; // 004
String part2 = parts[1];
System.out.println("System Check Sheet Branch Number :"+city_no);
%>
</head>
<%
Connection conn=null;
Statement st=null;
ResultSet rs=null;
int flag=0;
String remarks=null,sentby_name=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");

try 

{
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName(driver).newInstance();
      conn = DriverManager.getConnection(url+dbName,userName,password); 
//s_no,s_date,customer,s_person,s_add,s_contact,s_mail,s_web,s_sExecutive,s_industry,
//String query = "SELECT complain_id,cm_name,emp,cm_type,cm_problem,cm_location,cm_status  FROM complain_master_item WHERE emp='"+req+"' AND cm_date='"+cs_date+"'";
String query = "SELECT remarks,sentby_name FROM sendingMail_it_support";
st = conn.createStatement();
rs = st.executeQuery(query);
while(rs.next()){
	  flag=1;
remarks = rs.getString(1);
sentby_name = rs.getString(2);
}
%>
<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="150"    onload=show(0)>
<form>

<div id="id">
 <table>
<tr>
<td>
<img src="images/logo.png" height="35" width="220"> </td>
<!-- <td align="right">
<img src="images/cs-soft.jpg" height="30" width="100" hspace="796" ></td> -->
</table>
<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td>
</tr>
 <!-- <tr align="center">
 <td bgcolor="#2f4377"><strong><font size ="4" color="white">C2IT (CONNECT TO IT)</font></strong></td></tr> -->

</table>

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr align="center">
      <td align="left"><font size ="2">NAME :<%=session.getAttribute("Nname")%> </font>&nbsp;&nbsp; 
               <%--  <font size ="2">DESG :<%=session.getAttribute("desg")%> </font>&nbsp;&nbsp; --%>
                <font size ="2">BRANCH :<%= session.getAttribute( "city" )%></font>&nbsp;&nbsp;
                 <%--         <font size ="2">RIGHTS :<%= session.getAttribute( "rights" )%></font> --%>
      </td>
      <td align="right">
          <a href="feedbackComplaintUser.jsp?msg=1" onclick="return popitup2('feedbackComplaintUser.jsp?msg=1')" id="hiderow"><img width="35" src="images/doubt.jpg">Feedback</a>
          <a href="Attendence/availability.jsp?msg=1" onclick="return popitup2('Attendence/availability.jsp?msg=1')" id="hiderow"><img width="35" src="images/yesno.jpg">Availability</a>
          <a href="thoughtMaster.jsp?msg=1" onclick="return popitup2('thoughtMaster.jsp?msg=1')" id="hiderow"><img width="35" src="images/face.jpg">Message</a>
          <a href="change_pwdHO.jsp?msg=1" onclick="return popitup2('change_pwdHO.jsp?msg=1')" id="hiderow"><img width="35" src="images/passChange.jpg">Change Password</a>
          <!-- <a href="#" onclick="return popitup('ITSupportHelpPage.jsp')"><img width="30" src="images/help3.jpg"><font size ="2">Help</font></a> -->
          <a href="#" onclick="openHelpPDF()"><img width="30" src="images/help3.jpg"><font size ="2">Help</font></a>
          <a class="a_link" href="logout.jsp"><img width="30" src="images/icon_log.png"><font size ="2">Logout</font></a>
     </td>
</tr> 
</table>
<table width="1000" height="310" border="0" cellpadding="0" cellspacing="0" ID="Table1">
  <tr>
    <td width="360" align="justify" valign="top"></td>
    <td width="360" align="justify" valign="top"></td>
    <td width="60" align="justify" valign="top"></td>
    <td width="760" align="justify" valign="top">
    <%
    session.setMaxInactiveInterval(50*60);//seconds
    if(session==null||session.getAttribute( "Nname" )==null)
        {
	    String msg2=null;
	    msg2="Session Time Out \\n Login Again";
	    response.sendRedirect("loginho.jsp?msg="+msg2);
        }
    %>
    <br>
    <div id="smoothmenu2" class="ddsmoothmenu-v">
    <ul id="sidebarmenu1">
    <%
	//if(  (session.getAttribute("city") != null)&& (session.getAttribute("city").equals("HO")))
	//if  ("HO".equals(session.getAttribute("city")))
	//if(city_no=="90")
	if((department !=null) && (department.equals("IT SUPPORT")))
	     {
			if((city_no != null) && (city_no.equals("90")))
	              {%>
 
 <li><a href="OtherPage.jsp?msg=1">CHECK LIST</a>
  <ul>
    <li><a href="CheckListBranch.jsp?msg=1">SELECT LOCATION</a></li>
    <li><a href="CheckSheetSelectionHO.jsp?msg=1">VIEW CHECK LIST</a></li>
  </ul>
 </li>
  <%}
	  else
	{
    %>
 
   <li><a href="OtherPage.jsp?msg=1">CHECK LIST</a>
   <ul>
   <li><a href="CheckListBranchNext.jsp?msg=1">SELECT LOCATION</a></li>
   <!--   <li><a href="CheckList.jsp?msg=1">CREATE CHECK LIST</a></li> -->
  <li><a href="CheckSheetSelectionBranch.jsp?msg=1">VIEW CHECK LIST</a></li>
   </ul>
  </li>
  <%} %>
    
 <!--  <li><a href="OtherPage.jsp?msg=1">BACKUP CHECK LIST</a>
  <ul>
       <li><a href="SystemBackup/systemuser.jsp?msg=1" style="font-size:9pt;color:darkskyblue;">CREATE SYSTEM USER</a>
       <li><a href="SystemBackup/backupSchedule.jsp?msg=1">BACKUP SCHEDULE</a></li>
        <li><a href="SystemBackup/backupStatusUpdate.jsp?msg=1">BACKUP STATUS UPDATE</a></li>
       <li><a href="SystemBackup/softwaremaster.jsp?msg=1">SOFTWARE MASTER</a></li>
        <li><a href="SystemBackup/backupTypeMaster.jsp?msg=1">BACKUP TYPE MASTER</a></li>
  </ul>
  </li> -->
  
    
  <%-- <!--######################## THIS MODULE ADDED BY CHINTU KUMAR for office admin asset module####################### -->
  
<% System.out.println("Department :"+department);

if((department !=null) && (department.equals("OFFICE ADMINISTRATION")))            
	{
	
	
	%>
  <li><a href="#">ASSET MANAGEMENT</a>
	   <ul>
	 	 <li><a href="#">ASSET INVENTORY</a>
	 	          <ul>
	 	             <li><a href="assetManagement/AsmInventoryNONIT.jsp?msg=1">NONIT INVENTORY</a></li>
	 	          </ul>
	 	 </li>
		<li><a href="assetManagement/searchAsset.jsp?msg=1">SEARCH/REPORT ASSET</a></li>
	 	<li><a href="#">MASTER</a>
	          <ul>
	             <li><a href="assetManagement/assetTypeMasterNonIT.jsp?msg=1">ADD NewAssetType/Config</a></li>
	         </ul>
	    </li> 
	   </ul>
	 </li>
      <%}%>
  
   <!--######################## till here###################### -->
  
  
  
  
  
    <!--######################## THIS MODULE ADDED BY CHINTU KUMAR for system admin####################### -->
 
  <%
  if((department !=null) && (department.equals("IT SUPPORT")))            
	{%>
	  <li><a href="#">ASSET MANAGEMENT</a>
	   <ul>
	 	 <li><a href="#">ASSET INVENTORY</a>
	 	          <ul>
	 	          <li><a href="assetManagement/AsmInventory.jsp?msg=1">IT INVENTORY</a>
	 	             <ul>
	 	                 <li><a href="assetManagement/AsmInventoryWithPO.jsp?msg=1">WITH PO</a>
	 	                 <li><a href="assetManagement/AsmInventoryWithouthPO.jsp?msg=1">WITHOUTH PO</a>
	 	             </ul>
	 	          
	 	          </li>
	 	          <li><a href="assetManagement/AsmInventoryNONIT.jsp?msg=1">NONIT INVENTORY</a>
	 	             <ul>
	 	                 <li><a href="assetManagement/AsmInventoryWithPO.jsp?msg=1">WITH PO</a>
	 	                 <li><a href="assetManagement/AsmInventoryWithouthPO.jsp?msg=1">WITHOUTH PO</a>
	 	             </ul>
	 	         </li>
	 	        </ul>
	 	 </li>
	 	
	 	
	 	  <%if((city_no !=null) && (city_no.equals("90"))) 
	 	          { %>
	 	          <li><a href="#">ASSIGN ASSET</a>
	 	               <ul>
		                  <li><a href="assetManagement/assignOtherAsset.jsp?msg=1">TO USER</a></li>
		                  <li><a href="assetManagement/assignAsset.jsp?msg=1">TO OFFICE</a></li>
		                  <li><a href="assetManagement/uploadEmpITAssetFile.jsp?msg=1">UPLOAD ASSET FILE</a></li>
		              </ul>
		        </li>     
		        <%} %> 
		<li><a href="assetManagement/searchAsset.jsp?msg=1">SEARCH/REPORT ASSET</a></li>
		
		
		 <%if((city_no !=null) && (city_no.equals("90"))) 
	 	          { %>
		            <li><a href="assetManagement/assetTransfer.jsp?msg=1">ASSET TRANSFER</a></li>
		        <%} %> 
		 
		 
		 
		 <li><a href="assetManagement/assetConfigUpdate.jsp?msg=1">UPDATE ASSET CONFIG</a></li>
		<li><a href="#">MASTER</a>
	                 <ul>
	                 <li><a href="assetManagement/assetTypeMaster.jsp?msg=1">ADD NewAssetType/Config</a></li>
	                 <li><a href="assetManagement/assetISPmaster.jsp?msg=1">ADD ISP</a></li>
	                 <li><a href="assetManagement/assetDCType.jsp?msg=1">ADD DataCardType</a></li>
	                 <li><a href="assetManagement/assetAccessBioType.jsp?msg=1">ADD Access/Bio Type</a></li>
	                 </ul>
	    </li> 
	               
	   </ul>
	  
	  </li>
  
  
    <%}%>
  
  
  
                                  <!--##################################### TILL HERE ############################-->
  
  
   --%>
  
  
  
  
  
  
  
     <li><a href="OtherPage.jsp?msg=1">INCIDENT LOG</a>
  <ul>
  <li><a href="IncidentLog/IncidentLog.jsp?msg=1">CREATE</a></li>
  <li><a href="IncidentLog/IncidentUserSelection.jsp?msg=1">VIEW</a></li>

  </ul>
  </li>
  
  <%} %>
   <li><a href="OtherPage.jsp?msg=1">IMS REPORT</a>
  <ul>
  <li><a href="ims_Branch_Back.jsp?msg=1">CREATE IMS REPORT</a></li>
<!--   <li><a href="ims_Branch_BackPractice.jsp?msg=1">CREATE IMS PRACTICCE </a></li> -->
  <li><a href="imsSelectionBranch.jsp?msg=1">VIEW IMS REPORT</a></li>
<!--   <li><a href="PaymentCL_HO.jsp?msg=1">SEND CHECK LIST</a></li> -->
 
  </ul>
  </li>
  
  <%
  if((department !=null) && (department.equals("IT SUPPORT")))            
	{%>
  <li><a href="#">IT REPORTS</a>
   <ul>	
	   <li><a href="OtherPage.jsp?msg=1">ISP OUTAGE</a>
	     <ul>
	       <li><a href="CircuitId/InsertIspOutage.jsp?msg=1">CREATE</a></li>
	       <li><a href="CircuitId/SearchIspOutage.jsp?msg=1">VIEW REPORT</a></li>
	       <c:if test="${b_no == 90}">
	       <li><a href="CircuitId/ISPOutageEmailGroupMaster.jsp?msg=1">EMAIL GROUP MASTER</a></li>
	       <li><a href="CircuitId/ISPOutageEmailAddMaster.jsp?msg=1">ADD EMAIL TO GROUP</a></li>
	       </c:if>
	      <!--  <li><a href="OtherPage.jsp?msg=1">MASTER</a>
	        <ul>
	          <li><a href="CircuitId/CircuitIdMaster.jsp?msg=1">Circuit Id Master</a></li>	 
	          <li><a href="CircuitId/LinkTypeMaster.jsp?msg=1">Link Type Master</a></li>
	          <li><a href="CircuitId/CircuitMaster.jsp?msg=1">MASTER</a></li>	 
	       </ul>	       
	       </li>	 -->       
	    </ul>
	   </li>
	   <li><a href="OtherPage.jsp?msg=1">CARTRIDGE</a>
	     <ul>
	       <li><a href="Catridge/InsertCatridgeDetails.jsp?msg=1">CREATE</a></li>
	       <li><a href="Catridge/SearchCat.jsp?msg=1">EDIT/UPDATE</a></li>
	       <li><a href="Catridge/SearchCatridge.jsp?msg=1">VIEW REPORT</a></li>
	        <c:if test="${b_no == 90}">
	       <li><a href="OtherPage.jsp?msg=1">MASTER</a>
	        <ul>
	          <li><a href="Catridge/CatridgeMasterIns.jsp?msg=1">Cartridge Master</a></li>	 
	       </ul>	       
	       </li>	     </c:if>  
	    </ul>
	   </li>
	    <li><a href="OtherPage.jsp?msg=1">PHOTO COPIER</a>
	     <ul>
	       <li><a href="PhotoCopier/SelectBranch.jsp?msg=1">CREATE</a></li>
	       <li><a href="PhotoCopier/SearchPC.jsp?msg=1">EDIT/UPDATE</a></li>
	       <li><a href="PhotoCopier/SearchPhotoCopier.jsp?msg=1">VIEW REPORT</a></li>
	      
	       <li><a href="OtherPage.jsp?msg=1">MASTER</a>
	        <ul>
	          <li><a href="PhotoCopier/ModelMaster.jsp?msg=1">Model Master</a></li>	  
	       </ul>	       
	       </li>  
	    </ul>
	   </li>
	 <li><a href="OtherPage.jsp?msg=1">CONSUMPTION</a>
	       <ul>
	       <li><a href="Consumption/CreateConsumptionDetails.jsp?msg=1">CREATE</a></li>
	       <li><a href="Consumption/SearchCon1.jsp?msg=1">EDIT/UPDATE</a></li>
	       <li><a href="Consumption/SearchCon.jsp?msg=1">VIEW REPORT</a></li>
	       <li><a href="OtherPage.jsp?msg=1">MASTER</a>
	        <ul>
	          <li><a href="Consumption/CreateISPNetworkType.jsp?msg=1">ISP NETWORK TYPE</a></li>	 
	          <li><a href="Consumption/ConsumptionType.jsp?msg=1">CONSUMPTION TYPE</a></li>	       
	          <li><a href="Consumption/ConsumptionReportMaster.jsp?msg=1">CONSUMPTION REPORT MASTER</a></li>
	          <li><a href="Consumption/ConsumptionGroupMaster.jsp?msg=1">CREATE DATA CARD GROUP</a></li>	 
	       </ul>	       
	       </li>	       
	    </ul>	
	    </li>
	    <li><a href="OtherPage.jsp?msg=1">CONSUMPTION GROUP</a>
	        <ul>
	          <li><a href="Consumption/CreateConsumptionGroupDetails.jsp?msg=1">CREATE DATA CARD</a></li> 
	          <li><a href="Consumption/SearchConDataCard1.jsp?msg=1">EDIT/UPDATE</a></li>
	       </ul>	       
	       </li>	
	    
	    <li><a href="OtherPage.jsp?msg=1">MPLS / INTERNET LL</a>
	     <ul>
	       <li><a href="Mpls/InsertMpls.jsp?msg=1">CREATE</a></li>
	       <li><a href="Mpls/SearchMpls1.jsp?msg=1">EDIT/UPDATE</a></li>
	       <li><a href="Mpls/SearchMpls.jsp?msg=1">VIEW REPORT</a></li>
	        <c:if test="${b_no == 90}">
	       <li><a href="OtherPage.jsp?msg=1">MASTER</a>
	        <ul>
	          <li><a href="Mpls/CircuitIdMaster.jsp?msg=1">Circuit Id Master</a></li>	 
	          <li><a href="Mpls/LinkTypeMaster.jsp?msg=1">Link Type Master</a></li>	    
	          <li><a href="Mpls/IspMaster.jsp?msg=1">ISP Master</a></li>		          
	          <li><a href="Mpls/ServiceType.jsp?msg=1">Service Type Master</a></li>	   
	          <li><a href="Mpls/CircuitMaster.jsp?msg=1">MASTER</a></li>	 
	       </ul>	       
	       </li>	</c:if>       
	    </ul>
	   </li>
	   
	   <li><a href="OtherPage.jsp?msg=1">PROCUREMENT PAYMENT</a>
	     <ul>
	       <li><a href="ProcurementPayment/CreatePayment.jsp?msg=1">CREATE</a></li>
	       <li><a href="ProcurementPayment/SearchPayment1.jsp?msg=1">EDIT/UPDATE</a></li>
	       <li><a href="ProcurementPayment/SearchPayment.jsp?msg=1">VIEW REPORT</a></li>	       
	     </ul>
	   </li>
                   <li><a href="OtherPage.jsp?msg=1">NEIN ID's</a>
	     <ul>
	       <li><a href="NeinIds/CreateNeinIds.jsp?msg=1">CREATE NEIN ID's</a></li>
	       <li><a href="NeinIds/SearchNeinIds.jsp?msg=1">EDIT NEIN ID's</a></li>	
	       <li><a href="NeinIds/SearchNeinIdsForView.jsp?msg=1">VIEW REPORT</a></li>        
	    </ul>
	   </li>

          <!--        <li><a href="OtherPage.jsp?msg=1">LOTUS EMAIL</a>
	     <ul>
	       <li><a href="LotusAndNewins/CreateLotus.jsp?msg=1">CREATE LOTUS</a></li>
	       <li><a href="LotusAndNewins/SearchLotus.jsp?msg=1">EDIT LOTUS</a></li>	
	       <li><a href="LotusAndNewins/SearchLotus1.jsp?msg=1">VIEW REPORT</a></li>        
	    </ul>
	   </li>
	   <li><a href="OtherPage.jsp?msg=1">NEWINS</a>
	     <ul>
	       <li><a href="LotusAndNewins/CreateNewins.jsp?msg=1">CREATE NEWINS</a></li>
	       <li><a href="LotusAndNewins/SearchNewins.jsp?msg=1">EDIT NEWINS</a></li>
	       <li><a href="LotusAndNewins/SearchNewins1.jsp?msg=1">VIEW REPORT</a></li>	       
	    </ul>
	   </li>
	   <li><a href="OtherPage.jsp?msg=1">SAP / NExAS ID's'</a>
	     <ul>
	       <li><a href="LotusAndNewins/CreateSAP.jsp?msg=1">CREATE</a></li>
	       <li><a href="LotusAndNewins/SearchSap.jsp?msg=1">EDIT</a></li>	
	       <li><a href="LotusAndNewins/SearchSap1.jsp?msg=1">VIEW REPORT</a></li>        
	    </ul>
	   </li>
-->
	    <li><a href="Download/Download.jsp?FilePath=E:/neinSoft/files/C2IT/Manual/C2IT_ITReport.pdf">USER MANUAL</a></li>
	   
	   </ul>
	   </li>
  <!--  ************** MY Code here for Circuit details ***************  -->
  
  
	  
   <li><a href="#">AMC DETAILS(IT)</a>
   <ul>
 	   <li>
 	    <a href="productdetails/Software.jsp?msg=1">SOFTWAREAMC INSERT</a></li>
 	 <li><a href="productdetails/SoftwareDetailsFirst.jsp?msg=1">SOFTWAREAMC DISPLAY</a></li>
 	 <li><a href="productdetails/SoftwareRenewFirst.jsp?msg=1">SOFTWAREAMC RENEW</a></li>
	<li><a href="productdetails/HardwareCreation.jsp?msg=1">HARDWAREAMC INSERT</a></li>
	<li><a href="productdetails/HardwareDisplayFirst.jsp?msg=1">HARDWAREAMC DISPLAY</a></li>
	<li><a href="productdetails/HardwareRenewFirst.jsp?msg=1">HARDWAREAMC RENEW</a></li>
	<li><a href="#">AMC MASTERS</a>
	 <ul>
	                 <li><a href="productdetails/SoftwareMaster.jsp?msg=1">ADD SOFTWARES</a></li>
	                 <!-- <li><a href="productdetails/HardwareMaster.jsp?msg=1">ADD Hardwares</a></li>
	                <li><a href="productdetails/HardwarePartsMaster.jsp?msg=1">ADD Hardware Parts</a></li>
	                 --> </ul>
	
	
	</li>
   </ul>
  </li>
  <%} %>
   <li><a href="#">AMC(NONIT)</a>
   <ul>
 	 <li><a href="AmcNonIt/CreatePageFirst.jsp?msg=1">CREATE</a></li>
	<li><a href="AmcNonIt/SearchPage.jsp?msg=1">SEARCH</a></li>
   </ul>
   </li>
  
  
  
  
  <li><a href="#">COMPLAINTS</a>
   <ul>
 	 <li><a href="complainDateWise.jsp?msg=1">SELECT BY DATE</a></li>
	<li><a href="complaintPending.jsp?msg=1">VIEW ALL PENDING REQUEST</a></li>
   </ul>
  
  </li>
   <li><a href="#" onclick="openPDF();">MODULE HELP</a> </li>

 <%-- <% if ((remarks!=null) && (remarks.length()>5)){ %>
 <textarea id="blink" rows="1"  onmouseover="this.setAttribute('scrollamount', 0, 0);" onmouseout="this.setAttribute('scrollamount', 1, 0);" readonly="readonly" cols="30" onclick="this.style.height='160px';blinkOff2();" onblur="this.style.height='';"><%=sentby_name%> : <%=remarks%></textarea>
 <marquee direction="up" onMouseOver="this.setAttribute('scrollamount', 0, 0);" OnMouseOut="this.setAttribute('scrollamount', 1, 0);">
 <%=sentby_name%> : <%=remarks%>
 </marquee>
 <%}else{} %> --%>
 </div>







</td>
	<!-- <td width="350" height="258" align="justify" valign="middle">
		<img vspace="10" src="images/check.jpg" width="50" height="50" border=""> 		
</td> -->
		
		
		
		
		
		
</tr>
</table>
<br/><br />

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 

<td width="115" align="right"> 
<a href="loginho.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address>
</td> 
</tr> 
  
</table> 



<%}catch(Exception e){}
finally{
	 DbUtil.closeDBResources(rs,st,conn);
}

%>


<div id="layer05_holder">


<table width="1150" align="center" border="0" cellspacing="0" cellpadding="0">
   <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</div>
</div>








<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Venki coding start @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


<div>
 <table  style="margin-top:6%;margin-left:45%;">
	    <tr><td bgcolor="#FFee00" align="center">PENDING IT REPORTS</td> </tr>	   
	    <tr><td><a href="#" onclick='show(1);'>ISP OUTAGE</a></td></tr>
	    <tr><td><a href="#" onclick='show(2);'>PHOTOCOPIER CHEQUE</a></td></tr>
	    <tr><td><a href="#" onclick='show(8);'>PHOTOCOPIER INVOICE</a></td></tr>  
	    <tr><td><a href="#" onclick='show(3);'>CARTRIDGE CHEQUE</a></td></tr>   
	    <tr><td><a href="#" onclick='show(4);'>CONSUMPTION CHEQUE</a></td></tr> 
	    <tr><td><a href="#" onclick='show(5);'>MPLS CHEQUE</a></td></tr>  
	    <tr><td><a href="#" onclick='show(6);'>PAYMENT CHEQUE</a></td></tr> 
	    <tr><td><a href="#" onclick='show(7);'>PAYMENT INVOICE</a></td></tr>   
      <tr>
      <td >
      <div id="table1">
               <%            Connection con1 = null;
                             Connection2 dbConn = new Connection2();
		                     con1 = dbConn.getConnection2(); 
                             Statement st1=null;
                             ResultSet rs1=null; 
                             int aa=0;
                             String bNo=(String)session.getAttribute("b_no");
                             //System.out.println("sacmnskcu"+empid);
                           try
                              {
                        	   
                               String query1 = null;
                               
                             if(bNo.equals("90")){ 
                            	 
                               query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
                                       "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
                                       "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
                                       "WHERE status='Pending' and  branchNo in(90)";                               
                                }
                             if(bNo.equals("40")){
                          	   
                            	 query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
		                                 "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
		                                 "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
		                                 "WHERE status='Pending' and  branchNo in(40,41,52,43,42) ";
                              }
                             if(bNo.equals("20")){ 
                          	   
                            	 query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
		                                 "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
		                                 "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
		                                 "WHERE status='Pending' and  branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                             }
                             if(bNo.equals("30")){ 
                          	   
                            	 query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
		                                 "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
		                                 "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
		                                 "WHERE status='Pending' and  branchNo in(30,31,53,32)";
                             }
                             if(bNo.equals("10")){ 
                          	   
                            	 query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
		                                 "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
		                                 "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
		                                 "WHERE status='Pending' and  branchNo in(10,11)";
                             }
                             if(bNo.equals("54")){ 
                            	   
                            	 query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
		                                 "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
		                                 "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
		                                 "WHERE status='Pending' and  branchNo in(54,44)";
                             }
                           if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	 query1 = "SELECT `ispoutageno`, `circuit_Id`,`linktype_id`,b.b_name,u.full_name,`isp_name` FROM `circuitid_details`"+
		                                  "INNER JOIN branch_master b ON b.id=circuitid_details.branch_id "+
		                                  "INNER JOIN `leavemanagement` .user u ON u.emp_id=circuitid_details.initiator_id "+
		                                  "WHERE status='Pending' and  branchNo='"+bNo+"'";
                             }
                               
                               st1 = con1.createStatement();
                               rs1 = st1.executeQuery(query1);
                            
                   while(rs1.next()){
                   String ispoutageno=rs1.getString(1);
                if(aa == 0){  %>
                   
                   <!-- <div  style="margin-top:3%;overflow-y: scroll; margin-right:5%;height:150px;">  -->
                   <table  border="1" style="height:140px;display:block;overflow:scroll;" >
                   <tr  bgcolor="#FFee00">
			             <th colspan="7">Pending ISP OUTAGE details</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>ISPOUTAGE NO</th>
			             <th>INITIATOR</th>
			             <th>BRANCH</th>		
			             <th>CIRCUIT ID</th>
			             <th>LINK TYPE</th>	
			             <th>LINK TYPE</th>		            
			             <th>VIEW</th>
			        </tr> 
			        <% aa++; } %> 
			       <tr>
			             <td><%= rs1.getString(1)%></td>
			             <td><%= rs1.getString(5)%></td>
			             <td><%= rs1.getString(4)%></td>
			             <td><%= rs1.getString(2)%></td>
			             <td><%= rs1.getString(3)%></td>
			             <td><%= rs1.getString("isp_name")%></td>
			             <td><a href="CircuitId/EditIspDetails.jsp?msg=<%=(ispoutageno)%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --><br><br> 
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     con1.close();
                            	}%>
                            	
           </div>
         <div id="table2">             	
      <!--         Photo Copier               -->	
                            	
       	<%                   Connection conx = null;
							 Connection2 dbConnx = new Connection2();
							 conx = dbConnx.getConnection2();
							
							 int sumcount=0;
							 Statement stx=null;
							 ResultSet rsx=null; 
							 int aax=0;            
							 //String bNo=(String)session.getAttribute("b_no");
                            //System.out.println("sacmnskcu"+empid);
                           try
                              {
	                           
                               String query2 = null;
                               
                               if(bNo.equals("90")){
                                   query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                   " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                   " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                   " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                   " WHERE  p1.status='Pending' AND branch_no in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
                            	  query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  p1.status='Pending' AND branch_no in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  p1.status='Pending' AND branch_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  p1.status='Pending' AND branch_no in(30,31,53,32)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  p1.status='Pending' AND branch_no in(10,11)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                            	  query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  p1.status='Pending' AND branch_no in(54,44)";
                              }
                            if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query2 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                   " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                   " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                   " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                   " WHERE  p1.status='Pending' AND branch_no='"+bNo+"'";
                              }

                              
                               stx = conx.createStatement();
                               rsx = stx.executeQuery(query2);
                            
			        
                   while(rsx.next()){
                   String ph_id=rsx.getString("ph_id");
                if(aax == 0){  %>
                   
                   <table  border="1" style="height:140px;display:block;overflow:scroll; " >
                   <tr  bgcolor="#FFee00" >
			             <th colspan="7">Pending PhotoCopier Cheque Details</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>Location</th>
			             <th>MODEL NO</th>
			             <th>SERIAL NO</th>
			             <th>MONTH OF PAYMENT</th>		
			             <th>TOTAL AMOUNT</th>
			             <th>CREATED DATE</th>		            
			             <th>VIEW</th>
			        </tr> 
			        <% aax++; } %>     
                         
			       <tr>
			             <td><%= rsx.getString("b_name")%></td>
			             <td><%= rsx.getString("modelno")%></td>
			             <td><%= rsx.getString("serialno")%></td>
			             <td><%= rsx.getString("month_of_payment")%></td>
			             <td><%= rsx.getString("total_amt")%></td>
			             <td><%= rsx.getString("createddate")%></td>
			             <td><a href="PhotoCopier/EditPhotoCopierDetails1.jsp?phid=<%=(ph_id)%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --> <br><br>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     conx.close();
                            	}%>
                 </div>
                 <div id="table8">             	
      <!--         Photo Copier               -->	
                            	
       	<%                   Connection con8 = null;
							 Connection2 dbConn8 = new Connection2();
							 con8 = dbConn8.getConnection2();
							
							 int sumcount8=0;
							 Statement st8=null;
							 ResultSet rs8=null; 
							 int aa8=0;            
                            //String empid8=(String)session.getAttribute("empid");
                            //System.out.println("sacmnskcu"+empid);
                             try
                              {
                              String query3 = null;
                               
                               if(bNo.equals("90")){
                                   query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                   " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                   " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                   " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                   " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0') OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
                            	  query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0')  OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	  query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0')  OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	  query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0')  OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no in(30,31,53,32)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	  query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0')  OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no in(10,11)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                            	  query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                  " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                  " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                  " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                  " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0')  OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no in(54,44)";
                              }

                              
                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query3 = " SELECT Distinct  p1.`ph_id`,`modelno`, `serialno`,`month_of_payment`,`total_amt`, `closingdate`, `openingdate`,"+
		                                   " p1.`createddate`,b.b_name,u.full_name FROM `photocopier_details` p1 "+
		                                   " INNER JOIN `photocopy_summary` p2 ON p2.ph_id=p1.ph_id "+
		                                   " INNER JOIN `branch_master` b ON b.id=p1.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=p1.`empid`"+
		                                   " WHERE  (p2.status='Pending' OR (p2.`filepath` NOT LIKE '%.%' AND  p2.invoice_amt != '0')  OR p1.`rinvoice_file` NOT LIKE '%.%') AND branch_no='"+bNo+"'";
                              }
                              
                               
                               st8 = con8.createStatement();
                               rs8 = st8.executeQuery(query3);
                            
			        
                   while(rs8.next()){
                   String ph_id=rs8.getString("ph_id");
                if(aa8 == 0){  %>
                   
                   <table  border="1" style="height:140px;display:block;overflow:scroll; " >
                   <tr  bgcolor="#FFee00" >
			             <th colspan="7">Pending PhotoCopier Invoice Details</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>Location</th>
			             <th>MODEL NO</th>
			             <th>SERIAL NO</th>
			             <th>MONTH OF PAYMENT</th>		
			             <th>TOTAL AMOUNT</th>
			             <th>CREATED DATE</th>		            
			             <th>VIEW</th>
			        </tr> 
			        <% aa8++; } %>     
                         
			       <tr>
			             <td><%= rs8.getString("b_name")%></td>
			             <td><%= rs8.getString("modelno")%></td>
			             <td><%= rs8.getString("serialno")%></td>
			             <td><%= rs8.getString("month_of_payment")%></td>
			             <td><%= rs8.getString("total_amt")%></td>
			             <td><%= rs8.getString("createddate")%></td>
			             <td><a href="PhotoCopier/EditPhotoCopierDetails2.jsp?phid=<%=(ph_id)%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --> <br><br>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     con8.close();
                            	}%>
                 </div>
           <div id="table3">                     	
                          	
                            	
         <!--        Catridge           --> 
         
         	<%               Connection conx1 = null;
							 Connection2 dbConnx1 = new Connection2();
							 conx1 = dbConnx1.getConnection2();
							
							 int sumcount1=0;
							 Statement stx1=null;
							 ResultSet rsx1=null; 
							 int aax1=0;            
                             //String empid11=(String)session.getAttribute("empid");
                             //System.out.println("sacmnskcu"+empid);
                           try
                              {
	                           
                                String query4 =null;
                                
                                if(bNo.equals("90")){
                                   query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
		                                    " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
		                                    " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
		                                    " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
		                                    " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no in(90) ";
                                  }
                               if(bNo.equals("40")){
                            	   
                            	  query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
		                                   " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
		                                   " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no in(40,41,52,43,42) ";
                                }
                               if(bNo.equals("20")){ 
                            	   
                            	  query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
		                                   " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
		                                   " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no in(20,51,21,89,88,22,23,24,25,26,27,28)";
                               }
                               if(bNo.equals("30")){ 
                            	   
                            	  query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
		                                   " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
		                                   " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no in(30,31,53,32)";
                               }
                               if(bNo.equals("10")){ 
                            	   
                            	  query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
		                                   " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
		                                   " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no in(10,11)";
                               }
                               if(bNo.equals("54")){ 
                            	   
                             	  query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
 		                                   " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
 		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
 		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
 		                                   " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no in(54,44)";
                                }
                               if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	   query4 = " SELECT Distinct c.id,c.month_of_payment,c.totalAmt,b.b_name,"+
		                                    " u.user_name,c.vendor_name FROM `csdb`.`catridge_details` c "+
		                                    " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+
		                                    " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`empid` "+
		                                    " WHERE (`cheque_date`='' OR `chequeno`='') AND branch_no='"+bNo+"'";
                               }
                               
                               stx1 = conx1.createStatement();
                               rsx1 = stx1.executeQuery(query4);
                            
                   while(rsx1.next()){
                   String  id=rsx1.getString("id");
                if(aax1 == 0){  %>
                   
                  <!--  <div style="margin-top:-1%;overflow-y: scroll; margin-right:5%;height:150px;">  -->
               
                     <table  border="1" style="height:140px;display:block;overflow:scroll;margin-left:0%;width:95%;" >
                   <tr  bgcolor="#FFee00">
			             <th colspan="7">Pending Cartridge Cheque</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <!-- <th>CATRIDGE MODEL</th> -->
			             <th>Initiator Name</th>
			             <th>Location</th>
			             <th>Vendor Name</th>
			             <th>MONTH OF PAYMENT</th>		
			             <th>TOTAL AMOUNT</th>
			             <th>VIEW</th>
			        </tr> 
			        <% aax1++; } %>     
                         
			       <tr>
			            <%--  <td><%= rsx1.getString("catridge_model")%></td> --%>
			             <td><%= rsx1.getString("user_name")%></td>
			             <td><%= rsx1.getString("b_name")%></td>
			             <td><%= rsx1.getString("vendor_name")%></td>
			             <td><%= rsx1.getString("month_of_payment")%></td>
			             <td><%= rsx1.getString("totalAmt")%></td>
			             <td><a href="Catridge/EditCatridgeDetails.jsp?id=<%=id%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --> <br><br> 	
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     conx1.close();
                            	}%>
                          
   </div>
           <div id="table4">        
         <!--        Consumption Report           --> 
         
         	<%               Connection conc = null;
							 Connection2 dbConnc = new Connection2();
							 conc = dbConnc.getConnection2();
							
							 int sumcountc=0;
							 Statement stc=null;
							 ResultSet rsc=null; 
							 int aac=0;            
                             //String empidc=(String)session.getAttribute("empid");
                             //System.out.println("sacmnskcu"+empid);
                           try
                              {
	                           
                               String query5 =null;
                               if(bNo.equals("90")){
                                 query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
		                                  "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
		                                  " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
		                                  " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
                            	 query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
		                                  "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
		                                  " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
		                                  " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	 query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
		                                  "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
		                                  " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
		                                  " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	 query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
		                                  "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
		                                  " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
		                                  " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo in(30,31,53,32)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	 query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
		                                  "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
		                                  " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
		                                  " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo in(10,11)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                             	 query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
 		                                  "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
 		                                  " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
 		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
 		                                  " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo in(54,44)";
                               }
                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query5 = " SELECT c.`id`, `empname`, `number`,`relationnumber`, `isptype`, `typename`,`current_month_amt`, "+
		                                   "`monthofpayment`,b.b_name,u.full_name  FROM `consumption_report_details` c"+
		                                   " INNER JOIN `branch_master` b ON b.id=c.`branchid` "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiatorId`"+
		                                   " WHERE  (chequenumber = '' OR chequedate = '') AND branchNo='"+bNo+"'";
                              }
                               
                               stc = conc.createStatement();
                               rsc = stc.executeQuery(query5);
                            
			        
                   while(rsc.next()){
                   String id=rsc.getString("id");
                if(aac == 0){  %>
                   
                  <!--  <div id="table5" style="margin-top:-3%;overflow-y: scroll; margin-right:5%;height:150px;"> 
                  align="right" border="1" width="50%" bgcolor="#FFFFFF"
                  --> 
                      <table  border="1" style="height:140px;display:block;overflow:scroll;width:105%;" >
                   <tr  bgcolor="#FFee00">
			             <th colspan="9">Pending Consumption Cheque</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>Initiator</th>
			             <th>Number</th>
			             <th>User Name</th>	
			             <th>Location</th>		
			             <th>ISP Network Type</th>
			             <th>Type Name</th>
			             <th>Month Of Payment</th>
			             <th>Amount</th>
			             <th>View</th>
			        </tr> 
			        <% aac++; } %>     
                         
			       <tr>
			             <td><%= rsc.getString("full_name")%></td>
			             <td><%= rsc.getString("number")%></td>
			             <td><%= rsc.getString("empname")%></td>
			             <td><%= rsc.getString("b_name")%></td>
			             <td><%= rsc.getString("isptype")%></td>
			             <td><%= rsc.getString("typename")%></td>
			             <td><%= rsc.getString("monthofpayment")%></td>
			             <td><%= rsc.getString("current_month_amt")%></td>
			             <td><a href="Consumption/EditConsumptionReportDetails.jsp?id=<%=id%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --><br><br>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     conc.close();
                            	}%>
         </div>     
              	 
         <div id="table5">              
         <!--        MPLS Report           --> 
         
         	<%               Connection conq = null;
							 Connection2 dbConnq = new Connection2();
							 conq = dbConnq.getConnection2();
							
							 int sumcountq=0;
							 Statement stq=null;
							 ResultSet rsq=null; 
							 int aaq=0;            
                            // String empidq=(String)session.getAttribute("empid");
                             //System.out.println("sacmnskcu"+empid);
                           try
                              {
	                           
                               String query6 =null;
                               
                               if(bNo.equals("90")){
                                  query6 = " SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                   " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                   " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
                            	  query6 =" SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                  " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                  " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	 query6 = " SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                  " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                  " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }

                              if(bNo.equals("30")){ 
                           	   
                            	 query6 = " SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                  " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                  " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch in(30,31,53,32)";
                              }

                              if(bNo.equals("10")){ 
                           	   
                            	  query6 =" SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                  " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                  " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch in(10,11)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                            	  query6 =" SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                  " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                  " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch in(54,44)";
                              }

                              if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query6 =" SELECT c.`mpls_id`,c.`circuit_Id`,c.`bandwidth`,c.`bill_refno`,c.`bill_date`,c.`bill_fdate`, "+
		                                  " c.`bill_tdate`,c.`total_pay_amt`,b.b_name,u.full_name FROM `mpls_details` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branch_id` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`emp_id` "+
		                                  " WHERE (`cheque_date`='' OR `cheque_no`='') and initiator_Branch='"+bNo+"'";
                              }


                                                             
                               stq = conq.createStatement();
                               rsq = stq.executeQuery(query6);
                            
			        
                   while(rsq.next()){
                  // String id=rsd.getString("id");
                if(aaq == 0){  %>
                   
                  <!--  <div id="table5" style="margin-top:-3%;overflow-y: scroll; margin-right:5%;height:150px;"> 
                  align="right" border="1" width="50%" bgcolor="#FFFFFF"
                  --> 
                      <table  border="1" style="height:140px;display:block;overflow:scroll; margin-left:-10%;width:110%" >
                   <tr  bgcolor="#FFee00">
			             <th colspan="10">Pending MPLS Cheque Details</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>Initiator</th>
			             <th>Circuit Id</th>
			             <th>Bandwidth</th>	
			             <th>Location</th>		
			             <th>Bill Reference No</th>
			             <th>Bill Date</th>
			             <th>Bill From Date</th>
			             <th>Bill To Date</th>
			             <th>Total Payment Amount</th>
			             <th>View</th>
			        </tr> 
			        <% aaq++; } %>     
                         
			       <tr>
			             <td><%= rsq.getString("full_name")%></td>
			             <td><%= rsq.getString("circuit_Id")%></td>
			             <td><%= rsq.getString("bandwidth")%></td>
			             <td><%= rsq.getString("b_name")%></td>
			             <td><%= rsq.getString("bill_refno")%></td>
			             <td><%= rsq.getString("bill_date")%></td>
			             <td><%= rsq.getString("bill_fdate")%></td>
			             <td><%= rsq.getString("bill_tdate")%></td>
			             <td><%= rsq.getString("total_pay_amt")%></td>
			             <td><a href="Mpls/EditMpls1.jsp?id=<%= rsq.getString("mpls_id")%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --><br><br>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     conq.close();
                            	}%>
                            	
           </div>              
           <div id="table6">           
         <!--        Payment Report           --> 
         
         	<%               Connection cond = null;
							 Connection2 dbConnd = new Connection2();
							 cond = dbConnd.getConnection2();
							
							 int sumcountd=0;
							 Statement std=null;
							 ResultSet rsd=null; 
							 int aad=0;            
                            // String empidd=(String)session.getAttribute("empid");
                             //System.out.println("sacmnskcu"+empid);
                           try
                              {
	                           
                               String query7 =null;
                               
                               if(bNo.equals("90")){
                                  query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
		                                   " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
                            	 query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
		                                  " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	 query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
		                                  " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	 query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
		                                  " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch in(30,31,53,32)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	 query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
		                                  " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch in(10,11)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                             	 query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
 		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
 		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
 		                                  " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch in(54,44)";
                               }
                             if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query7 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c"+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId` "+ 
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator` "+
		                                   " WHERE (`cheque_no`='' OR `payment_date`='') AND initiator_Branch='"+bNo+"'";
                              }
                              
                               std = cond.createStatement();
                               rsd = std.executeQuery(query7);
                            
			        
                   while(rsd.next()){
                  // String id=rsd.getString("id");
                if(aad == 0){  %>
                   
                  <!--  <div id="table5" style="margin-top:-3%;overflow-y: scroll; margin-right:5%;height:150px;"> 
                  align="right" border="1" width="50%" bgcolor="#FFFFFF"
                  --> 
                       <table  border="1" style="height:140px;display:block;overflow:scroll;margin-left:0%;width:85%" >
                   <tr  bgcolor="#FFee00">
			             <th colspan="10">Pending Payment Cheque Details</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>Initiator</th>
			             <th>Location</th>		
			             <th>PO Number</th>
			             <th>Item Name</th>
			             <th>Quantity</th>
			             <th>Total Amount</th>
			             <th>View</th>
			        </tr> 
			        <% aad++; } %>     
                         
			       <tr>
			             <td><%= rsd.getString("full_name")%></td>
			             <td><%= rsd.getString("b_name")%></td>
			             <td><%= rsd.getString("po_number")%></td>
			             <td><%= rsd.getString("item_name")%></td>
			             <td><%= rsd.getString("quantity")%></td>
			             <td><%= rsd.getString("total_amt")%></td>
			             <td><a href="ProcurementPayment/EditPayment1.jsp?id=<%= rsd.getString("id")%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --><br><br>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     cond.close();
                            	}%>
                           	
         </div>     
          <div id="table7">           
         <!--        Payment Report           --> 
         
         	<%               Connection conp = null;
							 Connection2 dbConnp = new Connection2();
							 conp = dbConnp.getConnection2();
							
							 int sumcountp=0;
							 Statement stp=null;
							 ResultSet rsp=null; 
							 int aap=0;            
                             //String empidp=(String)session.getAttribute("empid");
                           try
                              {
	                           
                               String query8 =null;
                               
                               if(bNo.equals("90")){
                                  query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
		                                   " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch in(90) ";
                                 }
                              if(bNo.equals("40")){
                           	   
                            	 query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
		                                  " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch in(40,41,52,43,42) ";
                               }
                              if(bNo.equals("20")){ 
                           	   
                            	 query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
		                                  " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch in(20,51,21,89,88,22,23,24,25,26,27,28)";
                              }
                              if(bNo.equals("30")){ 
                           	   
                            	 query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
		                                  " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch in(30,31,53,32)";
                              }
                              if(bNo.equals("10")){ 
                           	   
                            	 query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
		                                  " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch in(10,1)";
                              }
                              if(bNo.equals("54")){ 
                              	   
                             	 query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
 		                                  " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
 		                                  " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
 		                                  " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch in(54,44)";
                               }
                            if(!(bNo.equals("54") || bNo.equals("10") || bNo.equals("20") || bNo.equals("30") || bNo.equals("40") || bNo.equals("90"))){ 
                            	  query8 = " SELECT c.id,c.po_number,c.item_name,c.quantity,c.total_amt,b.b_name,u.full_name FROM `procurement_payment` c "+
		                                   " INNER JOIN `csdb`.`branch_master` b ON b.id=c.`branchId`  "+
		                                   " INNER JOIN `leavemanagement`.user u ON u.emp_id=c.`initiator`"+ 
		                                   " WHERE (`delivery_date`='' OR `bill_no`='' OR `bill_date`=''  OR `file_path` NOT LIKE '%.%') AND initiator_Branch='"+bNo+"'";
                              }
                                         
                               stp = conp.createStatement();
                               rsp = stp.executeQuery(query8);
                            
			        
                   while(rsp.next()){
                  // String id=rsd.getString("id");
                if(aap == 0){  %>
                   
                   <table  border="1" style="height:140px;display:block;overflow:scroll;margin-left:0%;width:80%" >
                   <tr  bgcolor="#FFee00">
			             <th colspan="10">Pending Payment Invoice Details</th>
			        </tr>
			        <tr  bgcolor="#FFee00">
			             <th>Initiator</th>
			             <th>Location</th>		
			             <th>PO Number</th>
			             <th>Item Name</th>
			             <th>Quantity</th>
			             <th>Total Amount</th>
			             <th>View</th>
			        </tr> 
			        <% aap++; } %>     
                         
			       <tr>
			             <td><%= rsp.getString("full_name")%></td>
			             <td><%= rsp.getString("b_name")%></td>
			             <td><%= rsp.getString("po_number")%></td>
			             <td><%= rsp.getString("item_name")%></td>
			             <td><%= rsp.getString("quantity")%></td>
			             <td><%= rsp.getString("total_amt")%></td>
			             <td><a href="ProcurementPayment/EditPayment2.jsp?id=<%= rsp.getString("id")%>">VIEW</a></td>
			        </tr>
    	            <%}%></table><!-- </div> --><br><br>
	          
                <%} catch (SQLException ex) {
                                        ex.printStackTrace();
                                        }	
                    finally{
	                      
		                     conp.close();
                            	}%>
                           	
         </div>            
              	 
      </td>
      </tr>
</table>
</div>

 



<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Venki coding end @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->





<!--end wrapper-->
</form>
</body>
</html>