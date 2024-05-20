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
<!-- 	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script> -->
	  <script language="javascript"   type="text/javascript" src="../../js/formApprovalColorChange.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<link rel='stylesheet' type='text/css' href="../../css/style.css" />
	<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
	<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->

<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("../../adminHR.jsp?msg="+msg);
}
%>

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
</script>
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


<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("__","  ");
    %>
    msg = "<%=disp%>";

     if(msg!="1")
		{
           //alert(msg);
		}
</script>
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
                       }       var url="../../selEmpForms.jsp";  
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
                       }       var url="../../selectMailId.jsp";  
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
                       }       var url="../../ResendMailDomain?mail="+mail+","+form1_no+","+empD+"";  
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


<script>
function hiddenTables(obj){
	var type=obj;
	if(type[0].value=="Email ID" && type[0].checked==true){
		var email 		= document.getElementById("requestForCheck_email");
		var emdt		= document.getElementById("email_details");
		if(email.checked==true){
			emdt.style.display 		= "inline";
			emdt.style.visibility 	= "visible";
		}else{
			emdt.style.display 		= "none";
			emdt.style.visibility	= "hidden";
		}
	}
	if(type[1].value=="Domain Account" && type[1].checked==true){
		var domain		= document.getElementById("requestForCheck_dom");
		var dmdt		= document.getElementById("dom_details");
		if(domain.checked==true){
			dmdt.style.display = "inline";
		}else{
			dmdt.style.display = "none";			
		}
	}
	if(type[2].value=="Biometric / Access Card" && type[2].checked==true){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt		= document.getElementById("bio_details");
		if(biometric.checked==true){
			biodt.style.display = "inline";
		}else{
			biodt.style.display = "none";			
		}
	}
	if(type[3].value=="Shared Folder" && type[3].checked==true){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt		= document.getElementById("sha_details");
		if(shared.checked==true){
			shadt.style.display = "inline";
		}else{
			shadt.style.display = "none";			
		}
	}
	if(type[4].value=="Internet Access / FTP Access" && type[4].checked==true){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt		= document.getElementById("int_details");
		if(internet.checked==true){
			intdt.style.display = "inline";
		}else{
			intdt.style.display = "none";			
		}
	}
	if(type[5].value=="NEWINS" && type[5].checked==true){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt		= document.getElementById("new_details");
		if(newins.checked==true){
			newdt.style.display = "inline";
		}else{
			newdt.style.display = "none";			
		}
	}
	if(type[6].value=="NExAS" && type[6].checked==true){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt		= document.getElementById("nex_details");
		if(nexas.checked==true){
			nexdt.style.display = "inline";
		}else{
			nexdt.style.display = "none";			
		}
	}
	if(type[7].value=="GS-NET" && type[7].checked==true){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt		= document.getElementById("gs_details");
		if(gsnet.checked==true){
			gsdt.style.display = "inline";
		}else{
			gsdt.style.display = "none";			
		}
	}
	if(type[8].value=="Internal Application" && type[8].checked==true){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt		= document.getElementById("inter_details");
		if(internal.checked==true){
			interdt.style.display = "inline";
		}else{
			interdt.style.display = "none";			
		}
	}
	if(type[9].value=="USB Access" && type[9].checked==true){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt		= document.getElementById("usb_details");
		if(usb.checked==true){
			usbdt.style.display = "inline";
		}else{
			usbdt.style.display = "none";			
		}
	}
	if(type[10].value=="VPN Access" && type[10].checked==true){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt		= document.getElementById("vpn_details");
		if(vpn.checked==true){
			vpndt.style.display = "inline";
		}else{
			vpndt.style.display = "none";			
		}
	}if(type[11].value=="HardDisk / PenDrive" && type[11].checked==true){
		var hd 		= document.getElementById("requestForCheck_hard");
		var hddt		= document.getElementById("hard_details");
		if(hd.checked==true){
			hddt.style.display = "inline";
		}else{
			hddt.style.display = "none";			
		}
	}if(type[12].value=="Any Other Asset" && type[12].checked==true){
		var as 		= document.getElementById("requestForCheck_assets");
		var asdt		= document.getElementById("asset_details");
		if(as.checked==true){
			asdt.style.display = "inline";
		}else{
			asdt.style.display = "none";			
		}
	}
	if(type[13].value=="NEx-GLOW" && type[13].checked==true){
		var gl 		= document.getElementById("requestForCheck_glow");
		var gldt		= document.getElementById("glow_details");
		if(gl.checked==true){
			gldt.style.display = "inline";
		}else{
			gldt.style.display = "none";			
		}
	}
}

function intunedisplay(obj){
	var intune = obj.value;
	var yesNo  = document.getElementById("intuneYes");
	var yesNo111  = document.getElementById("intuneYes111");
	var yesNo11  = document.getElementById("intuneYes11");
	var yesNo1 = document.getElementById("intuneYes1");
	var yesNo12 = document.getElementById("intuneYes12");
	var yesNo13 = document.getElementById("intuneYes13");
	var yesNo2 = document.getElementById("intuneYes2");
	var yesNo21 = document.getElementById("intuneYes21");
	if(intune=="Yes"){
		  document.getElementById('mobInt').colSpan="1";
		  document.getElementById('emailRow').rowSpan="8";
		  yesNo.style.display="table-cell";
		  yesNo.style.visibility="visible";
		  yesNo11.style.display="table-cell";
		  yesNo11.style.visibility="visible";
		  yesNo1.style.display="table-row";
		  yesNo1.style.visibility="visible";
		  yesNo111.style.display="table-row";
		  yesNo111.style.visibility="visible";
		  yesNo12.style.display="table-cell";
		  yesNo12.style.visibility="visible";
		  yesNo13.style.display="table-cell";
		  yesNo13.style.visibility="visible";
		  yesNo2.style.display="table-cell";
		  yesNo2.style.visibility="visible";
		  yesNo21.style.display="table-cell";
		  yesNo21.style.visibility="visible";
	}else{
		  document.getElementById('mobInt').colSpan="3";
		  document.getElementById('emailRow').rowSpan="6";
		  yesNo.style.display="none";
		  yesNo.style.visibility="hidden";
		  yesNo11.style.display="none";
		  yesNo11.style.visibility="hidden";
		  yesNo1.style.display="none";
		  yesNo1.style.visibility="hidden";
		  yesNo111.style.display="none";
		  yesNo111.style.visibility="hidden";
		  yesNo12.style.display="none";
		  yesNo12.style.visibility="hidden";
		  yesNo13.style.display="none";
		  yesNo13.style.visibility="hidden";
		  yesNo2.style.display="none";
		  yesNo2.style.visibility="hidden";
		  yesNo21.style.display="none";
		  yesNo21.style.visibility="hidden";
	}
}

