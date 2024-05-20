<%@page import="CON2.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.Calendar" %> 
<%@ page import="java.io.*"%>
<%@page import="CON2.Connection2"%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ include file="banner.jsp" %>
<%@ include file="../../../../../Session/SuperAdminSession.jsp"%>
<jsp:useBean id="con" class="CON2.Connection2" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINISTRATOR</title>
<link rel='stylesheet' type='text/css' href='css/headerColor.css' />
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script> -->
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script language="javascript"   type="text/javascript" src="js/popWindowAtCenter.js"></script>
<script type="text/javascript" src="API/Js/jquery-1.8.2.js"></script>
	<link rel='stylesheet' type='text/css' href='css/homePage.css' />


<style type="text/css">
div#iddd
 {
  width:100px;
  height:100px;
  }
</style>

<script type="text/javascript">

function openRoutingPDF() {
	   // var ref = window.open('http://localhost:8080/nepl1/UserHelp.pdf', '_blank', 'location=yes');
	       var ref = window.open('helpPages/C2IT  Approval Flow Matrix Jan 2023.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	  //   var ref = window.open('http://localhost:8180/NEIN-C2IT/helpPages/ITclearanceHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	   // var ref = window.open('http://localhost:8080/NEIN-P2P/NIPPON/UserHelp.pdf', '_blank', 'fullscreen=yes,height=,width=,location=yes,scrollbars=1,resizable=yes,channelmode=yes');
	    ref.addEventListener('loadstart', function(event) { alert('start: ' + event.url); });
	    ref.addEventListener('loadstop', function(event) { alert('stop: ' + event.url); });
	    ref.addEventListener('loaderror', function(event) { alert('error: ' + event.message); });
	    ref.addEventListener('exit', function(event) { alert(event.type); });
	}



function link(form_no) 
{
   var f=document.form;  

	f.method="post";   
	//alert(form_no);
	f.action='DisplayPendingFormPopUp.jsp?form_no='+form_no;
	//window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    //f.target='formpopup';
	f.submit(); 
	}
	
function linkAppIT(form_no) 
{
var form_no1=document.getElementById(form_no).value;
document.form.req.value=form_no1;
document.form.pageName.value="../../adminPage.jsp";
var f=document.form;  
f.method="post";
f.action='SingleApplicationForm/updateForm/NEINFormInitUpdateIT.jsp?msg=1';
f.submit(); 
}

function linkApp(form_no) 
{
var form_no1=document.getElementById(form_no).value;
var f=document.form;  
f.method="post";   
f.action='SingleApplicationForm/FormApproval/PopupLink/NeinAppFormAdmin.jsp?form_no='+form_no1;
f.submit(); 
}
	
function linkPendingRF(form_no){
	var form_no1=document.getElementById("crf"+form_no).value;
	var f=document.form;
	f.method="post";
	f.action='BOMAUDIT/FormApproval/PopupLink/bomAuditLocalAdminApproval.jsp?req='+form_no1;
	f.submit();
}

function linkPendingView(id) 
   {
   //alert(id);
 
   var form_no1=document.getElementById(id).value;
  // alert(form_no1);
   var f=document.form;  
   f.method="post";   
   f.action='ITClearanceUpdate/ITclearanceLocalAllAdminView.jsp?formNo='+form_no1;
   window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
   f.target='formpopup';
   f.submit(); 
   }



function linkITAdmin(form_no1)
	{
	var g = document.form;
	g.method = "post";
	g.action = 'DisplayITPendingReminder.jsp?form_no='+form_no1;
	//newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	window.open('', 'formpopup', 'type=fullWindow,fullscreen,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
    //form.target = 'formpopup';
    g.target='formpopup';
	g.submit();
	
	}
function linkGatePass(form_no) 
{//alert("herer"+form_no);
var f=document.form;  
 f.method="post";   
  f.action='GatePass/gatePassformApprove1Super.jsp?req='+form_no;
f.submit();
}	
	
	
function linkNExAS(form_no) 
{//alert("herer"+form_no);
var f=document.form;  
 f.method="post";   
  f.action='NExAS/approvalRequestNExAS.jsp?form_no='+form_no;
f.submit();
}
function linkGSNET(form_no) 
{//alert("herer"+form_no);
var f=document.form;  
 f.method="post";   
  f.action='GSNET/approvalRequestGSNET.jsp?form_no='+form_no;
f.submit();
}
function linkTMS(form_no) 
{//alert("herer"+form_no);
var f=document.form;  
 f.method="post";   
  f.action='TMSUser/approvalRequestTMS.jsp?form_no='+form_no;
f.submit();
}
function linkCCD(form_no,form_name) 
{//alert("herer"+form_no);
var f=document.form;  
 f.method="post";  
 if(form_name=="CCDReport")
	  {
	  var f=document.form;  
	  f.method="post"; 
      f.action='CCDReport/approvalRequestCCD.jsp?form_no='+form_no;
      f.submit();
	  }
 else
	  {
	  //alert("form_name"+form_name);
	  var f=document.form;  
	  f.method="post"; 
      f.action='CCDReport/RegistrationForSW/FormApproval/PopupLink/RegistrationAdmin.jsp?form_no='+form_no;
      f.submit();
	  }

}


</script>

<script  type="text/javascript">
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
</script>
<%!String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,SessionSuperAdmin=null; %>
<%
 
 SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
SessionSuperAdmin = (String) session.getAttribute("AdminRights");
String emp_no = (String) session.getAttribute("EmpNo");
//System.out.println("Session empid  :"+emp_no);
%>
<%
//HttpSession session = request.getSession();
//session.setMaxInactiveInterval(20*60); 
session.setMaxInactiveInterval(30*60);
System.out.println("session.getAttribute b_no :"+session.getAttribute("b_no"));
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("logout.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}


//String b_no2=null;

//b_no2 = (String)session.getAttribute("b_no");

//System.out.println("Sesion converting :"+b_no2);

%>
<%int rCount =(Integer)session.getAttribute("Refresh"); 

if(rCount==0)
{
	//out.println("rCount==0"+rCount);
	//rCount=10;
	rCount=15;
	session.setAttribute("Refresh",rCount);
}
else{	
	rCount--;
	session.setAttribute("Refresh",rCount);
	//out.println("Else:"+rCount);
	if(rCount <= 0)
	{
		//out.println("rCount <= 0"+rCount);
		//session.setAttribute("Refresh",10);
		session.setAttribute("Refresh",30);
		request.getRequestDispatcher("logout.jsp").forward(request,response);
		
	}
}
%>



<!-- <script>
//Auto Refresh Page with Time script By JavaScript Kit (javascriptkit.com) Over 200+ free scripts here!
//enter refresh time in "minutes:seconds" Minutes should range from 0 to inifinity. Seconds should range from 0 to 59
var limit="0:30"
if (document.images){
var parselimit=limit.split(":")
parselimit=parselimit[0]*60+parselimit[1]*1
}
function beginrefresh(){
if (!document.images)
return
if (parselimit==1)
window.location.reload()
else{ 
parselimit-=1
curmin=Math.floor(parselimit/60)
cursec=parselimit%60
if (curmin!=0)
curtime=curmin+" minutes and "+cursec+" seconds left until page refresh!"
else
curtime=cursec+" seconds left until page refresh!"
window.status=curtime
setTimeout("beginrefresh()",1000)
}
}
window.onload=beginrefresh
</script>





<script type='text/javascript'>

$(function(){

var overlay = $('<div id="overlay"></div>');

overlay.show();

overlay.appendTo(document.body);

$('.popup').show();

$('.close').click(function(){

$('.popup').hide();

overlay.appendTo(document.body).remove();

return false;

});




$('.x').click(function(){

$('.popup').hide();

overlay.appendTo(document.body).remove();

return false;

});

});

</script> -->
<!-- <script>


/*
Auto Refresh Page with Time script
By JavaScript Kit (javascriptkit.com)
Over 200+ free scripts here!
*/

//enter refresh time in "minutes:seconds" Minutes should range from 0 to inifinity. Seconds should range from 0 to 59
var limit="0:60";

if (document.images){
var parselimit=limit.split(":")
parselimit=parselimit[0]*60+parselimit[1]*1;
//alert("time :"+parselimit); //time set 60
}
function beginrefresh(){
if (!document.images)
return
if (parselimit==1)
window.location.reload();
else{ 
parselimit-=1;
curmin=Math.floor(parselimit/60);
cursec=parselimit%60;
//alert("time cursec :"+cursec);//count down starts from 60-1 and refersh
if (curmin!=0)
curtime=curmin+" minutes and "+cursec+" seconds left until page refresh!";
else
curtime=cursec+" seconds left until page refresh!";
window.status=curtime;
setTimeout("beginrefresh()",1000);
}
}

window.onload=beginrefresh
//
</script>-->

</head>

<body bgcolor="#FFFFFF" leftmargin="80" rightmargin="80"   marginwidth="70" marginheight="5" style="overflow-x: hidden;" >
<div id="iddd" >
<form name="form" >
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


<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118" style="border-collapse: collapse;"> 

<tr>
<td width="1118" align="right"> 
<a href="#" onclick="openRoutingPDF()"><img width="30" ><font size ="2">Form Approval Routing</font></a>

<a href="SendingMailModule.jsp?msg=1" onclick="return popitup2('SendingMailModule.jsp?msg=1')" id="hiderow"><img width="35" src="images/mailings2.jpg">Send mail</a>
<a href="adminbom.jsp?msg=1"><img width="35" src="images/master2.jpg">Masters</a>
<!-- <a href="feedbackUser.jsp?msg=1" onclick="return popitup2('feedbackUser.jsp?msg=1')" id="hiderow"><img width="35" src="images/doubt.jpg">Feedback</a>
<a href="thoughtMaster.jsp?msg=1" onclick="return popitup2('thoughtMaster.jsp?msg=1')" id="hiderow"><img width="35" src="images/face.jpg">Message</a> -->
<a href="changePwdAdmin.jsp?msg=1" onclick="return popitup2('changePwdAdmin.jsp?msg=1')" id="hiderow"><img width="35" src="images/passChange.jpg">Change Password</a>
<a href="#" onclick="openHelpPDF()"><img width="30" src="images/help3.jpg"><font size ="2">Help</font></a>
<a class="a_link" href="logout.jsp"><img width="35" src="images/icon_log.png">Logout</a>
</td> 

</tr> 
</table>


<br />





				<table width="1118" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<tr>
<td colspan="10">
				 <font > Welcome :
<%=SessionName %>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<%=Sessiondesg %> 

</font>
		
</td>
<td bgcolor="white" align="right"><font color="#DCDCDC" size="1">Refresh Count :<%=rCount%></font></td>
</tr>		
				<tr><td colspan="11" align="center" bgcolor="grey" class="tdColor"><b>DASH BOARD</b></td></tr>



<%
String cs_date,datee=null;
//DateFormat dateFormat = new SimpleDateFormat("yyyy-dMM-d");
DateFormat dateFormat = new SimpleDateFormat("MM");
Date date = new Date();
cs_date = dateFormat.format(date);
System.out.println("SessionName"+SessionName);
System.out.println("Sessiondesg"+Sessiondesg);
//+SessionName+"' AND Approval_desg='"+Sessiondesg+
//String empp=null,status=null,notstatus=null,truestatus=null,allPending=null;
String form_name=null,form_no=null,initiator=null,initiatorDesg=null,forBranch=null,SentBy=null,SentByDesg=null,SentByRemarks=null;
String requestOption=null,full_name=null;
int k=0;
int flag=0;
Connection cn02 = null,cn9=null;
Statement st02 = null,st9=null; 
ResultSet rs02 = null,rs9=null;
%>










				<tr><td colspan="11" align="center" bgcolor="lightgrey" class="tdColor">PENDING STATUS OF OSD/INCEDENT LOG FORMS</td></tr>
	
				<tr>
						<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NO.</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUEST FOR</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor" ><font size="2">REQUEST TYPE</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUESTED DATE</font></td>
					
			    <td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR NAME</font></td>
				<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR DESIGNATION</font></td>
				
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY NAME</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY DESIGNATION</font></td>
					<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY REMARKS</font></td>
					
				</tr>
					<% 
						 try 
						  
						  {
				
						cn02 = con.getConnection2();
						st02=cn02.createStatement();
													
						
			 rs02 = st02.executeQuery("SELECT form_name,fnit.form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fnit.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance fnit inner join form1_it_clearance_item fnit1 on fnit.form1_no=fnit1.form1_no WHERE fnit1.empid='"+emp_no+"' and fnit1.presence='now'"+ 
 					
				    //"UNION SELECT fn12.form_name,fn12.form2_no,fn12.i_name,fn12.i_desg,fn12.branch,fn12.Approval_empp,fn12.Approval_desgg,fn12.Approval_remarks,DATE_FORMAT(fn12.f_date,'%d/%m/%Y'),fn12.requestOption,fn12.full_name,fn12.Approval_f_date as detu FROM form2_domain  fn12 inner join form2_domain_item fni12 on fn12.form2_no=fni12.form2_no WHERE fn12.Approval_sttatuss='Pending' AND ((fn12.Approval_emp='"+SessionName+"' AND fn12.Approval_desg='"+Sessiondesg+"')OR(fni12.empid='"+emp_no+"')) and fni12.presence='now'"+ /*  WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
 					//"UNION SELECT form_name,form11_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form11_dsc WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+
 		 			//"UNION SELECT fn1.form_name,fn1.form10_no,fn1.i_name,fn1.i_desg,fn1.branch,fn1.Approval_empp,fn1.Approval_desgg,fn1.Approval_remarks,DATE_FORMAT(fn1.f_date,'%d/%m/%Y'),fn1.requestOption,fn1.full_name,fn1.Approval_f_date as detu FROM form10_registration fn1 inner join form10_registration_item fni1 on fn1.form10_no=fni1.form10_no WHERE fn1.Approval_sttatuss='Pending' AND ((fn1.Approval_emp='"+SessionName+"' AND fn1.Approval_desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"')) and fni1.presence='now'"+
					//"UNION SELECT fn1.form_name,fn1.form10_no,fn1.i_name,fn1.i_desg,fn1.branch,fn1.Approval_empp,fn1.Approval_desgg,fn1.Approval_remarks,DATE_FORMAT(fn1.f_date,'%d/%m/%Y'),fn1.requestOption,fn1.full_name,fn1.Approval_f_date as detu FROM form17_usb_access fn1 inner join form17_usb_access_item fni1 on fn1.form10_no=fni1.form10_no WHERE fni1.status='Pending' and fni1.presence='now' and fni1.empid='"+emp_no+"'"+
 		 		    //"UNION SELECT form_name,fn3.form3_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fn3.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form3_lotus fn3 inner join form3_lotus_item fni3 on fn3.form3_no=fni3.form3_no WHERE fn3.Approval_sttatuss='Pending' AND ((fn3.Approval_emp='"+SessionName+"' AND fn3.Approval_desg='"+Sessiondesg+"')OR(fni3.empid='"+emp_no+"')) and fni3.presence='now'"+               /* form3_lotus WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
					//"UNION SELECT form_name,fn8.form8_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fn8.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form8_lotus_traveler fn8 inner join form8_lotus_traveler_item fni1 on fn8.form8_no=fni1.form8_no WHERE fn8.Approval_sttatuss='Pending' AND ((fn8.Approval_emp='"+SessionName+"' AND fn8.Approval_desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"')) and fni1.presence='now'"+ /*  WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
					//"UNION SELECT form_name,fn4.form4_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fn4.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form4_accesscard fn4 inner join form4_accesscard_item fni1 on fn4.form4_no=fni1.form4_no WHERE fn4.Approval_sttatuss='Pending' AND ((fn4.Approval_emp='"+SessionName+"' AND fn4.Approval_desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"')) and fni1.presence='now'"+ /*  WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
				    //"UNION SELECT form_name,fn5.form5_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fn5.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form5_folder fn5 inner join form5_folder_item fni1 on fn5.form5_no=fni1.form5_no WHERE fn5.Approval_sttatuss='Pending' AND ((fn5.Approval_emp='"+SessionName+"' AND fn5.Approval_desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"')) and fni1.presence='now'"+/* WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
					//"UNION SELECT form_name,fn6.form6_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fn6.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form6_internet fn6 inner join form6_internet_item fni1 on fn6.form6_no=fni1.form6_no WHERE fn6.Approval_sttatuss='Pending' AND ((fn6.Approval_emp='"+SessionName+"' AND fn6.Approval_desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"')) and fni1.presence='now'"+ /* WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
					//"UNION SELECT form_name,fn7.form7_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(fn7.f_date,'%d/%m/%Y'),requestOption,full_name,Approval_f_date as detu FROM form7_newins fn7 inner join form7_newins_item fni1 on fn7.form7_no=fni1.form7_no WHERE fn7.Approval_sttatuss='Pending' AND ((fn7.Approval_emp='"+SessionName+"' AND fn7.Approval_desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"')) and fni1.presence='now'"+/* WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"'"+ */
				
					"UNION SELECT form_name,form9_no,SessionName,SessionDesg,SUBSTRING(SessionCity, 1, CHAR_LENGTH(SessionCity) - 4) as SessionCityw,ifnull(Approval_empp,'-') as Approval_empp,ifnull(Approval_desgg,'-') as Approval_desgg,ifnull(Approval_remarks,'-') as Approval_remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),requestOption,SessionName,Approval_f_date as detu FROM  form9_incident_log WHERE Approval_sttatuss='Pending' AND Approval_emp='"+SessionName+"' AND Approval_desg='"+Sessiondesg+"' ORDER BY detu DESC");
									
					while(rs02.next())
						{k++;
						  flag=1;
						  form_name = rs02.getString(1);
							form_no = rs02.getString(2);
							
							//System.out.println("emp "+empp);
							initiator = rs02.getString(3);
							initiatorDesg = rs02.getString(4);
							forBranch = rs02.getString(5);
							SentBy = rs02.getString(6);
							SentByDesg = rs02.getString(7);
							SentByRemarks = rs02.getString(8);
							datee = rs02.getString(9);
							requestOption = rs02.getString(10);
							full_name = rs02.getString(11);
							//System.out.println("DATEEEEEEEEEEEEEEEEEEEE :"+datee);
						%>
				<tr><input type="hidden" name="<%=k%>" value="<%=form_no%>" />
	                 <td width="150px" align="center"  height="21" ><font size="2"><%=form_name%></font></td>
   					 <td width="200px" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="link(<%=k%>);"  title="click for more details"><font size="3"><%=form_no%></font></a></font> </td> 
   					 <td width="" align="center"  height="21" ><font size="2"><%=full_name%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=requestOption%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=datee%></font></td>
   					 
					
						<td width="" align="center"  height="21" ><font size="2"><%=forBranch%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=initiator%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=initiatorDesg%></font></td>
   					 
						<td width="" align="center"  height="21" ><font size="2"><%=SentBy%></font></td>
						<td width="" align="center"  height="21" ><font size="2"><%=SentByDesg%></font></td>
						<%-- <td width="67" align="center"  height="21" ><font size="2"><%=SentByRemarks%></font></td> --%>
						<td><textarea rows="1" cols="15" title="Remarks" readonly="readonly" onclick="this.style.height='200px';this.style.width='200px';" onblur="this.style.height='';this.style.width='140px';"><%=SentByRemarks%></textarea>
				</tr>		<%}
					if(flag==0){%>
		            	<tr><td align="center" colspan="20"><b><font color="red">---------------No Pending FORMS at present---------------</font></b></td></tr>
		            <%}
				%>
				</table>
				
			<%}catch (Exception e) {
		 		 System.out.println(e);
			}
			finally{
				DbUtil.closeDBResources(rs02,st02,cn02);

				}%>
				
<br>
<table width="1111"><tr>
<td>				
<center>
 <font color="red" size="2">
				 <%
				            
				 %></font>
</center>
</td>
</tr>
</table>

<input type="hidden" name="req">
<input type="hidden" name="pageName">
<table width="1118" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">

<tr><td colspan="11" align="center" bgcolor="lightgrey" class="tdColor">PENDING STATUS OF APPLICATION FORMS</td></tr>

<tr>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NAME</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NO.</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUEST FOR</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUEST TYPE</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUESTED DATE</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FOR BRANCH</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR NAME</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR DESIGNATION</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY NAME</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY DESIGNATION</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY REMARKS</font></td>
</tr>
<% 
String cs_dateApp,dateeApp=null;
//DateFormat dateFormat = new SimpleDateFormat("yyyy-dMM-d");
DateFormat dateFormatApp = new SimpleDateFormat("MM");
Date dateApp = new Date();
cs_dateApp = dateFormatApp.format(dateApp);
System.out.println("SessionName"+SessionName);
System.out.println("Sessiondesg"+Sessiondesg);
//+SessionName+"' AND Approval_desg='"+Sessiondesg+
//String empp=null,status=null,notstatus=null,truestatus=null,allPending=null;
String form_nameApp=null,form_noApp=null,initiatorApp=null,initiatorDesgApp=null,forBranchApp=null,SentByApp=null,SentByDesgApp=null,SentByRemarksApp=null;
String requestOptionApp=null,full_nameApp=null;
int ap=0;
int flagApp=0;
Connection cnApp=null;
Statement stApp=null; 
ResultSet rsApp=null;
String lvl="";
try
{
	cnApp = con.getConnection2();
	stApp=cnApp.createStatement();
	
rsApp = stApp.executeQuery("SELECT form_name,apF.applicationNo,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks,DATE_FORMAT(apF.applicationDate,'%d/%m/%Y'),request_type,full_name,Approval_f_date as detu,levelno FROM neinapplicationform apF inner join neinapplicationform_item apFi on apF.applicationNo=apFi.form2_no WHERE apF.Approval_sttatuss='Pending' AND ((apF.Approval_emp='"+SessionName+"' AND apF.Approval_desg='"+Sessiondesg+"') OR (apFi.empid='"+emp_no+"')) and apFi.presence='now' ORDER BY detu DESC");
	while(rsApp.next())
		{
		ap++;
		  flagApp=1;
		  	form_nameApp = rsApp.getString(1);
			form_noApp = rsApp.getString(2);
			initiatorApp = rsApp.getString(3);
			initiatorDesgApp = rsApp.getString(4);
			forBranchApp = rsApp.getString(5);
			SentByApp = rsApp.getString(6);
			SentByDesgApp = rsApp.getString(7);
			SentByRemarksApp = rsApp.getString(8);
			dateeApp = rsApp.getString(9);
			requestOptionApp = rsApp.getString(10);
			full_nameApp = rsApp.getString(11);
			lvl = rsApp.getString("levelno");
			 System.out.println("lvl====>"+lvl);
		%>
<tr><input type="hidden" name="<%=ap%>" id="<%=ap%>" value="<%=form_noApp%>" />
<td width="150px" align="center"  height="21" ><font size="2"><%=form_nameApp%></font></td>
<%if(lvl.equalsIgnoreCase("1")){%>
<td width="200px" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="linkAppIT(<%=ap%>);"  title="click for more details"><font size="3"><%=form_noApp%></font></a></font> </td> 
<%}else{%>
<td width="200px" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="linkApp(<%=ap%>);"  title="click for more details"><font size="3"><%=form_noApp%></font></a></font> </td> 
<%}%>
<td width="" align="center"  height="21" ><font size="2"><%=full_nameApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=requestOptionApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=dateeApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=forBranchApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=initiatorApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=initiatorDesgApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=SentByApp%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=SentByDesgApp%></font></td>
<td><textarea rows="1" cols="15" title="Remarks" readonly="readonly" onclick="this.style.height='200px';this.style.width='200px';" onblur="this.style.height='';this.style.width='140px';"><%=SentByRemarksApp%></textarea>
</tr>		
<%}
	if(flagApp==0){%>
	<tr><td align="center" colspan="20"><b><font color="red">---------------No Pending FORMS at present---------------</font></b></td></tr>
<%}
%>
</table>
<%}catch(Exception e){
	System.out.println(e);
}finally{
	DbUtil.closeDBResources(rsApp,stApp,cnApp);
}%>
				
<br>
<table width="1111"><tr>
<td>				
<center>
 <font color="red" size="2">
				 <%
				 %></font>
</center>
</td>
</tr>
</table>

<!----------------------------------------------------------------------------------- -->

<table width="1118" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
<tr><td colspan="11" align="center" bgcolor="lightgrey" class="tdColor">PENDING STATUS OF C2IT ACCESS REVIEW REPORT FORMS</td></tr>
<tr>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NAME.</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NO.</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUESTED DATE</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR BY</font></td>
<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR REMARKS</font></td>
</tr>
<% 
cs_dateApp = dateFormatApp.format(dateApp);
int flagAppRF=0,car=0;
String form_noAppRF="";
Connection cnAppRF=null;
Statement stAppRF=null; 
ResultSet rsAppRF=null;
try{
	cnAppRF = con.getConnection2();
	stAppRF=cnAppRF.createStatement();
	rsAppRF = stAppRF.executeQuery("select a.requestNo as reqNo,date_format(a.requestDate,'%d/%m/%Y') as requestDate,requestByName,a.requesterRemarks as remarks from c2itreviewfrommain a left outer join c2itreviewfromitem b on a.requestNo=b.reqNo where status='Pending' and presence='now' and b.empId='"+emp_no+"' order by requestDate desc");
	while(rsAppRF.next()){
		flagAppRF=1;
		car++;
		form_noAppRF = rsAppRF.getString(1);
%>
<tr>
<td width="" align="center"  height="21" ><font size="2">C2IT ACCESS REVIEW REPORT FORM<input type="hidden" name="crf<%=car%>" id="crf<%=car%>" value="<%=form_noAppRF%>" /></font></td>
<td width="" align="center"  height="21" ><font size="2"><font color="white" size="2" ><a href="#" onclick="linkPendingRF(<%=car%>);"  title="click for more details"><font size="3"><%=rsAppRF.getString(1)%></font></a></font></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=rsAppRF.getString(2)%></font></td>
<td width="" align="center"  height="21" ><font size="2"><%=rsAppRF.getString(3)%></font></td>
<td>
	<textarea rows="1" title="Remarks" readonly="readonly" onclick="this.style.height='200px';this.style.width='200px';" onblur="this.style.height='';this.style.width='200px';"><%=rsAppRF.getString(4)%></textarea>
</td>
</tr>
<%}
	if(flagAppRF==0){%>
	<tr><td align="center" colspan="20"><b><font color="red">---------------No Pending FORMS at present---------------</font></b></td></tr>
<%}
%>
</table>
<%}catch(Exception e){
	System.out.println(e);
}finally{
	DbUtil.closeDBResources(rsAppRF,stAppRF,cnAppRF);
}%>

<table width="1111"><tr>
<td>				
<center>
 <font color="red" size="2">
				 <%
				 %></font>
</center>
</td>
</tr>
</table>

<!----------------------------------------------------------------------------------- -->


 <%-- <%=emp_no%>  --%>

<% 
  if(emp_no.equals("214") || emp_no.equals("2428"))
  {
%>

<table width="1118" cellspacing="1" border="2" cellpadding="0" align="center" style="border-collapse: collapse;">
			<tr>
			     <td colspan="11" align="center" bgcolor="lightgrey" class="tdColor">LIST OF ALL PENDING OSD FORMS</td>
			</tr>
	  	    <tr>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FORM NO.</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUEST FOR</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor" ><font size="2">REQUEST TYPE</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">REQUESTED DATE</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR NAME</font></td>
				<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">INITIATOR DESIGNATION</font></td>
				<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY NAME</font></td>
				<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY DESIGNATION</font></td>
				<td width="" align="center"  height="21" bgcolor="grey" class="tdColor"><font size="2">SENT BY REMARKS</font></td>
			</tr>
					<% 
						String cs_datel,dateel=null;
						//DateFormat dateFormat = new SimpleDateFormat("yyyy-dMM-d");
						DateFormat dateFormat1 = new SimpleDateFormat("MM");
						Date datel = new Date();
						cs_datel = dateFormat.format(datel);
						String form_namel=null,form_nol=null,initiatorl=null,initiatorDesgl=null,forBranchl=null,SentByl=null,SentByDesgl=null,SentByRemarksl=null;
						String requestOptionl=null,full_namel=null;
						int kl=0;
						int flagl=0;
						Connection cn02l = null,cn9l=null;
						Statement st02l = null,st9l=null,st02l1=null; 
						ResultSet rs02l = null,rs9l=null,rs02l1=null;
						try 
						  {
						  cn02l = con.getConnection2();
						  st02l=cn02l.createStatement();
						  st02l1=cn02l.createStatement();
				   	      rs02l = st02l.executeQuery("SELECT form_name,form1_no,i_name,i_desg,branch,Approval_empp,Approval_desgg,Approval_remarks, "+
				   	    		                     "DATE_FORMAT(f_date,'%d-%m-%Y'),requestOption,full_name,Approval_f_date as detu FROM form1_it_clearance "+
			        		                         " where  f_date>'2020-01-01'  ");
				   	      int p=0;
					    while(rs02l.next())
						    {
						    kl++;
						   
						    flagl=1;
						    form_nol ="";
						    form_namel = rs02l.getString(1);
						    form_nol = rs02l.getString(2);
						    rs02l1 = st02l1.executeQuery("SELECT status,presence from form1_it_clearance_item where form1_no='"+form_nol+"' and status='Pending' and presence='now' and desg!='none'");
					        if(rs02l1.next())
							    {
					        	 p++;
								form_nol = rs02l.getString(2);
								initiatorl = rs02l.getString(3);
								initiatorDesgl = rs02l.getString(4);
								forBranchl = rs02l.getString(5);
								SentByl = rs02l.getString(6);
								SentByDesgl = rs02l.getString(7);
								SentByRemarksl = rs02l.getString(8);
								dateel = rs02l.getString(9);
								requestOptionl = rs02l.getString(10);
								full_namel = rs02l.getString(11);
						    %>
						     <tr><input type="hidden" name="<%=kl%>" id="<%=kl%>" value="<%=form_nol%>" />
			                 <td width="150px" align="center"  height="21" ><font size="2"><%=p%></font></td>
		   					 <td width="200px" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="linkPendingView(<%=kl%>);"  title="click for more details"><font size="3"><%=form_nol%></font></a></font> </td> 
		   					 <td width="" align="center"  height="21" ><font size="2"><%=full_namel%></font></td>
		   					 <td width="" align="center"  height="21" ><font size="2"><%=requestOptionl%></font></td>
		   					 <td width="" align="center"  height="21" ><font size="2"><%=dateel%></font></td>
		   					 <td width="" align="center"  height="21" ><font size="2"><%=forBranchl%></font></td>
		   					 <td width="" align="center"  height="21" ><font size="2"><%=initiatorl%></font></td>
		   					 <td width="" align="center"  height="21" ><font size="2"><%=initiatorDesgl%></font></td>
		   					 <td width="" align="center"  height="21" ><font size="2"><%=SentByl%></font></td>
							 <td width="" align="center"  height="21" ><font size="2"><%=SentByDesgl%></font></td>
							 <td><textarea rows="1" cols="15" title="Remarks" readonly="readonly" onclick="this.style.height='200px';this.style.width='200px';" onblur="this.style.height='';this.style.width='140px';"><%=SentByRemarksl%></textarea>
						     </tr>
				             <%}}
					
				%>
				</table>
				
			<%}catch (Exception e) {
		 		 System.out.println(e);
			}
			finally{
				DbUtil.closeDBResources(rs02l,st02l,cn02l);

				}%>
<table width="1111"><tr>
<td>				
<center>
 <font color="red" size="2">
				 <%
				            if(flagl==0){
				            	out.println("...................No Pending FORMS at present.....................");
				            }
				 %></font>
</center>
</td>
</tr>
</table>

<%}


String form_noNExAS=null,empid=null,empname=null,reqBranch=null,iname=null,reqDate=null,reqType=null,userbranch=null;
Connection cnNEX = null;
Statement stNEX = null; 
ResultSet rsNEX = null;
cnNEX = con.getConnection2();
stNEX=cnNEX.createStatement();

String form_noGSNET1=null,empid1=null,empname1=null,reqBranch1=null,iname1=null,reqDate1=null,reqType1=null,userbranch1=null;
int k1=0;
Connection cnNEX1 = null;
Statement stNEX1 = null; 
ResultSet rsNEX1 = null;
cnNEX1 = con.getConnection2();
stNEX1=cnNEX1.createStatement();

%>

















<!-- --------------------------------------------------------------------------------- -->
<br>

<!-- <table align="center" width="1118" cellspacing="1" border="2" style="border-collapse: collapse;">
<tr><td colspan="8" align="center" bgcolor="lightgrey">PENDING REQUEST OF NExAS FORM</td></tr>
<tr>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NO.</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR EMPID</font></td>
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST TYPE</font></td>
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUESTED DATE</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">INITIATOR NAME</font></td>
				
		    	
				</tr> -->
		   <%

			 try 
			    {
				
				//String quer="SELECT DISTINCT form_no FROM form12_nexas_item WHERE ((emp='"+SessionName+"' and desg='"+Sessiondesg+"')|| empid='"+emp_no+"') and status='Pending'  ORDER BY form_no ASC";
				String quer="SELECT fn.form_no,fn.empid,fn.full_name,fn.requestBy,fn.requestOption,fn.req_Branch,DATE_FORMAT(fn.form_date,'%d/%m/%Y'),fn.empBranch FROM form12_nexas fn inner join form12_nexas_item fni on fn.form_no=fni.form_no WHERE fni.status='Pending'  AND ((fni.emp='"+SessionName+"' AND fni.desg='"+Sessiondesg+"')OR(fni.empid='"+emp_no+"'))";
				rsNEX = stNEX.executeQuery(quer);
				while(rsNEX.next())
				    {
					k++;
					form_noNExAS = rsNEX.getString(1);
					empid = rsNEX.getString(2);
					empname = rsNEX.getString(3);
					reqBranch = rsNEX.getString(6);
					iname = rsNEX.getString(4);
					reqDate = rsNEX.getString(7);
				    reqType = rsNEX.getString(5);
				    userbranch = rsNEX.getString(8);
				
				    /* sentByName = rsNEX.getString(7);
				    sentByDesg = rsNEX.getString(5);
				    setByRem = rsNEX.getString(8); */
				
				%>
				<%-- <tr><input type="hidden" name="<%=k%>" value="<%=form_noNExAS%>" />
	                 <td width="" align="center"  height="21" ><font size="2">NExAS User Request</font></td>
   					 <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="linkNExAS(<%=k%>);"  title="click for more details"><font size="2"><%=form_noNExAS%></font></a> </font> </td>
   					 --%>
   					 <%--  <td width="" align="center"  height="21" ><font size="2"><%=empid%></font></td> --%>
 <%--   					 <td width="" align="center"  height="21" ><font size="2"><%=empname%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqType%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqDate%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=userbranch%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=iname%></font></td> 
   					 
   					
   				</tr> --%>
			<%}%>
				
<!-- </table> -->
<!-- <table align="center" width="1118" cellspacing="1" border="2" style="border-collapse: collapse;">
<tr><td colspan="8" align="center" bgcolor="lightgrey">PENDING REQUEST OF GSNET FORM</td></tr>
<tr>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NO.</font></td> -->
				<!-- <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR EMPID</font></td> -->
<!-- 			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST TYPE</font></td>
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUESTED DATE</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">INITIATOR NAME</font></td>
				
		    	
				</tr> -->
		   <%
				
				//String quer="SELECT DISTINCT form_no FROM form12_nexas_item WHERE ((emp='"+SessionName+"' and desg='"+Sessiondesg+"')|| empid='"+emp_no+"') and status='Pending'  ORDER BY form_no ASC";
				String quer1="SELECT fn.form_no,fn.empid,fn.full_name,fn.requestBy,fn.requestOption,fn.req_Branch,DATE_FORMAT(fn.form_date,'%d/%m/%Y'),fn.empBranch FROM form15_gsnet fn inner join form15_gsnet_item fni on fn.form_no=fni.form_no WHERE fni.status='Pending'  AND ((fni.emp='"+SessionName+"' AND fni.desg='"+Sessiondesg+"')OR(fni.empid='"+emp_no+"'))";
				rsNEX1 = stNEX1.executeQuery(quer1);
				while(rsNEX1.next())
				    {
					k++;
					form_noGSNET1 = rsNEX1.getString(1);
					empid1 = rsNEX1.getString(2);
					empname1 = rsNEX1.getString(3);
					reqBranch1 = rsNEX1.getString(6);
					iname1 = rsNEX1.getString(4);
					reqDate1 = rsNEX1.getString(7);
				    reqType1 = rsNEX1.getString(5);
				    userbranch1 = rsNEX1.getString(8);
				
				    /* sentByName = rsNEX.getString(7);
				    sentByDesg = rsNEX.getString(5);
				    setByRem = rsNEX.getString(8); */
				
				%>
				<%-- <tr><input type="hidden" name="<%=k%>" value="<%=form_noGSNET1%>" />
	                 <td width="" align="center"  height="21" ><font size="2">GSNET User Request</font></td>
   					 <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="linkGSNET(<%=k%>);"  title="click for more details"><font size="2"><%=form_noGSNET1%></font></a> </font> </td>
   					 --%><%--  <td width="" align="center"  height="21" ><font size="2"><%=empid%></font></td> --%>
   					 <%-- <td width="" align="center"  height="21" ><font size="2"><%=empname1%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqType1%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqDate1%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=userbranch1%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=iname1%></font></td> 
   					 
   					
   				</tr> --%>
			<%}%>
<!-- 				
</table> -->
<!-- <table align="center" width="1118" cellspacing="1" border="2" style="border-collapse: collapse;">
<tr><td colspan="8" align="center" bgcolor="lightgrey">PENDING REQUEST OF TMS USER REQUEST FORM</td></tr>
<tr>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NO.</font></td> -->
				<!-- <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR EMPID</font></td> -->
			    <!-- <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST TYPE</font></td>
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUESTED DATE</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">INITIATOR NAME</font></td>
				
		    	
				</tr> -->
		   <%
		     String form_notms=null,empidtms=null,empnametms=null,reqBranchtms=null,inametms=null,reqDatetms=null,reqTypetms=null,userbranchtms=null;
			    //int ktms=0;
				 Connection cntms = null;
				Statement sttms = null; 
				ResultSet rstms = null;
				cntms = con.getConnection2();
				sttms=cntms.createStatement();
				
				//String quer="SELECT DISTINCT form_no FROM form12_nexas_item WHERE ((emp='"+SessionName+"' and desg='"+Sessiondesg+"')|| empid='"+emp_no+"') and status='Pending'  ORDER BY form_no ASC";
				String quertms="SELECT fn.form_no,fn.empid,fn.full_name,fn.requestBy,fn.requestOption,fn.req_Branch,DATE_FORMAT(fn.form_date,'%d/%m/%Y'),fn.empBranch FROM form16_tmsuser fn inner join form16_tmsuser_item fni on fn.form_no=fni.form_no WHERE fni.status='Pending'  AND ((fni.emp='"+SessionName+"' AND fni.desg='"+Sessiondesg+"')OR(fni.empid='"+emp_no+"'))";
				rstms = sttms.executeQuery(quertms);
				while(rstms.next())
				    {
					k++;
					form_notms = rstms.getString(1);
					empidtms = rstms.getString(2);
					empnametms = rstms.getString(3);
					reqBranchtms = rstms.getString(6);
					inametms= rstms.getString(4);
					reqDatetms = rstms.getString(7);
				    reqTypetms = rstms.getString(5);
				    userbranchtms = rstms.getString(8);
				
				    /* sentByName = rsNEX.getString(7);
				    sentByDesg = rsNEX.getString(5);
				    setByRem = rsNEX.getString(8); */
				
				%>
				<%-- <tr><input type="hidden" name="<%=k%>" value="<%=form_notms%>" />
	                 <td width="" align="center"  height="21" ><font size="2">TMS User Request</font></td>
   					 <td width="" align=center  ><font color="white" size="2" ><a href="#" onclick="linkTMS(<%=k%>);"  title="click for more details"><font size="2"><%=form_notms%></font></a> </font> </td>
   					 --%>
   					 <%--  <td width="" align="center"  height="21" ><font size="2"><%=empid%></font></td> --%>
  <%--  					 <td width="" align="center"  height="21" ><font size="2"><%=empnametms%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqTypetms%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqDatetms%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=userbranchtms%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=inametms%></font></td> 
   					 
   					
   				</tr> --%>
			<%}%>
				
<!-- </table> -->

<!-- //////////////////////////////////////////////////////// CCD Report Start ////////////////////////////////////////////////// -->
<table align="center" width="1118" cellspacing="1" border="2" style="border-collapse: collapse;">
<tr><td colspan="8" align="center" bgcolor="lightgrey">PENDING REQUEST OF CCD REPORT FORM</td></tr>
<tr>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NO.</font></td>
				<!-- <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR EMPID</font></td> -->
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST TYPE</font></td>
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUESTED DATE</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">INITIATOR NAME</font></td>
				
		    	
				</tr>
		   <%
		     String formname=null,form_noccd=null,empidccd=null,empnameccd=null,reqBranchccd=null,inameccd=null,reqDateccd=null,reqTypeccd=null,userbranchccd=null;
				Connection cnccd = null;
				Statement stccd = null; 
				ResultSet rsccd = null;
				cnccd = con.getConnection2();
				stccd=cnccd.createStatement();
				
				//String quer="SELECT DISTINCT form_no FROM form12_nexas_item WHERE ((emp='"+SessionName+"' and desg='"+Sessiondesg+"')|| empid='"+emp_no+"') and status='Pending'  ORDER BY form_no ASC";
				String querccd="SELECT fn.form_no,fn.empid,fn.full_name,fn.requestBy,fn.requestOption,fn.req_Branch,DATE_FORMAT(fn.form_date,'%d/%m/%Y'),fn.empBranch,fn.form_name FROM form13_ccdreport fn inner join form13_ccdreport_item fni on fn.form_no=fni.form_no WHERE fni.status='Pending'  AND ((fni.emp='"+SessionName+"' AND fni.desg='"+Sessiondesg+"')OR(fni.empid='"+emp_no+"')) " +
						"UNION SELECT fn1.form10_no,fn1.emp_code,fn1.full_name,fn1.requestBy,fn1.requestOption,fn1.i_b_no,DATE_FORMAT(fn1.f_date,'%d/%m/%Y'),fn1.branch,fn1.form_name FROM form14_ccdregistration fn1 inner join form14_ccdregistration_item fni1 on fn1.form10_no=fni1.form10_no WHERE fni1.status='Pending'  AND ((fni1.emp='"+SessionName+"' AND fni1.desg='"+Sessiondesg+"')OR(fni1.empid='"+emp_no+"'))";
				rsccd= stccd.executeQuery(querccd);
				while(rsccd.next())
				    {
					k++;
					form_noccd = rsccd.getString(1);
					empidccd = rsccd.getString(2);
					empnameccd = rsccd.getString(3);
					inameccd = rsccd.getString(4);
					reqDateccd = rsccd.getString(7);
				    reqTypeccd = rsccd.getString(5);
				    userbranchccd = rsccd.getString(8);
				    reqBranchccd = rsccd.getString(6);
				    formname = rsccd.getString(9);
				   if(formname==null)formname="CCDReport";
				
				%>
				<tr><input type="hidden" name="<%=k%>" value="<%=form_noccd%>" />
	                 <td width="150px" align="center"  height="21" ><font size="2"><%=formname%></font></td>
   					 <td width="200px" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="linkCCD(<%=k%>,'<%=formname%>');"  title="click for more details"><font size="3"><%=form_noccd%></font></a> </font> </td>
   					<%--  <td width="" align="center"  height="21" ><font size="2"><%=empid%></font></td> --%>
   					 <td width="" align="center"  height="21" ><font size="2"><%=empnameccd%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqTypeccd%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=reqDateccd%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=userbranchccd%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=inameccd%></font></td> 
   					 
   					
   				</tr>
			<%}%>
				
</table>
<br>

<!-- ////////////////////////////////////////////////////// CCD REport End /////////////////////////////////////////////////////// -->





<!-- ////////////////////////////////////// GatePass form///////////////////////////////////////// -->


<table align="center" width="1118" cellspacing="1" border="2" style="border-collapse: collapse;">
<tr><td colspan="8" align="center" bgcolor="lightgrey">PENDING REQUEST OF GATEPASS FORM</td></tr>
             <tr>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NO.</font></td>
				<!-- <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR EMPID</font></td> -->
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST FOR</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUEST TYPE</font></td>
			    <td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUESTED DATE</font></td>
			    <td width="" align="center"  height="21" bgcolor="grey"><font size="2">FOR BRANCH</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">INITIATOR NAME</font></td>
				</tr>

                <% String gateformno="",createdBy="",createdDate="",cityName="",passType="";
			    cn9 = con.getConnection2();
                st9=cn9.createStatement();
                rs9 = st9.executeQuery("SELECT DISTINCT formno,createdBy,createdDate,cityName,passType FROM gatepassform WHERE ((ganame='"+SessionName+"' and gadesg='"+Sessiondesg+"')|| gaempid='"+emp_no+"') and approvalStatus='Pending' AND formno LIKE 'NEIN/GATEPASS%' ORDER BY formno DESC");
                while(rs9.next())
                    { k++;
		            gateformno=rs9.getString(1);
		            createdBy=rs9.getString(2);
		            createdDate=rs9.getString(3);
		            cityName=rs9.getString(4);
		            passType=rs9.getString(5);
		            //System.out.println("gate pass Form no :"+gateformno);
		            %> 
		          <tr><input type="hidden" name="<%=k%>" value="<%=gateformno%>" />
	                 <td width="150px" align="center"  height="21" ><font size="2">Gatepass Form</font></td>
   					 <td width="200px" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="linkGatePass(<%=k%>);"  title="click for more details"><font size="3"><%=gateformno%></font></a> </font> </td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=passType %></font></td>
   					 <td width="" align="center"  height="21" ><font size="2">New</font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=createdDate%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=cityName%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=createdBy%></font></td> 
   					</tr>
   					<%} %>

</table>

<!-- ////////////////////////////////////// GatePass form close///////////////////////////////////////// -->








<%}catch(Exception e){}%>



<br>







<%
//System.out.println("Sessionb_no ******************************************* : "+Sessionb_no);
//System.out.println("Sessiondesg  : "+Sessiondesg);

//<%if((ITbno.equals(session.getAttribute("b_no")) && ITdesg.equals(session.getAttribute("desg")))){ 
if((Sessionb_no!=null && Sessionb_no.equals("90")) && (Sessiondesg!=null && Sessiondesg.equals("SR.MANAGER IT"))){
//if((Sessionb_no!="null" && Sessionb_no.equals("90")) && ((Sessiondesg!="null" && Sessiondesg.equals("SR.MANAGER IT")))){ %>
<table align="center" width="1118" cellspacing="1" border="2" style="border-collapse: collapse;">
<tr><td colspan="7" align="center" bgcolor="grey">DASH BOARD</td></tr>
<tr><td colspan="7" align="center" bgcolor="lightgrey">REMINDERS OF PENDING REQUEST FOR HO-SR.MANAGER IT  </td></tr>
<tr>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NO.</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">FORM NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">INITIATOR NAME</font></td>
				<td  width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUESTED DATE</font></td>
					<td width="" align="center"  height="21" bgcolor="grey"><font size="2">FOR BRANCH</font></td>
					<td width="" align="center"  height="21" bgcolor="grey"><font size="2">REQUIRED FOR</font></td>
					
					
				</tr>
				<%
				String form_no1=null,initiatorr=null,forNewEmpName=null,forNewEmpBranch=null,form_name1=null,dateee=null;
				int l=0;
				int flag2=0;
				 try 
				  
				  {
				Connection cn022 = null;
				Statement st022 = null; 
				ResultSet rs022 = null;
				cn022 = con.getConnection2();
				st022=cn022.createStatement();
				rs022 = st022.executeQuery("SELECT form1_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form1_it_clearance WHERE "+
						"it1aa='Yes' OR it2bb='Yes' OR it3cc='Yes' OR it4dd='Yes' OR it5ee='Yes' OR "+
						"it6ff='Yes' OR it7gg='Yes' OR it8hh='Yes' OR it9ii='Yes' OR it10jj='Yes' "+
						"AND Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT' AND Approval_status  <> 'NOT APPROVED'"+
				/*   "UNION SELECT form2_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form2_domain WHERE reminder='Yes' AND Approval_emp='Prasanna Kumar' AND Approval_desg='SR.MANAGER IT' OR Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT'"+
				  
				  "UNION SELECT form3_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form3_lotus WHERE reminder='Yes' AND Approval_emp='Prasanna Kumar' AND Approval_desg='SR.MANAGER IT' OR Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT'"+
				  "UNION SELECT form4_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form4_accesscard WHERE reminder='Yes' AND Approval_emp='Prasanna Kumar' AND Approval_desg='SR.MANAGER IT' OR Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT'"+
				  "UNION SELECT form5_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form5_folder WHERE reminder='Yes' AND Approval_emp='Prasanna Kumar' AND Approval_desg='SR.MANAGER IT' OR Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT'"+
				  "UNION SELECT form6_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form6_internet WHERE reminder='Yes' AND Approval_emp='Prasanna Kumar' AND Approval_desg='SR.MANAGER IT' OR Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT'"+
				  "UNION SELECT form7_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form7_newins WHERE reminder='Yes' AND Approval_emp='Prasanna Kumar' AND Approval_desg='SR.MANAGER IT' OR Approval_empp='Prasanna Kumar' AND Approval_desgg='SR.MANAGER IT'"); */
				  "UNION SELECT form11_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form11_dsc WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form2_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form2_domain WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form11_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form11_dsc WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form3_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form3_lotus WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form8_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form8_lotus_traveler WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form4_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form4_accesscard WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form5_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form5_folder WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form6_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form6_internet WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED' "+
				  "UNION SELECT form7_no,i_name,branch,full_name,form_name,DATE_FORMAT(Approval_f_date,'%d/%m/%Y') FROM form7_newins WHERE reminder='Yes' AND Approval_status  <> 'NOT APPROVED'");
				while(rs022.next())
				{k++;
				  flag2=1;
					form_no1 = rs022.getString(1);
					initiatorr = rs022.getString(2);
					
					forNewEmpBranch = rs022.getString(3);
					forNewEmpName = rs022.getString(4);
					form_name1 = rs022.getString(5);
					dateee = rs022.getString(6);
				//	String 2 = rs022.getString("Yes");
				%>
				<tr><input type="hidden" name="<%=k%>" value="<%=form_no1%>" />
	
   					 <td width="" align="center" nowrap><font color="white" size="2" ><a href="#" onclick="linkITAdmin(<%=k%>);"  title="click for more details"><font size="3"><%=form_no1%></font></a>
   					 
   					 
   					 
   					 </font> </td>
   					 <td width="150px" align="center"  height="21" ><font size="2"><%=form_name1%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=initiatorr%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=dateee%></font></td>
   					 <td width="" align="center"  height="21" ><font size="2"><%=forNewEmpBranch%></font></td> 
   					 <td width="" align="center"  height="21" ><font size="2"><%=forNewEmpName%></font></td>
   					 				</tr>
				<%}%>
				
</table>
<%}catch(Exception e){}%>


<table width="1111"><tr>
<td>				
<center>
<%
if(flag2==0){
	out.println("...................No Pending reminder at present.....................");
}
}

%>
</center></td></tr></table>




<table align="center" cellspacing="0" cellpadding="0" border="0" width="1118"> 
<tr> 
<td width="1000" align="left"> 
<a href="HOME.jsp"><img src="home12.jpg" border="0" height="35" width="35"></a><address><font size="2">HOME</font></address> 
</td> 
 
<td width="115" align="right"> 
<a href="adminlink.jsp?msg = 1"><img src="bakk.png" border="0" height="35" width="35"></a><address><font size="2">BACK</font></address> 
</td> 
</tr> 
</table> 



<table width="1118" align="center" border="0" cellspacing="0" cellpadding="0">
 <tr align="center"> <td class="greenLine" style="font-style: italic;"></td></tr>
<tr align="center"><td class="blueLine" style="font-style: italic;"></td></tr>
</table> 
</form>
</div>




</body>
</html>