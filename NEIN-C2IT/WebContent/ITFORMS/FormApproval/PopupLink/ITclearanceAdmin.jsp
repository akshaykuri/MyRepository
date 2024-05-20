<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.util.ResourceBundle"%>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.io.*" %>
<%@page import = "CON2.Connection2" %> 
<%@page import = "CON2.CurrentTime" %>
<%@include file= "../../../banner.jsp" %>
<%@include file= "../../../../Session/SuperAdminSessionInSide2.jsp"%>
<jsp:useBean id= "con" class="CON2.Connection2" />
<jsp:useBean id= "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id= "c2ITUtil1" class="CON2.C2ITUtils" />
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Check List</title>
<link rel='stylesheet' type='text/css' href='../../../css/style2.css' />
<link rel='stylesheet' type='text/css' href='../../../css/homePage.css' />
<link rel="shortcut icon" type="image/x-icon" href="../../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../../../css/Calender.css" title="style" />
<link rel="stylesheet" type="text/css" href="../../../css/FormsHelp.css" title="style" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
<script language="javascript"   type="text/javascript" src="../../../js/FormsHelp.js"></script>
<script language="javascript"   type="text/javascript" src="../../../js/formApprovalColorChange.js"></script>
<script language="javascript"   type="text/javascript" src="../../../js/onSubmitWait.js"></script>
<script language="javascript"   type="text/javascript" src="../../js/jquery.1.11.1.min.js" ></script>
<script language="javascript"   type="text/javascript" src="../../../js/Calendar.js"></script>
<script language="javascript" type="text/javascript"> 

function resendMail(email_id,form1_no,mail,name)
{
if(typeof XMLHttpRequest != "undefined"){    
xmlHttp= new XMLHttpRequest();    
}else if (window.ActiveXObject){
xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
}if (xmlHttp==null){    
alert("Browser does not support XMLHTTP Request");    
return;     
}       
var url="../../../ResendMailItClearance?mail="+email_id+","+form1_no+","+mail+","+name+"";  
xmlHttp.onreadystatechange = mailStateChange;  
xmlHttp.open("POST", url, true); 
xmlHttp.send(null);
} 

function mailStateChange()
{ 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
{   
document.getElementById("idmailStatus").value=xmlHttp.responseText;
} 
}                               

</script>

<script type="text/javascript">
function cancel()
{
close();
}
</script>

<script language="javascript"   type="text/javascript">
function onloadCheck()
{
var frm=document.forms[0],flds=[frm['idaa'],frm['idaa2']];
for (var z0=0;z0<flds[0].length;z0++)
{
if(flds[0][z0].value=="Initiator"||flds[0][z0].value=="Approved")
{
flds[1][z0].style.display = 'none';
}
}
}
</script>

 <script language="javascript" type="text/javascript">
