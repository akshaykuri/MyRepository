<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="CON2.Connection2"%> 
<%@page import="CON2.CurrentTime"%>
<%@ include file="../../banner.jsp"%>
<jsp:useBean id="con" class="CON2.Connection2"/>
<jsp:useBean id="conLMS" class="CON2.ConnectionLMS"/>
<jsp:useBean id="currentTime" class="CON2.CurrentTime"/>
<jsp:useBean id="c2ITUtil1" class="CON2.C2ITUtils"/>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Check List</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<script language="javascript"   type="text/javascript" src="../../js/formApprovalColorChange.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<link rel='stylesheet' type='text/css' href="../../css/style.css" />
<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
	<!-- Help Page pop up starts  -->
<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
<script language="javascript" type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
<script language="javascript" type="text/javascript" src="../../js/onSubmitWait.js"></script>
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
}else{
	return false;
}
}

function validate()
{
	try{
	if(document.getElementById("sow").value=="" || document.getElementById("sow").value==null) 
	{
	     alert("Select Scope Of Work!");
	     document.getElementById("sow").focus();
	     return false;
	}
	if(document.form.employeeOption1.value!="Contract" && !document.getElementsByName("employeeOption")[0].checked && !document.getElementsByName("employeeOption")[1].checked) 
	{
	     alert("Select Employee Type \n\n Permanent or Probation");
	     document.getElementsByName("employeeOption")[0].focus();
	     return false;
	}
	if(!document.getElementsByName("requestOption")[0].checked && !document.getElementsByName("requestOption")[1].checked) 
	{
	     alert("Select Request \n\n New or Change");
	     document.getElementsByName("requestOption")[0].focus();
	     return false;
	}
	if((document.getElementsByName("requestForCheck")[0].checked==false && document.getElementsByName("requestForCheck")[0].disabled==false) && (document.getElementsByName("requestForCheck")[1].checked==false && document.getElementsByName("requestForCheck")[1].disabled==false) && (document.getElementsByName("requestForCheck")[2].checked==false && document.getElementsByName("requestForCheck")[2].disabled==false) && (document.getElementsByName("requestForCheck")[3].checked==false && document.getElementsByName("requestForCheck")[3].disabled==false) && (document.getElementsByName("requestForCheck")[4].checked==false && document.getElementsByName("requestForCheck")[4].disabled==false) && (document.getElementsByName("requestForCheck")[5].checked==false && document.getElementsByName("requestForCheck")[5].disabled==false) && (document.getElementsByName("requestForCheck")[6].checked==false && document.getElementsByName("requestForCheck")[6].disabled==false) && (document.getElementsByName("requestForCheck")[7].checked==false && document.getElementsByName("requestForCheck")[7].disabled==false) && (document.getElementsByName("requestForCheck")[8].checked==false && document.getElementsByName("requestForCheck")[8].disabled==false) && (document.getElementsByName("requestForCheck")[9].checked==false && document.getElementsByName("requestForCheck")[9].disabled==false) && (document.getElementsByName("requestForCheck")[10].checked==false && document.getElementsByName("requestForCheck")[10].disabled==false) && (document.getElementsByName("requestForCheck")[11].checked==false && document.getElementsByName("requestForCheck")[11].disabled==false) && (document.getElementsByName("requestForCheck")[12].checked==false && document.getElementsByName("requestForCheck")[12].disabled==false) && (document.getElementsByName("requestForCheck")[13].checked==false && document.getElementsByName("requestForCheck")[13].disabled==false)){
        alert("Select Request For!");
        document.getElementsByName("requestForCheck")[0].focus();
        return false;
    }
	//email id
    if((document.getElementsByName("requestForCheck")[0].value=="Email ID") && (document.getElementsByName("requestForCheck")[0].checked == true) && document.getElementsByName("requestForCheck")[0].disabled==false){
	if(document.getElementById("idemaildomain").value=="" || document.getElementById("idemaildomain").value==null) 
	{
	     alert("Select Email Domain!");
	     document.getElementById("idemaildomain").focus();
	     return false;
	}if(document.getElementById("idemptype").value=="" || document.getElementById("idemptype").value==null) 
	{
	     alert("Select Employee Type for Email ID!");
	     document.getElementById("idemptype").focus();
	     return false;
	}if(document.getElementById("idreqEmail").value=="" || document.getElementById("idreqEmail").value==null) 
	{
	     alert("Enter Requested Mail ID!");
	     document.getElementById("idreqEmail").focus();
	     return false;
	}
	if((document.getElementsByName("mobileOption")[0].checked==false) && (document.getElementsByName("mobileOption")[1].checked==false)){
        alert("Please Select Company Provided Mobile \n\n Yes or No!");
        document.getElementsByName("mobileOption")[0].focus();
        return false;
    }if((document.getElementById("makeModel").value=="" || document.getElementById("makeModel").value==null) && (document.form.mobileOption.value=="Yes"))
	{
	     alert("Enter Mobile Make and Model!");
	     document.getElementById("makeModel").focus();
	     return false;
	}if((document.getElementsByName("simOption")[0].checked==false) && (document.getElementsByName("simOption")[1].checked==false)){
        alert("Please Select Company Provided SIM Card \n\n Yes or No!");
        document.getElementsByName("simOption")[0].focus();
        return false;
    }if((document.getElementById("simNo").value=="" || document.getElementById("simNo").value==null) && (document.form.simOption.value=="Yes")) 
	{
	     alert("Enter SIM Card Mobile Number!");
	     document.getElementById("simNo").focus();
	     return false;
	}if((document.getElementsByName("intune")[0].checked==false) && (document.getElementsByName("intune")[1].checked==false)){
        alert("Please Select Mobile Access (Intune) \n\n Yes or No!");
        document.getElementsByName("intune")[0].focus();
        return false;
    }
	if((document.getElementById("idmobile").value=="" || document.getElementById("idmobile").value==null) && (document.form.intune.value=="Yes")) 
	{
	     alert("Enter Intune Mobile Number!");
	     document.getElementById("idmobile").focus();
	     return false;
	}if((document.getElementById("idimei1").value=="" || document.getElementById("idimei1").value==null) && (document.form.intune.value=="Yes")) 
	{
	     alert("Enter IMEI N0. 1!");
	     document.getElementById("idimei1").focus();
	     return false;
	}if((document.getElementById("idimei2").value=="" || document.getElementById("idimei2").value==null) && (document.form.intune.value=="Yes")) 
	{
	     alert("Enter IMEI No. 2!");
	     document.getElementById("idimei2").focus();
	     return false;
	}if(document.getElementById("remarksEmail").value=="" || document.getElementById("remarksEmail").value==null) 
	{
	     alert("Enter Email Remarks!");
	     document.getElementById("remarksEmail").focus();
	     return false;
	}
    }
    if((document.getElementsByName("requestForCheck")[1].value=="Domain Account") && (document.getElementsByName("requestForCheck")[1].checked == true) && document.getElementsByName("requestForCheck")[1].disabled==false){
   	if((document.getElementsByName("passChan")[0].checked==false) && (document.getElementsByName("passChan")[1].checked==false) && document.getElementById("domPass1").style.display!="none" && document.getElementById("domPass2").style.display!="none"){
		alert("Select Password Reset \n\n Yes / No!");
		document.getElementsByName("passChan")[0].focus();
		return false;
	}if((document.getElementById("domainRem").value==null) || (document.getElementById("domainRem").value=="")){
		alert("Enter Domain Remarks!");
		document.getElementById("domainRem").focus();
		return false;
	}
    }
    if((document.getElementsByName("requestForCheck")[2].value=="Biometric / Access Card") && (document.getElementsByName("requestForCheck")[2].checked == true) && document.getElementsByName("requestForCheck")[2].disabled==false){
	if((document.getElementsByName("changeBio")[0].checked==false) && (document.getElementsByName("changeBio")[1].checked==false) && document.getElementById("bioLoc").style.display!="none"){
		alert("Select Changes Required for \n\n Biometric / Access Card \n\n Yes / No!");
		document.getElementsByName("changeBio")[0].focus();
		return false;
	}
	if((document.getElementById("selBranch").value==null || document.getElementById("selBranch").value=="") && document.getElementById("bio1").style.display!="none" && document.getElementById("bio2").style.display!="none"){
		alert("Select Branch ('s)!");
		document.getElementById("selBranch").focus();
		return false;
	}
	if ((document.getElementById("bioRemarks").value==null)||(document.getElementById("bioRemarks").value=="")){
		alert("Enter Biometric / Access Card Remarks!");
		document.getElementById("bioRemarks").focus();
		return false;
	}
	}
    if((document.getElementsByName("requestForCheck")[3].value=="Shared Folder") && (document.getElementsByName("requestForCheck")[3].checked == true) && document.getElementsByName("requestForCheck")[3].disabled==false){
   	if ((document.getElementById("shareRemarks").value==null)||(document.getElementById("shareRemarks").value=="")){
   		alert("Enter Shared Folder Remarks!");
   		document.getElementById("shareRemarks").focus();
   		return false;
   	}
   	}
    if((document.getElementsByName("requestForCheck")[4].value=="Internet Access / FTP Access") && (document.getElementsByName("requestForCheck")[4].checked == true) && document.getElementsByName("requestForCheck")[4].disabled==false){
   	if((document.getElementsByName("requestTypeOption")[0].checked == false ) && (document.getElementsByName("requestTypeOption")[1].checked == false ) && (document.getElementsByName("requestTypeOption")[2].checked == false ) && (document.getElementsByName("requestTypeOption")[3].checked == false )){
		alert("Select Request Type Of Internet Access / FTP Access!");
		document.getElementsByName("requestTypeOption")[0].focus();
		return false;
	}
	if ((document.getElementById("idinternetRem").value==null)||(document.getElementById("idinternetRem").value=="")){
		alert("Enter Internet Access / FTP Access Remarks!");
		document.getElementById("idinternetRem").focus();
		return false;
	}
	}
    if((document.getElementsByName("requestForCheck")[5].value=="NEWINS") && (document.getElementsByName("requestForCheck")[5].checked == true) && document.getElementsByName("requestForCheck")[5].disabled==false){
	if((document.getElementsByName("changeNew")[0].checked==false) && (document.getElementsByName("changeNew")[1].checked==false) && document.getElementById("newLoc").style.display!="none"){
		alert("Select Changes Required for \n\n NEWINS \n\n Yes / No!");
		document.getElementsByName("changeNew")[0].focus();
		return false;
	}
	if ((document.getElementById("idreqBranch").value==null)||(document.getElementById("idreqBranch").value=="")){
		alert("Select Requested Branch Code!");
		document.getElementById("idreqBranch").focus();
		return false;
	}
	if ((document.getElementById("ncode").value==null)||(document.getElementById("ncode").value=="")){
		alert("Enter Operator Code!");
		document.getElementById("ncode").focus();
		return false;
	}
	if (checkAddress(document.getElementById("ncode").value)==false){
		document.getElementById("ncode").value="";
		alert("Invalid Code!");
		document.getElementById("ncode").focus();
		return false;
	}
	if ((document.getElementsByName("reqNew")[0].checked == false ) && (document.getElementsByName("reqNew")[1].checked == false )){
		alert("Select Status Of Request! \n \n New / Change");
		document.getElementsByName("reqNew")[0].focus();
		return false;
	}
	if (((document.getElementById("newRem").value==null)||(document.getElementById("newRem").value=="")) && (document.getElementsByName("reqNew")[1].checked == true)){
		alert("Enter NEWINS Remarks!");
		document.getElementById("newRem").focus();
		return false;
	} 
	}
    if((document.getElementsByName("requestForCheck")[6].value=="NExAS") && (document.getElementsByName("requestForCheck")[6].checked == true) && document.getElementsByName("requestForCheck")[6].disabled==false){
	if(document.getElementById("idcompCode").value=="" || document.getElementById("idcompCode").value==null)
	{
		alert("Select Company Code!");
		document.getElementById("idcompCode").focus();
		return false;
	}
	if(document.getElementById("idcostCName").value=="" || document.getElementById("idcostCName")==null)
	{
		alert("Select Cost Center Name!");
		document.getElementById("idcostCName").focus();
		return false;
	}
	if(document.getElementById("idcostCCode").value=="" || document.getElementById("idcostCCode").value==null)
	{
		alert("Enter Cost Center Code!");
		document.getElementById("idcostCCode").focus();
		return false;
	}
	if(document.getElementById("idcostOPRange").value=="" || document.getElementById("idcostOPRange").value==null)
	{
		alert("Enter Operation Range!");
		document.getElementById("idcostOPRange").focus();
		return false;
	}
	if((document.getElementsByName("userKind")[0].checked == false ) && (document.getElementsByName("userKind")[1].checked == false ) && (document.getElementsByName("userKind")[2].checked == false ) && (document.getElementsByName("userKind")[3].checked == false ) )
	{
	alert("Select Request Type option for NExAS!");
	document.getElementsByName("userKind")[0].focus();
	return false;
	}
	if ((document.getElementsByName("OptionalMenu[]")[0].checked == false ) && (document.getElementsByName("OptionalMenu[]")[1].checked == false ) && (document.getElementsByName("OptionalMenu[]")[2].checked == false ) && (document.getElementsByName("OptionalMenu[]")[3].checked == false )&& (document.getElementsByName("OptionalMenu[]")[4].checked == false ) && (document.getElementsByName("OptionalMenu[]")[5].checked == false ) && (document.getElementsByName("OptionalMenu[]")[6].checked == false ) && (document.getElementsByName("OptionalMenu[]")[7].checked == false ) && (document.getElementsByName("OptionalMenu[]")[8].checked == false ) && (document.getElementsByName("OptionalMenu[]")[9].checked == false ) && (document.getElementsByName("OptionalMenu[]")[10].checked == false ) && (document.getElementsByName("OptionalMenu[]")[11].checked == false ) )
	{
	alert("Select optional menu with respect on selected Request Type option!");
	document.getElementsByName("OptionalMenu[]")[0].focus();
	return false;
	} 
	if (((document.getElementById("idnexasRem").value==null)||(document.getElementById("idnexasRem").value==""))){
		alert("Enter NExAS Remarks!");
		document.getElementById("idnexasRem").focus();
		return false
	}
	}
    if((document.getElementsByName("requestForCheck")[7].value=="GS-NET") && (document.getElementsByName("requestForCheck")[7].checked==true) && document.getElementsByName("requestForCheck")[7].disabled==false){
	if((document.getElementsByName("changeGS")[0].checked==false) && (document.getElementsByName("changeGS")[1].checked==false) && document.getElementById("gsLoc").style.display!="none"){
		alert("Select Changes Required for \n\n GS-NET \n\n Yes / No!");
		document.getElementsByName("changeGS")[0].focus();
		return false;
	}
		
	var i,flag=0;
	chks = document.getElementsByName('gsnetBrCode[]');
	for (i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
			{
			flag=1; 
			}
		}
	if(flag==0)
		{
		alert('Select GSNET Branch Code!');
		chks[0].focus();
		return false;
		}
	
	var j,flag1=0;
	chks1 = document.getElementsByName('gsnetDiv[]');
	
	for (j = 0; j < chks1.length; j++)
		{
		if (chks1[j].checked)
			{
			flag1=1; 
			}
	}
	if(flag1==0)
	{
		alert('Select Division Name!');
		chks1[0].focus();
		return false;
	}
	
	var k,flag2=0;
	chks2 = document.getElementsByName('gsnetPdiv[]');
	//alert("herer..1.......");
	for (k = 0; k < chks2.length; k++)
		{
	if (chks2[k].checked)
		{
		flag2=1; 
		}
		}
	if(flag2==0)
		{
		alert('Select Primary Division Name!');
		chks2[0].focus();
		return false;
		}
	
	
	var k3,flag3=0;
	chks3 = document.getElementsByName('role[]');
	//alert("herer..1.......");
	for (k3 = 0; k3 < chks3.length; k3++)
	{
	if (chks3[k3].checked)
		{
		flag3=1; 
		}
	}
	if(flag3==0)
	{
	alert('Select Role!');
	chks3[0].focus();
	return false;
	}
	if ((document.getElementById("gsNetremarks").value==null)||(document.getElementById("gsNetremarks").value=="")){
		alert("Enter GS-NET Remarks!");
		document.getElementById("gsNetremarks").focus();
		return false;
	}                             
	}
    if((document.getElementsByName("requestForCheck")[8].value=="Internal Application") && (document.getElementsByName("requestForCheck")[8].checked == true) && document.getElementsByName("requestForCheck")[8].disabled==false){
	if ((document.getElementById("Software").value==null)||(document.getElementById("Software").value=="")){
		alert("Select Internal Application!");
		document.getElementById("Software").focus()
		return false;
	}
	if (((document.getElementById("idinternalRem").value==null)||(document.getElementById("idinternalRem").value==""))){
		alert("Enter Internal Application Remarks!");
		document.getElementById("idinternalRem").focus();
		return false;
	}
	}
    if((document.getElementsByName("requestForCheck")[9].value=="USB Access") && (document.getElementsByName("requestForCheck")[9].checked == true) && document.getElementsByName("requestForCheck")[9].disabled==false){
	if ((document.getElementById("idaccessFor").value==null)||(document.getElementById("idaccessFor").value=="")){
		alert("Select Access For!");
		document.getElementById("idaccessFor").focus();
		return false;
	}
	if (((document.getElementById("idUSBRem").value==null)||(document.getElementById("idUSBRem").value==""))){
		alert("Enter USB Access Remarks / Reason!");
		document.getElementById("idUSBRem").focus();
		return false;
	}
	}
    if((document.getElementsByName("requestForCheck")[10].value=="VPN Access") && (document.getElementsByName("requestForCheck")[10].checked == true) && document.getElementsByName("requestForCheck")[10].disabled==false){
	if ((document.getElementById("idvpnEmail").value==null)||(document.getElementById("idvpnEmail").value=="")){
		alert("Enter Email ID!");
		document.getElementById("idvpnEmail").focus();
		return false;
	}
	if ((document.getElementById("idMlps").value==null)||(document.getElementById("idMlps").value=="")){
		alert("Select MPLS / Non MPLS!");
		document.getElementById("idMlps").focus();
		return false;
	}
	if (((document.getElementById("idDOMid").value==null)||(document.getElementById("idDOMid").value=="")) && (document.getElementById("idMlps").value=="MPLS")){
		alert("Enter Domain ID!");
		document.getElementById("idDOMid").focus();
		return false;
	}
	}
    if((document.getElementsByName("requestForCheck")[11].value=="HardDisk / PenDrive") && (document.getElementsByName("requestForCheck")[11].checked == true) && document.getElementsByName("requestForCheck")[11].disabled==false){
	if ((document.getElementById("hardRemarks").value==null)||(document.getElementById("hardRemarks").value=="")){
		alert("Enter HardDisk / PenDrive Remarks!");
		document.getElementById("hardRemarks").focus();
		return false;
	}
	}
	if((document.getElementsByName("requestForCheck")[12].value=="Any Other Asset") && (document.getElementsByName("requestForCheck")[12].checked == true) && document.getElementsByName("requestForCheck")[12].disabled==false){
	if ((document.getElementById("assetRemarks").value==null)||(document.getElementById("assetRemarks").value=="")){
		alert("Enter Any Other Asset Remarks!");
		document.getElementById("assetRemarks").focus();
		return false;
	}
	}
	if((document.getElementsByName("requestForCheck")[13].value=="NEx-GLOW") && (document.getElementsByName("requestForCheck")[13].checked == true) && document.getElementsByName("requestForCheck")[13].disabled==false){
	if ((document.getElementById("project").value==null)||(document.getElementById("project").value=="")){
		alert("Enter Project!");
		document.getElementById("project").focus();
		return false;
	}
	if ((document.getElementById("warehouse").value==null)||(document.getElementById("warehouse").value=="")){
		alert("Enter Ware-House!");
		document.getElementById("warehouse").focus();
		return false;
	}
	if ((document.getElementById("glowRemarks").value==null)||(document.getElementById("glowRemarks").value=="")){
		alert("Enter NEx-GLOW Remarks!");
		document.getElementById("glowRemarks").focus();
		return false;
	}
	}
	
	var clvl = document.form.clvl.value;
	var clarifyCol = document.form.clarifyCol.value;
    var clarLen=document.getElementsByName("mailingCheckClarificationStart");
    
  	if(clvl=="Creater" || clvl=="00" || clarifyCol=="2"){
  		if(!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
  		{
  		     alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
  		     document.getElementsByName("mmdradio")[0].focus();
  		     return false;
  		}
  	}else{
		if(!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[2].checked && !document.getElementsByName("mmdradio")[1].checked) 
		{
		     alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
		     document.getElementsByName("mmdradio")[0].focus();
		     return false;
		}
  	}
  	
  	var clarCond = 0;
  	if(clvl!="Creater" && clvl!="00" && clarifyCol!="2"){
      if (document.getElementsByName("mmdradio")[2].checked)
 	        {
     	 		for(let zzzz=0; zzzz<clarLen.length; zzzz++){
      	 			if(clarLen[zzzz].checked){
     	 				clarCond = 1;	
      	 			}
     	 		}
     	 		if(clarCond==0){
 				        alert("Select from whome Clarification Required..");
 				        document.getElementsByName("mailingCheckClarificationStart")[0].focus();
 			 		    return false;
     	 		}
 	        }
  	}
  	
	if(document.getElementsByName("mmdradio")[0].checked==true && document.getElementsByName("iddeptadminP1")[0].checked==false) 
	{
	     alert("Select Approver!");
	     document.getElementsByName("iddeptadminP1")[0].focus();
	     return false;
	}
	if ((document.getElementById("ta").value==null)||(document.getElementById("ta").value=="")){
		alert("Enter Remarks!");
		document.getElementById("ta").focus();
		return false;
	}
	}catch(err){
		alert("here=="+err);
		return false;
	}
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

<% 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("../../adminHR.jsp?msg="+msg);
}
%>

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
         alert(msg);
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
			if(document.form.passChan1.value=="Yes" || document.form.passChan1.value=="No"){				
			document.getElementById("domPass1").style.display="table-cell";
			document.getElementById("domPass2").style.display="table-cell";	
			}
		}else{
			dmdt.style.display = "none";			
		}
	}
	if(type[2].value=="Biometric / Access Card" && type[2].checked==true){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt		= document.getElementById("bio_details");
		if(biometric.checked==true){
			biodt.style.display = "inline";
			if(document.form.changeBio1.value=="Yes" || document.form.changeBio1.value=="No"){
			document.getElementById("bio_details").style.display="inline";
			document.getElementById("bioLoc").style.display="table-row";		
			document.getElementById("bioRow").rowSpan="3";
			}
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
			if(document.form.changeNew1.value=="Yes" || document.form.changeNew1.value=="No"){
				document.getElementById("newLoc").style.display="table-row";		
				document.getElementById("newCol").rowSpan="6";	
			}
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
			if(document.form.changeGS.value=="Yes" || document.form.changeGS.value=="No"){
			document.getElementById("gsLoc").style.display="table-row";		
			document.getElementById("gsnet").rowSpan="9";
			}
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
	var intune = obj;
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
function showTR1(obj)
{
	if(obj=="Change"){
	  document.getElementById("newCol").rowSpan="6";
	  document.getElementById('idDelete').style.display="table-row";
	  document.getElementById('idDelete').style.visibility="visible";
	}else if(obj=="New"){
	if(document.form.changeNew1.value=="Yes" || document.form.changeNew1.value=="No"){
	  document.getElementById("newCol").rowSpan="5";
	}else{
	  document.getElementById("newCol").rowSpan="4";
	}
	  document.getElementById('idDelete').style.display="none";
	  document.getElementById('idDelete').style.visibility="hidden";
	}
 }
</script>

<script language = "Javascript">
function showMob(obj)
{
 	  if(obj=="Yes"){
 	  document.getElementById('compTD').colSpan="1";
	  document.getElementById('mob1').style.display="table-cell";
	  document.getElementById('mob1').style.visibility="visible";
	  document.getElementById('mob2').style.display="table-cell";
	  document.getElementById('mob2').style.visibility="visible";
 	  }else if(obj=="No"){
	  document.getElementById('compTD').colSpan="3";
	  document.getElementById('mob1').style.display="none";
	  document.getElementById('mob1').style.visibility="hidden";
	  document.getElementById('mob2').style.display="none";
	  document.getElementById('mob2').style.visibility="hidden"; 		  
 	  }
}
function showSim(obj)
{
 	  if(obj=="Yes"){
 	  document.getElementById('compSim').colSpan="1";
	  document.getElementById('sim1').style.display="table-cell";
	  document.getElementById('sim1').style.visibility="visible";
	  document.getElementById('sim2').style.display="table-cell";
	  document.getElementById('sim2').style.visibility="visible";
 	  }else if(obj=="No"){
	  document.getElementById('compSim').colSpan="3";
	  document.getElementById('sim1').style.display="none";
	  document.getElementById('sim1').style.visibility="hidden";
	  document.getElementById('sim2').style.display="none";
	  document.getElementById('sim2').style.visibility="hidden"; 		  
 	  }
}
</script>

<script>
function callcostDetails(v)  
{
if(typeof XMLHttpRequest != "undefined")
{    
xmlHttp= new XMLHttpRequest();    
}
else if(window.ActiveXObject)
{    
xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
} 
if(xmlHttp==null)
{   
alert("Browser does not support XMLHTTP Request");   
return;     
}      
var url="getCost.jsp";  
url +="?cname=" +v;
xmlHttp.onreadystatechange = getCostInfo;  
xmlHttp.open("GET", url, true);   
xmlHttp.send(null);    
}  
function getCostInfo()
{     
var str2=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
{ 
document.getElementById("resultFromAjax3").innerHTML = str2;//fname,iddept,idbranch,iddesg
document.getElementById("idcostCCode").value =  document.getElementById("q1").value;
document.getElementById("idcostOPRange").value =  document.getElementById("q2").value;
}
else
{
document.getElementById("resultFromAjax3").innerHTML = str2;
document.getElementById("idcostCCode").value = "";
document.getElementById("idcostOPRange").value =""; 
}
}
</script>

<script>
function unchecked()
{
	   document.getElementById("OptionalMenu1").checked = false;
	   document.getElementById("OptionalMenu2").checked = false;
	   document.getElementById("OptionalMenu3").checked = false;
	   document.getElementById("OptionalMenu4").checked = false;
	   document.getElementById("OptionalMenu5").checked = false;
	   document.getElementById("OptionalMenu6").checked = false;
	   document.getElementById("OptionalMenu7").checked = false;
	   document.getElementById("OptionalMenu8").checked = false;
	   document.getElementById("OptionalMenu9").checked = false;
	   document.getElementById("OptionalMenu10").checked = false;
	   document.getElementById("OptionalMenu11").checked = false;
	   document.getElementById("OptionalMenu12").checked = false;
}

function active(value)
{
	try{
	  unchecked();
	  var nexAppSel = document.getElementById("nexAppSel").value;
	  var nexAppType = document.getElementById("usKnd").value;
	  var otpMenus = document.getElementsByName("OptionalMenu[]");
  if(value=="HOAcUser"){
       document.getElementById("OptionalMenu1").disabled = true;
       document.getElementById("OptionalMenu2").disabled = true;
       document.getElementById("OptionalMenu3").disabled = true;
       document.getElementById("OptionalMenu4").disabled = false;
       document.getElementById("OptionalMenu5").disabled = false;
       document.getElementById("OptionalMenu6").disabled = false;
       document.getElementById("OptionalMenu7").disabled = true;
       document.getElementById("OptionalMenu8").disabled = false;
       document.getElementById("OptionalMenu9").disabled = true;
       document.getElementById("OptionalMenu10").disabled = true;
       document.getElementById("OptionalMenu11").disabled = false;
       document.getElementById("OptionalMenu12").disabled = false;
       
       var nex1 = nexAppSel.split(",");
       var aaaa=0;
       for(let n=0;n<otpMenus.length;n++){
    	   aaaa++;
   		for(let nn=0;nn<nex1.length;nn++){
   			if(((nex1[nn]).trim()==(document.getElementById("OptionalMenu"+aaaa).value).trim()) && nexAppType=="HOAcUser"){
   				document.getElementById("OptionalMenu"+aaaa).checked=true;
   			}
   		}
	   } 
  }
  if(value=="BRAcUser")
      {
       document.getElementById("OptionalMenu1").disabled = true;
       document.getElementById("OptionalMenu2").disabled = true;
       document.getElementById("OptionalMenu3").disabled = false;
	   document.getElementById("OptionalMenu4").disabled = false;
       document.getElementById("OptionalMenu5").disabled = false;
       document.getElementById("OptionalMenu6").disabled = false;
       document.getElementById("OptionalMenu7").disabled = false;
       document.getElementById("OptionalMenu8").disabled = false;
       document.getElementById("OptionalMenu9").disabled = true;
       document.getElementById("OptionalMenu10").disabled = true;
       document.getElementById("OptionalMenu11").disabled = false;
       document.getElementById("OptionalMenu12").disabled = false;
       
        var nex1 = nexAppSel.split(",");
       var aaaa=0;
       for(let n=0;n<otpMenus.length;n++){
    	   aaaa++;
   		for(let nn=0;nn<nex1.length;nn++){
   			if(((nex1[nn]).trim()==(document.getElementById("OptionalMenu"+aaaa).value).trim()) && nexAppType=="BRAcUser"){
   				document.getElementById("OptionalMenu"+aaaa).checked=true;
   			}
   		}
	   } 
      }
  if(value=="ITUser")
      {
       document.getElementById("OptionalMenu1").disabled = true;
       document.getElementById("OptionalMenu2").disabled = true;
       document.getElementById("OptionalMenu3").disabled = true;
	   document.getElementById("OptionalMenu4").disabled = false;
       document.getElementById("OptionalMenu5").disabled = false;
       document.getElementById("OptionalMenu6").disabled = false;
       document.getElementById("OptionalMenu7").disabled = true;
       document.getElementById("OptionalMenu8").disabled = false;
       document.getElementById("OptionalMenu9").disabled = true;
       document.getElementById("OptionalMenu10").disabled = true;
       document.getElementById("OptionalMenu11").disabled = false;
       document.getElementById("OptionalMenu12").disabled = false;
       
        var nex1 = nexAppSel.split(",");
       var aaaa=0;
       for(let n=0;n<otpMenus.length;n++){
    	   aaaa++;
   		for(let nn=0;nn<nex1.length;nn++){
   			if(((nex1[nn]).trim()==(document.getElementById("OptionalMenu"+aaaa).value).trim()) && nexAppType=="ITUser"){
   				document.getElementById("OptionalMenu"+aaaa).checked=true;
   			}
   		}
	   }
      }
  if(value=="RepoDispOnly")
      {
       document.getElementById("OptionalMenu1").disabled = false;
       document.getElementById("OptionalMenu2").disabled = false;
       document.getElementById("OptionalMenu3").disabled = false;
	   document.getElementById("OptionalMenu4").disabled = false;
       document.getElementById("OptionalMenu5").disabled = false;
       document.getElementById("OptionalMenu6").disabled = false;
       document.getElementById("OptionalMenu7").disabled = false;
       document.getElementById("OptionalMenu8").disabled = false;
       document.getElementById("OptionalMenu9").disabled = false;
       document.getElementById("OptionalMenu10").disabled = false;
       document.getElementById("OptionalMenu11").disabled = false;
       document.getElementById("OptionalMenu12").disabled = false;
       
       var nex1 = nexAppSel.split(",");
       var aaaa=0;
       for(let n=0;n<otpMenus.length;n++){
    	   aaaa++;
   		for(let nn=0;nn<nex1.length;nn++){
   			if(((nex1[nn]).trim()==(document.getElementById("OptionalMenu"+aaaa).value).trim()) && nexAppType=="RepoDispOnly"){
   				document.getElementById("OptionalMenu"+aaaa).checked=true;
   			}
   		}
	   }
   }
  
}catch(err){
	  alert("here1=="+err);
  }
}

function hidefields()
{
	 document.getElementById("currNExASID").style.visibility = "hidden";
	 document.getElementById("idcurrentNExASID").value ="";
	 document.getElementById("OptionalMenu1").disabled = true;
	 document.getElementById("OptionalMenu2").disabled = true;
	 document.getElementById("OptionalMenu3").disabled = true;
	 document.getElementById("OptionalMenu4").disabled = true;
	 document.getElementById("OptionalMenu5").disabled = true;
	 document.getElementById("OptionalMenu6").disabled = true;
	 document.getElementById("OptionalMenu7").disabled = true;
	 document.getElementById("OptionalMenu8").disabled = true;
	 document.getElementById("OptionalMenu9").disabled = true;
	 document.getElementById("OptionalMenu10").disabled = true;
	 document.getElementById("OptionalMenu11").disabled = true;
	 document.getElementById("OptionalMenu12").disabled = true;
}
</script>

<script>
function reqFor(type){	
	var type 		= type.value;
	if(type=="Email ID"){
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
	if(type=="Domain Account"){
		var domain		= document.getElementById("requestForCheck_dom");
		var dmdt		= document.getElementById("dom_details");
		if(domain.checked==true){
			dmdt.style.display = "inline";
		}else{
			dmdt.style.display = "none";		
		}
	}
	if(type=="Biometric / Access Card"){
		var biometric 	= document.getElementById("requestForCheck_bio");
		var biodt		= document.getElementById("bio_details");
		if(biometric.checked==true){
			biodt.style.display = "inline";
		}else{
			biodt.style.display = "none";			
		}
	}
	if(type=="Shared Folder"){
		var shared 		= document.getElementById("requestForCheck_sha");
		var shadt		= document.getElementById("sha_details");
		if(shared.checked==true){
			shadt.style.display = "inline";
		}else{
			shadt.style.display = "none";			
		}
	}
	if(type=="Internet Access / FTP Access"){
		var internet 	= document.getElementById("requestForCheck_int");
		var intdt		= document.getElementById("int_details");
		if(internet.checked==true){
			intdt.style.display = "inline";
		}else{
			intdt.style.display = "none";			
		}
	}
	if(type=="NEWINS"){
		var newins 		= document.getElementById("requestForCheck_newins");
		var newdt		= document.getElementById("new_details");
		if(newins.checked==true){
			newdt.style.display = "inline";
		}else{
			newdt.style.display = "none";			
		}
	}
	if(type=="NExAS"){
		var nexas 		= document.getElementById("requestForCheck_nexas");
		var nexdt		= document.getElementById("nex_details");
		if(nexas.checked==true){
			nexdt.style.display = "inline";
		}else{
			nexdt.style.display = "none";			
		}
	}
	if(type=="GS-NET"){
		var gsnet 		= document.getElementById("requestForCheck_gs");
		var gsdt		= document.getElementById("gs_details");
		if(gsnet.checked==true){
			gsdt.style.display = "inline";
		}else{
			gsdt.style.display = "none";			
		}
	}
	if(type=="Internal Application"){
		var internal 	= document.getElementById("requestForCheck_internal");
		var interdt		= document.getElementById("inter_details");
		if(internal.checked==true){
			interdt.style.display = "inline";
		}else{
			interdt.style.display = "none";			
		}
	}
	if(type=="USB Access"){
		var usb 		= document.getElementById("requestForCheck_usb");
		var usbdt		= document.getElementById("usb_details");
		if(usb.checked==true){
			usbdt.style.display = "inline";
		}else{
			usbdt.style.display = "none";			
		}
	}
	if(type=="VPN Access"){
		var vpn 		= document.getElementById("requestForCheck_vpn");
		var vpndt		= document.getElementById("vpn_details");
		if(vpn.checked==true){
			vpndt.style.display = "inline";
		}else{
			vpndt.style.display = "none";			
		}
	}
	if(type=="HardDisk / PenDrive"){
		var hd	 		= document.getElementById("requestForCheck_hard");
		var hddt		= document.getElementById("hard_details");
		if(hd.checked==true){
			hddt.style.display = "inline";
		}else{
			hddt.style.display = "none";			
		}
	}
	if(type=="Any Other Asset"){
		var as	 		= document.getElementById("requestForCheck_assets");
		var asdt		= document.getElementById("asset_details");
		if(as.checked==true){
			asdt.style.display = "inline";
		}else{
			asdt.style.display = "none";			
		}
	}
	if(type=="NEx-GLOW"){
		var gl	 		= document.getElementById("requestForCheck_glow");
		var gldt		= document.getElementById("glow_details");
		if(gl.checked==true){
			gldt.style.display = "inline";
		}else{
			gldt.style.display = "none";			
		}
	}
	
	ajaxApprover();
	
}
</script>

<script>
function selected(){
	//newins
	var newBRS = document.getElementById("idnewBRS").value;
	var defBC = document.getElementsByName("approverslistBC");
	var newinsBranch = newBRS.split(",");
	for(let n=0;n<defBC.length;n++){
		for(let nn=0;nn<newinsBranch.length;nn++){
			if((newinsBranch[nn]).trim()==((defBC[n].value)).trim()){
				document.getElementById("idapproverslistBC"+defBC[n].value).checked=true;
			}
		}
	}
	//internal apps
	var intApp = document.getElementById("intApp").value;
 	var defApp = document.getElementsByName("approverslist");
	var internalApp = intApp.split(",");
	for(let m=0;m<defApp.length;m++){
		for(let mm=0;mm<internalApp.length;mm++){
			if((internalApp[mm])==(defApp[m].value)){
				document.getElementById("idapproverslist"+defApp[m].value).checked=true;
			}
		}
	}
	//gsnet
	var gsbranch = document.getElementById("gsSel").value;
	var defgsbr	 = document.getElementsByName("gsnetBrCode[]");
	var gsbranch1 = gsbranch.split(",");
	for(let jjj=0;jjj<defgsbr.length;jjj++){
		for(let jj=0;jj<gsbranch1.length;jj++){
		if(((gsbranch1[jj]).trim())==((defgsbr[jjj].value).trim())){
			document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).checked=true;
		}
		}
	}
	var gsdiv = document.getElementById("selDiv").value;
	var defgsdiv = document.getElementsByName("gsnetDiv[]");
	var gsdiv1 = gsdiv.split(",");
	for(let hh=0;hh<defgsdiv.length;hh++){
		for(let hhh=0;hhh<gsdiv1.length;hhh++){
		if(((gsdiv1[hhh]).trim())==((defgsdiv[hh].value).trim())){
			document.getElementById("idgsnetDiv"+defgsdiv[hh].value).checked=true;
		}
		}
	}
	var gspridiv = document.getElementById("selPD").value;
	var defgspridiv = document.getElementsByName("gsnetPdiv[]");
	var gspridiv1 = gspridiv.split(",");
	for(let zz=0;zz<defgspridiv.length;zz++){
		for(let zzz=0;zzz<gspridiv1.length;zzz++){
		if(((gspridiv1[zzz]).trim())==((defgspridiv[zz].value).trim())){
			document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).checked=true;
		}
		}
	}
	var gsrole = document.getElementById("selRole").value;
	var defgsrole = document.getElementsByName("role[]");
	var gsrole1 = gsrole.split(",");
	for(let ll=0;ll<defgsrole.length;ll++){
		for(let lll=0;lll<gsrole1.length;lll++){
		if(((gsrole1[lll]).trim())==((defgsrole[ll].value).trim())){
			document.getElementById("role"+ll).checked=true;
		}
		}
	}
}
</script>

<script>

function syncBC(val) 
{
var vijayValBC="";
for(var i1=0; i1 < document.form.approverslistBC.length; i1++)
{
if(document.form.approverslistBC[i1].checked)
{
vijayValBC=vijayValBC+ document.form.approverslistBC[i1].value+",";
}
}
document.getElementById("idreqBranch").value=vijayValBC;
}

var expandedBC = false;
function showCheckboxesBC() 
{
var checkboxes = document.getElementById("checkboxesBC");
if (!expandedBC) {
checkboxes.style.display = "block";
expandedBC = true;
var values = $('input:checkbox:checked.group1BC').map(function () {
return this.value;
}).get();
}else{
checkboxes.style.display = "none";
expandedBC = false;
}
}
</script>

<script>
var expanded = false;
function showCheckboxes() 
{
var checkboxes = document.getElementById("checkboxes");
if(!expanded) {
checkboxes.style.display = "block";
expanded = true;
var values = $('input:checkbox:checked.group1').map(function () {
return this.value;
}).get();
}else{
checkboxes.style.display = "none";
expanded = false;
}
}

function sync(val) 
{
var vijayVal="";
for(var i1=0; i1 < document.form.approverslist.length; i1++)
{
if(document.form.approverslist[i1].checked)
{
	vijayVal=vijayVal+ document.form.approverslist[i1].value+",";
}
}
document.getElementById("Software").value=vijayVal;
}
</script>

<script>
function syncApp(val)
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
</script>

<script type="text/javascript">
function cleartext()
{
var checkboxes = document.getElementById("checkboxes");
checkboxes.style.display = "none";
}
</script>

<script type="text/javascript">
function cleartextBC()
{
var checkboxesBC = document.getElementById("checkboxesBC");
checkboxesBC.style.display = "none";
}
//hidefields();
</script>

<script>
function callFun(val1)
{
var ecode=document.getElementById("ecode").value;
if(val1=="PenDrive")   
{
document.getElementById("dscNo").value="";
}
else if(val1=="DSC_CHA")   
{
getDSCNo(val1,ecode);
}
else 
{
getDSCNo(val1,ecode) ;
}
}

function getDSCNo(v,ecode)  
{
if (typeof XMLHttpRequest != "undefined")
{    
xmlHttp= new XMLHttpRequest();    
}
else if (window.ActiveXObject)
{    
xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
} 
if (xmlHttp==null)
{   
alert("Browser does not support XMLHTTP Request");   
return;     
}
var url="getDSCNo.jsp";  
url +="?dsctype="+v;
url +="&empcode="+ecode;
xmlHttp.onreadystatechange = getInfo1;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}

function getInfo1()
{     
var str2=xmlHttp.responseText;
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
{ 
document.getElementById("resultFromAjax21").innerHTML = str2;
document.getElementById("dscNo").value =  document.getElementById("dscNo1").value;
}
else
{
document.getElementById("dscNo").value = "";
}
}
</script>

<script>
function bioCheck(obj){
	var chkBio = obj;
	if(chkBio=="Yes"){
		document.getElementById("requestForCheck_bio").disabled=false;		
		document.getElementById("bioRemarks").readOnly=false;
		document.getElementById("bio1").style.display="table-cell";
		document.getElementById("bio2").style.display="table-cell";
		document.getElementById("colBio").colSpan="1";

		var selBranch1= document.getElementById("selBranch1").value;
		if(selBranch1!=""){
		 	var selBranch = document.getElementById("selBranch");
		 	var selBranch2= selBranch1.split(",");
		 	var req_branch = document.getElementById("reqBranch").value;
		 	for(let bbb=0;bbb<selBranch.length;bbb++){
		 		for(let bb=0;bb<selBranch2.length;bb++){
		 		if((selBranch2[bb])==(selBranch[bbb].value)){
		 			selBranch[bbb].selected=true;
		 		}
		 		}
		 	}
		}else{
		 	var selBranch = document.getElementById("selBranch");
		 	var req_branch = document.getElementById("reqBranch").value;
		 	alert(req_branch);
		 	for(let bbb=0;bbb<selBranch.length;bbb++){
		 		if(req_branch.includes(selBranch[bbb].value)){
		 			selBranch[bbb].selected=true;
		 		}
		 	}
		}
		document.getElementById("colBio").style.width="20%";
	}else if(chkBio=="No"){
		document.getElementById("requestForCheck_bio").disabled=true;				
		document.getElementById("bioRemarks").readOnly=true;				
		document.getElementById("bioRemarks").value=document.getElementById("bioRemarks1").value;
		document.getElementById("bio1").style.display="none";
		document.getElementById("bio2").style.display="none";
		document.getElementById("colBio").colSpan="3";
		document.getElementById("colBio").style.width="60%";
	}
	
	ajaxApprover();
	
}

function newCheck(obj){
	try{
	var chkNew = obj;
	if(chkNew=="Yes"){
		document.getElementById("requestForCheck_newins").disabled=false;
		document.getElementById("new1").style.display="table-cell";
		document.getElementById("new2").style.display="table-cell";
		document.getElementById("colnew").colSpan="1";
		document.getElementById("idnewBRS").disabled=false;
		document.getElementById("idselBranch").disabled=false;
		document.getElementById("idreqBranch").disabled=false;
		document.getElementById("ncode").disabled=false;
		showTR1(document.form.reqNew.value);
	}else if(chkNew=="No"){
		document.getElementById("new1").style.display="none";
		document.getElementById("new2").style.display="none";
		document.getElementById("colnew").colSpan="3";
		document.getElementById("requestForCheck_newins").disabled=true;
		document.getElementById("idnewBRS").disabled=true;
		document.getElementById("idselBranch").disabled=true;
		document.getElementById("idreqBranch").disabled=true;
		document.getElementById("ncode").disabled=true;
	var newType1 = document.getElementById("reqNew1").value;
	 	if(newType1=="New"){
	 		document.getElementById('idDelete').style.display="none";
	 		document.getElementById('idDelete').style.visibility="hidden";
	 		document.getElementById('newCol').rowSpan="5";
	 	}if(newType1=="Change"){
	 		document.getElementById('idDelete').style.display="table-row";
	 		document.getElementById('idDelete').style.visibility="visible";
	 	    document.getElementById('newCol').rowSpan="6";
	 	}
		showTR1(document.form.reqNew.value);
	}
	
	ajaxApprover();
	
	}catch(err){
		alert("here2=="+err);
	}
}


function gsCheck(obj){
	try{
	var chkGS = obj;
	if(chkGS=="Yes"){
		document.getElementById("gs1").style.display="table-row";
		document.getElementById("gs2").style.display="table-row";
		document.getElementById("gsnet").rowSpan="9";
		document.getElementById("requestForCheck_gs").disabled=false;		
		document.getElementById("gsNetremarks").readOnly=false;
		var gsbranch = document.getElementById("gsSel").value;
		var defgsbr	 = document.getElementsByName("gsnetBrCode[]");
		var gsbranch1 = gsbranch.split(",");
		for(let jjj=0;jjj<defgsbr.length;jjj++){
			document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).checked=false;
			document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).disabled=false;
			for(let jj=0;jj<gsbranch1.length;jj++){
			if(((gsbranch1[jj]).trim())==((defgsbr[jjj].value).trim())){
				document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).checked=true;
			}
			}
		}

		var gsdiv = document.getElementById("selDiv").value;
		var defgsdiv = document.getElementsByName("gsnetDiv[]");
		var gsdiv1 = gsdiv.split(",");
		for(let hh=0;hh<defgsdiv.length;hh++){
				document.getElementById("idgsnetDiv"+defgsdiv[hh].value).checked=false;
				document.getElementById("idgsnetDiv"+defgsdiv[hh].value).disabled=false;
			for(let hhh=0;hhh<gsdiv1.length;hhh++){
			if(((gsdiv1[hhh]).trim())==((defgsdiv[hh].value).trim())){
				document.getElementById("idgsnetDiv"+defgsdiv[hh].value).checked=true;
			}
			}
		}

		var gspridiv = document.getElementById("selPD").value;
		var defgspridiv = document.getElementsByName("gsnetPdiv[]");
		var gspridiv1 = gspridiv.split(",");
		for(let zz=0;zz<defgspridiv.length;zz++){
				document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).checked=false;
				document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).disabled=false;
			for(let zzz=0;zzz<gspridiv1.length;zzz++){
			if(((gspridiv1[zzz]).trim())==((defgspridiv[zz].value).trim())){
				document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).checked=true;
			}
			}
		}
		
		var gsrole = document.getElementById("selRole").value;
		var defgsrole = document.getElementsByName("role[]");
		var gsrole1 = gsrole.split(",");
		for(let ll=0;ll<defgsrole.length;ll++){
				document.getElementById("role"+ll).checked=false;
				document.getElementById("role"+ll).disabled=false;
			for(let lll=0;lll<gsrole1.length;lll++){
			if(((gsrole1[lll]).trim())==((defgsrole[ll].value).trim())){
				document.getElementById("role"+ll).checked=true;
			}
			}
		}
	}else if(chkGS=="No"){
		document.getElementById("gs1").style.display="none";
		document.getElementById("gs2").style.display="none";
		document.getElementById("gsnet").rowSpan="7";
		document.getElementById("requestForCheck_gs").disabled=true;
		document.getElementById("gsNetremarks").value=document.getElementById("gsNetremarks1").value;
		
		var gsbranch = document.getElementById("changesGSNet").value;
		var defgsbr	 = document.getElementsByName("gsnetBrCode[]");
		var gsbranch1 = gsbranch.split(",");
		for(let jjj=0;jjj<defgsbr.length;jjj++){
			if(gsbranch!=""){			
			document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).disabled=true;
			}
				document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).checked=false;
			for(let jj=0;jj<gsbranch1.length;jj++){
			if(((gsbranch1[jj]).trim())==((defgsbr[jjj].value).trim())){
				document.getElementById("idgsnetBrCode"+defgsbr[jjj].value).checked=true;
			}
			}
		}

		var gsdiv = document.getElementById("prevDivGSNet").value;
		var defgsdiv = document.getElementsByName("gsnetDiv[]");
		var gsdiv1 = gsdiv.split(",");
		for(let hh=0;hh<defgsdiv.length;hh++){
			if(gsdiv!=""){			
				document.getElementById("idgsnetDiv"+defgsdiv[hh].value).disabled=true;
			}
				document.getElementById("idgsnetDiv"+defgsdiv[hh].value).checked=false;
			for(let hhh=0;hhh<gsdiv1.length;hhh++){
			if(((gsdiv1[hhh]).trim())==((defgsdiv[hh].value).trim())){
				document.getElementById("idgsnetDiv"+defgsdiv[hh].value).checked=true;
			}
			}
		}

		var gspridiv = document.getElementById("prevPDivGSNet").value;
		var defgspridiv = document.getElementsByName("gsnetPdiv[]");
		var gspridiv1 = gspridiv.split(",");
		for(let zz=0;zz<defgspridiv.length;zz++){
			if(gspridiv!=""){
				document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).disabled=true;
			}
				document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).checked=false;
			for(let zzz=0;zzz<gspridiv1.length;zzz++){
			if(((gspridiv1[zzz]).trim())==((defgspridiv[zz].value).trim())){
				document.getElementById("idgsnetPdiv"+defgspridiv[zz].value).checked=true;
			}
			}
		}
		
		var gsrole = document.getElementById("prevRoleGSNet").value;
		var defgsrole = document.getElementsByName("role[]");
		var gsrole1 = gsrole.split(",");
		for(let ll=0;ll<defgsrole.length;ll++){
			if(gsrole!=""){
				document.getElementById("role"+ll).disabled=true;
			}
				document.getElementById("role"+ll).checked=false;
			for(let lll=0;lll<gsrole1.length;lll++){
			if(((gsrole1[lll]).trim())==((defgsrole[ll].value).trim())){
				document.getElementById("role"+ll).checked=true;
			}
			}
		}
	}
	
	ajaxApprover();
	
	}catch(err){
		//alert(err);
	}
}

