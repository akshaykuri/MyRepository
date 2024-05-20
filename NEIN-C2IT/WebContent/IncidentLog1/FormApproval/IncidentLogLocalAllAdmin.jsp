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
<%@ include file="../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	  <script language="javascript"   type="text/javascript" src="../../js/formApprovalColorChange.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->

 <script language="javascript" type="text/javascript">
	 function checkAddress(str){
         
         
		   var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
         if (re.test(str)) return false;
         return true;
       }
 function checkNumber(string)
     {
     var numericExpression = /^[0-9]+$/;
     if(string.match(numericExpression)) {
      return true;
     } else {
     return false;
        }
     }
   function validate()
   {//txtmail_msg
   var d1 = document.form.txtmail_msg;
   var d2 = document.form.mail1;
   var ff=document.form.aabbcc;
  if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	 {
       alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
       document.getElementsByName("mmdradio")[0].focus();
       return false;
    } 
  if (document.getElementsByName("mmdradio")[0].checked)
	 {
	  if (!document.getElementsByName("higherAuthority")[0].checked && !document.getElementsByName("higherAuthority")[1].checked) 
	  		{  
		    alert("Select Radio Button \n \n For selecting Higher Authority Or Direct approval of Approval Routine \n \n  Else Can not Proceed Further..");
		    document.getElementsByName("higherAuthority")[0].focus();
      		return false;
	  		}
	  }
  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[0].checked && ((d2.value==null)||(d2.value=="NULL")||(d2.value=="")))
	 {
	        alert("Select Desgination and Mail ID ..");
	        d2.focus();
   		    return false;
	  }
 /*  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[1].checked && !document.getElementsByName("Itradio")[0].checked && !document.getElementsByName("Itradio")[1].checked)
	 {
	        alert("Select IT / NON IT");
		    document.getElementsByName("Itradio")[0].focus();
		    return false;
	  } */
  if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	{
	 alert("Enter Remarks !");
	         d1.focus();
	 return false;
	 }
else
return true;
   }
</script>
<script language="javascript" type="text/javascript">
function popitup(url) {
	//newwindow=window.open(url,'name','height=300,width=150,scrollbars=1');
	//if (window.focus) {newwindow.focus()}
	//return false;
		newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}
function closeWin() {
    //myWindow.close();   // Closes the new window
    window.close();
}
</script>
<script language="javascript">
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}</script>
<script type="text/javascript">
function OtherAdmin()
{
	
document.form.action="DomainUserAdminBack.jsp";
document.form.method="post";
document.form.submit();
}
function ITManager()
{
document.form.action="DomainUserAdminPrasannaBack.jsp";
document.form.method="post";
document.form.submit();
}
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
	
	else{
	     alert("Select Direct Approved Or Higher Authority");
		 document.getElementById('idApproved').style.display="table-row";
	   	 document.getElementById('idApproved').style.visibility="visible";
	 	 document.getElementById('idPwd').style.display="table-row";
		 document.getElementById('idPwd').style.visibility="visible";
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
 document.getElementById('idApproved').style.hidden="table-row";
 document.getElementById('idApproved').style.visibility="hidden";
 document.getElementById('idApproved1').style.hidden="table-row";
 document.getElementById('idApproved1').style.visibility="hidden";
 document.getElementById('idApprovedd').style.hidden="table-row";
 document.getElementById('idApprovedd').style.visibility="hidden";
 
 return true;
 
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
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("adminlink.jsp?msg="+msg);
}
%>
<%-- <script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           alert(msg);
		}
</script> --%>
	<script language="javascript" type="text/javascript">     
     var xmlHttp       
      var xmlHttp      
      function showEmp(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="../../../../selEmpForms.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = stateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function stateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                 document.getElementById("emp").innerHTML=xmlHttp.responseText    
                                                      } 
                                                              
            }  
            
            
     function Mail(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="../../../../selectMailId.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText   
                                                      } 
                                                              
            } 
            
/*  
function popupform(myform, windowname)
{
if (! window.focus)return true;
window.open('', windowname, 'height=200,width=400,scrollbars=yes');
myform.target=windowname;
return true;
}
 */

            
                </script> 
  <script language="javascript" type="text/javascript"> 