function checkAddress(str)
{
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
 
function myFunctionVal()
{
var a =document.form.a_model;
var ar = document.form.r_model;
var b = document.form.a_model_info;
var br = document.form.r_model_info;
var c = document.form.a_datacard;
var cr = document.form.r_datacard;
var d = document.form.a_email;
var dr = document.form.r_email;
var g = document.form.a_mobile_model;
var gr = document.form.r_mobile_model;
var h = document.form.a_mobile_no;
var hr = document.form.r_mobile_no;
var hcomp = document.form.a_compmobile_no;
var hrcomp = document.form.r_compmobile_no;
var f = document.form.a_domain;
var fr = document.form.r_domain;
var i = document.form.a_access_card
var ir = document.form.r_access_card;
var e = document.form.a_newins;
var er = document.form.r_newins;
var j = document.form.a_drive;
var jr = document.form.r_drive;
var k = document.form.a_other_asset;
var kr = document.form.r_other_asset;

var sa = document.form.a_shared_card
var sr = document.form.r_shared_card;
var ina= document.form.a_internet;
var inr= document.form.r_internet;
var nexa = document.form.a_nexas;
var nexr = document.form.r_nexas;
var ga = document.form.a_gsnet;
var gr = document.form.r_gsnet;
var inta = document.form.a_internal;
var intr = document.form.r_internal;
var dsa= document.form.a_dsc;
var dsr= document.form.r_dsc;
var va = document.form.a_vpn;
var vr = document.form.r_vpn;
var gla= document.form.a_glow;
var glr= document.form.r_glow;
var aira = document.form.airLin;
var airr = document.form.rairLin;

var asop = document.form.sophos;
var rsop = document.form.rsophos;
var afor = document.form.forti;
var rfor = document.form.rforti;

var levelno = document.form.levelno1; 
if (levelno.value!="2")
{
a.readOnly=true;ar.readOnly=true;b.readOnly=true;br.readOnly=true;
c.readOnly=true;cr.readOnly=true;d.readOnly=true;dr.readOnly=true;
e.readOnly=true;er.readOnly=true;f.readOnly=true;fr.readOnly=true;
g.readOnly=true;gr.readOnly=true;h.readOnly=true;hr.readOnly=true;
i.readOnly=true;ir.readOnly=true;j.readOnly=true;jr.readOnly=true;
k.readOnly=true;kr.readOnly=true;sa.readOnly=true;sr.readOnly=true;
ina.readOnly=true;inr.readOnly=true;nexa.readOnly=true;nexr.readOnly=true;
ga.readOnly=true;gr.readOnly=true;inta.readOnly=true;intr.readOnly=true;
dsa.readOnly=true;dsr.readOnly=true;va.readOnly=true;vr.readOnly=true;
gla.readOnly=true;glr.readOnly=true;aira.readOnly=true;airr.readOnly=true;
asop.readOnly=true;rsop.readOnly=true;afor.readOnly=true;rfor.readOnly=true;
hcomp.readOnly=true;hrcomp.readOnly=true;
return false;
}
else if(levelno.value=="2")
{
a.readOnly=false;ar.readOnly=false;b.readOnly=false;br.readOnly=false;
c.readOnly=false;cr.readOnly=false;d.readOnly=false;dr.readOnly=false;
e.readOnly=false;er.readOnly=false;f.readOnly=false;fr.readOnly=false;
g.readOnly=false;gr.readOnly=false;h.readOnly=false;hr.readOnly=false;
i.readOnly=false;ir.readOnly=false;j.readOnly=false;jr.readOnly=false;
k.readOnly=false;kr.readOnly=false;sa.readOnly=false;sr.readOnly=false;
ina.readOnly=false;inr.readOnly=false;nexa.readOnly=false;nexr.readOnly=false;
ga.readOnly=false;gr.readOnly=false;inta.readOnly=false;intr.readOnly=false;
dsa.readOnly=false;dsr.readOnly=false;va.readOnly=false;vr.readOnly=false;
gla.readOnly=false;glr.readOnly=false;aira.readOnly=false;airr.readOnly=false;
asop.readOnly=false;rsop.readOnly=false;afor.readOnly=false;rfor.readOnly=false;
hcomp.readOnly=false;hrcomp.readOnly=false;
return false;
}
else{
return true;
}
}
   
function myFunctionRO()
{
var du =document.form.duty;
var ke = document.form.keyJob;
var no = document.form.noticePeriod;

var levelno2 = document.form.levelno2;
if (levelno2.value!="0")
{
du.readOnly = true;
ke.readOnly = true;
no.readOnly = true;
return false;
}
else if (levelno2.value=="0")
{
du.readOnly = false;
ke.readOnly = false;
no.readOnly = false;
return false;
}
else{
return true;
}
}
        
function ITmangerfields()
{
var a =document.form.it1a;
var ar = document.form.it2b;
var b = document.form.it3c;
var br = document.form.it4d;
var c = document.form.it5e;
var cr = document.form. it6f;
var d = document.form.it7g;
var dr = document.form.it8h;
var e = document.form.it9i;
var er = document.form.it10j;
var er1 = document.form.it10jnexas;
var er11 = document.form.it10jjnexas;
var dcomp = document.form.it11k;
var l = document.form.it12l;
var m = document.form.it13m;
var n = document.form.it14n;
var o = document.form.it15o;
var p = document.form.it16p;
var q = document.form.it17q;
var r = document.form.it18r;
var s = document.form.it19s;
var rair = document.form.itrairLin;

var rsop = document.form.itrsophos;
var rfor = document.form.itrforti;
       
var levelno = document.form.levelno1; 
if (levelno.value!="5")
{
a.readOnly=true;ar.readOnly=true;b.readOnly=true;br.readOnly=true;
c.readOnly=true;cr.readOnly=true;d.readOnly=true;dr.readOnly=true;
e.readOnly=true;er.readOnly=true;er1.readOnly=true;er11.readOnly=true;
l.readOnly=true;m.readOnly=true;n.readOnly=true;o.readOnly=true;
p.readOnly=true;q.readOnly=true;r.readOnly=true;s.readOnly=true;
rair.readOnly=true;dcomp.readOnly=true;rsop.readOnly=true;rfor.readOnly=true;
return false;
}
else if(levelno.value=="5")
{
a.readOnly=false;ar.readOnly=false;b.readOnly=false;br.readOnly=false;
c.readOnly=false;cr.readOnly=false;d.readOnly=false;dr.readOnly=false;
e.readOnly=false;er.readOnly=false;er1.readOnly=false;er11.readOnly=false;
l.readOnly=false;m.readOnly=false;n.readOnly=false;o.readOnly=false;
p.readOnly=false;q.readOnly=false;r.readOnly=false;s.readOnly=false;
rair.readOnly=false;dcomp.readOnly=false;rsop.readOnly=false;rfor.readOnly=false;
return false;
}
else{
return true;
}
}

function myFunctionAccounts()
{
var a =document.form.a_document_ac;
var ar = document.form.r_document_ac;
var levelno = document.form.levelno1; 
if (levelno.value!="1")
{
a.readOnly = true;ar.readOnly = true;
return false;
}
else if (levelno.value=="1")
{
a.readOnly = false;ar.readOnly = false;
return false;
}
else{
	return true;
}
}

function sync(val)
{
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
 
function validate(levelno)
    {
    var d1 = document.form.txtmail_msg;
    var d2 = document.form.mail1;
    var bkColor = "red";
    var bkColor2 = "white";
	var v1 = document.form.a_document_ac;
	var v2 = document.form.r_document_ac;
    
	 var du =document.form.duty;
	    var ke = document.form.keyJob;
	    var no = document.form.noticePeriod;
	    var levelno2 = document.form.levelno2;
	
	
	
	if (((v1.value==null)||(v1.value=="NULL")||(v1.value==""))&&(levelno=="1"))
	         {
	         alert("Enter Accounts - Advance / Impres !");
	         v1.focus();
	         v1.style.bkColor = v1.style.backgroundColor;
			 v1.style.backgroundColor = bkColor;
	         return false;
	         }
	if (((v2.value==null)||(v2.value=="NULL")||(v2.value==""))&&(levelno=="1"))
	         {
	         alert("Enter Accounts - Advance / Impres Remarks !");
	         v2.focus();
	         v2.style.bkColor = v2.style.backgroundColor;
			 v2.style.backgroundColor = bkColor;
			 v1.style.bkColor2 = v1.style.backgroundColor;
			 v1.style.backgroundColor = bkColor2;
	         return false;
	         }

	if (((du.value=='null')||(du.value=="NULL")||(du.value==""))&&(levelno2.value=="0"))
    {
    alert("Enter DUTIES RESPONSIBILITES Remarks !");
    du.value="";
    du.focus();
    du.style.bkColor = du.style.backgroundColor;
		du.style.backgroundColor = bkColor;
	   return false;
    }
	if (((ke.value=='null')||(ke.value=="NULL")||(ke.value==""))&&(levelno2.value=="0"))
    {
    alert("Enter KEY JOB CONTACTS Remarks !");
    ke.value='';
    ke.focus();
    ke.style.bkColor = ke.style.backgroundColor;
		 ke.style.backgroundColor = bkColor;
	   return false;
    }
	if (((no.value=='null')||(no.value=="NULL")||(no.value==""))&&(levelno2.value=="0"))
    {
    alert("Enter NOTICE PERIOD WAIVE OFF Remarks !");
    no.value='';
    no.focus();
    no.style.bkColor =no.style.backgroundColor;
		 no.style.backgroundColor = bkColor;
		return false;
    }
	
	
	
	
	if(levelno=="5")
		{
	    var a =document.form.it1a;
	    var ar = document.form.it2b;
	    var b = document.form.it3c;
	    var br = document.form.it4d;
	    var c = document.form.it5e;
	    var cr = document.form. it6f;
	    var d = document.form.it7g;
	    var dr = document.form.it8h;
	    var e = document.form.it9i;
	    var er = document.form.it10j;
	    var er1 = document.form.it10jnexas;
	    var dcomp = document.form.it11k;
	    var l = document.form.it12l;
	    var m = document.form.it13m;
	    var n = document.form.it14n;
	    var o = document.form.it15o;
	    var p = document.form.it16p;
	    var q = document.form.it17q;
	    var r = document.form.it18r;
	    var s = document.form.it19s;
	    var rair = document.form.itrairLin;
	    
	    var rsop = document.form.itrsophos;
	    var rfor = document.form.itrforti;
	   // var er11 = document.form.it10jjnexas;
if ((a.value==null||a.value=="NULL"||a.value=="")&&(levelno=="5"))
{
alert("Enter Laptop/Desktop  remarks !");
a.focus();
return false;
} 
if ((r.value==null||r.value=="NULL"||r.value=="")&&(levelno=="5"))
{
alert("Enter Password info passed on to  remarks !");
r.focus();
return false;
} 
if ((ar.value==null||ar.value=="NULL"||ar.value=="")&&(levelno=="5"))
{
alert("Enter Data Card remarks !");
ar.focus();
return false;
} 
if ((b.value==null||b.value=="NULL"||b.value=="")&&(levelno=="5"))
{
alert("Enter Email Id remarks !");
b.focus();
return false;
}
if ((cr.value==null||cr.value=="NULL"||cr.value==""   )&&(levelno=="5"))
{
alert("Enter Mobile Phone Mode remarks !");
cr.focus();
return false;
}
if ((d.value==null||d.value=="NULL"||d.value==""   )&&(levelno=="5"))
{
alert("Enter Mobile No (Intune) remarks !");
d.focus();
return false;
}
if ((dcomp.value==null||dcomp.value=="NULL"||dcomp.value==""   )&&(levelno=="5"))
{
alert("Enter Mobile No (Company Provided SIM) remarks !");
dcomp.focus();
return false;
}
if ((c.value==null||c.value=="NULL"||c.value==""   )&&(levelno=="5"))
{
alert("Enter Domain User remarks !");
c.focus();
return false;
}
if ((dr.value==null||dr.value=="NULL"||dr.value==""   )&&(levelno=="5"))
{
alert("Enter Access Card remarks !");
dr.focus();
return false;
}
if ((l.value==null||l.value=="NULL"||l.value==""   )&&(levelno=="5"))
{
alert("Enter Shared Folder remarks !");
l.focus();
return false;
}
if ((m.value==null||m.value=="NULL"||m.value==""   )&&(levelno=="5"))
{
alert("Enter Internet/FTP Access remarks !");
m.focus();
return false;
}
if ((br.value==null||br.value=="NULL"||br.value==""   )&&(levelno=="5"))
{
alert("Enter Newins Id  remarks !");
br.focus();
return false;
}
if ((er1.value==null||er1.value=="NULL"||er1.value==""   )&&(levelno=="5"))
{
alert("Enter NExAS ID  remarks !");
er1.focus();
return false;
}
if ((n.value==null||n.value=="NULL"||n.value==""   )&&(levelno=="5"))
{
alert("Enter GS-NET ID  remarks !");
n.focus();
return false;
}
if ((o.value==null||o.value=="NULL"||o.value==""   )&&(levelno=="5"))
{
alert("Enter Internal Appication  remarks !");
o.focus();
return false;
}
if ((p.value==null||p.value=="NULL"||p.value==""   )&&(levelno=="5"))
{
alert("Enter DSC Dongle Received remarks !");
p.focus();
return false;
}
if ((q.value==null||q.value=="NULL"||q.value==""   )&&(levelno=="5"))
{
alert("Enter VPN remarks !");
q.focus();
return false;
}
if ((e.value==null||e.value=="NULL"||e.value==""   )&&(levelno=="5"))
{
alert("Enter Hard Disk/Pen Drive remarks !");
e.focus();
return false;
}
if ((er.value==null||er.value=="NULL"||er.value==""   )&&(levelno=="5"))
{
alert("Enter Any Other Asset remarks !");
er.focus();
return false;
}
if ((s.value==null||s.value=="NULL"||s.value==""   )&&(levelno=="5"))
{
alert("Enter NEx-GLOW remarks !");
s.focus();
return false;
}
if ((rair.value==null||rair.value=="NULL"||rair.value==""   )&&(levelno=="5"))
{
alert("Enter Airline / Liner Login remarks !");
rair.focus();
return false;
}
if ((rsop.value==null||rsop.value=="NULL"||rsop.value==""   )&&(levelno=="5"))
{
alert("Enter Sophos & Manage Engine Access remarks !");
rsop.focus();
return false;
}
if ((rfor.value==null||rfor.value=="NULL"||rfor.value==""   )&&(levelno=="5"))
{
alert("Enter Fortinet VPN Access remarks !");
rfor.focus();
return false;
}
}
	
	
 if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
      {
      alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
      document.getElementsByName("mmdradio")[0].focus();
      return false;
      } 
 if(levelno=="8")
	 {
 if (document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("higherAuthority")[0].checked )//senddirect
     {
	 alert("Select Radio Button For Form and File close..");
     return false;
     }
	 }
 if (document.getElementsByName("mmdradio")[0].checked  && ((d2.value==null)||(d2.value=="NULL")||(d2.value=="")) &&(levelno!="8"))
      {
      alert("Select next approver name ..");
      return false;
      }
 if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
     {
     alert("Enter Remarks !");
     d1.focus();
     return false;
     }
 else{
	 return true;
 }
}
</script>
<script language="javascript" type="text/javascript">
function popitup(url)
      {
	  newwindow=window.open(url,'name','height=300,width=1100,location=1,status=1,scrollbars=1,resizable=yes,channelmode=yes');
	  if (window.focus) {newwindow.focus()}
	  return false;
      }
</script>


<script type="text/javascript">
function showTR()
{
var status = document.getElementById('idstatus1').value;
if (status!="true")
{
alert("you are not authorized person");
return false;
}
else
{
document.getElementById('idApproved').style.display="table-row";
document.getElementById('idApproved').style.visibility="visible";
document.getElementById('idPwd').style.display="table-row";
document.getElementById('idPwd').style.visibility="visible";
return true;
}
}

function hideTR()
{
var status = document.getElementById('idstatus1').value;
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
document.getElementById('idApproved1').style.display="none";
document.getElementById('idApproved1').style.visibility="hidden";
document.getElementById('idApprovedd').style.display="table-row";
document.getElementById('idApprovedd').style.visibility="visible";
}
function showHigherTR()
{
document.getElementById('idApproved1').style.display="table-row";
document.getElementById('idApproved1').style.visibility="visible";
document.getElementById('idApprovedd').style.display="table-row";
document.getElementById('idApprovedd').style.display="none";
}
</script>
 </head>
<body onload="onloadCheck(),checkForm()">
<form name="form" method="post" action="ITclearanceAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cn4Ac=null,cn2Neww=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,st4AC=null,stl=null,stlro=null,st12=null,stnext=null,str=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rs4AC=null,rsl=null,rslro=null,rs12=null,rsnext=null,rsr=null;
String req=null;
String empD=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null,SessionSuperAdmin=null;
String NewQueryIsApprovedOne=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("m_b_no");
admin =  (String) session.getAttribute("admin");
SessionSuperAdmin = (String) session.getAttribute("AdminRights");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("SessionSuperAdmin :"+SessionSuperAdmin );
System.out.println("------------------------------------");
Connection cn5 = null,cn11=null,cn11New=null; 
Statement st5 = null,st11=null,st11New=null; 
ResultSet rs5 = null,rs11=null,RSttrHR=null,rs11New=null; PreparedStatement psmt=null,psmt2=null,psmtttrHR=null,psmt2Neww=null;
try{
%>

<%//form1_it_clearance
 String form1_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,d_resignation=null,d_reliving=null;
String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null;
String notServed=null,grade=null,requestOption=null;
String a_nexas=null,r_nexas=null;
String airLin=null,rairLin=null;
String sophos=null,rsophos=null;
String forti=null,rforti=null;
String rduty=null,rkeyJob=null,rnoticePeriod=null;
String a_document_hr=null,r_document_hr=null,a_co_car_hr=null,r_co_car_hr=null,a_calculator_hr=null,r_calculator_hr=null,a_conn_mobile_hr=null,r_conn_mobile_hr=null,a_mobile_handset_hr=null,r_mobile_handset_hr=null;
String a_id_card_hr=null,r_id_card_hr=null,a_work_key_hr=null,r_work_key_hr=null,a_any_other_hr=null,r_any_other_hr=null,a_leave_card_hr=null,r_leave_card_hr=null,a_resignation_letter_hr=null,r_resignation_letter_hr=null,a_identity_card_hr=null,r_identity_card_hr=null;
String a_model_info=null,r_model_info=null,a_document_ac=null,r_document_ac=null,d_new_relieved_request=null,d_new_reliving_co=null,a_compmobile_no=null,r_compmobile_no=null; 
String vpn=null,r_vpn=null,a_dsc=null,r_dsc=null,a_internet=null,r_internet=null,a_internal=null,r_internal=null,a_gsnet=null,r_gsnet=null,a_shared_card=null,r_shared_card=null,a_glow=null,r_glow=null;

String req = request.getParameter("rss");
String fg=request.getParameter("fg");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select form1_no,f_date,idextend,branch,depart,full_name,emp_code,designation,r_officer,DATE_FORMAT(d_resignation,'%d/%m/%Y'),DATE_FORMAT(d_reliving,'%d/%m/%Y'),a_model,a_data_card,a_email,a_newins,a_domain,a_mobile_model,a_mobile_no,a_access_card,a_drive,a_other_asset,a_remarks,notServed,grade,requestOption,r_model,r_data_card,r_email,r_newins,r_domain,r_mobile_model,r_mobile_no,r_access_card,r_drive,r_other_asset, a_nexas,r_nexas, i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,a_document_hr,r_document_hr,a_co_car_hr,r_co_car_hr,a_calculator_hr,r_calculator_hr,a_conn_mobile_hr,r_conn_mobile_hr,a_mobile_handset_hr,r_mobile_handset_hr,a_id_card_hr,r_id_card_hr,a_work_key_hr,r_work_key_hr,a_any_other_hr,r_any_other_hr,a_leave_card_hr,r_leave_card_hr,a_resignation_letter_hr,r_resignation_letter_hr,a_identity_card_hr,r_identity_card_hr,a_model_info,r_model_info,a_document_ac,r_document_ac,DATE_FORMAT(d_new_relieved_request,'%d/%m/%Y') as d_new_relieved_request_format,DATE_FORMAT(d_new_reliving_co,'%d/%m/%Y') as d_new_reliving_co_format,rduty,rkeyJob,rnoticePeriod,airLin,rairLin,vpn,rvpn,a_compmobile_no,r_compmobile_no,a_shared_card,r_shared_card,a_internet,r_internet,a_gsnet,r_gsnet,a_internal,r_internal,a_nexglow,r_nexglow,a_dsc,r_dsc,a_sophos,r_sophos,a_forti,r_forti from form1_it_clearance WHERE form1_no='"+req+"'"); 
while(rs100.next())
{
	 form1_no = rs100.getString(1);
	 f_date = rs100.getString(2);
	 idextend = rs100.getString(3);
	 branch = rs100.getString(4);
	 depart = rs100.getString(5);
	 full_name = rs100.getString(6);
	 emp_code = rs100.getString(7);
	 designation = rs100.getString(8);
	 r_officer = rs100.getString(9);
	 d_resignation = rs100.getString(10);
	 d_reliving = rs100.getString(11);
	 a_model = rs100.getString("a_model");
	 a_data_card = rs100.getString("a_data_card");
	 a_email = rs100.getString("a_email");
	 a_newins = rs100.getString("a_newins");
	 a_domain = rs100.getString("a_domain");
	 a_mobile_model = rs100.getString("a_mobile_model");
	 a_mobile_no = rs100.getString("a_mobile_no");
	 a_compmobile_no = rs100.getString("a_compmobile_no");
	 r_compmobile_no = rs100.getString("r_compmobile_no");
	 a_access_card = rs100.getString("a_access_card");
	 a_drive = rs100.getString("a_drive");
	 a_other_asset = rs100.getString("a_other_asset");
	 a_remarks = rs100.getString("a_remarks");
	 notServed = rs100.getString("notServed");
	 grade = rs100.getString("grade");
	 requestOption =rs100.getString("requestOption");
	 
	 r_model = rs100.getString("r_model");
	 r_data_card = rs100.getString("r_data_card");
	 r_email = rs100.getString("r_email");
	 r_newins = rs100.getString("r_newins");
	 r_domain = rs100.getString("r_domain");
	 r_mobile_model = rs100.getString("r_mobile_model");
	 r_mobile_no = rs100.getString("r_mobile_no");
	 r_access_card = rs100.getString("r_access_card");
	 r_drive = rs100.getString("r_drive");
	 r_other_asset = rs100.getString("r_other_asset");
     a_nexas = rs100.getString("a_nexas");
	 r_nexas = rs100.getString("r_nexas");
	 
	 i_name = rs100.getString("i_name");
	 i_desg = rs100.getString("i_desg");
	 i_city = rs100.getString("i_city");
	 i_b_no = rs100.getString("i_b_no");
	 i_admin = rs100.getString("i_admin");
	 i_email_id = rs100.getString("i_email_id");

	 desg = rs100.getString("desg");
	 emp = rs100.getString("emp");
	 mail = rs100.getString("mail");
	 
	 a_document_hr = rs100.getString("a_document_hr");
	 r_document_hr= rs100.getString("r_document_hr");
	 a_co_car_hr= rs100.getString("a_co_car_hr");
	 r_co_car_hr= rs100.getString("r_co_car_hr");
	 a_calculator_hr= rs100.getString("a_calculator_hr");
	 r_calculator_hr= rs100.getString("r_calculator_hr");
	 a_conn_mobile_hr= rs100.getString("a_conn_mobile_hr");
	 r_conn_mobile_hr= rs100.getString("r_conn_mobile_hr");
	 a_mobile_handset_hr= rs100.getString("a_mobile_handset_hr");
	 r_mobile_handset_hr= rs100.getString("r_mobile_handset_hr");
	 a_id_card_hr= rs100.getString("a_id_card_hr");
	 r_id_card_hr= rs100.getString("r_id_card_hr");
	 a_work_key_hr= rs100.getString("a_work_key_hr");
	 r_work_key_hr= rs100.getString("r_work_key_hr");
	 a_any_other_hr= rs100.getString("a_any_other_hr");
	 r_any_other_hr= rs100.getString("r_any_other_hr");
	 a_leave_card_hr= rs100.getString("a_leave_card_hr");
	 r_leave_card_hr= rs100.getString("r_leave_card_hr");
	 a_resignation_letter_hr= rs100.getString("a_resignation_letter_hr");
	 r_resignation_letter_hr= rs100.getString("r_resignation_letter_hr");
	 a_identity_card_hr= rs100.getString("a_identity_card_hr");
     r_identity_card_hr= rs100.getString("r_identity_card_hr");
     a_model_info= rs100.getString("a_model_info");
     r_model_info= rs100.getString("r_model_info");
     a_document_ac= rs100.getString("a_document_ac");
     r_document_ac= rs100.getString("r_document_ac");
	 
     d_new_relieved_request= rs100.getString("d_new_relieved_request_format");
     d_new_reliving_co = rs100.getString("d_new_reliving_co_format");
     
     rduty = rs100.getString("rduty")==null?"":rs100.getString("rduty");
     rkeyJob= rs100.getString("rkeyJob")==null?"":rs100.getString("rkeyJob");
     rnoticePeriod=rs100.getString("rnoticePeriod")==null?"":rs100.getString("rnoticePeriod");
     
     airLin= rs100.getString("airLin");
     rairLin=rs100.getString("rairLin");

     sophos= rs100.getString("a_sophos");
     rsophos=rs100.getString("r_sophos");
     forti= rs100.getString("a_forti");
     rforti=rs100.getString("r_forti");

     a_shared_card= rs100.getString("a_shared_card");
     r_shared_card=rs100.getString("r_shared_card");
     a_internet= rs100.getString("a_internet");
     r_internet=rs100.getString("r_internet");
     a_gsnet= rs100.getString("a_gsnet");
     r_gsnet=rs100.getString("r_gsnet");
     a_internal= rs100.getString("a_internal");
     r_internal=rs100.getString("r_internal");
     a_dsc= rs100.getString("a_dsc");
     r_dsc=rs100.getString("r_dsc");
     vpn= rs100.getString("vpn");
     r_vpn=rs100.getString("rvpn");
     a_glow= rs100.getString("a_nexglow");
     r_glow=rs100.getString("r_nexglow");
}

String empid="",levelno="",levelno2="";
int flagro=0;
empid = (String) session.getAttribute("EmpNo");
System.out.println("empid :"+empid);
cn2 = con.getConnection2();
stl=cn2.createStatement();
rsl = stl.executeQuery("select max(CAST(levelno AS UNSIGNED)) from form1_it_clearance_item where form1_no='"+req+"'"); 
while(rsl.next())
{
levelno=rsl.getString(1);
}

str=cn2.createStatement();
rsr = str.executeQuery("select levelno from form1_it_clearance_item where form1_no='"+req+"' and status='Pending'"); 
while(rsr.next())
{
levelno2=rsr.getString(1);
}

stlro=cn2.createStatement();
rslro = stlro.executeQuery("select levelno from form1_it_clearance_item where form1_no='"+req+"' and levelno='0'"); 
if(rslro.next())
{
flagro=1;
}

%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;"><center><font size="5">
		<b><label>
		Outstanding Dues & Handover Report</label>
		</b></font></center>  </td>
		</tr>
		<tr><td>
		<input type="text" name="i_name" value="<%=SessionName%>" />
		<input type="text" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="text" name="i_city" value="<%=Sessioncity%>" />
		<input type="hidden" name="i_b_no" value="<%=Sessionb_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="text" name="i_email_id" value="<%=email_id%>" />
		<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form1_no" value="<%=form1_no%>" />
		<input type="hidden" name="fg" value="<%=fg%>" />
		<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
		</td>
		
	</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">

<input type="hidden" name="levelno1" id="levelno1" value="<%=levelno%>" />
<input type="hidden" name="levelno2" id="levelno2" value="<%=levelno2%>" />
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
	 <br />
<%



cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 
cn4Ac = con.getConnection2();
st4AC=cn4Ac.createStatement();

%>	 
<%
int flagAC=0;
String ACMailing=null,ACNname=null,ACNpost=null;
String fullSendingDetailsOfAC=null;
rs4AC = st4AC.executeQuery("SELECT l.Nname,l.post,l.Nmail,l.city FROM login l INNER join form1_it_clearance_item f ON (l.Nname=f.emp) AND l.subDept='Accounts' AND l.b_no='90' AND l.admin='SuperAdmin' AND f.status='Approved' AND f.form1_no='"+req+"'");
while(rs4AC.next())
{
flagAC=1;
ACNname=rs4AC.getString("Nname");
ACNpost =rs4AC.getString("post");
ACMailing=rs4AC.getString("Nmail");
fullSendingDetailsOfAC = ACNname +","+ACNpost +","+ACMailing;
System.out.println("fullSendingDetailsOfAC ------------------------------------------------------------------:"+fullSendingDetailsOfAC);
} 
%>	
<table width="895">
<tr>
<td align="center" bgcolor="grey" colspan="4"><b>
<font size="5"><%=form1_no%></font></b>
</td>
</tr>
<tr>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
</tr>

<tr>
<td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/>
</td> 
</tr>

<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" value="<%=designation%>" readonly="readonly"/></td>
<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=r_officer%>" readonly="readonly"/></td>
</tr>

<tr>
<td  style="text-align: right;">Date Of Resignation :</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_resignation" value="<%=d_resignation%>" readonly="readonly"  readonly="readonly" />
</td>
<td  style="text-align: right;">Last Served Date :</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_reliving"  value="<%=d_reliving%>" readonly="readonly" readonly="readonly" />
</td> 					        
</tr>

<tr>
<td  style="text-align: right;">Date Of Relieving requested by the employee :</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_resignation" value="<%=d_new_relieved_request%>" readonly="readonly"  />
</td>
<td  style="text-align: right;">Date of Relieving as per co policy:</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_reliving"  value="<%=d_new_reliving_co%>" readonly="readonly"  />
</td> 					        
</tr>

<tr>
<td  style="text-align: right;">Status Of Employement  :</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_resignation" value="<%=requestOption%>" readonly="readonly"  readonly="readonly" />
</td>
<td  style="text-align: right;">Grade :</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_reliving"  value="<%=grade%>" readonly="readonly" readonly="readonly" />
</td> 					        
</tr>

<tr>
<td  style="text-align: right;">Not Served:</td>
<td style="text-align:left;" colspan="3">
<input type="text"  style="width: 6em"  name="d_resignation" value="<%=notServed%>" readonly="readonly"  readonly="readonly" />
days
</td>
</tr>

</table>
<% 
cn5 = con.getConnection2();
st5 = cn5.createStatement();

String ITdesg=null,ITbno=null;
String NONITName=null,NONITmailId=null,NONITDEsg=null,NONITfullSendingDetails=null;

psmt = cn2.prepareStatement("SELECT post,b_no FROM login WHERE b_no=? AND post=?");
psmt.setString(1,"90");
psmt.setString(2,"ASST. GENERAL MANAGER");
ResultSet itmang = psmt.executeQuery();
while(itmang.next())
{
	 ITdesg = itmang.getString(1);
	 ITbno = itmang.getString(2);
}

psmtttrHR = cn2.prepareStatement("select g.form1_no from form1_it_clearance g WHERE g.form1_no=? AND g.HRvalidateAC='Accounts' ORDER BY g.id ASC");
psmtttrHR.setString(1,req);
RSttrHR = psmtttrHR.executeQuery();
String AccountsPresent=null;
while(RSttrHR.next())
{
	AccountsPresent = RSttrHR.getString(1);
	
}
System.out.println("AccountsPresent ************************************* : "+AccountsPresent);

psmt2 = cn2.prepareStatement("SELECT Nname,post,Nmail,b_no FROM login WHERE b_no=? AND subDept=?");
psmt2.setString(1,"90");
psmt2.setString(2,"HR");
ResultSet nonitmailing = psmt2.executeQuery();
while(nonitmailing.next())
{
	NONITName = nonitmailing.getString(1);
	NONITDEsg = nonitmailing.getString(2);
	NONITmailId = nonitmailing.getString(3);
	NONITfullSendingDetails = NONITName +","+NONITDEsg +","+NONITmailId;
}
System.out.println("Non it mailing running-------------------------- query :");
//Checking present form is Approved , if so then its need to continue.
psmt2Neww = cn2.prepareStatement("select g.form1_no from form1_it_clearance g WHERE g.form1_no=? AND g.Approval_status='Approved'");
psmt2Neww.setString(1,req);
ResultSet rsNeww = psmt2Neww.executeQuery();

while(rsNeww.next())
{
	NewQueryIsApprovedOne = rsNeww.getString(1);
}

System.out.println("NONITfullSendingDetails : "+NONITfullSendingDetails);

%> 
<br>
<label><center> <font color="black"><u><b>ONLY FOR HR DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="895" align="center">
<tr>
<td class="it1" align="center">1  </td>
<td class="it2" style="text-align: right;width:23%;"> All document taken overby:</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_document_hr"  value="<%=a_document_hr%>" id="mod" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_document_hr" id="rem1" size="40" value="<%=r_document_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>
<td class="it2" style="text-align: right;width:23%;">Company Car :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" value="<%=a_co_car_hr%>" name="a_co_car_hr" id="dc" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_co_car_hr" id="rem2" size="40" value="<%=r_co_car_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>
<td class="it2" style="text-align: right;width:23%;">Calculators :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_calculator_hr" value="<%=a_calculator_hr%>" id="eid" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_calculator_hr" id="rem3" size="40" maxlength="44" value="<%=r_calculator_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>
<td class="it2" style="text-align: right;width:23%;"> Connection surrendered :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_conn_mobile_hr" id="nid" value="<%=a_conn_mobile_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_conn_mobile_hr" id="rem4" size="40" maxlength="44" value="<%=r_conn_mobile_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>
<td class="it2" style="text-align: right;width:23%;">Mobile handset :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_mobile_handset_hr" id="du" value="<%=a_mobile_handset_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_mobile_handset_hr" id="rem5" size="40" maxlength="44" value="<%=r_mobile_handset_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it2" style="text-align: right;width:23%;">ID card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_id_card_hr" id="du" value="<%=a_id_card_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_id_card_hr" id="rem5" size="40" maxlength="44" value="<%=r_id_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it2" style="text-align: right;width:23%;">Workstation keys :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_work_key_hr" id="du" value="<%=a_work_key_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_work_key_hr" id="rem5" size="40" maxlength="44" value="<%=r_work_key_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>
<td class="it2" style="text-align: right;width:23%;">Any Other:</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_any_other_hr" id="du" value="<%=a_any_other_hr%>" maxlength="44" readonly="readonly"  onfocus="myFunctionHR();"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_any_other_hr" id="rem5" size="40" maxlength="44" value="<%=r_any_other_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">9  </td>
<td class="it2" style="text-align: right;width:23%;"> Leave card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_leave_card_hr"  size="10" maxlength="44" value="<%=a_leave_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/>
</td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_leave_card_hr" id="rem5" size="40" maxlength="44" value="<%=r_leave_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">10  </td>
<td class="it2" style="text-align: right;width:23%;">Resignation letter enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<input type="text" name="a_resignation_letter_hr"  size="10" maxlength="44" value="<%=a_resignation_letter_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/>
</td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_resignation_letter_hr" id="rem5" size="40" maxlength="44" value="<%=r_resignation_letter_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>

<tr>
<td class="it1" align="center">11  </td>
<td class="it2" style="text-align: right;width:23%;">Identity card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<input type="text" name="a_identity_card_hr"  size="10" maxlength="44" value="<%=a_identity_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/>
</td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_identity_card_hr" id="rem5" size="40" maxlength="44" value="<%=r_identity_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>
</table>
<br>
<label><center> <font color="black"><u><b>ONLY FOR A / C DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="895" align="center">
<tr>
<td class="it1" align="center" style="width:3%;"> 1   </td>
<td class="it2" style="text-align: right;width:23%;"> Accounts - Advance / Imprest Balance:</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_document_ac" id="mod" maxlength="44" value="<%=a_document_ac%>" readonly="readonly"  onfocus="myFunctionAccounts();" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_document_ac" id="rem1" size="40" maxlength="44" readonly="readonly"  value="<%=r_document_ac%>" onfocus="myFunctionAccounts();" /></td>
</tr>
</table>

<br>

<label><center> <font color="black"><u><b>ONLY FOR REPORTING OFFICER</b></u></font></center> </label> 
<br>
<table id="table4" width="895">
<tr>
	<td class="ro1" align="center">1  </td>
	<td class="ro2" style="text-align: right;width:23%;">DUTIES RESPONSIBILITES DOCUMENTS AND FILES:</td>
	<td class="ro2">Remarks :</td>
	<td class="ro2"   ><input type="text" name="duty" id="duty" size="45"  value="<%=rduty%>" readonly="readonly"  onfocus="myFunctionRO();"/></td>
</tr>
<tr>
	<td class="ro1" align="center">2  </td>
	<td class="ro2" style="text-align: right;width:23%;">KEY JOB CONTACTS:</td>
	<td class="ro2">Remarks :</td>
	<td class="ro2"   ><input type="text" name="keyJob" id="keyJob" size="45" value="<%=rkeyJob%>" maxlength="44" readonly="readonly"  onfocus="myFunctionRO();"/></td>
</tr>
<tr>
	<td class="ro1" align="center">3  </td>
	<td class="ro2" style="text-align: right;width:23%;">NOTICE PERIOD WAIVE OFF:</td>
	<td class="ro2">Remarks :</td>
	<td class="ro2"   ><input type="text" name="noticePeriod" id="noticePeriod" size="45"  value="<%=rnoticePeriod%>" readonly="readonly"  onfocus="myFunctionRO();"/></td>
</tr>
</table>

<br>
<label><center> <font color="black"><u><b>IT ASSET PROVIDED</b></u></font></center> </label> 
<br/>
<table id="table3" width="895">
<tr>
<td>Sl</td>
<td colspan="2" align="center">ITEM NAMES</td>
<td colspan="2" align="center">INITIATOR REMARKS</td>
<%if(levelno.equals("5")){ %>
<td colspan="2" align="center">ASST. GENERAL MANAGER REMARKS</td>
<td>REMINDER</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">1  </td>
<td class="it2" style="text-align: right;"> Laptop/Desktop Model :</td>
<td> <input type="text" name="a_model" readonly="readonly" id="mod" maxlength="100" value="<%=a_model%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="r_model" id="rem1" readonly="readonly" value="<%=r_model%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="it1a" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it1aa" checked="checked" /> -->
<select name="it1aa">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">1a  </td>
<td class="it2" style="text-align: right;">Password info passed on to :</td>
<td> <input type="text" name="a_model_info" readonly="readonly" value="<%=a_model_info%>" id="dc" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_model_info" id="rem2" readonly="readonly" value="<%=r_model_info%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it18r" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it18rr" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">2  </td>
<td class="it2" style="text-align: right;">Data Card :</td>
<td> <input type="text" name="a_datacard" readonly="readonly" value="<%=a_data_card%>" id="dc" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_datacard" id="rem2" readonly="readonly" value="<%=r_data_card%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it2b" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it2bb" checked="checked" /> -->
<select name="it2bb" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">3  </td>
<td class="it2" style="text-align: right;">Email Id :</td>
<td > <input type="text" name="a_email" id="eid" readonly="readonly" value="<%=a_email%>" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_email" id="rem3" readonly="readonly" value="<%=r_email%>" /></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it3c" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it3cc" checked="checked"/> -->
<select name="it3cc" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">3a  </td>
<td class="it2" style="text-align: right;">Mobile Phone Model :</td>
<td > <input type="text" name="a_mobile_model" readonly="readonly" id="mpd" value="<%=a_mobile_model%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="r_mobile_model" id="rem6" readonly="readonly" value="<%=r_mobile_model%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it6f" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it6ff" checked="checked"/> -->
<select name="it6ff" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">3b  </td>
<td class="it2" style="text-align: right;">Mobile No (Intune) :</td>
<td > <input type="text" readonly="readonly" name="a_mobile_no" id="mno" value="<%=a_mobile_no%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_mobile_no" id="rem7" readonly="readonly" value="<%=r_mobile_no%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it7g" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it7gg" checked="checked"/> -->
<select name="it7gg" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">3c  </td>
<td class="it2" style="text-align: right;">Mobile No (Company Provided SIM) :</td>
<td > <input type="text" readonly="readonly" name="a_compmobile_no" id="mnocomp" value="<%=a_compmobile_no%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_compmobile_no" id="remcomp" readonly="readonly" value="<%=r_compmobile_no%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it11k" id="rem1comp"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it11kk" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">4  </td>
<td class="it2" style="text-align: right;">Domain User :</td>
<td > <input type="text" name="a_domain" readonly="readonly" value="<%=a_domain%>" id="du" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_domain" id="rem5" readonly="readonly" value="<%=r_domain%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it5e" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it5ee" checked="checked"/> -->
<select name="it5ee" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">5  </td>
<td class="it2" style="text-align: right;">Access Card/Biometric :</td>
<td > <input type="text" name="a_access_card" readonly="readonly" id="acard" value="<%=a_access_card%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_access_card" id="rem8" readonly="readonly" value="<%=r_access_card%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it8h" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it8hh" checked="checked"/> -->
<select name="it8hh" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%} %>
</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it2" style="text-align: right;">Shared Folder :</td>
<td > <input type="text" name="a_shared_card" readonly="readonly" id="acard" value="<%=a_shared_card%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_shared_card" id="rem8" readonly="readonly" value="<%=r_shared_card%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it12l" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it8hh" checked="checked"/> -->
<select name="it12ll" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%} %>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it2" style="text-align: right;">Internet Access / FTP Access :</td>
<td > <input type="text" name="a_internet" readonly="readonly" id="acard" value="<%=a_internet%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_internet" id="rem8" readonly="readonly" value="<%=r_internet%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it13m" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it8hh" checked="checked"/> -->
<select name="it13mm" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%} %>
</tr>

<tr>
<td class="it1" align="center">8  </td>
<td class="it2" style="text-align: right;">Newins Id :</td>
<td > <input type="text" name="a_newins" readonly="readonly" value="<%=a_newins%>" id="nid" maxlength="100" /></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_newins" id="rem4" readonly="readonly" value="<%=r_newins%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it4d" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<!-- <input type="checkbox" name="it4dd" checked="checked"/> <input type="radio" name="it4dd" checked="checked" value="yes"/><input type="radio" name="it4dd" checked="checked" value="No"/> -->
<select name="it4dd" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">9  </td>
<td class="it2" style="text-align: right;">NEXAS\SAP ID :</td>
<td > <input type="text" name="a_nexas" readonly="readonly" value="<%=a_nexas%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_nexas" id="rem8" readonly="readonly" value="<%=r_nexas%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it10jnexas" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it10jjnexas" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">10  </td>
<td class="it2" style="text-align: right;">GS-NET :</td>
<td > <input type="text" name="a_gsnet" readonly="readonly" value="<%=a_gsnet%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_gsnet" id="rem8" readonly="readonly" value="<%=r_gsnet%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it14n" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it14nn" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">11  </td>
<td class="it2" style="text-align: right;">Internal Application :</td>
<td > <input type="text" name="a_internal" readonly="readonly" value="<%=a_internal%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_internal" id="rem8" readonly="readonly" value="<%=r_internal%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it15o" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it15oo" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">12  </td>
<td class="it2" style="text-align: right;">DSC Dongle Received :</td>
<td > <input type="text" name="a_dsc" readonly="readonly" value="<%=a_dsc%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_dsc" id="rem8" readonly="readonly" value="<%=r_dsc%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it16p" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it16pp" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">13  </td>
<td class="it2" style="text-align: right;">VPN :</td>
<td > <input type="text" name="a_vpn" readonly="readonly" value="<%=vpn%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_vpn" id="rem8" readonly="readonly" value="<%=r_vpn%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it17q" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="it17qq" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">14  </td>
<td class="it2" style="text-align: right;">Hard Disk/Pen Drive :</td>
<td > <input type="text" name="a_drive" readonly="readonly" id="hp" value="<%=a_drive%>"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_drive" id="rem8" readonly="readonly" value="<%=r_drive%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it9i" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it9ii" checked="checked"/> -->
<select name="it9ii" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">15  </td>
<td class="it2" style="text-align: right;">Any Other Asset :</td>
<td > <input type="text" name="a_other_asset" readonly="readonly" value="<%=a_other_asset%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_other_asset" id="rem8" readonly="readonly" value="<%=r_other_asset%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="it10j" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it10jj" checked="checked"/> -->
<select name="it10jj" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">16  </td>
<td class="it2" style="text-align: right;">NEx-GLOW :</td>
<td > <input type="text" name="a_glow" readonly="readonly" value="<%=a_glow%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="r_glow" id="rem8" readonly="readonly" value="<%=r_glow%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="it19s" id="rem1"  value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center"><!-- <input type="checkbox" name="it10jj" checked="checked"/> -->
<select name="it19ss" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">17  </td>
<td class="it2" style="text-align: right;">Airline / Liner Login :</td>
<td > <input type="text" name="airLin" readonly="readonly" value="<%=airLin%>" id="asset1"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="rairLin" id="rairLin" readonly="readonly" value="<%=rairLin%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="itrairLin" id="itrairLin" value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="itrairLin1" >
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">18  </td>
<td class="it2" style="text-align: right;">Sophos & Manage Engine Access :</td>
<td > <input type="text" name="sophos" readonly="readonly" value="<%=sophos%>" id="sophos"/></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="rsophos" id="rsophos" readonly="readonly" value="<%=rsophos%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="itrsophos" id="itrsophos" value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="itrsophos1">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>

<tr>
<td class="it1" align="center">19  </td>
<td class="it2" style="text-align: right;">Fortinet VPN Access :</td>
<td > <input type="text" name="forti" readonly="readonly" value="<%=forti%>" id="forti"/></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="rforti" id="rforti" readonly="readonly" value="<%=rforti%>"/></td>
<%if(levelno.equals("5")){ %>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="itrforti" id="itrforti" value="" placeholder="Enter IT Remarks"/></td>
<td class="it1" align="center">
<select name="itrforti1">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</td>
<%}%>
</tr>
</table>
<br />
<table id="tableData" name="tableData" width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
<tr>
<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>RESEND</b></font></td>
</tr>
<%
cn1 = con.getConnection2();
st1=cn1.createStatement();
rs1 = st1.executeQuery("select form1_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),mail from form1_it_clearance_item WHERE form1_no='"+req+"' ORDER BY id ASC"); 
while(rs1.next())
{
String form1_noD= rs1.getString(1);
String desgD= rs1.getString(2);
empD= rs1.getString(3);
String statusD= rs1.getString(4);
String remarksD= rs1.getString(5);
String f_dateD= rs1.getString(6);
String mailD= rs1.getString(7);
String m = "";
if(rs1.getString("mail")!=null)
{
m =  rs1.getString("mail").trim();
}
%>
<tr>
<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
<input id="idStatus" type="hidden" value="<%=statusD%>"/></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
<td bgcolor="white" width="100" class="fonter"><input id="idaa" readonly="readonly" size="10" value="<%=statusD%>"/></td>
<td bgcolor="white" width="100"><textarea rows="2" cols="30" readonly="readonly" onclick="this.style.height='60px';this.style.width='300px';" onblur="this.style.height='';this.style.width='';"><%=remarksD%></textarea></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
<td><input type="button"  style="size:1" value="RE-SEND MAIL" id="idaa2" onclick="resendMail('<%=email_id%>','<%=form1_no%>','<%=m%>','<%=SessionName%>');" /></td> 
</tr>
<%}%>
</table>
<%
String flag =c2ITUtil1.getAuthorizedName(form1_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),session.getAttribute("EmpNo").toString());
%>
<input type="hidden" id="idstatus1" value="<%= flag %>" />
<table align="center" class="dynatable" width="895" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
<input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
<input type="hidden" value="<%= session.getAttribute("form2_no") %>" id="idmrId"/>
<input type="hidden" id="idstatus" value="<%= flag %>" />
<tr>
<td align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(showTR());"/>Approved 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR());" />Not Approved
</td>
</tr>  
<tr style="display: none;" id="idApproved" >
<% 
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
   
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password); 
Connection connhrms = null;
  
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
Statement nstmt = connhrms.createStatement();  
String maxlevel="";
cn1 = con.getConnection2();
st12=cn1.createStatement();
	  