function domCheck(obj){
try{
	var chkDom = obj;
	if(chkDom=="Yes"){
		document.getElementById("requestForCheck_dom").disabled=false;		
		document.getElementById("domainRem").readOnly=false;
	}else if(chkDom=="No"){
		document.getElementById("requestForCheck_dom").disabled=true;				
		document.getElementById("domainRem").readOnly=true;				
		document.getElementById("domainRem").value=document.getElementById("remarksDom1").value;
	}
	
	ajaxApprover();
	
}catch(err){}
}

</script>

<script>
function showApp1(){
	var status = document.getElementById('idstatus').value;
	if(status!="true"){
		 alert("you are not authorized person");
		 return false;
	}else{
		 document.getElementById('idApproved').style.display = 'block';
		 document.getElementById('idApproved1').style.display="none";
		 document.getElementById('idApproved2').style.display="none";
	}
}

function showApp()
{
var status = document.getElementById('idstatus').value;
if(status!="true")
{
 alert("you are not authorized person");
 return false;
}
else{
 document.getElementById('idApproved').style.display = 'block';
 document.getElementById('idApproved1').style.display="none";
 document.getElementById('idApproved2').style.display="none";
 return true;
}
}

function hideApp(obj)
{
var status = document.getElementById('idstatus').value;
if(status!="true")
{
 alert("you are not authorized person");
 return false;
}
else
{
	if(obj=="Not Approved"){
		document.getElementById('idApproved').style.display = 'none';
		document.getElementById('idApproved1').style.display="block";
		document.getElementById('idApproved2').style.display = 'none';
		return true;
	}else if(obj=="Clarification Required"){
		document.getElementById('idApproved').style.display = 'none';
		document.getElementById('idApproved1').style.display="none";
		document.getElementById('idApproved2').style.display="block";
		return true;
	}
}
}
</script>