</script>

<script language = "Javascript">
function showTR1()
{
	  document.getElementById('idDelete').style.display="table-row";
	  document.getElementById('idDelete').style.visibility="visible";
	  document.getElementById('idDelete2').style.display="table-row";
	  document.getElementById('idDelete2').style.visibility="visible";
 }
function hideTR1()
{
	 document.getElementById('idDelete').style.display="none";
	 document.getElementById('idDelete').style.visibility="hidden";
	 document.getElementById('idDelete2').style.display="none";
	 document.getElementById('idDelete2').style.visibility="hidden";
 }
</script>

<script language = "Javascript">
function showMob()
{
 	  if(document.getElementById("cmp").value=="Yes"){
 	  document.getElementById('compTD').colSpan="1";
	  document.getElementById('mob1').style.display="table-cell";
	  document.getElementById('mob1').style.visibility="visible";
	  document.getElementById('mob2').style.display="table-cell";
	  document.getElementById('mob2').style.visibility="visible";
 	  }else{
	  document.getElementById('compTD').colSpan="3";
	  document.getElementById('mob1').style.display="none";
	  document.getElementById('mob1').style.visibility="hidden";
	  document.getElementById('mob2').style.display="none";
	  document.getElementById('mob2').style.visibility="hidden"; 		  
 	  }
}
function showSim()
{
 	  if(document.getElementById("cmp").value=="Yes"){
 	  document.getElementById('compSim').colSpan="1";
	  document.getElementById('sim1').style.display="table-cell";
	  document.getElementById('sim1').style.visibility="visible";
	  document.getElementById('sim2').style.display="table-cell";
	  document.getElementById('sim2').style.visibility="visible";
 	  }else{
	  document.getElementById('compSim').colSpan="3";
	  document.getElementById('sim1').style.display="none";
	  document.getElementById('sim1').style.visibility="hidden";
	  document.getElementById('sim2').style.display="none";
	  document.getElementById('sim2').style.visibility="hidden"; 		  
 	  }
}
</script>

</head>
<body onload="hiddenTables(document.form.requestForCheck);intunedisplay(document.form.onintune);showMob();showSim();showTR1();hideTR1();">
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="DomainUserAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cnB=null,cnH=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,stB=null,stH=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rsB=null,rsH=null;
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
System.out.println("-------------------------------------");
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");

%>

<%//form1_it_clearance
 //String form1_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,d_resignation=null,d_reliving=null;
//String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
//String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;

//form2_domain
String form2_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null,reqBranch=null,emp_type=null,emp_contract_type=null,reqFor=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,group=null;
String req = request.getParameter(request.getParameter("form_no"));
String values[] = req.split(" -");
System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
//System.out.println("val 2 : "+values[1].replaceAll(" ", ""));
req = values[0].replaceAll(" ", "");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from neinapplicationform WHERE applicationNo='"+req+"'"); 
while(rs100.next())
{
	    form2_no = rs100.getString("applicationNo");
	    f_date = rs100.getString("applicationDate");
	    idextend = rs100.getString("idextend");
	    branch = rs100.getString("branch");
	    depart = rs100.getString("department");
	    full_name = rs100.getString("full_name");
	    designation = rs100.getString("designation");
	    scopeOfWork = rs100.getString("scope_Of_Work");
	    emp_code = rs100.getString("employee_code");
	    reporting_officer = rs100.getString("report_officer");
	    requestOption = rs100.getString("request_type");
	    requestBy = rs100.getString("requested_by");
	    remarks = rs100.getString("neinRemarks");
	    reqBranch = rs100.getString("requested_branch");
	    emp_type = rs100.getString("emp_type");
	    emp_contract_type = rs100.getString("emp_contract_type");
	    reqFor = rs100.getString("requestFor");
	   

	 i_name = rs100.getString("i_name");
	 i_desg = rs100.getString("i_desg");
	 i_city = rs100.getString("i_city");
	 i_b_no = rs100.getString("i_b_no");
	 i_admin = rs100.getString("i_admin");
	 i_email_id = rs100.getString("i_email_id");


	 desg = rs100.getString("desg");
	 emp = rs100.getString("emp");
	 mail = rs100.getString("mail");
//	group = rs100.getString("ITcreated");
	
}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<br /><br />
<center>
 <table width="900" border="1" align="center" style="border-color: white;">
<tr>
<td align="center" style="border-color: white;">
<img src="../../images/faviconnnnn.ico" height="25" width="25" /> 
<font size="5" style="position: static;">
NIPPON EXPRESS (INDIA) PRIVATE LIMITED
</font>
</td>
</tr>
</table>
</center>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;"><center><font size="3">
		<b><label>
		APPLICATION FORM FROM EMPLOYEE</label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=Name%>" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="hidden" name="i_city" value="<%=city%>" />
		<input type="hidden" name="i_b_no" value="<%=b_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form1_no" value="<%=form2_no%>" />
		<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
		</td>
		
	</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
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

<%



cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

cnB=con.getConnection2();
stB=cnB.createStatement();
rsB=stB.executeQuery("select m_b_name,m_b_location from branch_master_main where m_b_no='"+reqBranch+"' ORDER BY m_b_name Asc");
if(rsB.next()){
	reqBranch=rsB.getString("m_b_name");
}