String i_b_no1=form1_no.substring(11,13);
System.out.println("i_b_no1 :"+i_b_no1);
rs12= st12.executeQuery("SELECT max(CAST(levelno AS UNSIGNED)) FROM formapproval WHERE branch='"+i_b_no1+"' and formtype='IT_CLS'  ORDER BY levelno ASC");
if(rs12.next())
{ 
maxlevel=rs12.getString(1);
}
System.out.println("Max Level no :"+maxlevel);
String allopt="",dirappro="",ro="",ro1="";
st11 = cn1.createStatement();  
rs11 = st11.executeQuery("SELECT alloptions,directApprove FROM formapproval WHERE branch='"+i_b_no1+"' and empid='"+empid+"' and formtype='IT_CLS'");
if(rs11.next())
{ 
allopt=rs11.getString(1);
dirappro=rs11.getString(2);
}
    
int nextlevel=0;
st5 = cn5.createStatement(); 
System.out.println("Current Level no :"+levelno);
if(!levelno.equals("Creater"))
{
nextlevel=Integer.parseInt(levelno)+1;
}
else
{
nextlevel=Integer.parseInt(maxlevel);
levelno=maxlevel;
}
    
/* ////////////////////////// Skeeping level code  ////////////////////////////////// */
String nextemp="";
stnext = cn5.createStatement(); 
rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='IT_CLS' ORDER BY levelno ASC");
if(rsnext.next())
{
nextemp=rsnext.getString(5);
}
if(empid.equals(nextemp))
{
if(!levelno.equals("Creater")) 
nextlevel++;
}
/* ////////////////////////// end Skeeping level code  ////////////////////////////////// */
if(allopt.equals("0") || allopt.equals(""))
{
if(!levelno.equals(maxlevel) && !dirappro.equals("1"))
{
Statement stmtro = connhrms.createStatement(); 
Statement stmtro1 = connhrms.createStatement(); 
if(levelno.equals("2") && flagro==0)//find the RO of resigned employed.......
{
ResultSet rsro = stmtro.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,m3.email,m3.emp_id FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + emp_code + "' ) AND u.employee_status = 'yes' ");
while(rsro.next())
{ 
ResultSet rsro1 = stmtro1.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name,m3.user_name AS manager_name FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='"+rsro.getString(7)+"' ) AND u.employee_status = 'yes' ");
if(rsro1.next())
{      
desg=rsro1.getString(2);
} 
ro=rsro.getString(7) +","+rsro.getString(5)+","+desg+","+rsro.getString(6)+","+"0";
ro1=rsro.getString(5)+"("+rsro.getString(6)+")";
}
%>

<input type="hidden" name="senddirect" id="senddirect" value="sendonly" readonly/>
<td> Send to RO :
<input align="left" type="radio" value="<%=ro%>" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
<input type="text" name="mail11" id="iddeptadminP11" value="<%=ro1%>" size="50" readonly/>
<input type="hidden" name="mail12" id="iddeptadminP" value="<%=ro%>" size="30"/>
</td>
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>

<% 
}// level = 2 close
else
{
rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='IT_CLS' ORDER BY levelno ASC");
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
%>
<input type="hidden" name="senddirect" id="senddirect" value="sendonly" readonly/>
<td> Send to Next approver level :
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
}
}
else
{
String app_name=null,developer_name=null,developer_mail=null,napprovalsw="",napprovalsw1="";
st2=cn2.createStatement();
rs2 = st2.executeQuery("select app_name,developer_name,developer_mail from software_owner_master where app_name='NEIN-P2P'");
if(rs2.next())
{
app_name = rs2.getString("app_name");
developer_name = rs2.getString("developer_name");
developer_mail = rs2.getString("developer_mail");
}
napprovalsw=developer_name+"("+developer_mail+")";
napprovalsw1="1952"+","+developer_name+","+"Deputy Manager"+","+developer_mail+","+"Creater";%>
<input type="hidden" name="senddirect" id="senddirect" value="direct" readonly/>
<td>
<input type="hidden" name="mail1" id="idromail" value="chintu.kumar@nipponexpress.com" readonly/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="direct" id="idmNon" onclick="showHigherTR(this.value);"/>Close File & Forms</td>
<%}}
else
{
int curlev=Integer.parseInt(levelno);
int next=0;
while(curlev<=Integer.parseInt(maxlevel))
{
next=curlev+1;
rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+next+"'  ORDER BY levelno ASC");
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
<tr style="display: none;" id="idApproved1" >
<td>
Mail will be send to All approver.
</td>
</tr>
<tr  ><td colspan="6">REMARKS:
<div style="overflow:auto;">
<textarea  name="txtmail_msg"  rows="2" cols="100"></textarea></div></td>
</tr>
</table>
</br>
</td>
</tr>
</table> 
<table style="margin-left: auto;margin-right: auto;" >
<tr>
<td> <div id="formsubmitbutton"> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate(levelno1.value));" />
</div>
<div id="buttonreplacement" style="margin-left:30px; display:none;">
<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
</div> 
</td>
<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
<td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
<input type="button" id="btnShowSimple" value="APPROVAL ROUTINE" />
</td>
<td><a href="../ITclearanceHelp.jsp" onclick="return popitup('../ITclearanceHelp.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
<td style="font-size:1">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='ITclearanceSelectAdmin.jsp?msg=1'"/> -->
<a  href="../../../adminPage.jsp?msg=1">BACK</a>
</td>
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
DbUtil.closeDBResources(null,psmt,null);
DbUtil.closeDBResources(null,psmt2,null);
}
%>
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
</table><br />
<label style="text-align:center;">HR/Admin (Local)</label>
<br />
<label style="font-size: 30px;">&#x21d3;</label>
<br />
<label>A/C (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT(Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>RO</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BRANCH GA</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HO(IT)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>GA(HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>CFO</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>MD</label>
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HR/Admin (HO)</label>
<br />
</div>
</form>	
</body>
</html>