<script>
function oldReqFor(obj){
	try{
	var reqFor = obj.value;
	var reqFor1 = reqFor.split(",");
	for(let z=0;z<reqFor1.length;z++){
 		reqFor1[z]=reqFor1[z].trim();
	if(reqFor1[z]=="Email ID" && document.getElementById("requestForCheck_email").checked==false){
		document.getElementById("requestForCheck_email").checked=true;
		document.getElementById("requestForCheck_email").disabled=true;
		document.getElementById("email_details").style.display="inline";
		document.getElementById("email_details").style.visibility="visible";
		document.getElementById("idemaildomain").disabled=true;
		document.getElementById("idemptype").disabled=true;
		document.getElementById("idreqEmail").readOnly=true;
		document.getElementById("mobileOptionyes").disabled=true;
		document.getElementById("mobileOptionno").disabled=true;
		document.getElementById("makeModel").readOnly=true;
		document.getElementById("simOptionyes").disabled=true;
		document.getElementById("simOptionno").disabled=true;
		document.getElementById("simNo").readOnly=true;
		document.getElementById("intuneyes").disabled=true;
		document.getElementById("intuneno").disabled=true;
		document.getElementById("idmobile").readOnly=true;
		document.getElementById("idimei1").readOnly=true;
		document.getElementById("idimei2").readOnly=true;
		document.getElementById("remarksEmail").readOnly=true;		
		
	}if(reqFor1[z]=="Domain Account" && document.getElementById("requestForCheck_dom").checked==false){
		document.getElementById("requestForCheck_dom").checked=true;
		document.getElementById("requestForCheck_dom").disabled=true;
		document.getElementById("dom_details").style.display="inline";
		document.getElementById("domPass1").style.display="table-cell";
		document.getElementById("domPass2").style.display="table-cell";	
		
	}if(reqFor1[z]=="Biometric / Access Card" && document.getElementById("requestForCheck_bio").checked==false){
		document.getElementById("requestForCheck_bio").checked=true;
		document.getElementById("requestForCheck_bio").disabled=true;
		document.getElementById("bio_details").style.display="inline";
		document.getElementById("bioLoc").style.display="table-row";		
		document.getElementById("bioRow").rowSpan="3";
		
	}if(reqFor1[z]=="Shared Folder" && document.getElementById("requestForCheck_sha").checked==false){
		document.getElementById("requestForCheck_sha").checked=true;
		document.getElementById("requestForCheck_sha").disabled=true;
		document.getElementById("sha_details").style.display="inline";
		document.getElementById("shareRemarks").readOnly=true;
		
	}if(reqFor1[z]=="Internet Access / FTP Access" && document.getElementById("requestForCheck_int").checked==false){
		document.getElementById("requestForCheck_int").checked=true;
		document.getElementById("requestForCheck_int").disabled=true;
		document.getElementById("int_details").style.display="inline";
		document.getElementById("idrequestTypeOption1").disabled=true;
		document.getElementById("idrequestTypeOption2").disabled=true;
		document.getElementById("idrequestTypeOption3").disabled=true;
		document.getElementById("idrequestTypeOption4").disabled=true;
		document.getElementById("idinternetRem").readOnly=true;
		
	}if(reqFor1[z]=="NEWINS" && document.getElementById("requestForCheck_newins").checked==false){
		document.getElementById("requestForCheck_newins").checked=true;
		document.getElementById("requestForCheck_newins").disabled=true;
		document.getElementById("new_details").style.display="inline";
		document.getElementById("newLoc").style.display="table-row";		
		document.getElementById("newCol").rowSpan="6";
		
	}if(reqFor1[z]=="NExAS" && document.getElementById("requestForCheck_nexas").checked==false){
		document.getElementById("requestForCheck_nexas").checked=true;
		document.getElementById("requestForCheck_nexas").disabled=true;
		document.getElementById("nex_details").style.display="inline";
		document.getElementById("idcompCode").disabled=true;
		document.getElementById("idcostCName").disabled=true;
		document.getElementById("idcostCCode").readOnly=true;
		document.getElementById("idcostOPRange").readOnly=true;
		document.getElementById("idnexasRem").readOnly=true;
		document.getElementById("userKind1").disabled=true;
		document.getElementById("userKind2").disabled=true;
		document.getElementById("userKind3").disabled=true;
		document.getElementById("userKind4").disabled=true;

		  var otpMenus = document.getElementsByName("OptionalMenu[]");
		  let aaaa=0;
		  for(let n=0;n<otpMenus.length;n++){
   			  aaaa++;	
			  document.getElementById("OptionalMenu"+aaaa).disabled=true;
	   	  }
	   		
	}if(reqFor1[z]=="GS-NET" && document.getElementById("requestForCheck_gs").checked==false){
		document.getElementById("requestForCheck_gs").checked=true;
		document.getElementById("requestForCheck_gs").disabled=true;
		document.getElementById("gs_details").style.display="inline";
		document.getElementById("gsLoc").style.display="table-row";		
		document.getElementById("gsnet").rowSpan="9";			
		
	}if(reqFor1[z]=="Internal Application" && document.getElementById("requestForCheck_internal").checked==false){
		document.getElementById("requestForCheck_internal").checked=true;
		document.getElementById("requestForCheck_internal").disabled=true;
		document.getElementById("inter_details").style.display="inline";
		document.getElementById("idSelSoftware").disabled=true;
		document.getElementById("Software").disabled=true;
		document.getElementById("checkboxes").disabled=true;
		document.getElementById("idinternalRem").readOnly=true;

	}if(reqFor1[z]=="USB Access" && document.getElementById("requestForCheck_usb").checked==false){
		document.getElementById("requestForCheck_usb").checked=true;
		document.getElementById("requestForCheck_usb").disabled=true;
		document.getElementById("usb_details").style.display="inline";
		document.getElementById("idaccessFor").disabled=true;
		document.getElementById("dscNo").readOnly=true;
		document.getElementById("idUSBRem").readOnly=true;
		
	}if(reqFor1[z]=="VPN Access" && document.getElementById("requestForCheck_vpn").checked==false){
		document.getElementById("requestForCheck_vpn").checked=true;
		document.getElementById("requestForCheck_vpn").disabled=true;
		document.getElementById("vpn_details").style.display="inline";
		document.getElementById("idDOMid").readOnly=true;
		document.getElementById("idvpnEmail").readOnly=true;
		document.getElementById("idMlps").disabled=true;
		
	}if(reqFor1[z]=="HardDisk / PenDrive" && document.getElementById("requestForCheck_hard").checked==false){
		document.getElementById("requestForCheck_hard").checked=true;
		document.getElementById("requestForCheck_hard").disabled=true;
		document.getElementById("hard_details").style.display="inline";
		document.getElementById("hardRemarks").readOnly=true;
		
	}if(reqFor1[z]=="Any Other Asset" && document.getElementById("requestForCheck_assets").checked==false){
		document.getElementById("requestForCheck_assets").checked=true;
		document.getElementById("requestForCheck_assets").disabled=true;
		document.getElementById("asset_details").style.display="inline";
		document.getElementById("assetRemarks").readOnly=true;
		
	}if(reqFor1[z]=="NEx-GLOW" && document.getElementById("requestForCheck_glow").checked==false){
		document.getElementById("requestForCheck_glow").checked=true;
		document.getElementById("requestForCheck_glow").disabled=true;
		document.getElementById("glow_details").style.display="inline";
		document.getElementById("project").readOnly=true;
		document.getElementById("warehouse").readOnly=true;
		document.getElementById("glowRemarks").readOnly=true;
	}
 	}
	}catch(err){
		alert("here3=="+err);
	}
}