String emailDomain=null,employeeType=null,reqMailID=null,mobIntune=null,mobileNo=null,imei1=null,imei2=null,domainRemarks=null,bioRemarks=null,folderRemarks=null;
String internetReqType=null,internetRemarks=null,newinsBranchCode=null,newinsOpCode=null,newinsRequest=null,newinsRemarks=null,nexasCompCode=null,nexasCCName=null;
String nexasCCCode=null,nexasOPRange=null,nexasReqType=null,nexasOptionalMenu=null,nexasRemarks=null,gsnetBranchCode=null,gsnetDivName=null,gsnetPrimaryDiv=null;
String gsnetUserRole=null,gsnetRemarks=null,internalApplication=null,internalRemarks=null,usbAccessFor=null,usbDetails=null,usbRemarks=null,vpnDomainID=null,changesGSNet=null,prevBRCodesGSNet=null,prevDivGSNet=null,prevPDivGSNet=null,prevRoleGSNet=null;
String vpnEmailID=null,vpnMPLS=null,group_name=null,mailIDCreated=null,intuneAccessProvided=null,emailRemarks=null,passChan=null,chanReqBio=null,selBioBranches=null,changesNewins=null,previousBranchesNewins=null;
String compProv=null,makemodel=null,otherRemarks=null,hardRemarks=null,compProvSimCard=null,compProvSimNumber=null,makeAndModel=null,simCard=null,simNo=null,project=null,warehouse=null,glowRemarks=null;
cnH=con.getConnection2();
stH=cnH.createStatement();
rsH=stH.executeQuery("select * from neinapplicationform_requestfor where app_no='"+req+"' ORDER BY req_id Asc");
while(rsH.next()){
	emailDomain=rsH.getString("emailDomain")==null?"":rsH.getString("emailDomain");
	employeeType=rsH.getString("employeeType")==null?"":rsH.getString("employeeType");
	reqMailID=rsH.getString("reqMailID")==null?"":rsH.getString("reqMailID");
	mobIntune=rsH.getString("mobIntune")==null?"":rsH.getString("mobIntune");
	mobileNo=rsH.getString("mobileNo")==null?"":rsH.getString("mobileNo");
	imei1=rsH.getString("imei1")==null?"":rsH.getString("imei1");
	imei2=rsH.getString("imei2")==null?"":rsH.getString("imei2");
	group_name=rsH.getString("group_name")==null?"":rsH.getString("group_name");
	mailIDCreated=rsH.getString("mailIDCreated")==null?"":rsH.getString("mailIDCreated");
	intuneAccessProvided=rsH.getString("intuneAccessProvided")==null?"":rsH.getString("intuneAccessProvided");
	emailRemarks=rsH.getString("emailRemarks")==null?"":rsH.getString("emailRemarks");
	passChan=rsH.getString("passReset")==null?"":rsH.getString("passReset");
	domainRemarks=rsH.getString("domainRemarks")==null?"":rsH.getString("domainRemarks");
	chanReqBio=rsH.getString("chanReqBio")==null?"":rsH.getString("chanReqBio");
	selBioBranches=rsH.getString("selBioBranches")==null?"0":rsH.getString("selBioBranches");
	bioRemarks=rsH.getString("bioRemarks")==null?"":rsH.getString("bioRemarks");
	folderRemarks=rsH.getString("folderRemarks")==null?"":rsH.getString("folderRemarks");
	internetReqType=rsH.getString("internetReqType")==null?"":rsH.getString("internetReqType");
	internetRemarks=rsH.getString("internetRemarks")==null?"":rsH.getString("internetRemarks");
	newinsBranchCode=rsH.getString("newinsBranchCode");
	newinsOpCode=rsH.getString("newinsOpCode")==null?"":rsH.getString("newinsOpCode");
	newinsRequest=rsH.getString("newinsRequest")==null?"":rsH.getString("newinsRequest");
	newinsRemarks=rsH.getString("newinsRemarks")==null?"":rsH.getString("newinsRemarks");
	nexasCompCode=rsH.getString("nexasCompCode")==null?"":rsH.getString("nexasCompCode");
	nexasCCName=rsH.getString("nexasCCName")==null?"":rsH.getString("nexasCCName");
	nexasCCCode=rsH.getString("nexasCCCode")==null?"":rsH.getString("nexasCCCode");
	nexasOPRange=rsH.getString("nexasOPRange")==null?"":rsH.getString("nexasOPRange");
	nexasReqType=rsH.getString("nexasReqType")==null?"":rsH.getString("nexasReqType");
	nexasOptionalMenu=rsH.getString("nexasOptionalMenu")==null?"":rsH.getString("nexasOptionalMenu");
	nexasRemarks=rsH.getString("nexasRemarks")==null?"":rsH.getString("nexasRemarks");
	gsnetBranchCode=rsH.getString("gsnetBranchCode");
	gsnetDivName=rsH.getString("gsnetDivName");
	gsnetPrimaryDiv=rsH.getString("gsnetPrimaryDiv");
	gsnetUserRole=rsH.getString("gsnetUserRole");
	gsnetRemarks=rsH.getString("gsnetRemarks")==null?"":rsH.getString("gsnetRemarks");
	internalApplication=rsH.getString("internalApplication")==null?"":rsH.getString("internalApplication");
	internalRemarks=rsH.getString("internalRemarks")==null?"":rsH.getString("internalRemarks");
	usbAccessFor=rsH.getString("usbAccessFor")==null?"":rsH.getString("usbAccessFor");
	usbDetails=rsH.getString("usbDetails")==null?"":rsH.getString("usbDetails");
	usbRemarks=rsH.getString("usbRemarks")==null?"":rsH.getString("usbRemarks");
	vpnDomainID=rsH.getString("vpnDomainID")==null?"":rsH.getString("vpnDomainID");
	vpnEmailID=rsH.getString("vpnEmailID")==null?"":rsH.getString("vpnEmailID");
	vpnMPLS=rsH.getString("vpnMPLS")==null?"":rsH.getString("vpnMPLS");
	compProv=rsH.getString("CompanyProvMobile")==null?"":rsH.getString("CompanyProvMobile");
	makemodel=rsH.getString("makeAndModel")==null?"":rsH.getString("makeAndModel");
	compProvSimCard=rsH.getString("compProvSimCard")==null?"":rsH.getString("compProvSimCard");
	compProvSimNumber=rsH.getString("compProvSimNumber")==null?"":rsH.getString("compProvSimNumber");
	hardRemarks=rsH.getString("hardPenRemarks")==null?"":rsH.getString("hardPenRemarks");
	otherRemarks=rsH.getString("otherAssetRemarks")==null?"":rsH.getString("otherAssetRemarks");
	project=rsH.getString("glowProject")==null?"":rsH.getString("glowProject");
	warehouse=rsH.getString("glowWarehouse")==null?"":rsH.getString("glowWarehouse");
	glowRemarks=rsH.getString("glowRemarks")==null?"":rsH.getString("glowRemarks");
	changesNewins=rsH.getString("changesNewins")==null?"":rsH.getString("changesNewins");
	previousBranchesNewins=rsH.getString("previousBranchesNewins")==null?"":rsH.getString("previousBranchesNewins");
	changesGSNet=rsH.getString("changesGSNet")==null?"":rsH.getString("changesGSNet");
	prevBRCodesGSNet=rsH.getString("prevBRCodesGSNet")==null?"":rsH.getString("prevBRCodesGSNet");
	prevDivGSNet=rsH.getString("prevDivGSNet")==null?"":rsH.getString("prevDivGSNet");
	prevPDivGSNet=rsH.getString("prevPDivGSNet")==null?"":rsH.getString("prevPDivGSNet");
	prevRoleGSNet=rsH.getString("prevRoleGSNet")==null?"":rsH.getString("prevRoleGSNet");
}

