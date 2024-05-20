<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
 <%@ include file="banner.jsp" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body background =".jpg" >

<head><title>Incident Selection</title>
<link rel='stylesheet' type='text/css' href='../../css/homePage.css' />
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<script type="text/javascript">

var showdata="";
function check(value){ 
xmlHttp=GetXmlHttpObject();
var url="imsAjaxValidity.jsp";
url=url+"?aabbcc="+value;
xmlHttp.onreadystatechange=stateChanged; 
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
function stateChanged(){ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
showdata = xmlHttp.responseText; 
//alert(showdata);

document.getElementById("mydiv").innerHTML= showdata;
} 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try{
xmlHttp=new XMLHttpRequest();
}
catch (e) {
try {
xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
}
catch (e){
xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
}
}
return xmlHttp;
}
</script>
</head>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {

	newwindow=window.open(url,'name','height=300,width=900,location=1,status=1,scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}
 

// -->
   function get_val9(tot_val)
   {
   		
   		 form.action = "complainPageAdmin.jsp?msg=1";
   		 form.method = "post";
 		 form.submit();
      
   }
   function report()
   {
   document.form.action="CheckListSelectionBack.jsp?msg=1";
   document.form.method="post";
   document.form.submit();
   }
   function ExcelReport()
   {
   document.form.action="CheckListExcelReport.jsp?msg=1";
   document.form.method="post";
   document.form.submit();
   }
</script>

	<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__", "   ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
     
     
</script>
<%
session.setMaxInactiveInterval(20*60);

if((session==null||session.getAttribute( "Nname" )==null)||(session.getAttribute( "NpostingCo" )==null))
{
	String msg2=null;
	msg2="Session Time Out \\n Login Again";
	response.sendRedirect("../../adminlink.jsp?msg="+msg2);
}
%>
<script language="javascript" type="text/javascript">
function validate4()
{	/* var p1=document.form.branch4;  */var y1=document.form.date4;var y2=document.form.date44;
 /* if ((p1.value==null)||(p1.value=="NULL"))
				{alert("Select Branch Name!"); p1.focus(); return false; }
  */if ((y1.value==null)||(y1.value=="NULL"))
				{ alert("Select From Date!"); y1.focus(); return false; }
 if ((y2.value==null)||(y2.value=="NULL"))
				{ alert("Select  To Date!"); y2.focus(); return false; }
   else
	return true;
}  
</script>
<%
//String city = request.getParameter( "city" );
session.getAttribute("city");

%><%!
	              Connection conn = null;
	              Statement st;
	              ResultSet rs;
	              String []id;
	              Object logInName = null,desg=null,realname=null,city=null,Initiator=null;
	              
	%>
	 <%
              logInName = session.getAttribute("theName");
     		  realname =  session.getAttribute("Nname");
     		   desg = session.getAttribute("desg");
     		   city = session.getAttribute("NpostingCo");
     		   Initiator = session.getAttribute("Nmail");
     		  System.out.println("logInName  "+logInName);
     		  System.out.println("realname  "+realname);
     		  System.out.println("desg  "+desg);
     		  System.out.println("Branch nameeee  "+city);
     		  System.out.println("Initiator NAMEEEEEEEE "+Initiator);
     %>
<%-- <font > Welcome :<%= session.getAttribute( "city" ) %></font> --%>
<body bgcolor="" leftmargin="80" rightmargin="80"  >

<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<img src="../../images/nippon.gif" height="35" width="220">
</td> 

</tr> 
</table>


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  
   <tr align="center">
    <td bgcolor="#8ec300" class="greenLine"><strong><font size ="4" color="white" ><b> 	WELCOME </b><br />
    </font></strong></td>
</tr>
<tr align="center">
 <td bgcolor="#2f4377" class="blueLine"><strong><font size ="4" color="white">CHECK LIST REPORT</font></strong></td>
</tr>
 
</table>
<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr>
<td width="1118" align="left"><font color="blue"> 
<%= session.getAttribute( "NpostingCo" ) %>-BRANCH</font>
</td>
<td width="1118" align="right"> 
<a href="../logout.jsp"><font size=2>LOGOUT</font></a>
</td> 
</tr> 
</table>
<br />
<br />

<%
String tot_val;
Connection cn9 = null,cn99=null,cn999=null,cn9999=null;
Statement st9 = null,st99=null,st999=null,st9999=null; 
ResultSet rs9 = null,rs99=null,rs999=null,rs9999=null;
try{
cn9 = con.getConnection2();
st9=cn9.createStatement();
cn99 = con.getConnection2();
st99=cn99.createStatement();
cn999 = con.getConnection2();
st999=cn999.createStatement();
cn9999 = con.getConnection2();
st9999=cn9999.createStatement();
rs99 = st99.executeQuery("select DISTINCT m_b_name,m_b_no FROM branch_master_main ORDER BY m_b_name ASC");
//rs9 = st9.executeQuery("select DISTINCT ims_id from ims_master WHERE ims_id LIKE 'NEIN/CS/IMS/90%' ");
rs9 = st9.executeQuery("select DISTINCT ims_id from ims_master Left Join branch_master On(substr(ims_id,13,2)=branch_master.b_no) WHERE '"+city+"'=branch_master.b_name GROUP BY ims_id");
rs999 = st999.executeQuery("select DISTINCT Nname FROM nentryho WHERE Npost='IT SUPPORT' ORDER BY Nname ASC");
rs9999 = st9999.executeQuery("select DISTINCT Nname FROM nentryho WHERE Npost='IT SUPPORT' ORDER BY Nname ASC");
%>
<!-- <form name="form1" method="post" action="CheckListViewHO.jsp?msg=1" onsubmit="return ValidateForm();"> -->
<form name="form" method="post" action="CheckListSelectionBack.jsp?msg=1" >
<!-- <form name="form1" method="post" action="SelectIms.jsp?msg=1" onsubmit="return ValidateForm();"> -->
	 
<table align="center" width="100%">
<tr>
<th>CHECK-LIST DISPLAY </th>
</tr>
</table>

<br>
<br>	 
	 
  <table width="30%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="lightgrey">
   
 
    
 <!--   <tr>
      <td><label>Select Date</label></td>
     <td><input type="text"  style="width: 6em"  name="txtCalendar" value="" id="idCalendar" onclick="showCalendarControl(this)" readonly="readonly"></td> 
      		<td> <img src="../images/cal.gif" id="idForDay" style="float: left;margin: 0.5em 0.5em 0.5em 0.5em;" name="imgForDate" width="16" height="16"  onclick="showCalendarControl(document.getElementById('idCalendar'))">	</td>
	</tr> -->
	<tr>
   <td bgcolor="#2f4377" colspan="5">
     <font size ="3" color="white">FROM DATE - TO DATE REPORT</font>
     <input type="hidden" value="<%=realname%>" name="SE_name">
     <input type="hidden" value="<%=city%>" name="SE_b_no">
   </td>
  </tr>
	  <tr>
      <td width="15%"><label>From Date:</label><input type="text"  name="date4" style="width: 6em" value="NULL" id="idCalendar2" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	  <td width="15%"><label>To Date:</label><input type="text"  name="date44" style="width: 6em" value="NULL" id="idCalendar3" onclick="showCalendarControl(this)" readonly="readonly"></td> 			        
	 
      
	</tr>
      <tr>
     <td width="30%"><label>Select Branch</label></td>
	 <td>
	 
      <select  name="branch"  id="hiderow">     <option value="">SELECT</option> 
                                                
										        <%while(rs99.next()){ %> 
										       <option><%=rs99.getString(1) +"-"+ rs99.getString(2)%> </option>
										        <%} %> 
										        </select>
      </td>
  </tr>
      
	<tr>
<td><label>Select Viewed By</label></td>
	 <td>
	 
      <select  name="person"  id="hiderow">     <option value="">SELECT</option> 
                                                
										        <%while(rs999.next()){ %> 
										       <option><%=rs999.getString(1)%> </option>
										        <%} %> 
										        </select>
      </td>
  </tr>
<!-- <tr>
<td><label>Select Status</label></td>
	 <td>
	 
      <select  name="status"  id="hiderow">     <option value="">SELECT</option> 
                                                 
										       <option value="Incident reported">Incident reported</option>
										       <option value="No Incident reported">No Incident reported</option>
										        </select>
      </td>
  </tr> -->

	<tr align="center">
	   
	      
	<td align="center" colspan="2">
	<input style="background-color:#2f4377;font-weight:bold;color:white;" type="submit" align="middle" name="subpopup" value="DISPLAY" onclick="return (validate4() && report());"/>
	<INPUT type="button" style="background-color:#2f4377;font-weight:bold;color:white;" value="EXCEL" name=button44 onclick="return ( validate4() && ExcelReport());">
	</td>
	
	</tr>
	</table>
<%

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs99,st99,cn99);
	DbUtil.closeDBResources(rs999,st999,cn999);
	DbUtil.closeDBResources(rs9999,st9999,cn9999);
	
}
%>	
	
	
	</form>

	
	<br>
<br>
<br>
<br>







<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="../../HOME.jsp"><img src="../../home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address>
</td> 




<td width="115" align="right"> 
<a href="../../adminbom.jsp?msg=1"><img src="../../bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 


<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 





</body>
</html>