//NEINFormInitUpdateITBack.jsp
</script>

<script>

function ajaxApprover()  
{
var reqFF = "";
var reqF1 = document.form.requestForCheck;
var next = document.form.nextlevel.value;
var v = document.form.vlvl.value;
var bno = document.form.i_b_no1.value;
var clarCol = document.form.clarCol.value;
for(var k=0;k<reqF1.length;k++){
	if(reqF1[k].checked==true && reqF1[k].disabled==false){
		reqFF += reqF1[k].value+",";
	}
}
if (typeof XMLHttpRequest != "undefined")
{
    xmlHttp1= new XMLHttpRequest();    
}
else if (window.ActiveXObject)
{    
    xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");  
} 
if (xmlHttp1==null)
{   
    alert("Browser does not support XMLHTTP Request");   
    return;     
}      
var url="ajaxForApprovedIT.jsp";  
url +="?lvl="+v+"&reqF="+reqFF+"&nextlevel="+next+"&i_b_no1="+bno+"&clarCol="+clarCol;
//alert(url);
xmlHttp1.onreadystatechange = getAjaxApprover;  
xmlHttp1.open("GET", url, true);   
xmlHttp1.send(null);    
}

function getAjaxApprover()
{
var str2=xmlHttp1.responseText;
if(xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete")
{
     document.getElementById("resultFromAjaxApp").innerHTML=str2;
     document.getElementById("iddeptadminP1").value=document.getElementById("a8").value;
     document.getElementById("iddeptadminP").value=document.getElementById("a8").value;
     document.getElementById("iddeptadminP11").value=document.getElementById("a9").value;
}
else
{
     document.getElementById("resultFromAjaxApp").innerHTML=str2;
     document.getElementById("iddeptadminP1").value="";
     document.getElementById("iddeptadminP").value="";
     document.getElementById("iddeptadminP11").value="";
}
}

</script>

</head>
<body onload="hiddenTables(document.form.requestForCheck);showMob(document.form.mobileOption.value);intunedisplay(document.form.intune.value);showSim(document.form.simOption.value);cleartextBC();selected();showTR1(document.form.reqNew.value);callcostDetails(document.form.costCName.value);active(document.form.userKind.value);cleartext();oldReqFor(document.form.reqFor111);newCheck(document.form.changeNew.value);bioCheck(document.form.changeBio.value);gsCheck(document.form.changeGS.value);">
<form name="form" method="post" action="NEINFormInitUpdateITBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection conED=null,conlm=null,cnNew=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,stB=null,stH=null,stGR=null,stED=null,stET=null,stBC=null,stINT=null,stMul=null,st5=null,nstmt=null,st12=null,stBC1=null,stNew=null,st11=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rsED=null,rs100=null,rsB=null,rsH=null,rsGR=null,rsET=null,rsBC=null,rsINT=null,rsMul=null,rs5=null,rs12=null,rsBC1=null,rsNew=null,rs11=null;
String req=null;
String empD=null;
%>
<%
//NEINFormInitUpdateITBack.jsp
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

<%
conED= con.getConnection2();
conlm= conLMS.getConnectionlms();
stED = conED.createStatement();
rsED = stED.executeQuery("select emaildomain from emaildomainmaster ORDER BY emaildomain Asc");

stET = conED.createStatement();
rsET = stET.executeQuery("select employeetype from employeeTypeMaster ORDER BY employeetype Asc");

stBC = conED.createStatement();
rsBC = stBC.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_no Asc");

stBC1 = conlm.createStatement();
rsBC1 = stBC1.executeQuery("select branch_type_code,branch_name from branchmaster ORDER BY branch_type_code Asc");

stINT = conED.createStatement();
rsINT = stINT.executeQuery("select app_name from software_owner_master ORDER BY app_name Asc"); 

stMul = conED.createStatement();
rsMul = stMul.executeQuery("select m_b_no,m_b_name from branch_master_main ORDER BY m_b_name Asc"); 

String emp_no2 = (String) session.getAttribute("EmpNo");

String form2_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null,reqBranch=null,emp_type=null,emp_contract_type=null,reqFor=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,group=null;
String req = request.getParameter("req");
String pageName = request.getParameter("pageName");
System.out.println("pageName====>"+pageName);
String values[] = req.split(" -");
System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
req = values[0].replaceAll(" ", "");
st100 = conED.createStatement();
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
}