String selBioBranches1="";
if(!selBioBranches.equalsIgnoreCase("") && !selBioBranches.equalsIgnoreCase(null)) {
rsH=stH.executeQuery("select m_b_name from branch_master_main where m_b_no in ("+selBioBranches+") ORDER BY m_b_name Asc");
while(rsH.next()){
	selBioBranches1 += rsH.getString(1)+", ";
}
}
if(!selBioBranches1.equals("")){
	selBioBranches1 = selBioBranches1.substring(0,selBioBranches1.length()-2);
}

String nexasReqType1 = "";
if(nexasReqType.equalsIgnoreCase("HOAcUser")){
	nexasReqType1 = "HO Acounting User";
}if(nexasReqType.equalsIgnoreCase("BRAcUser")){
	nexasReqType1 = "Branch Acounting User";
}if(nexasReqType.equalsIgnoreCase("ITUser")){
	nexasReqType1 = "IT User";
}if(nexasReqType.equalsIgnoreCase("RepoDispOnly")){
	nexasReqType1 = "Report display only User";
}

String nexasOptionalMenu1 = "";
if(nexasOptionalMenu.contains("paymentProp")) {
	nexasOptionalMenu1+= "Payment Proposal"+", ";
}if(nexasOptionalMenu.contains("paymentAppr")) {
	nexasOptionalMenu1+= "Payment Approval"+", ";	
}if(nexasOptionalMenu.contains("openCloseSch")) {
	nexasOptionalMenu1+= "Open/Close Schedule"+", ";
}if(nexasOptionalMenu.contains("voidCheq")) {
	nexasOptionalMenu1+= "Void Cheque"+", ";
}if(nexasOptionalMenu.contains("issueCheq")) {
	nexasOptionalMenu1+= "Issue Cheque"+", ";
}if(nexasOptionalMenu.contains("taxRepo")) {
	nexasOptionalMenu1+= "Tax Report"+", ";
}if(nexasOptionalMenu.contains("ExchangRateMa")) {
	nexasOptionalMenu1+= "Exchange Rate Maintainance"+", ";
}if(nexasOptionalMenu.contains("offsetAc")) {
	nexasOptionalMenu1+= "Offset Account"+", ";
}if(nexasOptionalMenu.contains("addfreeMaster")) {
	nexasOptionalMenu1+= "Addfree master Maintainance"+", ";
}if(nexasOptionalMenu.contains("paymentOpeBranch")) {
	nexasOptionalMenu1+= "Payment operation of branch"+", ";
}if(nexasOptionalMenu.contains("batchInput")) {
	nexasOptionalMenu1+= "Batch Input"+", ";
}if(nexasOptionalMenu.contains("SEPABACS")) {
	nexasOptionalMenu1+= "SEPA.BACS data Download"+", ";
}

if(!nexasOptionalMenu1.equals("")){
	nexasOptionalMenu1 = nexasOptionalMenu1.substring(0, nexasOptionalMenu1.length()-2);
}

if(!newinsBranchCode.equals("")){	
newinsBranchCode=newinsBranchCode.substring(0,newinsBranchCode.length()-1);
}
if(!previousBranchesNewins.equals("")){	
previousBranchesNewins=previousBranchesNewins.substring(0,previousBranchesNewins.length()-1);
}
if(!internalApplication.equals("")){	
internalApplication=internalApplication.substring(0,internalApplication.length()-1);
}

%>	 
		
	<table width="895">
	<!-- <tr>
	<td ><font size="3">
		<b><center><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label> </center>
		</b></font></td>
	</tr> -->
<tr>
<td  style="text-align: right;width: 215px; " bgcolor="grey" id="hiderow">NAME:</td>
<td style="text-align:left;" bgcolor="grey" id="hiderow" colspan="3"><input name="branch" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<td  style="text-align: right;width: 215px; " bgcolor="grey" id="hiderow">DESIGNATION :</td>
<td style="text-align:left;" bgcolor="grey" id="hiderow" colspan="3"><input name="branch" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" bgcolor="grey" colspan="3"><input name="branch" value="<%=form2_no%>" size="31" readonly="readonly"/> </td>
</tr>	
<%
if(!emp_contract_type.equalsIgnoreCase("Contract")){
%>
<tr>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="31" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
</tr>
<tr>
<td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" size="31" value="<%=depart%>" readonly="readonly"/>
 
					</td> 
</tr>


<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" size="31" value="<%=designation%>" readonly="readonly"/></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" size="31" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>


</tr>
<tr>
<td  style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;">

<input type="text"   name="d_resignation" size="31" value="<%=scopeOfWork%>" readonly="readonly"/>

</td>

<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  name="d_reliving" size="31" value="<%=requestBy%>" readonly="readonly"/>
	
		</td> 					        
</tr>
<tr>
<td style="text-align: right;">Employee Type :</td>
<td style="text-align:left;"><input type="text" name="d_resignation" size="31" value="<%=emp_type%>"readonly="readonly" /></td>
<td style="text-align: right;">Employee Contract Type :</td>
<td style="text-align:left;"><input type="text" name="d_reliving" size="31" value="<%=emp_contract_type%>" readonly="readonly" /></td>				        
</tr>
<tr>
<td align="right">Request  :</td>
<td > 
     <input style="" type ="text" name = "requestOption" size="31" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
<td align="right">Requested Branch  :</td>
<td style="text-align:left;"><input style="" type ="text" size="31" name = "requestOption" readonly="readonly" value ="<%=reqBranch%>" id=""/></td>
 </tr>
<%}else{%>
<tr>
<td  style="text-align: right;">Employee Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
<td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
</tr>
<tr>
<td  style="text-align: right;width: 175px;">Department :</td>
<td style="text-align:left;"><input name="depart" size="31" value="<%=depart%>" readonly="readonly"/></td> 
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" size="31" value="<%=designation%>" readonly="readonly"/></td>
</tr>
<tr>
<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" size="31" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>
<td  style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;"><input type="text"   name="d_resignation" size="31" value="<%=scopeOfWork%>" readonly="readonly"/></td>
</tr>
<tr>
<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;"><input type="text"  name="d_reliving" size="31" value="<%=requestBy%>" readonly="readonly"/></td>
<td style="text-align: right;">Employee Contract Type :</td>
<td style="text-align:left;"><input type="text" name="d_reliving" size="31" value="<%=emp_contract_type%>" readonly="readonly" /></td>				        
</tr>
<tr>
<td align="right">Request  :</td>
<td colspan="3"><input style="" type ="text" name = "requestOption" size="31" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
</tr>
<%}%>
</table>