function resendMail(mail,form1_no,empD)
  		 {
	 alert("Working"); 
	 alert("mail :"+mail);
	alert("form1_no :"+form1_no);
	alert("empD :"+empD);
  		if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){
           alet("Creating html http object");    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){    
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="../../../ResendMailDomain?mail="+mail+","+form1_no+","+empD+"";  
                          // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                           //url +="?mail="+mailId;   
                              xmlHttp.onreadystatechange = mailStateChange;  
                             alert("before sending mail");
                                  xmlHttp.open("POST", url, true); 
                                  
                                  alert("MAIL SENT");
                                     xmlHttp.send(null);
                                     
                                     alert("MAIL RESENT");
                                       } 
		function mailStateChange()
		{ 
 		//alert("mail state change");    
 		  if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
  		 {   
    	  // document.getElementById("idmailStatus").innerHTML=xmlHttp.responseText
   			 //  alert("xmlHttp.responseText      :"+xmlHttp.responseText);
   			   document.getElementById("idmailStatus").value=xmlHttp.responseText;
   		 } 
  	    }                               
</script>
</head>
<body onload="checkForm()">
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="DomainUserAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null;
String req=null;
String empD=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");


%>

<%
 String no=request.getParameter("s_no");
System.out.println("wat is the getting value  :"+no); 
String req2 = request.getParameter(no);
System.out.println("wat is the getting value 2 :"+req2); 

String req = request.getParameter("req");
System.out.println("REq **************************************************************************: "+req);
/* String values[] = req.split(" -");
System.out.println("val 1 : "+values[0].replaceAll(" ", "")); */
//System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
String SystemAdminName=null,Location=null,CreatedDate=null,FromDate=null,ToDate=null,form_no9=null,ITReview="",HRReview="";
cn100 = con.getConnection2();
st100=cn100.createStatement();
//rs100 = st100.executeQuery("select * from form9_incident_log WHERE form9_no='"+values[0]+"' ");
rs100 = st100.executeQuery("select * from form9_incident_log WHERE form9_no='"+req2+"' "); 
while(rs100.next())
{
	form_no9 = rs100.getString("form9_no");   
	SystemAdminName = rs100.getString("SessionName");
	Location = rs100.getString("SessionCity");
	CreatedDate = rs100.getString("Created_date");
	FromDate = rs100.getString("from_date");
	ToDate = rs100.getString("to_date");
	ITReview = rs100.getString("ITViewStatus");
	HRReview = rs100.getString("HRViewStatus");
	if(ITReview==null && HRReview==null){ITReview="";HRReview="";}
}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="101%"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td height="15"><center><font size="3">
		<b><label>
		CCTV SURVEILLANCE & SECURITY SYSTEMS</label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=Name%>" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="hidden" name="i_city" value="<%=city%>" />
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form1_no" value="<%=form_no9%>" />
		<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
		</td>
		
	</tr>
</table>
<table width="100%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td>
<!-- <br />
<br />
<center>
<label><font color="black"><u><b>IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</b></u></font></label> <br />


</center>
	 <br /> -->
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>

<%--



cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 


--%>	 
		
<table width="900">

<tr>
<td bgcolor="grey">Form No. :</td>
<td bgcolor="grey"><font size="2" color="black"><%=req2%></font></td>
<td>System Admin :</td>

<td ><font size="2" color="black"><%=SystemAdminName%></font></td>

</tr>

<tr>
<td >Created date :</td>
<td ><font size="2" color="black"><%=CreatedDate%></font></td>
<td >Location :</td>
<td ><font size="2" color="black"><%=Location%></font></td>

</tr>
<tr>
<td >From Date  :</td>
<td ><font size="2" color="black" ><%=FromDate%></font></td>

<td >To Date :</td>
<td ><font size="2" color="black"><%=ToDate%></font></td>

</tr>
</table>
<br>