String reqFor111="";
if(!emp_contract_type.equalsIgnoreCase("Contract")){
rs100 = st100.executeQuery("select requestFor from neinapplicationform WHERE applicationNo!='"+req+"' and employee_code='"+emp_code+"' and Approval_sttatuss!='Not Appproved'"); 
}else{
rs100 = st100.executeQuery("select requestFor from neinapplicationform WHERE applicationNo!='"+req+"' and full_name='"+full_name+"' and Approval_sttatuss!='Not Appproved'"); 	
}
while(rs100.next())
{
	reqFor111 += rs100.getString("requestFor")+", ";
}

%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
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
<input type="hidden" value="<%=pageName%>" name="pageName">
<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
<tr>
<td style="height: 40px;"><center><font size="3">
<b><label>
APPLICATION FORM FROM EMPLOYEE</label>
</b></font></center> 
<input type="hidden" name="i_name" value="<%=SessionName%>" />
<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
<input type="hidden" name="i_city" value="<%=Sessioncity%>" />
<input type="hidden" name="i_b_no" value="<%=Sessionb_no%>" />
<input type="hidden" name="i_admin" value="<%=admin%>" />
<input type="hidden" name="i_email_id" value="<%=email_id%>" />
<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
<input type="hidden" name="r_remarks" value="extra_value"/>
<input type="hidden" name="form1_no" value="<%=form2_no%>" />
</td>	
</tr>
</table>
<table width="895"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<tr>
<td>
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");

st2 = conlm.createStatement();
rs2 = st2.executeQuery("select department_name from department ORDER BY department_name Asc"); 

st4 = conED.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 

stGR  = conED.createStatement();
rsGR  = stGR.executeQuery("select groupName from groupmaster ORDER BY groupName Asc"); 

stB = conED.createStatement();
rsB = stB.executeQuery("select m_b_name,m_b_location from branch_master_main where m_b_no='"+reqBranch+"' ORDER BY m_b_name Asc");
if(rsB.next()){
	reqBranch=rsB.getString("m_b_name");
}

String emailDomain=null,employeeType=null,reqMailID=null,mobIntune=null,mobileNo=null,imei1=null,imei2=null,domainRemarks=null,bioRemarks=null,folderRemarks=null;
String internetReqType=null,internetRemarks=null,newinsBranchCode=null,newinsOpCode=null,newinsRequest=null,newinsRemarks=null,nexasCompCode=null,nexasCCName=null;
String nexasCCCode=null,nexasOPRange=null,nexasReqType=null,nexasOptionalMenu=null,nexasRemarks=null,gsnetBranchCode=null,gsnetDivName=null,gsnetPrimaryDiv=null;
String gsnetUserRole=null,gsnetRemarks=null,internalApplication=null,internalRemarks=null,usbAccessFor=null,usbDetails=null,usbRemarks=null,vpnDomainID=null,changesGSNet=null,prevBRCodesGSNet=null,prevDivGSNet=null,prevPDivGSNet=null,prevRoleGSNet=null;
String vpnEmailID=null,vpnMPLS=null,group_name=null,mailIDCreated=null,intuneAccessProvided=null,emailRemarks=null,passChan=null,chanReqBio=null,selBioBranches=null,changesNewins=null,previousBranchesNewins=null;
String compProv=null,makemodel=null,otherRemarks=null,hardRemarks=null,compProvSimCard=null,compProvSimNumber=null,makeAndModel=null,simCard=null,simNo=null,project=null,warehouse=null,glowRemarks=null;
stH=conED.createStatement();
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
	newinsBranchCode=rsH.getString("newinsBranchCode")==null?"":rsH.getString("newinsBranchCode");
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
	gsnetBranchCode=rsH.getString("gsnetBranchCode")==null?"":rsH.getString("gsnetBranchCode");
	gsnetDivName=rsH.getString("gsnetDivName")==null?"":rsH.getString("gsnetDivName");
	gsnetPrimaryDiv=rsH.getString("gsnetPrimaryDiv")==null?"":rsH.getString("gsnetPrimaryDiv");
	gsnetUserRole=rsH.getString("gsnetUserRole")==null?"":rsH.getString("gsnetUserRole");
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

/* if(!newinsBranchCode.equals("")){	
newinsBranchCode=newinsBranchCode.substring(0,newinsBranchCode.length()-1);
} */
/* if(!previousBranchesNewins.equals("")){	
previousBranchesNewins=previousBranchesNewins.substring(0,previousBranchesNewins.length()-1);
} */
/* if(!internalApplication.equals("")){	
internalApplication=internalApplication.substring(0,internalApplication.length()-1);
} */

%>	 
	
<table width="895">
<tr>
<td style="text-align: right;width: 215px; " bgcolor="grey" id="hiderow">NAME:</td>
<td style="text-align:left;" bgcolor="grey" id="hiderow" colspan="3"><input name="NAMEMain" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<td style="text-align: right;width: 215px; " bgcolor="grey" id="hiderow">DESIGNATION :</td>
<td style="text-align:left;" bgcolor="grey" id="hiderow" colspan="3"><input name="DESIGNATIONMain" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<td style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" bgcolor="grey" colspan="3"><input name="formNum" value="<%=form2_no%>" size="31" readonly="readonly"/> </td>
</tr>	
<%
if(emp_contract_type.equalsIgnoreCase("On Roll")){
%>
<tr>
<td style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="31" value="<%=emp_code%>" readonly="readonly"/></td>
<td style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
</tr>
<tr>
<td style="text-align: right;width: 215px;">Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td style="text-align: right;width: 175px;">Department :</td>
<td style="text-align:left;"><input name="depart" size="31" value="<%=depart%>" readonly="readonly"/>
</td> 
</tr>
<tr>
<td style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" size="31" value="<%=designation%>" readonly="readonly"/></td>
<td style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" size="31" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>
</tr>
<tr>
<td style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;">
<select name="group" id="sow" style="width:100%;">      
<option value="">Select</option>
<%while(rsGR.next()){%>     
<option value="<%=rsGR.getString(1)%>" <%if(rsGR.getString(1).equalsIgnoreCase(scopeOfWork)){out.println("selected");}%>><%=rsGR.getString(1)%></option> 
<%}%>   
</select>  
</td>
</td>
<td style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  name="d_reliving" size="31" value="<%=requestBy%>" readonly="readonly"/>
</td> 					        
</tr>
<tr>
<td style="text-align: right;">Employee Type :</td>
<td style="text-align:left;">
<input type="radio" name="employeeOption" value="Permanent" <%if(emp_type.equalsIgnoreCase("Permanent")){out.println("checked");}%>/>Permanent
<input type="radio" name="employeeOption" value="Probation" <%if(emp_type.equalsIgnoreCase("Probation")){out.println("checked");}%>/>Probation
</td>
<td style="text-align: right;">Employee Contract Type :</td>
<td style="text-align:left;">
<input type="text" readonly name="employeeOption1" size="31" value="<%=emp_contract_type%>"/>
</td>				        
</tr>
<tr>
<td align="right">Request :</td>
<td colspan="3">
<input type="radio" name="requestOption" value="New" <%if(requestOption.equalsIgnoreCase("New")){out.println("checked");}%>/>New
<input type="radio" name="requestOption" value="Change" <%if(requestOption.equalsIgnoreCase("Change")){out.println("checked");}%>/>Change
</td>
<input type="hidden" name="reqBranch" id="reqBranch" value ="<%=reqBranch%>"/>
</tr>
<%}else{%>
<tr>
<td style="text-align: right;">Employee Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
<td style="text-align: right;width: 215px;">Branch :</td>
<td style="text-align:left;">
<select name="branch" id="idbranch" style="width:100%;">
<option value="">Select</option>
<%while(rsBC1.next()){%>
<option value="<%=rsBC1.getString("branch_name")%>" <%if(branch.equalsIgnoreCase(rsBC1.getString("branch_name"))){out.println("selected");}%>><%=rsBC1.getString("branch_name")%></option>
<%}%>
</select>
</tr>
<tr>
<td style="text-align: right;width: 175px;">Department :</td>
<td style="text-align:left;">
<select name="depart" id="iddepart" style="width:100%;">
<option value="">Select</option>
<%while(rs2.next()){%>
<option value="<%=rs2.getString("department_name")%>" <%if(depart.equalsIgnoreCase(rs2.getString("department_name"))){out.println("selected");}%>><%=rs2.getString("department_name")%></option>
<%}%>
</select>
<td style="text-align: right;">Designation :</td>
<td style="text-align:left;">
<select name="designation" id="iddesignation" style="width:100%;">
<option value="">Select</option>
<%while(rs4.next()){%>
<option value="<%=rs4.getString("DESIGNATION")%>" <%if(designation.equalsIgnoreCase(rs4.getString("DESIGNATION"))){out.println("selected");}%>><%=rs4.getString("DESIGNATION")%></option>
<%}%>
</select>
</tr>
<tr>
</tr>
<tr>
<td style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" size="31" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>
<td style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;">
<select name="group" id="sow" style="width:100%;">      
<option value="">Select</option>
<%while(rsGR.next()){%>     
<option value="<%=rsGR.getString(1)%>" <%if(rsGR.getString(1).equalsIgnoreCase(scopeOfWork)){out.println("selected");}%>><%=rsGR.getString(1)%></option> 
<%}%>   
</select>  
</td>
</tr>
<tr>
<td style="text-align: right;">Employee Contract Type :</td>
<td style="text-align:left;">
<input type="text" readonly name="employeeOption1" size="31" value="<%=emp_contract_type%>"/>
</td>	
<td style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  name="d_reliving" size="31" value="<%=requestBy%>" readonly="readonly"/>
</td> 					        
</tr>
<tr>
<td align="right">Request :</td>
<td colspan="3">
<input type="radio" name="requestOption" value="New" <%if(requestOption.equalsIgnoreCase("New")){out.println("checked");}%>/>New
<input type="radio" name="requestOption" value="Change" <%if(requestOption.equalsIgnoreCase("Change")){out.println("checked");}%>/>Change
</td>
<input type="hidden" name="reqBranch" id="reqBranch" value ="<%=reqBranch%>"/>
</tr>
<%}%>
</table>
<br>
<%
System.out.println("reqFor==>"+reqFor);
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
<td id="req" rowspan="3" style="text-align:right; width: 15%;"><font color=red>*</font>Request For</td><input type="hidden" name="reqFor111" id="reqFor111" value="<%=reqFor111%>" size="100">
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk1%> name="requestForCheck" id="requestForCheck_email" onclick="reqFor(this)" value="Email ID">Email ID</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk2%> name="requestForCheck" id="requestForCheck_dom" onclick="reqFor(this)" value="Domain Account">Domain Account</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk3%> name="requestForCheck" id="requestForCheck_bio" onclick="reqFor(this)" value="Biometric / Access Card">Biometric / Access Card</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk4%> name="requestForCheck" id="requestForCheck_sha" onclick="reqFor(this)" value="Shared Folder">Shared Folder</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk5%> name="requestForCheck" id="requestForCheck_int" onclick="reqFor(this)" value="Internet Access / FTP Access">Internet Access / FTP Access</td>
<tr>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk6%> name="requestForCheck" id="requestForCheck_newins" onclick="reqFor(this)" value="NEWINS">NEWINS</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk7%> name="requestForCheck" id="requestForCheck_nexas" onclick="reqFor(this)" value="NExAS">NExAS</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk8%> name="requestForCheck" id="requestForCheck_gs" onclick="reqFor(this)" value="GS-NET">GS-NET</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk9%> name="requestForCheck" id="requestForCheck_internal" onclick="reqFor(this)" value="Internal Application">Internal Application</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk10%> name="requestForCheck" id="requestForCheck_usb" onclick="reqFor(this)" value="USB Access">USB Access</td>
</tr>
<tr>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk11%> name="requestForCheck" id="requestForCheck_vpn" onclick="reqFor(this)" value="VPN Access">VPN Access</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk12%> name="requestForCheck" id="requestForCheck_hard" onclick="reqFor(this)" value="HardDisk / PenDrive">HardDisk / PenDrive</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk13%> name="requestForCheck" id="requestForCheck_assets" onclick="reqFor(this)" value="Any Other Asset">Any Other Asset</td>
<td style="font-weight:bold;font-style:italic;"><input type="checkbox" <%=chk14%> name="requestForCheck" id="requestForCheck_glow" onclick="reqFor(this)" value="NEx-GLOW">NEx-GLOW</td>
<td colspan="2"></td>
</tr>
</tr>
</table>