<br>
<%
String chk1=null,chk2=null,chk3=null,chk4=null,chk5=null,chk6=null,chk7=null,chk8=null,chk9=null,chk10=null,chk11=null,chk12=null,chk13=null,chk14=null;
String[] reqFor1 = reqFor.split(",");
for(int i=0;i<reqFor1.length;i++){
	if(reqFor1[i].trim().equalsIgnoreCase("Email ID")){
		chk1="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Domain Account")){
		chk2="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Biometric / Access Card")){
		chk3="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Shared Folder")){
		chk4="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Internet Access / FTP Access")){
		chk5="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("NEWINS")){
		chk6="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("NExAS")){
		chk7="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("GS-NET")){
		chk8="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("Internal Application")){
		chk9="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("USB Access")){
		chk10="checked";
	}	
	if(reqFor1[i].trim().equalsIgnoreCase("VPN Access")){
		chk11="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("HardDisk / PenDrive")){
		chk12="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("Any Other Asset")){
		chk13="checked";
	}
	if(reqFor1[i].trim().equalsIgnoreCase("NEx-GLOW")){
		chk14="checked";
	}
}
%>
<table width="895">
<tr>
<td id="req" rowspan="3" style="text-align:right;width: 15%;">Request For :</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk1%> disabled="disabled" name="requestForCheck" id="requestForCheck_email" value="Email ID">Email ID</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk2%> disabled="disabled" name="requestForCheck" id="requestForCheck_dom" value="Domain Account">Domain Account</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk3%> disabled="disabled" name="requestForCheck" id="requestForCheck_bio" value="Biometric / Access Card">Biometric / Access Card</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk4%> disabled="disabled" name="requestForCheck" id="requestForCheck_sha" value="Shared Folder">Shared Folder</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk5%> disabled="disabled" name="requestForCheck" id="requestForCheck_int" value="Internet Access / FTP Access">Internet Access / FTP Access</td>
<tr>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk6%> disabled="disabled" name="requestForCheck" id="requestForCheck_newins" value="NEWINS">NEWINS</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk7%> disabled="disabled" name="requestForCheck" id="requestForCheck_nexas" value="NExAS">NExAS</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk8%> disabled="disabled" name="requestForCheck" id="requestForCheck_gs" value="GS-NET">GS-NET</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk9%> disabled="disabled" name="requestForCheck" id="requestForCheck_internal" value="Internal Application">Internal Application</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk10%> disabled="disabled" name="requestForCheck" id="requestForCheck_usb" value="USB Access">USB Access</td>
</tr>
<tr>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk11%> disabled="disabled" name="requestForCheck" id="requestForCheck_vpn" value="VPN Access">VPN Access</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" name="requestForCheck" <%=chk12%> disabled="disabled" id="requestForCheck_hard" onclick="reqFor(this)" value="HardDisk / PenDrive">HardDisk / PenDrive</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" name="requestForCheck" <%=chk13%> disabled="disabled" id="requestForCheck_assets" onclick="reqFor(this)" value="Any Other Asset">Any Other Asset</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk14%> disabled="disabled" name="requestForCheck" id="requestForCheck_glow" value="NEx-GLOW">NEx-GLOW</td>
<td colspan="1"></td>
</tr>
</tr>
</table>
<br>
<div id="email_details" style="display: none;visibility: hidden;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" id="emailRow" rowspan="6" style="width:15%"><font size="3"><b>Email ID</b></font></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Email Domain :</td>
<td align="left" style="width: 20%;"> <input type="hidden" name="emaildomain1" id="idemaildomain1">
<input type="text" value="<%=emailDomain%>" style="width:100%;" readonly>  
</td>
<%-- <td style="text-align: right;width: 20%;"><font color=red>*</font>Group :</td>
<td style="text-align: left;width: 20%;"> <input type="hidden" name="group1" id="idgroup1">
<select name="group" id="idgroup" style="width:80%;">      
<option value="">Select</option>
<%while(rsGR.next()){%>     
<option value="<%=rsGR.getString(1)%>"><%=rsGR.getString(1)%></option> 
<%}%>   
</select>  
</td> --%>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Employee Type :</td>
<td  style="text-align: left;width: 20%;"> <input type="hidden" name="emptype1" id="idemptype1">
<input type="text" value="<%=employeeType%>" style="width:100%;" readonly>
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Requested E-Mail Id :</td>
<td style="text-align:left;" colspan="3"><input type="text" value="<%=reqMailID%>" style="width:60%;" readonly/></td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided Mobile  :</td>
<td style="text-align:left;" colspan="3" id="compTD">
<input type="text" id="cmp" value="<%=compProv%>" readonly="readonly" style="width:100%;">
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="mob1"><font color=red>*</font>Mobile Make & Model  :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="mob2"><input type="text" name="makeModel" id="makeModel" value="<%=makemodel%>" style="width:100%;" readonly="readonly">
</td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided SIM Card:</td>
<td style="text-align:left;" colspan="3" id="compSim"><input type="text" name="simOption1" id="idSimOption1"  style="width:100%;" value="<%=compProvSimCard%>">
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="sim1"><font color=red>*</font>SIM Card Mobile Number :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="sim2"><input type="text" value="<%=compProvSimNumber%>"  style="width:100%;" name="simNo" id="simNo">
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Mobile Access (Intune)</td>
<td style="text-align:left;"><input type="text" value="<%=mobIntune%>" name="onintune" id="mobInt" readonly style="width:100%;">
</td>
<td style="text-align:right;display: none;" id="intuneYes"><font color=red>*</font>Mobile No. :</td>
<td style="text-align:left;display: none;" id="intuneYes11"><input type="text" value="<%=mobileNo%>" readonly style="width:100%;"/></td>
</tr>
<tr id="intuneYes1" style="display: none;">
<td style="text-align:center;" colspan="4" class="tdColor"><font color="red">*</font>IMEI No. ('s) :</td>		
</tr>
<tr id="intuneYes111" style="display: none;">
<td style="text-align:right;display: none;" id="intuneYes12" colspan="1"><font color="red">*</font>IMEI No 1 :</td>
<td style="text-align:left;display: none;" id="intuneYes13"><input type="text" value="<%=imei1%>" readonly style="width:100%;"/></td>		
<td style="text-align:right;display: none;" id="intuneYes2" colspan="1"><font color="red">*</font>IMEI No 2 :</td>
<td style="text-align:left;display: none;" id="intuneYes21" colspan="1"><input type="text" value="<%=imei2%>" readonly style="width:100%;"/></td>
</tr>
<tr>
<td align="right"  style="width:20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left"  style="width:20%;" colspan="3"><textarea name="remarksDom" id="domainRem" rows="3" cols="30" maxlength="199" readonly value=""><%=emailRemarks%></textarea></td>
</tr>
</table>
<br />
</div>
<%-- 
<div id="email_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" id="emailRow" rowspan="6"  style="width:15%"><font size="3"><b>Email ID</b></font></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Email Domain :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=emailDomain%>" style="width:100%;" readonly>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Group :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=group_name%>" style="width:100%;" readonly>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Employee Type :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=employeeType%>" style="width:100%;" readonly>
<td style="text-align: right;width: 20%;"><font color=red>*</font>E-Mail ID Created :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=mailIDCreated%>" style="width:100%;" readonly>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Requested E-Mail Id :</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=reqMailID%>" style="width:100%;" readonly/></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Intune Access Provided:</td>
<td style="text-align: left;width: 20%;"><input type="text" value="<%=intuneAccessProvided%>" style="width:100%;" readonly/></td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided Mobile  :</td>
<td style="text-align:left;" id="compTD">
<input type="text" id="cmp" value="<%=compProv%>" readonly="readonly" style="width:100%;">
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="mob1"><font color=red>*</font>Mobile Make & Model  :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="mob2"><input type="text" name="makeModel" id="makeModel" value="<%=makemodel%>" style="width:100%;" readonly="readonly">
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Mobile Access (Intune)</td>
<td style="text-align:left;"><input type="text" value="<%=mobIntune%>" name="onintune" id="mobInt" readonly style="width:100%;"></td>
<td style="text-align:right;display: none;" id="intuneYes"><font color=red>*</font>Mobile No. :</td>
<td style="text-align:left;display: none;" id="intuneYes11"><input type="text" value="<%=mobileNo%>" readonly style="width:100%;"/></td>
</tr>
<tr id="intuneYes1" style="display: none;">
<td style="text-align:center;" colspan="4" class="tdColor"><font color="red">*</font>IMEI No. ('s) :</td>		
</tr>
<tr id="intuneYes111" style="display: none;">
<td style="text-align:right;display: none;" id="intuneYes12" colspan="1"><font color="red">*</font>IMEI No 1 :</td>
<td style="text-align:left;display: none;" id="intuneYes13"><input type="text" value="<%=imei1%>" readonly style="width:100%;"/></td>		
<td style="text-align:right;display: none;" id="intuneYes2" colspan="1"><font color="red">*</font>IMEI No 2 :</td>
<td style="text-align:left;display: none;" id="intuneYes21" colspan="1"><input type="text" value="<%=imei2%>" readonly style="width:100%;"/></td>
</tr>
<tr>
<td align="right"  style="width:20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left"  style="width:20%;" colspan="3"><textarea name="remarksDom" id="domainRem" rows="3" cols="30" maxlength="199" readonly value=""><%=emailRemarks%></textarea></td>
</tr>
</table>
<br />
</div>
--%>
<%
String colorBG="",bgcolor="",rowDom="";
if(passChan.equalsIgnoreCase("Yes")){
	colorBG = "#9AA";
	bgcolor = "#9AA";
	rowDom = "3";
}else{
	colorBG = "";
	bgcolor = "grey";
	rowDom = "2";
}
%>
<div id="dom_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor%>" align="center" rowspan="<%=rowDom%>" style="width:15%"><font size="3"><b>Domain Account</b></font></td>
</tr>
<%if(passChan.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right;width:20%;background-color:<%=colorBG%>;"><font color="red">*</font>Password Reset :</td>
<td style="text-align:left;background-color:<%=colorBG%>;" colspan="3">
<input type="text" name="passChan" value="<%=passChan%>" readonly/>
</td>
</tr>
<%}%>
<tr>
<td style="text-align: right;width: 20%;background-color:<%=colorBG%>;"><font color="red">*</font>Remarks :</td>
<td style="text-align:left;width: 60%;background-color:<%=colorBG%>;"><textarea name="remarksDom" rows="3" cols="30" id="domainRem" maxlength="199" readonly><%=domainRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<%
String colorBG1="",bgcolor1="",rowBio="";
if(chanReqBio.equalsIgnoreCase("Yes")){
	colorBG1 = "#9AA";
	bgcolor1 = "#9AA";
	rowBio	 = "3";
}else{
	colorBG1 = "";
	bgcolor1 = "grey";
	rowBio	 = "2";
}
%>
<div id="bio_details" style="display: none;">
<table id="bio_details" width="895">
<tr>
<td bgcolor="<%=bgcolor1%>" align="center" rowspan="<%=rowBio%>" style="width:15%"><font size="3"><b>Biometric / Access Card</b></font></td>
</tr>
<%if(chanReqBio.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right; width: 20%;background-color: <%=colorBG1%>;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left; width: 20%;background-color: <%=colorBG1%>;">
<input type="text" name="changeBio" value="<%=chanReqBio%>" readonly/>
</td>
<td style="text-align:right;background-color: <%=colorBG1%>;"><font color="red">*</font>Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG1%>;">
<input type="text" size="30" name="selBranch" value="<%=selBioBranches1%>" readonly/>
</td>
</tr>
<%}%>
<tr>
<td align="right" style="width: 20%;background-color: <%=colorBG1%>;"><font color="red">*</font>Remarks :</td>
<td align="left" style="width: 60%;background-color: <%=colorBG1%>;" colspan="3"><textarea name="bioRemarks" rows="3" cols="30" id="bioRemarks" maxlength="199" readonly><%=bioRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="sha_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Shared Folder Access</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="sharedRemarks" rows="3" cols="30" id="shareRemarks" maxlength="199" readonly><%=folderRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="int_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internet Access / FTP Access</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Request Type :</td>
<td colspan="3" style="font-weight:bold;font-style:italic;text-align:left;width: 20%;"><input size="31" type="text" value="<%=internetReqType%>" readonly></td>
</td>
</tr>
<tr>
<td align="right" colspan="1" style="width:20%"><font color="red">*</font>Remarks :</td>
<td align="left" colspan="3" style="width:60%"><textarea name="internetRem" rows="3" cols="30" id="idinternetRem" maxlength="199" readonly><%=internetRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<%
String colorBG2="",bgcolor2="",rowNEW="";
if(changesNewins.equalsIgnoreCase("Yes")){
	colorBG2 = "#9AA";
	bgcolor2 = "#9AA";
	rowNEW	 = "6";
}else{
	colorBG2 = "";
	bgcolor2 = "grey";
	rowNEW	 = "5";
}
%>
<div id="new_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor2%>" align="center" rowspan="<%=rowNEW%>" style="width:15%"><font size="3"><b>NEWINS</b></font></td>
</tr>
<%if(changesNewins.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right; width: 20%;background-color: <%=colorBG2%>;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;background-color: <%=colorBG2%>;">
<input type="text" name="changeNew" value="<%=changesNewins%>" id="changeNew" readonly/>
</td>
<td style="text-align:right;width: 20%;background-color: <%=colorBG2%>;" colspan="1"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG2%>;">
<input type="text" name="prevNewinBr" id="prevNew" value="<%=previousBranchesNewins%>" readonly>
</td>
</tr>
<%}else{%>
<input type="hidden" name="changeNew" value="" id="changeNew" readonly/>
<%}%>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Requested Branch Code :</td>
<td align="left" style="width: 60%;background-color: <%=colorBG2%>;" colspan="3"><input type="text" name="reqBrCode" size=50 id="idreqBranch" value="<%=newinsBranchCode%>" readonly/>
</td> 
</tr>
<tr>
<td style="text-align: right;width:20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Requested NEWIN's ID / Operator Code :</td>
<td style="text-align:left;width:60%;background-color: <%=colorBG2%>;" colspan="3"><input type="text" name="newinCode" id="ncode" maxlength="44" size="29" value="<%=newinsOpCode%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:60%;background-color: <%=colorBG2%>;" colspan="3"><input type="text" name="newinsRequest" value="<%=newinsRequest%>" readonly></td>
</tr>
<tr style="visibility: hidden;display: none;" id="idDelete">
<td style="text-align: right;width: 20%;background-color: <%=colorBG2%>;"><font color=red>*</font>Remarks :</td>
<td style="text-align: left;width: 20%;background-color: <%=colorBG2%>;" colspan="3"><textarea name="newRem" rows="3" cols="30" id="newRem" maxlength="99" title="Remarks 100 characters" readonly><%=newinsRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="nex_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="8" style="width:15%"><font size="3"><b>NExAS</b></font></td>
<td align="right" colspan="1" style="width:20%;"><font color="red">*</font>Company Code :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" size="31" value="<%=nexasCompCode%>" readonlu></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Cost Center Name:</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" size="31" value="<%=nexasCCName%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Cost Center Code:</td>
<td style="text-align: left;width: 60%;" colspan="3"><input size="31" type="text" name="costCCode" id="idcostCCode" value="<%=nexasCCCode%>" size="10" maxlength="44" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Operation range:</td>
<td style="text-align: left;width: 60%;" colspan="3"><input size="31" type="text" name="costOPRange"	id="idcostOPRange" value="<%=nexasOPRange%>" size="10" maxlength="44" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Request Type <font color=red>(Please select first)</font></td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" size="31" value="<%=nexasReqType1%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1">Optional menu</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea rows="3" cols="65" readonly><%=nexasOptionalMenu1%></textarea></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="nexasRem" rows="3" cols="30" id="idnexasRem" maxlength="199" readonly><%=nexasRemarks%></textarea></td>
</tr>
<tr>
<td colspan="10">
<font color=red><b><h3>Note :<br /> 
       *If the user will use TV menu in NExAS , tell HO Admin to create employee master please. <br />
       *If you want to be in  charge of other Company or Branch or Region fill in "Operation Range" or "Display Range" please.<br />
       *Please apply through H.O Accounting manager. <br />
       *If you want to change your status, please submit your applicatiobs each user.<br />
       (e.g. If you want to 3 create user and 5 delete user, please submit 8 user application for each user.)</b><br /></h3>
</font> 
</td>
</tr>
</table>
<br />
</div>


<%
String colorBG3="",bgcolor3="",rowGS="";
if(changesGSNet.equalsIgnoreCase("Yes")){
	colorBG3 = "#9AA";
	bgcolor3 = "#9AA";
	rowGS	 = "9";
}else{
	colorBG3 = "";
	bgcolor3 = "grey";
	rowGS	 = "6";
}
%>
<div id="gs_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor3%>" align="center" rowspan="<%=rowGS%>" style="width:15%"><font size="3"><b>GS-NET</b></font></td>
<%if(changesGSNet.equalsIgnoreCase("Yes")){%>
<tr>
<td style="text-align:right; width: 20%;background-color: <%=colorBG3%>;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;background-color: <%=colorBG3%>;" colspan="3">
<input type="text" name="changeGS" value="<%=changesGSNet%>" id="changeGS" readonly/>
</td>
</tr>
<tr>
<td style="text-align:righ;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="changesGSNet" id="changesGSNet" rows="3" value="<%=prevBRCodesGSNet%>" readonly><%=prevBRCodesGSNet%></textarea>
</td>
<td style="text-align:right;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="prevDivGSNet" id="prevDivGSNet" rows="3" value="<%=prevDivGSNet%>" readonly><%=prevDivGSNet%></textarea>
</td>
</tr>
<tr>
<td style="text-align:right;width: 20%;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="prevPDivGSNet" id="prevPDivGSNet" rows="3" value="<%=prevPDivGSNet%>" readonly><%=prevPDivGSNet%></textarea>
</td>
<td style="text-align:right;width: 20%;background-color: <%=colorBG3%>;"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;background-color: <%=colorBG3%>;">
<textarea type="text" name="prevRoleGSNet" id="prevRoleGSNet" rows="3" value="<%=prevRoleGSNet%>" readonly><%=prevRoleGSNet%></textarea>
</td>
</tr>
<%}%>
<tr>    
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;" colspan="1"><font color=red>*</font>Requested GSNET Branch Code :</td>
<td style="text-align: left;width: 60%;background-color: <%=colorBG3%>;" colspan="3" style="width:62%"><textarea rows="3" cols="65" readonly><%=gsnetBranchCode%></textarea></td>
</tr>

<tr>     
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;" colspan="1"><font color=red>*</font>Requested Division Name :</td>
<td style="text-align: left;width: 20%;background-color: <%=colorBG3%>;" colspan="3"><input type="text" size="31" style="width:75%;" value="<%=gsnetDivName%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;" colspan="1"><font color=red>*</font>Requested Primary Division:</td>
<td style="text-align: left;width: 20%;background-color: <%=colorBG3%>;" colspan="3"><input type="text" size="31" style="width:75%;" value="<%=gsnetPrimaryDiv%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;" colspan="1"><font color=red>*</font>Requested User Role  :</td>
<td style="text-align: left;width: 20%;background-color: <%=colorBG3%>;" colspan="3"><input type="text" size="31" style="width:75%;" value="<%=gsnetUserRole%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;background-color: <%=colorBG3%>;" colspan="1"><font color=red>*</font>Remarks  :</td>
<td style="text-align: left;width: 60%;background-color: <%=colorBG3%>;" colspan="3"><textarea name="gsNetremarks" rows="3" cols="30" id="gsNetremarks" maxlength="199" title="Remarks 200 characters" readonly><%=gsnetRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="inter_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internal Application</b></font></td>
<td align="right" colspan="1" style="width:20%"><font color="red">*</font>Internal Application :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea rows="3" cols="65" readonly><%=internalApplication%></textarea>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="internalRem" rows="3" cols="30" id="idinternalRem" maxlength="199" readonly><%=internalRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="usb_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>USB Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>Access For :</td>
<td style="text-align: left;" style="width:60%" colspan="3"><input size="31" type="text" value="<%=usbAccessFor%>" readonly></td>
</tr>
<tr>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>USB Details:</td>
<td style="text-align: left;width:60%;" colspan="3"><input type="text"  size="31" name="dscNo" value="<%=usbDetails%>" id="dscNo" maxlength="44" readonly/></td>		
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks / Reason :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="usbRem" rows="3" cols="30" size="31" id="idUSBRem" maxlength="199" readonly><%=usbRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="vpn_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>VPN Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>Domain ID :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" name="domID" id="idDOMid" size="31" maxlength="44" value="<%=vpnDomainID%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Email ID :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" name="vpnEmail" id="idvpnEmail" size="31" maxlength="44" value="<%=vpnEmailID%>" readonly/></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>MPLS / NON MPLS :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" size="31" value="<%=vpnMPLS%>" readonly></td>
</tr>
</table>
<br />
</div>

<div id="hard_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>HardDisk / PenDrive</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="sharedRemarks" rows="3" cols="30" id="shareRemarks" maxlength="199" readonly><%=hardRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="asset_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Any Other Asset</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="sharedRemarks" rows="3" cols="30" id="shareRemarks" maxlength="199" readonly><%=otherRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<div id="glow_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>NEx-GLOW</b></font></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>Project :</td>
<td align="left" style="width: 60%;"><input type="text" name="project" id="project" value="<%=project%>" size="50" readonly></td>
</tr>
<tr>
<td align="right" style="width: 20%;"><font color="red">*</font>Ware-House :</td>
<td align="left" style="width: 60%;"><input type="text" name="warehouse" id="warehouse" value="<%=warehouse%>" size="50" readonly></td>
</tr>
<tr>
<td align="right" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left" colspan="3"><textarea name="glowRemarks" rows="3" cols="30" id="glowRemarks" maxlength="199" readonly><%=glowRemarks%></textarea></td>
</tr>
</table>
<br />
</div>

<br>
<br />
<table id="tableData" name="tableData" width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
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
	  String statusD=null;
	  rs1 = st1.executeQuery("select form2_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),mail from neinapplicationform_item WHERE form2_no='"+req+"' order by item_id asc"); 
	  while(rs1.next())
	  {
		  String form2_noD= rs1.getString(1);
		  String desgD= rs1.getString(2);
		  empD= rs1.getString(3);
		  statusD= rs1.getString(4);
		  String remarksD= rs1.getString(5);
		  String f_dateD= rs1.getString(6);
		  mailD= rs1.getString(7);
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
		<td bgcolor="white" width="100" class="fonter"><%=statusD%></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
	
	  </tr>
	  <%} %>
</table>




 
</br>
                                                                
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1" id="hiderow">&nbsp;&nbsp;
     <a href="javascript:history.back()">BACK</a>
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
     <td id="hiderow">&nbsp;&nbsp;<input type="button" id="btnShowSimple" value="HELP" />
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
      </table><br />
    <label style="text-align:center;">HR/Admin (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>GA(Branch)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>BM/GM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label>IT(HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT(HO)</label>
<br />

</form>	

</body>

</html>