<br />
<table id="tableData" name="tableData" width="100%" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Date</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Time</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Viewed By</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Incident status</b></font></td>
		<td colspan="2" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Remarks</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>CCTV footage Reviewed By IT Dept</b></font></td>
		<td bgcolor="grey" width="10" align=center><font size="2" color="black"><b>CCTV footage reviewed by GA Dept</b></font></td>
		
	  </tr>
	  <%
	  
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	   String I_date,I_time,I_viewedBy,Incident_Reported,I_Remarks,Created_Date,revbyIT=null,revbyGA=null;
	  rs1 = st1.executeQuery("select form9_no,I_date,I_time,I_viewedBy,Incident_Reported,I_Remarks,Created_Date,viewedByIT,viewedByGA from  form9_incident_item WHERE form9_no='"+req2+"'  ORDER BY id ASC"); 
	  while(rs1.next())
	  {
		  I_date = rs1.getString("I_date");
		  I_time = rs1.getString("I_time");
		  I_viewedBy = rs1.getString("I_viewedBy");
		  Incident_Reported = rs1.getString("Incident_Reported");
		  I_Remarks = rs1.getString("I_Remarks");
		  Created_Date = rs1.getString("Created_Date");
		  revbyIT= rs1.getString("viewedByIT");
	  	  revbyGA = rs1.getString("viewedByGA");
	  	  if(revbyIT==null)revbyIT="";
	  	  if(revbyGA==null)revbyGA="";
		 %>
	   <tr>
	   
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=I_date%></font>
		</td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=I_time%></font></td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=I_viewedBy%></font></td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=Incident_Reported%></font></td>
		<td colspan="2" bgcolor="white" width="100" align="center"><font size="2" color="black"><%=I_Remarks%></font></td>
	   <td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=revbyIT%></font></td>
		<td colspan="2" bgcolor="white" width="100" align="center"><font size="2" color="black"><%=revbyGA%></font></td>
	
	  </tr>
	  
	 <%--  <tr>
	 	<td colspan="2" bgcolor="grey" width="100" align="center"><font size="2" color="black">CCTV footage reviewed by IT Dept.:</font></td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=ITReview%></font></td>
		<td colspan="2"bgcolor="grey" width="100" align="center"><font size="2" color="black">CCTV footage reviewed by HR/Admin Dept.:</font></td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=HRReview%></font></td>
	 </tr> --%>
	 
	  <%} %>
	  <tr>
	    <td colspan="8">
   <b>Note :</b> For operational purpose and in accordance with the CCTV Policy, Procedure & Monitoring Policy(*Refer IT Policy), only designated IT & GA dept staff shall have the primary
                access to CCTV Recording. Regular monitoring i.e daily and weekly once (Which is mandatory as per AEO compliance) need to be done by IT & GA Dept i.e randomly select any office/warehouse
                at their respective location and randomly select any camera and check the recording and if any observation or incident need to be recorded/updated in Incident log report via C2IT portal.
                <br><b><u>Mandatory Compliance:</u></b><br>
                1st level :- CCTV footage review will be done by IT Dept on daily or weekly.
                <br>2nd level :- CCTV footage review will be done by GA Dept on daily or weekly.
                <br>3rd level :- CCTV footage review will be done by BM/GM or above Dept. will report to BM/GM immediately on any Observation Or Incident report.
                <br>4th level :- CCTV footage review will be done by HO(IT).
</td>
	 
	 </tr>
	  
</table>

<br>


<br />
<table id="tableData" name="tableData" width="100%" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
		
	  </tr>
	  <%
	  
	  cn2 = con.getConnection2();
	  st2=cn2.createStatement();
	  
	  String desg,emp,status,remarks,f_date;
	  rs2 = st2.executeQuery("select * FROM form9_incident_log_item WHERE form9_no='"+req2+"' ORDER BY id ASC"); 
	  while(rs2.next())
	  {
		  desg= rs2.getString("desg");
		  emp=rs2.getString("emp");
		  status=rs2.getString("status");
		  remarks=rs2.getString("remarks");
		  f_date =rs2.getString("f_date");
		 %>
	   <tr>
	   
		<td bgcolor="white" width="100"><font size="2" color="black"><%=emp%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=desg%></font></td>
				<td bgcolor="white" width="100" class="fonter"><%=status%></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarks%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_date%></font></td>
	
	  </tr>
	  <%} %>
</table>


 
</br>
                                                                
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1">&nbsp;&nbsp;<input size="2" type="button"  value="CLOSE" onclick="return closeWin()"/> 
     <!-- <a href="javascript:history.back()">CLOSE</a> -->
     </td>
  <td align="right" id="hiderow">

<SCRIPT Language="Javascript">  
var NS = (navigator.appName == "Eclipse");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input id="hiderow" type="button" value="PRINT" style="background-color:white;font-weight:bold;color:black;" height="60" width="55" name="Print" onClick="printit()" </form>');        
} 
</script>
</td>
     <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	</tr>
 
</table> 	

</center>
	<br /><br /><br />
	
</div>
<div id="dialog" class="web_dialog">
   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      </table>
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT(HO)</label>
<br />

</form>	

</body>

</html>