<br>
<div id="email_details" style="display: none;visibility: hidden;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" id="emailRow" rowspan="6" style="width:15%"><font size="3"><b>Email ID</b></font></td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Email Domain :</td>
<td align="left" style="width: 20%;"><input type="hidden" name="emaildomain1" value="<%=emailDomain%>">
<select name="emaildomain" id="idemaildomain" style="width:80%;">      
<option value="">Select</option>
<%while(rsED.next()){%>     
<option value="<%=rsED.getString(1)%>" <%if(emailDomain.equalsIgnoreCase(rsED.getString(1))){out.println("selected");}%>><%=rsED.getString(1)%></option> 
<%}%>   
</select>   
</td>
<td style="text-align: right;width: 20%;"><font color=red>*</font>Employee Type :</td>
<td style="text-align: left;width: 20%;"><input type="hidden" name="emptype1" value="<%=employeeType%>">
<select name="emptype" id="idemptype" style="width:80%;">      
<option value="">Select</option>
<%while(rsET.next()){%>     
<option value="<%=rsET.getString(1)%>" <%if(employeeType.equalsIgnoreCase(rsET.getString(1))){out.println("selected");}%>><%=rsET.getString(1)%></option> 
<%}%>   
</select>
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Requested E-Mail Id :</td>
<td style="text-align:left;" colspan="3"><input type="text" value="<%=reqMailID%>" name="reqEmail" id="idreqEmail" style="width:60%;"/><input type="hidden" name="reqEmail1" value="<%=reqMailID%>"></td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided Mobile  :</td>
<td style="text-align:left;" colspan="3" id="compTD"><input type="hidden" name="mobileOption1" value="<%=compProv%>">
<input type="radio" name="mobileOption" value="Yes" onchange="showMob(this.value)" id="mobileOptionyes" <%if(compProv.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="mobileOption" value="No" onchange="showMob(this.value)" id="mobileOptionno" <%if(compProv.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="mob1"><font color=red>*</font>Mobile Make & Model  :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="mob2"><input type="text" name="makeModel" id="makeModel" value="<%=makemodel%>" style="width:100%;"><input type="hidden" name="makeModel1" value="<%=reqMailID%>">
</td>
</tr>
<tr>
<td style="text-align:right;"><font color=red>*</font>Company Provided SIM Card:</td>
<td style="text-align:left;" colspan="3" id="compSim"><input type="hidden" name="simOption1" value="<%=compProvSimCard%>">
<input type="radio" name="simOption" value="Yes" onchange="showSim(this.value)" id="simOptionyes" <%if(compProvSimCard.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="simOption" value="No" onchange="showSim(this.value)" id="simOptionno" <%if(compProvSimCard.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
<td style="visibility:hidden;display:none;text-align:right;" id="sim1"><font color=red>*</font>SIM Card Mobile Number :</td>
<td style="visibility:hidden;display:none;text-align:left;" id="sim2"><input type="text" value="<%=compProvSimNumber%>"  style="width:100%;" name="simNo" id="simNo"><input type="hidden" name="simNo1" value="<%=compProvSimNumber%>">
</td>
</tr>
<tr>
<td style="text-align: right;"><font color=red>*</font>Mobile Access (Intune)</td>
<td style="text-align:left;" colspan="3" id="mobInt"><input type="hidden" name="intune1" value="<%=mobIntune%>">
<input type="radio" name="intune" value="Yes" onchange="return intunedisplay(this.value)" id="intuneyes" <%if(mobIntune.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="intune" value="No" onchange="return intunedisplay(this.value)" id="intuneno" <%if(mobIntune.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
<td style="text-align:right;display: none;" id="intuneYes"><font color=red>*</font>Mobile No. :</td>
<td style="text-align:left;display: none;" id="intuneYes11"><input type="text" value="<%=mobileNo%>" name="mobile" id="idmobile" style="width:100%;"/><input type="hidden" name="mobile1" value="<%=mobileNo%>"></td>
</tr>
<tr id="intuneYes1" style="display: none;">
<td style="text-align:center;" colspan="4" class="tdColor"><font color="red">*</font>IMEI No. ('s) :</td>		
</tr>
<tr id="intuneYes111" style="display: none;">
<td style="text-align:right;display: none;" id="intuneYes12" colspan="1"><font color="red">*</font>IMEI No 1 :</td>
<td style="text-align:left;display: none;" id="intuneYes13"><input type="text" value="<%=imei1%>" name="imei1" id="idimei1" style="width:100%;"/><input type="hidden" name="imei11" value="<%=imei1%>"></td>		
<td style="text-align:right;display: none;" id="intuneYes2" colspan="1"><font color="red">*</font>IMEI No 2 :</td>
<td style="text-align:left;display: none;" id="intuneYes21" colspan="1"><input type="text" value="<%=imei2%>" name="imei2" id="idimei2" style="width:100%;"/><input type="hidden" name="imei21" value="<%=imei2%>"></td>
</tr>
<tr>
<td align="right" style="width:20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left" style="width:20%;" colspan="3"><textarea name="remarksEmail" id="remarksEmail" rows="3" cols="30" maxlength="199"><%=emailRemarks%></textarea><input type="hidden" name="remarksEmail1" value="<%=emailRemarks%>"></td>
</tr>
</table>
<br />
</div>
<%
String colorBG="",bgcolor="",rowDom="";
if(passChan.equalsIgnoreCase("Yes")){
	colorBG = "#9AA";
	bgcolor = "#9AA";
	rowDom = "3";
}else if(passChan.equalsIgnoreCase("No")){
	colorBG = "#9AA";
	bgcolor = "#9AA";
	rowDom = "3";	
}else{
	colorBG = "";
	bgcolor = "grey";
	rowDom = "3";
}
%>
<div id="dom_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor%>" align="center" rowspan="<%=rowDom%>" style="width:15%"><font size="3"><b>Domain Account</b></font></td>
</tr>
<tr>
<td style="text-align:right;width:20%;display:none;" id="domPass1" colspan="1" bgcolor="<%=colorBG%>"><font color="red">*</font>Password Reset :</td>
<td style="text-align:left;display:none;" colspan="3" id="domPass2" bgcolor="<%=colorBG%>"><input type="hidden" name="passChan1" value="<%=passChan%>">
<input type="radio" name="passChan" value="Yes" onchange="domCheck(this.value)" id="passChanYes" <%if(passChan.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="passChan" value="No" onchange="domCheck(this.value)" id="passChanNo" <%if(passChan.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" bgcolor="<%=colorBG%>"><font color="red">*</font>Remarks :</td>
<td style="text-align:left;width: 60%;" bgcolor="<%=colorBG%>"><textarea name="remarksDom" rows="3" cols="30" id="domainRem" maxlength="199"><%=domainRemarks%></textarea><input type="hidden" name="remarksDom1" id="remarksDom1" value="<%=domainRemarks%>"></td>
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
}else if(chanReqBio.equalsIgnoreCase("No")){
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
<td bgcolor="<%=bgcolor1%>" id="bioRow" align="center" rowspan="<%=rowBio%>" style="width:15%"><font size="3"><b>Biometric / Access Card</b></font></td>
</tr>
<tr style="display: none;" id="bioLoc" bgcolor="<%=colorBG1%>">
<td style="text-align:right; width: 20%;"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;width: 60%;" id="colBio" bgcolor="<%=colorBG1%>"><input type="hidden" name="changeBio1" value="<%=chanReqBio%>">
<input type="radio" name="changeBio" value="Yes" onchange="bioCheck(this.value)" id="changeBioYes" <%if(chanReqBio.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="changeBio" value="No" onchange="bioCheck(this.value)" id="changeBioNo" <%if(chanReqBio.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
<td style="text-align:right;display: none;" colspan="1" id="bio1" bgcolor="<%=colorBG1%>"><font color="red">*</font>Branch ('s):</td>
<td style="text-align: left;display: none;width: 20%;" id="bio2" bgcolor="<%=colorBG1%>"><input type="hidden" name="selBranch1" id="selBranch1" value="<%=selBioBranches%>">
<select name="selBranch" id="selBranch" multiple="multiple" style="width: 100%;">
<%while(rsMul.next()){%>
<option value="<%=rsMul.getString(1)%>"><%=rsMul.getString(2)%></option>
<%}%>
</select>
</tr>
<tr>
<td align="right" style="width: 20%;" bgcolor="<%=colorBG1%>"><font color="red">*</font>Remarks :</td>
<td align="left" style="width: 60%;" colspan="3" bgcolor="<%=colorBG1%>"><textarea name="bioRemarks" rows="3" cols="30" id="bioRemarks" maxlength="199" ><%=bioRemarks%></textarea><input type="hidden" name="bioRemarks1" id="bioRemarks1" value="<%=bioRemarks%>"></td>
</tr>
</table>
<br />
</div>

<div id="sha_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Shared Folder Access</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="sharedRemarks" rows="3" cols="30" id="shareRemarks" maxlength="199" ><%=folderRemarks%></textarea><input type="hidden" name="sharedRemarks1" value="<%=folderRemarks%>"></td>
</tr>
</table>
<br />
</div>

<div id="int_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internet Access / FTP Access</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Request Type :</td>
<td colspan="3" style="font-weight:bold;font-style:italic;text-align:left;width: 60%;"><input type="hidden" name="requestTypeOption1" value="<%=internetReqType%>">
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption1" <%if(internetReqType.equalsIgnoreCase("Privilege Access")){out.println("checked");}%> value ="Privilege Access">Privilege Access
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption2" <%if(internetReqType.equalsIgnoreCase("Normal Access")){out.println("checked");}%> value ="Normal Access">Normal Access
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption3" <%if(internetReqType.equalsIgnoreCase("Limited Access")){out.println("checked");}%> value ="Limited Access">Limited Access
<input type ="radio" name = "requestTypeOption" id="idrequestTypeOption4" <%if(internetReqType.equalsIgnoreCase("No Internet Access")){out.println("checked");}%> value ="No Internet Access">No Internet Access
</td>
</td>
</tr>
<tr>
<td align="right" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left" colspan="3"><textarea name="internetRem" rows="3" cols="30" id="idinternetRem" maxlength="199" ><%=internetRemarks%></textarea><input type="hidden" name="internetRem1" value="<%=internetRemarks%>"></td>
</tr>
</table>
<br />
</div>

<%
String colorBG2="",bgcolor2="",rowNEW="";
if(changesNewins.equalsIgnoreCase("Yes")){
	colorBG2 = "#9AA";
	bgcolor2 = "#9AA";
	rowNEW	 = "5";
}else if(changesNewins.equalsIgnoreCase("No")){
	colorBG2 = "#9AA";
	bgcolor2 = "#9AA";
	rowNEW	 = "5";
}else{
	colorBG2 = "";
	bgcolor2 = "grey";
	rowNEW	 = "4";
}
%>
<div id="new_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor2%>" align="center" rowspan="<%=rowNEW%>" id="newCol" style="width:15%"><font size="3"><b>NEWINS</b></font></td>
</tr>
<tr style="display: none;" id="newLoc">
<td style="text-align:right; width: 20%;" bgcolor="<%=colorBG2%>"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;" id="colnew" bgcolor="<%=colorBG2%>"><input type="hidden" name="changeNew1" value="<%=changesNewins%>">
<input type="radio" name="changeNew" value="Yes" onchange="return newCheck(this.value)" id="changeNewYes" <%if(changesNewins.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="changeNew" value="No" onchange="return newCheck(this.value)" id="changeNewNo" <%if(changesNewins.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
<td style="text-align:right;width: 20%;display: none;" colspan="1" id="new1" bgcolor="<%=colorBG2%>"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;display: none;" id="new2" bgcolor="<%=colorBG2%>"><input type="hidden" name="prevNewinBr1" value="<%=previousBranchesNewins%>">
<input type="text" name="prevNewinBr" id="prevNew" readonly value="<%=previousBranchesNewins%>" >
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1" bgcolor="<%=colorBG2%>"><font color=red>*</font>Requested Branch Code :</td>
<td style="text-align: left;" colspan="3" bgcolor="<%=colorBG2%>"><input type="hidden" name="reqBrCode1" value="<%=newinsBranchCode%>">
<input type="hidden" name="newBRS" size=50 id="idnewBRS" value="<%=newinsBranchCode%>" />
<div class="multiselect">
<div class="selectBox" onclick="showCheckboxesBC()" >
<select style="width:30%;" id="idselBranch">
<option value="">Select</option>
</select>
<input type="text" name="reqBrCode" value="<%=newinsBranchCode%>" size=50 id="idreqBranch" readonly/>
<div class="overSelect"></div>
</div>
<div id="checkboxesBC"  onclick="showCheckboxesBC()">
<%while(rsBC.next()){%> 
<label for="<%=rsBC.getString(1)%>" style="width:55%; text-align: left;">
<input type="checkbox" name="approverslistBC" onclick="syncBC(this);showCheckboxesBC();" id="idapproverslistBC<%=rsBC.getString(1)%>" class="group1BC" value="<%=rsBC.getString(1)%>" /><%=rsBC.getString(1)%> -- (<%=rsBC.getString(2)%>)</label>
<%}%>
</div>
</div>
</td>
</tr>
<tr>
<td style="text-align: right;width:20%;" bgcolor="<%=colorBG2%>"><font color=red>*</font>Requested NEWIN's ID / Operator Code :</td>
<td style="text-align:left;width:60%;" colspan="3" bgcolor="<%=colorBG2%>"><input type="text" name="newinCode" id="ncode" maxlength="44" size="29" value="<%=newinsOpCode%>" /><input type="hidden" name="newinCode1" value="<%=newinsOpCode%>"></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" bgcolor="<%=colorBG2%>"><font color=red>*</font>Request  :</td>
<td style="font-weight:bold;font-style:italic;width:60%;" colspan="3" bgcolor="<%=colorBG2%>"><input type="hidden" name="reqNew1" id="reqNew1" value="<%=newinsRequest%>">
<input type="radio" name="reqNew" value="New" id="idreqNew1" onclick="showTR1(this.value);" <%if(newinsRequest.equalsIgnoreCase("New")){out.println("checked");}%>/>New
<input type="radio" name="reqNew" value="Change" id="idreqNew2" onclick="showTR1(this.value);" <%if(newinsRequest.equalsIgnoreCase("Change")){out.println("checked");}%>/>Change
</td>
</tr>
<tr style="visibility: hidden;display: none;" id="idDelete" bgcolor="<%=colorBG2%>">
<td style="text-align: right;width: 20%;" bgcolor="<%=colorBG2%>"><font color=red>*</font>Remarks :</td>
<td style="text-align: left;width: 20%;" colspan="3"><textarea name="newRem" rows="3" cols="30" id="newRem" maxlength="99" title="Remarks 100 characters" ><%=newinsRemarks%></textarea><input type="hidden" name="newRem1" value="<%=newinsRemarks%>"></td>
</tr>
</table>
<br />
</div>

<div id="nex_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="8" style="width:15%"><font size="3"><b>NExAS</b></font></td>
<td align="right" colspan="1" style="width:20%;"><font color="red">*</font>Company Code :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="hidden" name="compCode1" value="<%=nexasCompCode%>">
<select style="width: 30%;" name="compCode" id="idcompCode">
<option value="">Select</option>
<option value="NIN" <%if(nexasCompCode.equalsIgnoreCase("NIN")){out.println("selected");}%>>NIN</option>
</select>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Cost Center Name:</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="hidden" name="costCName1" value="<%=nexasCCName%>">
<%
Connection con11 = null;
ResourceBundle dbProperties1 = ResourceBundle.getBundle("csdb");
String userName1 = dbProperties1.getString("csdb.username");
String password1 = dbProperties1.getString("csdb.password");
String url1 = dbProperties1.getString("csdb.url");
String driver1 = dbProperties1.getString("csdb.driverName");
String dbName1 = dbProperties1.getString("csdb.dbName");
//int sumcount=0;
Statement stcc=null;
ResultSet rscc=null; 
try
{
// id="idBranch"
Class.forName(driver1).newInstance();
con11 = DriverManager.getConnection(url1+dbName1,userName1,password1); 
String query = "select * from nexascostmaster ORDER BY costname Asc";
stcc = con11.createStatement();
rscc = stcc.executeQuery(query);
%>
<select name="costCName" id="idcostCName" onchange="callcostDetails(this.value)" style="width:30%;">
<option value="">Select</option>
<%while(rscc.next()){%>
<option value="<%=rscc.getString(2)%>" <%if(nexasCCName.equalsIgnoreCase(rscc.getString(2))){out.println("selected");}%>><%=rscc.getString(2)%></option>
<%}%>
</select>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
con11.close();
stcc.close();
rscc.close();
}%>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Cost Center Code:</td>
<td style="text-align: left;width: 60%;" colspan="3"><input size="31" type="text" name="costCCode" id="idcostCCode" value="<%=nexasCCCode%>" size="10" maxlength="44"/><input type="hidden" name="costCCode1" value="<%=nexasCCCode%>"></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Operation range:</td>
<td style="text-align: left;width: 60%;" colspan="3"><input size="31" type="text" name="costOPRange" id="idcostOPRange" value="<%=nexasOPRange%>" size="10" maxlength="44"/><input type="hidden" name="costOPRange1" value="<%=nexasOPRange%>"></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color=red>*</font>Request Type <font color=red>(Please select first)</font></td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="hidden" name="usKnd" id="usKnd" value="<%=nexasReqType%>">
<input type="hidden" name="userKind1" value="<%=nexasReqType%>">
<table>
<tr>
<td><input type="radio" size="50" name="userKind" id="userKind1" value="HOAcUser" onclick="active(this.value)" <%if(nexasReqType.equalsIgnoreCase("HOAcUser")){out.println("checked");}%>>HO Acounting User</td>
<td><input type="radio" size="50" name="userKind" id="userKind2" value="BRAcUser" onclick="active(this.value)" <%if(nexasReqType.equalsIgnoreCase("BRAcUser")){out.println("checked");}%>>Branch Acounting User</td>
</tr>
<tr>
<td><input type="radio" size="50" name="userKind" id="userKind3" value="ITUser" onclick="active(this.value)" <%if(nexasReqType.equalsIgnoreCase("ITUser")){out.println("checked");}%>>IT User</td>
<td><input type="radio" size="50" name="userKind" id="userKind4" value="RepoDispOnly" onclick="active(this.value)" <%if(nexasReqType.equalsIgnoreCase("RepoDispOnly")){out.println("checked");}%>>Report display only User</td>
</tr>
</table>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1">Optional menu</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="hidden" value="<%=nexasOptionalMenu%>" id="nexAppSel">
<input type="hidden" name="OptionalMenu1" value="<%=nexasOptionalMenu%>">
<table>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu1" value="paymentProp" <%if(nexasOptionalMenu.contains("paymentProp")){out.println("checked");}%>></input> Payment Proposal</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu2" value="paymentAppr" <%if(nexasOptionalMenu.contains("paymentAppr")){out.println("checked");}%>></input> Payment Approval</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu3" value="openCloseSch" <%if(nexasOptionalMenu.contains("openCloseSch")){out.println("checked");}%>></input> Open/Close Schedule</td>
</tr>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu4" value="voidCheq" <%if(nexasOptionalMenu.contains("voidCheq")){out.println("checked");}%>></input> Void Cheque</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu5" value="issueCheq" <%if(nexasOptionalMenu.contains("issueCheq")){out.println("checked");}%>></input> Issue Cheque</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu6" value="taxRepo" <%if(nexasOptionalMenu.contains("taxRepo")){out.println("checked");}%>></input> Tax Report</td>
</tr>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu7" value="ExchangRateMa" <%if(nexasOptionalMenu.contains("ExchangRateMa")){out.println("checked");}%>></input> Exchange Rate Maintainance</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu8" value="offsetAc" <%if(nexasOptionalMenu.contains("offsetAc")){out.println("checked");}%>></input> Offset Account</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu9" value="addfreeMaster" <%if(nexasOptionalMenu.contains("addfreeMaster")){out.println("checked");}%>></input> Addfree master Maintainance</td>
</tr>
<tr>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu10" value="paymentOpeBranch" <%if(nexasOptionalMenu.contains("paymentOpeBranch")){out.println("checked");}%>></input> Payment operation of branch</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu11" value="batchInput" <%if(nexasOptionalMenu.contains("batchInput")){out.println("checked");}%>></input> Batch Input</td>
<td><input type="checkbox" size="50" name="OptionalMenu[]" id="OptionalMenu12" value="SEPABACS" <%if(nexasOptionalMenu.contains("SEPABACS")){out.println("checked");}%>></input> SEPA.BACS data Download</td>
</tr>
</table>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="nexasRem" rows="3" cols="30" id="idnexasRem" maxlength="199" ><%=nexasRemarks%></textarea><input type="hidden" name="nexasRem1" value="<%=nexasRemarks%>"></td>
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
}else if(changesGSNet.equalsIgnoreCase("No")){
	colorBG3 = "#9AA";
	bgcolor3 = "#9AA";
	rowGS	 = "7";
}else{
	colorBG3 = "";
	bgcolor3 = "grey";
	rowGS	 = "6";
}
%>
<div id="gs_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="<%=bgcolor3%>" id="gsnet" align="center" rowspan="<%=rowGS%>" style="width:15%"><font size="3"><b>GS-NET</b></font></td>
<tr style="display: none;" id="gsLoc" bgcolor="<%=colorBG3%>">
<td style="text-align:right; width: 20%;" bgcolor="<%=colorBG3%>"><font color="red">*</font>Changes Required ?:</td>
<td style="text-align:left;" colspan="3" bgcolor="<%=colorBG3%>"><input type="hidden" value="<%=changesGSNet%>" name="changeGS1">
<input type="radio" name="changeGS" value="Yes" onchange="return gsCheck(this.value)" id="changeGSYes" <%if(changesGSNet.equalsIgnoreCase("Yes")){out.println("checked");}%>/>Yes
<input type="radio" name="changeGS" value="No" onchange="return gsCheck(this.value)" id="changeGSNo" <%if(changesGSNet.equalsIgnoreCase("No")){out.println("checked");}%>/>No
</td>
</tr>
<tr style="display: none;" id="gs1" bgcolor="<%=colorBG3%>">
<td style="text-align:righ;" bgcolor="<%=colorBG3%>"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;" bgcolor="<%=colorBG3%>"><input type="hidden" value="<%=prevBRCodesGSNet%>" name="changesGSNet1">
<textarea type="text" name="changesGSNet" id="changesGSNet" rows="3" value="<%=prevBRCodesGSNet%>" ><%=prevBRCodesGSNet%></textarea>
</td>
<td style="text-align:right;" bgcolor="<%=colorBG3%>"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;" bgcolor="<%=colorBG3%>"><input type="hidden" value="<%=prevDivGSNet%>" name="prevDivGSNet1">
<textarea type="text" name="prevDivGSNet" id="prevDivGSNet" rows="3" value="<%=prevDivGSNet%>" ><%=prevDivGSNet%></textarea>
</td>
</tr>
<tr style="display: none;" id="gs2" bgcolor="<%=colorBG3%>">
<td style="text-align:right;width: 20%;" bgcolor="<%=colorBG3%>"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;" bgcolor="<%=colorBG3%>"><input type="hidden" value="<%=prevPDivGSNet%>" name="prevPDivGSNet1">
<textarea type="text" name="prevPDivGSNet" id="prevPDivGSNet" rows="3" value="<%=prevPDivGSNet%>" ><%=prevPDivGSNet%></textarea>
</td>
<td style="text-align:right;width: 20%;" bgcolor="<%=colorBG3%>"><font color="red">*</font>Previously Selected Branch ('s):</td>
<td style="text-align: left;" bgcolor="<%=colorBG3%>"><input type="hidden" value="<%=prevRoleGSNet%>" name="prevRoleGSNet1">
<textarea type="text" name="prevRoleGSNet" id="prevRoleGSNet" rows="3" value="<%=prevRoleGSNet%>" ><%=prevRoleGSNet%></textarea>
</td>
</tr>
<tr bgcolor="<%=colorBG3%>">    
<td style="text-align: right;width: 20%;" colspan="1" bgcolor="<%=colorBG3%>"><font color=red>*</font>Requested GSNET Branch Code :</td>
<td style="text-align: left;width: 60%;" colspan="3" style="width:62%" bgcolor="<%=colorBG3%>"><input type="hidden" name="gsSel" id="gsSel" value="<%=gsnetBranchCode%>">
<input type="hidden" value="<%=prevBRCodesGSNet%>" name="gsnetBrCode1">
<input type="hidden" value="<%=prevDivGSNet%>" name="gsnetDiv1">
<input type="hidden" value="<%=prevPDivGSNet%>" name="gsnetPdiv1">
<input type="hidden" value="<%=prevRoleGSNet%>" name="role1">
<table bgcolor="<%=colorBG3%>">
<%
int column=0,column2=0,count=0;
Connection con1 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Statement st=null;
ResultSet rs=null; 
try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from gsnetbranchcodemaster ORDER BY branchcode Asc";
st = con1.createStatement();
rs = st.executeQuery(query);
int i=1;
count=0;
column=0;
ArrayList<String> gsnetBranchCodes = new ArrayList<String>();
%>							
<%while(rs.next()){
	gsnetBranchCodes.add(rs.getString(2));
}
for(int row=0;row<gsnetBranchCodes.size();row+=3)
{
%>
<tr bgcolor="<%=colorBG3%>">
<%
for(column=0;column<3;column++){
if(row+column<gsnetBranchCodes.size())
{ 
String temp = gsnetBranchCodes.get(row+column);
%>
<td bgcolor="lightgrey" style="background-color: <%=colorBG3%>;">
<input type="checkbox" name="gsnetBrCode[]" id="idgsnetBrCode<%=gsnetBranchCodes.get(row+column)%>" value="<%=gsnetBranchCodes.get(row+column)%>" /><span style="font-size: 11px;"><%=gsnetBranchCodes.get(row+column)%></span></td>
<%
}
}
%>
</tr>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
//	DbUtil.closeDBResources(rs,st,con);
con1.close();
}%>
</table>
</td>
</tr>

<tr bgcolor="<%=colorBG3%>">     
<td style="text-align: right;width: 20%;" colspan="1" bgcolor="<%=colorBG3%>"><font color=red>*</font>Requested Division Name :</td>
<td style="text-align: left;width: 20%;" colspan="3" bgcolor="<%=colorBG3%>"><input type="hidden" name="selDiv" id="selDiv" value="<%=gsnetDivName%>" >
<%       
try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from gsntdivisionmaster ORDER BY divName Asc";
st1 = con1.createStatement();
rs1 = st1.executeQuery(query);
%>
<%while(rs1.next()){%>
<input type='checkbox' id='idgsnetDiv<%=rs1.getString(2)%>' name='gsnetDiv[]' value="<%=rs1.getString(2)%>"/><%=rs1.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
con1.close();
}%>
</td>
</tr>
<tr bgcolor="<%=colorBG3%>">
<td style="text-align: right;width: 20%;" colspan="1" bgcolor="<%=colorBG3%>"><font color=red>*</font>Requested Primary Division:</td>
<td style="text-align: left;width: 20%;" colspan="3" bgcolor="<%=colorBG3%>"><input type="hidden" name="selPD" id="selPD" value="<%=gsnetPrimaryDiv%>" >
<%
try
{
Class.forName(driver).newInstance();
con1 = DriverManager.getConnection(url+dbName,userName,password); 
String query = "select * from gsnetprimarydivmaster ORDER BY divName Asc";
st2 = con1.createStatement();
rs2 = st2.executeQuery(query);
%>
<%while(rs2.next()){%>
<input type='checkbox' id='idgsnetPdiv<%=rs2.getString(2)%>' name='gsnetPdiv[]' value="<%=rs2.getString(2)%>"/><%=rs2.getString(2)%>
<%}%>
<%} catch (SQLException ex) {
ex.printStackTrace();
}	
finally{
con1.close();
}%>
</td>
</tr>
<tr bgcolor="<%=colorBG3%>">
<td style="text-align: right;width: 20%;" colspan="1" bgcolor="<%=colorBG3%>"><font color=red>*</font>Requested User Role  :</td>
<td style="text-align: left;width: 20%;" colspan="3" bgcolor="<%=colorBG3%>"><input type="hidden" name="selRole" id="selRole" value="<%=gsnetUserRole%>" >
<input type='checkbox' id='role0' name='role[]' value="USER"/>USER
<input type='checkbox' id='role1' name='role[]' value="MANAGER"/>MANAGER
</td>
</tr>
<tr bgcolor="<%=colorBG3%>">
<td style="text-align: right;width: 20%;" colspan="1" bgcolor="<%=colorBG3%>"><font color=red>*</font>Remarks  :</td>
<td style="text-align: left;width: 60%;" colspan="3" bgcolor="<%=colorBG3%>"><textarea name="gsNetremarks" rows="3" cols="30" id="gsNetremarks" maxlength="199" title="Remarks 200 characters" ><%=gsnetRemarks%></textarea><input type="hidden" value="<%=gsnetRemarks%>" name="gsNetremarks1" id="gsNetremarks1"></td>
</tr>
</table>
<br />
</div>

<div id="inter_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="2" style="width:15%"><font size="3"><b>Internal Application</b></font></td>
<td align="right" colspan="1" style="width:20%"><font color="red">*</font>Internal Application :</td><input type="hidden" value="<%=internalApplication%>" name="Software1">
<td style="text-align: left;width: 60%;" colspan="3"><input type="hidden" id="intApp" value="<%=internalApplication%>">
<%-- <textarea rows="3" cols="65" ><%=internalApplication%></textarea> --%>
<div class="multiselect">
<div class="selectBox" onclick="showCheckboxes()" >
<select style="width:30%;" id="idSelSoftware">
<option value="">Select</option>
</select>
<input type="text" name="Software" size=50 id="Software" value="<%=internalApplication%>" readonly/>
<div class="overSelect"></div>
</div>
<div id="checkboxes"  onclick="showCheckboxes()">
<%while(rsINT.next()){%> 
<label for="<%=rsINT.getString("app_name")%>" style="width:55%; text-align: left;">
<input type="checkbox" name="approverslist" onclick="sync(this);showCheckboxes();" id="idapproverslist<%=rsINT.getString("app_name")%>" class="group1" value="<%=rsINT.getString("app_name")%>" /><%=rsINT.getString("app_name")%></label>
<%}%>
</div>
</div>
</td>
</td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="internalRem" rows="3" cols="30" id="idinternalRem" maxlength="199" ><%=internalRemarks%></textarea><input type="hidden" value="<%=internalRemarks%>" name="internalRem1"></td>
</tr>
</table>
<br />
</div>

<div id="usb_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>USB Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>Access For :</td>
<td style="text-align: left;" style="width:60%" colspan="3"><input type="hidden" name="accessFor1" value="<%=usbAccessFor%>">
<select name="accessFor" id="idaccessFor" style="width:30%;" onchange="callFun(this.value);">
<option value="">Select</option>
<option value="PenDrive" <%if(usbAccessFor.equalsIgnoreCase("PenDrive")){out.println("selected");}%>>PenDrive</option>
<option value="DSC_CHA" <%if(usbAccessFor.equalsIgnoreCase("DSC_CHA")){out.println("selected");}%>>DSC-CHA</option>
<option value="DSC_OTHER" <%if(usbAccessFor.equalsIgnoreCase("DSC_OTHER")){out.println("selected");}%>>DSC-OTHER</option>
</select>
</td>
</tr>
<tr>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>USB Details:</td>
<td style="text-align: left;width:60%;" colspan="3"><input type="text"  size="31" name="dscNo" value="<%=usbDetails%>" id="dscNo" maxlength="44" /><input type="hidden" name="dscNo1" value="<%=usbDetails%>"></td>		
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks / Reason :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="usbRem" rows="3" cols="30" size="31" id="idUSBRem" maxlength="199" ><%=usbRemarks%></textarea><input type="hidden" name="usbRem1" value="<%=usbRemarks%>"></td>
</tr>
</table>
<br />
</div>

<div id="vpn_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>VPN Access</b></font></td>
<td style="text-align: right;width:20%;" colspan="1"><font color=red>*</font>Domain ID :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" name="domID" id="idDOMid" size="31" maxlength="44" value="<%=vpnDomainID%>" /><input type="hidden" name="domID1" value="<%=vpnDomainID%>"></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Email ID :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="text" name="vpnEmail" id="idvpnEmail" size="31" maxlength="44" value="<%=vpnEmailID%>" /><input type="hidden" name="vpnEmail1" value="<%=vpnEmailID%>"></td>
</tr>
<tr>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>MPLS / NON MPLS :</td>
<td style="text-align: left;width: 60%;" colspan="3"><input type="hidden" name="mlps1" value="<%=vpnMPLS%>">
<select name="mlps" id="idMlps" style="width:30%;">
<option value="">Select</option>
<option value="MPLS" <%if(vpnMPLS.equalsIgnoreCase("MPLS")){out.println("selected");}%>>MPLS</option>
<option value="NON MPLS" <%if(vpnMPLS.equalsIgnoreCase("NON MPLS")){out.println("selected");}%>>NON MPLS</option>
</select>
</td>
</tr>
</table>
<br />
</div>

<div id="hard_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>HardDisk / PenDrive</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="hardRemarks" rows="3" cols="30" id="hardRemarks" maxlength="199" ><%=hardRemarks%></textarea><input type="hidden" name="hardRemarks1" value="<%=hardRemarks%>"></td>
</tr>
</table>
<br />
</div>

<div id="asset_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" style="width:15%"><font size="3"><b>Any Other Asset</b></font></td>
<td style="text-align: right;width: 20%;" colspan="1"><font color="red">*</font>Remarks :</td>
<td style="text-align: left;width: 60%;" colspan="3"><textarea name="assetRemarks" rows="3" cols="30" id="assetRemarks" maxlength="199"><%=otherRemarks%></textarea><input type="hidden" name="assetRemarks1" value="<%=otherRemarks%>"></td>
</tr>
</table>
<br />
</div>

<div id="glow_details" style="display: none;">
<table width="895">
<tr>
<td bgcolor="grey" align="center" rowspan="3" style="width:15%"><font size="3"><b>NEx-GLOW</b></font></td>
<td align="right" style="width: 20%;" colspan="1"><font color="red">*</font>Project :</td>
<td align="left" style="width: 60%;"><input type="text" name="project" id="project" value="<%=project%>" size="50" ><input type="hidden" name="project1" value="<%=project%>"></td>
</tr>
<tr>
<td align="right" style="width: 20%;"><font color="red">*</font>Ware-House :</td>
<td align="left" style="width: 60%;"><input type="text" name="warehouse" id="warehouse" value="<%=warehouse%>" size="50" ><input type="hidden" name="warehouse1" value="<%=warehouse%>"></td>
</tr>
<tr>
<td align="right" colspan="1"><font color="red">*</font>Remarks :</td>
<td align="left" colspan="3"><textarea name="glowRemarks" rows="3" cols="30" id="glowRemarks" maxlength="199" ><%=glowRemarks%></textarea><input type="hidden" name="glowRemarks1" value="<%=glowRemarks%>"></td>
</tr>
</table>
<br />
</div>

<center><h2><u>Approval Routine</u></h2></center>
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
st1=conED.createStatement();
String statusD=null,levelno="",colChange="red";
rs1 = st1.executeQuery("select form2_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),mail,levelno from neinapplicationform_item WHERE form2_no='"+req+"' order by item_id asc"); 
while(rs1.next())
{
String form2_noD= rs1.getString(1);
String desgD= rs1.getString(2);
empD= rs1.getString(3);
statusD= rs1.getString(4);
String remarksD= rs1.getString(5);
String f_dateD= rs1.getString(6);
mailD= rs1.getString(7);
levelno= rs1.getString("levelno");
String m = "";
if(rs1.getString("mail")!=null)
{
 m =  rs1.getString("mail").trim();
}

if(statusD.equalsIgnoreCase("Initiator")){
	colChange = "#0066FF";
}else if(statusD.equalsIgnoreCase("Approved") || statusD.equals("Clarification Required")){
	colChange = "lightgreen";
}else if(statusD.equalsIgnoreCase("Pending")){
	colChange = "#FF6600";
}else{
	colChange = "#FF0000";
}
%>
<tr>
<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font><input id="idStatus1" type="hidden" value="<%=statusD%>"/></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
<td bgcolor="white" width="100" class="fonter" style="background-color: <%=colChange%>"><%=statusD%></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
</tr>
<%}%>
</table>
</br>
<%
String flag = c2ITUtil1.getAuthorizedNameAPPForm(form2_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),session.getAttribute("EmpNo").toString()); 
System.out.println("FLAG IT value --------------------- : "+flag);
%>

<%
String crlvl="",clarifyCol="";
rs1 = st1.executeQuery("select distinct levelno,clarifyCol from neinapplicationform_item WHERE form2_no='"+req+"' and empid='"+emp_no2+"' ORDER BY item_id desc");
if(rs1.next()){
	crlvl = rs1.getString(1);
	clarifyCol = rs1.getString(2);
}
System.out.println("crlvl====>"+crlvl);
%>
<input type="hidden" value="<%=crlvl%>" name="clvl" id="clvl">
<input type="hidden" value="<%=clarifyCol%>" name="clarifyCol" id="clarifyCol">

<table align="center" class="dynatable" width="895" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
<input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
<input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
<input type="hidden" value="<%= session.getAttribute("form2_no") %>" id="idmrId"/>
<input type="hidden" id="idstatus" value="<%=flag%>" />

<tr>
<td align="left" colspan="11">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="showApp1();ajaxApprover();"/>Approved 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return hideApp(this.value);" />Not Approved

<%if(!crlvl.equalsIgnoreCase("00") && !crlvl.equalsIgnoreCase("Creater") && !clarifyCol.equalsIgnoreCase("2")){%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Clarification Required" onclick="return hideApp(this.value);" />Clarification Required
<%}%>

</td>
</tr>
<tr style="display: none;" id="idApproved">
<%
try{
String nuname="",ndesg="",nmailid="",napproval="",napproval1="",maxlevel="",roapprover="";
String i_b_no1=req.substring(17,19);

int nextlevel=0;
st5 = conED.createStatement(); 
st11 = conED.createStatement(); 

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

rs11 = st11.executeQuery("SELECT levelno,empid,clarifyCol FROM neinApplicationForm_item WHERE clarifyCol='1' and form2_no='"+req+"'");
if(rs11.next())
{ 
	nextlevel  = rs11.getInt(1);
	roapprover = rs11.getString(2);
	clarifyCol = rs11.getString(3);
}

if(clarifyCol.equalsIgnoreCase("1")){
	rs11 = st11.executeQuery("SELECT distinct levelno FROM neinApplicationForm_item WHERE empid='"+roapprover+"' and clarifyCol='1' and form2_no='"+req+"' ORDER BY levelno desc");
	if(rs11.next()){
		nextlevel = rs11.getInt(1);
	}
}else{
	nextlevel  = nextlevel;
}


%>
<input type="hidden" value="<%=i_b_no1%>" name="i_b_no1">
<input type="hidden" value="<%=nextlevel%>" name="nextlevel">
<input type="hidden" value="<%=levelno%>" name="vlvl">
<input type="hidden" value="<%=clarifyCol%>" name="clarCol">
<%
if(!clarifyCol.equalsIgnoreCase("1")){
if(!(reqFor.contains("NEWINS")) && !(reqFor.contains("GS-NET")) && !(reqFor.contains("NEx-GLOW")) && !(reqFor.contains("NExAS")) && Integer.parseInt(levelno)==3 && !i_b_no1.equals("90")){
	nextlevel++;
	nextlevel++;
//System.out.println("here"+nextlevel);
}else if(!(reqFor.contains("NEWINS")) && !(reqFor.contains("GS-NET")) && !(reqFor.contains("NEx-GLOW")) && !(reqFor.contains("NExAS")) && Integer.parseInt(levelno)==1 && i_b_no1.equals("90")){
	nextlevel++;
	nextlevel++;
}
}

rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='APPLICATION' ORDER BY levelno desc");
if(rs5.next())
{
System.out.println(rs5.getString(5));

Connection connhrms = null;
ResourceBundle dbPropertiesl1 = ResourceBundle.getBundle("leavemanagement");
String userName1l = dbPropertiesl1.getString("leavemanagement.username");
String password1l = dbPropertiesl1.getString("leavemanagement.password");
String urll1 = dbPropertiesl1.getString("leavemanagement.url");
String driver1l = dbPropertiesl1.getString("leavemanagement.driverName");
String dbNamel1 = dbPropertiesl1.getString("leavemanagement.dbName");

connhrms = DriverManager.getConnection(urll1+dbNamel1,userName1l,password1l);  
Statement nstmt = connhrms.createStatement();  

nstmt = connhrms.createStatement(); 
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
<input type="hidden" name="senddirect" id="senddirect" value="sendonly" readonly/>
<td> 
<input align="left" type="radio" value="<%=napproval%>" id="iddeptadminP1" name="iddeptadminP1" onclick="syncApp(iddeptadminP.value);"/>
<input type="text" name="mail11" id="iddeptadminP11" value="<%=napproval1%>" size="50" readonly/>
<input type="hidden" name="mail12" id="iddeptadminP" value="<%=napproval%>" size="30"/>
</td>
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
<%}
}catch(Exception e){
	System.out.println("here at 3303=="+e);
}
%>
</tr>
<tr style="display: none;" id="idApproved1">
	<td>Mail will be send to All approver.</td>
</tr>

<tr style="display: none;" id="idApproved2">
	<td align="left" colspan="10">
		<b>Send To:</b>
		<%
		cnNew = con.getConnection2();
		stNew=cnNew.createStatement();
		rsNew = stNew.executeQuery("SELECT DISTINCT mail,emp,desg,form2_no,empid,levelno FROM neinApplicationForm_item WHERE form2_no='"+req+"' and empid<>'"+emp_no2+"' ORDER BY item_id DESC");
		while(rsNew.next()){
		  String Mailing=rsNew.getString("mail");
		  String emp1= rsNew.getString("emp");
		  String desg1 = rsNew.getString("desg");
		  String empidclar = rsNew.getString("empid");
		  String levelno1 = rsNew.getString("levelno");
		  String empDesgMail = empidclar+","+emp1+","+desg1+","+Mailing+","+levelno1;%>
	 	  <input type="radio" name="mailingCheckClarificationStart" value="<%=empDesgMail%>" onclick="syncApp('<%=empDesgMail%>');"/>&nbsp;&nbsp;<%=Mailing%>
		  <%}%>
	</td>
<input type="hidden" name="empid1" id="idempid1" value="" readonly/>
<input type="hidden" name="emp" id="idroname" value="" readonly/> 
<input type="hidden" name="desg" id="idrodesg" value="" readonly/>
<input type="hidden" name="mail1" id="idromail" value="" readonly/>
<input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
</tr>

</table>


<table id="it" width="895">
<tr><td id="ita"><font color=red>*</font>Remarks/Reason</td></tr>
<tr><td><textarea name="remarks" rows="3" cols="120" id="ta" maxlength="199"></textarea></td></tr>
</table>
</br>

</td>
</tr>
</table> 

<table style="margin-left: auto;margin-right: auto;" ><tr>
<td style="size:1"> <div id="formsubmitbutton"> <input style="size:1;font-size: 1.1em;" type="submit" value="SUBMIT" name="save1" id="save1" onclick="return validate();" /></div>
<div id="buttonreplacement" style="display:none;"><img src="http://www.willmaster.com/images/preload.gif" alt="loading..." /></div></td>
<td><input style="size:1;font-size: 1.1em;" type="button" id="btnShowSimple" value="HELP" /></td>
<td style="font-size:1"><input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.history.go(-1); return false;"/> </td>
</tr>
</table>
</center>
<br />
<br />
<br />
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
<br />
<label style="text-align:center;">HR/Admin</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label style="text-align:center;">RO</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>Branch IT</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>Branch GA</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>Branch Head</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label>HO IT</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label>HO Finance</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label>HO GA</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label>CFO</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br /> 
<label>HO IT</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>Code Creater</label>
<br />
</form>	
<div id="resultFromAjax3" style="display:none;"></div>
<div id="resultFromAjax21" style="display:none;"></div>
<div id="resultFromAjaxApp" style="display:none;"></div>
</body>
</html>