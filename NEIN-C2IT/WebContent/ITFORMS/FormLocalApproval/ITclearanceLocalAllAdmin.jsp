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
<%@ include file="../../../Session/NormalAdminSessionInSide2.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<title>Check List</title>
<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
<link rel='stylesheet' type='text/css' href="../../css/style.css" />
<link rel='stylesheet' type='text/css' href='../../css/print.css' media="print" />
<link rel='stylesheet' type='text/css' href='../../css/show.css' media="show" />
<script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
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
	
document.form.action="ITclearanceLocalAdminBack.jsp";
document.form.method="post";
document.form.submit();
}
function ITManager()
{
document.form.action="ITclearanceLocalAdminITmanagerHOBack.jsp";
document.form.method="post";
document.form.submit();
}
</script>
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
  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[1].checked && !document.getElementsByName("Itradio")[0].checked && !document.getElementsByName("Itradio")[1].checked)
	 {
	        alert("Select IT / NON IT");
		    document.getElementsByName("Itradio")[0].focus();
		    return false;
	  }
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
 document.getElementById('idApproved1').style.display="none";
 document.getElementById('idApproved1').style.visibility="hidden";
/*  document.getElementById('idPwd1').style.display="none";
 document.getElementById('idPwd1').style.visibility="hidden"; */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.visibility="visible";
 alert("Select Designation And Name");
}
function showHigherTR()
{
 document.getElementById('idApproved1').style.display="table-row";
 document.getElementById('idApproved1').style.visibility="visible";
/*  document.getElementById('idPwd1').style.display="table-row";
 document.getElementById('idPwd1').style.visibility="visible" */
 document.getElementById('idApprovedd').style.display="table-row";
 document.getElementById('idApprovedd').style.display="none";
 alert("Select IT Or NON IT");
}
</script>
<%-- 
session.setMaxInactiveInterval(30*60);
if(session==null||session.getAttribute( "Nname" )==null||session.getAttribute( "desg" )==null||session.getAttribute( "city" )==null||session.getAttribute( "Nmail" )==null)
{	
String msg=null;
msg="Session__Time__out \\n Login__In__Again ";
response.sendRedirect("adminlink.jsp?msg="+msg);
}
--%>
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
<script type="text/javascript">

                                       function resendMail(email_id,form1_no,mail,name)
                                  	 {
                                         // alert("Ajax working ?");   
                                       
                                  		if (typeof XMLHttpRequest != "undefined"){    
                                  		xmlHttp= new XMLHttpRequest();    
                                    		}      else if (window.ActiveXObject){
                                  //   alet("Creating html http object");    
                                      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                                          }      if (xmlHttp==null){    
                                             alert("Browser does not support XMLHTTP Request");    
                                               return;     
                                                }       var url="../../ResendMailItClearance?mail="+email_id+","+form1_no+","+mail+","+name+"";  
                                                   // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                                                    //url +="?mail="+mailId;   
                                                       xmlHttp.onreadystatechange = mailStateChange;  
                                                     // alert("before sending mail");
                                                           xmlHttp.open("POST", url, true); 
                                                           
                                                          // alert("MAIL SENT");
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
<body onload="onloadCheck();">
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="ITclearanceAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null;
String req=null;
String empD=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
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
 String form1_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,d_resignation=null,d_reliving=null;
String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null;
String notServed=null,grade=null,requestOption=null;

String a_document_hr=null,r_document_hr=null,a_co_car_hr=null,r_co_car_hr=null,a_calculator_hr=null,r_calculator_hr=null,a_conn_mobile_hr=null,r_conn_mobile_hr=null,a_mobile_handset_hr=null,r_mobile_handset_hr=null;
String a_id_card_hr=null,r_id_card_hr=null,a_work_key_hr=null,r_work_key_hr=null,a_any_other_hr=null,r_any_other_hr=null,a_leave_card_hr=null,r_leave_card_hr=null,a_resignation_letter_hr=null,r_resignation_letter_hr=null,a_identity_card_hr=null,r_identity_card_hr=null;
String a_model_info=null,r_model_info=null,a_document_ac=null,r_document_ac=null,d_new_relieved_request=null,d_new_reliving_co=null; 
String a_nexas=null,r_nexas=null,a_compmobile_no=null,r_compmobile_no=null;
String rduty=null,rkeyJob=null,rnoticePeriod=null;
String airLin=null,rairLin=null,sophos=null,rsophos=null,forti=null,rforti=null;;
String a_shared_card=null,r_shared_card=null,a_internet=null,r_internet=null,a_gsnet=null,r_gsnet=null,a_internal=null,r_internal=null,a_dsc=null,r_dsc=null,a_glow=null,r_glow=null;
String it1a=null,it2b=null,it3c=null,it4d=null,it5e=null,it6f=null,it7g=null,it8h=null,it9i=null,it10j=null,it11k=null,it12l=null,it13m=null,it14n=null,it15o=null,it16p=null,it17q=null,it18r=null,it19s=null,it10jnexas=null,itrairLin=null,itrsophos=null,itrforti=null;
//VPN
String vpn=null,rvpn=null;
String req = request.getParameter("req");
String values[] = req.split(" -");
System.out.println("val 1 : "+values[0].replaceAll(" ", ""));
System.out.println("val 2 : "+values[1].replaceAll(" ", ""));

req = values[0].replaceAll(" ", "");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form1_it_clearance WHERE form1_no='"+req+"'"); 
while(rs100.next())
{
	 form1_no = rs100.getString("form1_no");
	 f_date = rs100.getString("f_date");
	 idextend = rs100.getString("idextend");
	 branch = rs100.getString("branch");
	 depart = rs100.getString("depart");
	 full_name = rs100.getString("full_name");
	 emp_code = rs100.getString("emp_code");
	 designation = rs100.getString("designation");
	 r_officer = rs100.getString("r_officer");
	 d_resignation = rs100.getString("d_resignation");
	 d_reliving = rs100.getString("d_reliving");
	 a_model = rs100.getString("a_model");
	 a_data_card = rs100.getString("a_data_card");
	 a_email = rs100.getString("a_email");
	 a_newins = rs100.getString("a_newins");
	 a_domain = rs100.getString("a_domain");
	 a_mobile_model = rs100.getString("a_mobile_model");
	 a_mobile_no = rs100.getString("a_mobile_no");
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
	 //r_remarks = rs100.getString("r_remarks");
     a_nexas= rs100.getString("a_nexas");
     r_nexas=rs100.getString("r_nexas");
	 
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
	 
     d_new_relieved_request= rs100.getString("d_new_relieved_request");
     d_new_reliving_co = rs100.getString("d_new_reliving_co");
     rduty = rs100.getString("rduty")==null?"":rs100.getString("rduty");
     rkeyJob= rs100.getString("rkeyJob")==null?"":rs100.getString("rkeyJob");
     rnoticePeriod=rs100.getString("rnoticePeriod")==null?"":rs100.getString("rnoticePeriod");
     
     airLin=rs100.getString("airLin");
     rairLin=rs100.getString("rairLin");
     sophos=rs100.getString("a_sophos");
     rsophos=rs100.getString("r_sophos");
     forti=rs100.getString("a_forti");
     rforti=rs100.getString("r_forti");
 //VPN
     
     vpn=rs100.getString("vpn");
     rvpn=rs100.getString("rvpn");

     a_compmobile_no=rs100.getString("a_compmobile_no");
     r_compmobile_no=rs100.getString("r_compmobile_no");
     
     a_shared_card=rs100.getString("a_shared_card");
     r_shared_card=rs100.getString("r_shared_card");
     a_internet=rs100.getString("a_internet");
     r_internet=rs100.getString("r_internet");
     a_gsnet=rs100.getString("a_gsnet");
     r_gsnet=rs100.getString("r_gsnet");
     a_internal=rs100.getString("a_internal");
     r_internal=rs100.getString("r_internal");
     a_dsc=rs100.getString("a_dsc");
     r_dsc=rs100.getString("r_dsc");
     a_glow=rs100.getString("a_nexglow");
     r_glow=rs100.getString("r_nexglow");
     
     it1a= rs100.getString("it1a")==null?"":rs100.getString("it1a");
     it2b= rs100.getString("it2b")==null?"":rs100.getString("it2b");
     it3c= rs100.getString("it3c")==null?"":rs100.getString("it3c");
     it4d= rs100.getString("it4d")==null?"":rs100.getString("it4d");
     it5e= rs100.getString("it5e")==null?"":rs100.getString("it5e");
     it6f= rs100.getString("it6f")==null?"":rs100.getString("it6f");
     it7g= rs100.getString("it7g")==null?"":rs100.getString("it7g");
     it8h= rs100.getString("it8h")==null?"":rs100.getString("it8h");
     it9i= rs100.getString("it9i")==null?"":rs100.getString("it9i");
     it10j= rs100.getString("it10j")==null?"":rs100.getString("it10j");   
	 it10jnexas = rs100.getString("it10jnexas")==null?"":rs100.getString("it10jnexas");
     it11k= rs100.getString("it11k")==null?"":rs100.getString("it11k");   
     it12l= rs100.getString("it12l")==null?"":rs100.getString("it12l");   
     it13m= rs100.getString("it13m")==null?"":rs100.getString("it13m");   
     it14n= rs100.getString("it14n")==null?"":rs100.getString("it14n");   
     it15o= rs100.getString("it15o")==null?"":rs100.getString("it15o");   
     it16p= rs100.getString("it16p")==null?"":rs100.getString("it16p");   
     it17q= rs100.getString("it17q")==null?"":rs100.getString("it17q");   
     it18r= rs100.getString("it18r")==null?"":rs100.getString("it18r");   
     it19s= rs100.getString("it19s")==null?"":rs100.getString("it19s");
     itrairLin=rs100.getString("itrairLin")==null?"":rs100.getString("itrairLin");
     itrsophos=rs100.getString("itrsophos")==null?"":rs100.getString("itrsophos");
     itrforti=rs100.getString("itrforti")==null?"":rs100.getString("itrforti");
}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<br /><br />
<center>
 <table width="907" border="1" align="center" style="border-color: white;">
<tr>
<td align="center" style="border-color: white;">
<img src="../../images/nip.gif" height="25" width="25" /> 
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
		<td style="height: 40px;"><center><font size="5">
		<b><label>
		Outstanding Dues & Handover Report</label>
		</b></font></center>  </td></tr><tr><td id="hiderow">
		<input type="text" name="i_name" value="<%=SessionName%>" readonly="readonly"/>
		<input type="text" name="i_desg" value="<%=Sessiondesg%>" readonly="readonly"/>
		<input type="text"  name="i_city" value="<%=Sessioncity%>" readonly="readonly"/>
		<input type="hidden" name="i_b_no" value="<%=Sessionb_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="text" size="12" name="f_date" value="<%= po_date.format(new java.util.Date())%>" readonly="readonly"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="text" name="form1_no" value="<%=form1_no%>" readonly="readonly"/>
		<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
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
<td align="center" bgcolor="grey" colspan="4"><b><font size="5">
<%=form1_no%></font></b>
</td>
</tr>
	
<tr>
<td  style="text-align: right;" width="180">Employee Code :</td>
<td style="text-align:left;" width="220"><input type="text" size="31" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;" width="180">Full Name :</td>
<td style="text-align:left;" width="220"><input type="text" size="31" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
</tr>

<tr>
<td  style="text-align: right;" width="180" >Branch :</td>
<td style="text-align:left;" width="220"><input name="branch" value="<%=branch%>" readonly="readonly"/> </td>
<td  style="text-align: right;" width="180">Department :</td>
<td style="text-align:left;" width="220"><input name="depart" size="31" value="<%=depart%>" readonly="readonly"/> 
</td> 
</tr>

<tr>
<td  style="text-align: right;" width="180">Designation :</td>
<td style="text-align:left;" width="220"><input name="designation" size="31" value="<%=designation%>" readonly="readonly"/></td>
<td  style="text-align: right;" width="180">Reporting Officer  :</td>
<td style="text-align:left;" width="220"><input type="text" size="31" name="r_officer" id="rofficer" value="<%=r_officer%>" readonly="readonly"/></td>
</tr>

<tr>
<td  style="text-align: right;" width="180">Date Of Resignation :</td>
<td style="text-align:left;" width="220"><input type="text" name="d_resignation" size="31" value="<%=d_resignation%>" readonly="readonly"  readonly="readonly" /></td>
<td  style="text-align: right;" width="180">Last Served Date :</td>
<td style="text-align:left;" width="220">
<input type="text"   name="d_reliving"  size="31" value="<%=d_reliving%>" readonly="readonly" readonly="readonly" />
</td>
</tr>

<tr>
<td  style="text-align: right;">Date Of Relieving requested by the employee :</td>
<td style="text-align:left;"><input type="text"  style="width: 6em"  name="d_resignation" value="<%=d_new_relieved_request%>" readonly="readonly"  /></td>
<td  style="text-align: right;">Date of Relieving as per co policy:</td>
<td style="text-align:left;"><input type="text"  style="width: 6em"  name="d_reliving"  value="<%=d_new_reliving_co%>" readonly="readonly"  /></td> 					        
</tr>

<tr>
<td  style="text-align: right;" width="180">Status Of Employement  :</td>
<td style="text-align:left;" width="220"><input type="text"   name="d_resignation" size="31" value="<%=requestOption%>" readonly="readonly"  readonly="readonly" /></td>
<td  style="text-align: right;" width="180">Grade :</td>
<td style="text-align:left;" width="220"><input type="text"   name="d_reliving" size="31" value="<%=grade%>" readonly="readonly" readonly="readonly" /></td> 					        
</tr>

<tr>
<td  style="text-align: right;" width="180">Not Served:</td>
<td style="text-align:left;" width="220" colspan="3"><input type="text"  style="width: 6em"  name="d_resignation" size="31" value="<%=notServed%>" readonly="readonly"  readonly="readonly" />
days</td>
</tr>

</table>
<br>
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
<!-- <select style="width: 5em"  name="a_leave_card_hr"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> -->

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_leave_card_hr" id="rem5" size="40" maxlength="44" value="<%=r_leave_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>


<tr>
<td class="it1" align="center">10  </td>



<td class="it2" style="text-align: right;width:23%;">Resignation letter enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<input type="text" name="a_resignation_letter_hr"  size="10" maxlength="44" value="<%=a_resignation_letter_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/>
<!-- <select style="width: 5em" name="a_resignation_letter_hr" readonly="readonly"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> -->

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_resignation_letter_hr" id="rem5" size="40" maxlength="44" value="<%=r_resignation_letter_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>


<tr>
<td class="it1" align="center">11  </td>



<td class="it2" style="text-align: right;width:23%;">Identity card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> 
<input type="text" name="a_identity_card_hr"  size="10" maxlength="44" value="<%=a_identity_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/>
<!-- <select style="width: 5em" name="a_identity_card_hr" readonly="readonly"  onfocus="myFunctionHR();">
<option value="NULL">Select</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select> -->

</td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_identity_card_hr" id="rem5" size="40" maxlength="44" value="<%=r_identity_card_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>
<!-- <tr>
<td colspan="5">
<textarea name="a_remarks" rows="3" cols="140" id="ta" maxlength="199" placeholder="HR / ADMIN REMARKS"></textarea>
</td>
</tr> -->
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
<!-- <tr>
<td colspan="5">
<textarea name="account_remarks" rows="3" cols="140" id="ta" maxlength="199" placeholder="ACCOUNT REMARKS"></textarea>
</td>
</tr> -->
</table>

<%--}else{ --%>
<br>

<label><center> <font color="black"><u><b>IT ASSET PROVIDED</b></u></font></center> </label> 
<br>
<table id="table3" align="center" width="895">
<tr>
<td bgcolor="grey">Sl</td>
<td bgcolor="grey" colspan="2" align="center" width="33%">ITEM NAMES</td>
<td bgcolor="grey" colspan="2" align="center" width="34%">INITIATOR REMARKS</td>
<td bgcolor="grey" colspan="2" align="center" width="33%">IT MANAGER REMARKS</td>
</tr>
<tr>
<td class="it1" align="center">1  </td>
<td class="it2" style="text-align: right;width:17%;"> Laptop/Desktop Model :</td>
<td class="it2"  style="text-align:left;"> <input type="hidden" name="a_model" readonly="readonly" id="mod" maxlength="100" value="<%=a_model%>"/><%=a_model%></td>
<td class="it2" width="8%">Remarks :</td>
<td class="it2" width="26%"><input type="hidden" name="r_model" id="rem1" size="40" readonly="readonly" value="<%=r_model%>"/><%=r_model%></td>
<td width="8%">Remarks :</td>
<td width="25%"  ><%=it1a%></td>
</tr>

<tr>
<td class="it1" align="center">1a  </td>
<td class="it2" style="text-align: right;">Password info passed on to :</td>
<td> <input type="hidden" name="a_password" readonly="readonly" value="<%=a_model_info%>" id="dc" maxlength="100" /><%=a_model_info%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_password" id="rem2" size="40" readonly="readonly" value="<%=r_model_info%>"/><%=r_model_info%></td>
<td width="8%">Remarks :</td>
<td width="25%"  ><%=it18r%></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>
<td class="it2" style="text-align: right;">Data Card :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_datacard" readonly="readonly" value="<%=a_data_card%>" id="dc" maxlength="100" /><%=a_data_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_datacard" id="rem2" size="40" readonly="readonly" value="<%=r_data_card%>"/><%=r_data_card%></td>
<td width="8%">Remarks :</td>
<td width="25%"  ><%=it2b%></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>
<td class="it2" style="text-align: right;">Email Id :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_email" id="eid" readonly="readonly" value="<%=a_email%>" maxlength="100" /><%=a_email%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_email" id="rem3" size="40" readonly="readonly" value="<%=r_email%>" /><%=r_email%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it3c%></td>
</tr>

<tr>
<td class="it1" align="center">3a  </td>
<td class="it2" style="text-align: right;">Mobile Phone Model :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_mobile_model" readonly="readonly" id="mpd" value="<%=a_mobile_model%>"/><%=a_mobile_model%></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="hidden" name="r_mobile_model" id="rem6" size="40" readonly="readonly" value="<%=r_mobile_model%>"/><%=r_mobile_model%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it6f%></td>
</tr>

<tr>
<td class="it1" align="center">3b  </td>
<td class="it2" style="text-align: right;">Mobile No (intune) :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" readonly="readonly" name="a_mobile_no" id="mno" value="<%=a_mobile_no%>"/><%=a_mobile_no%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_mobile_no" id="rem7" readonly="readonly" size="40" value="<%=r_mobile_no%>"/><%=r_mobile_no%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it7g%></td>
</tr>

<tr>
<td class="it1" align="center">3c  </td>
<td class="it2" style="text-align: right;">Mobile No (Company Provided SIM) :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" readonly="readonly" name="a_mobile_no" id="mno" value="<%=a_compmobile_no%>"/><%=a_compmobile_no%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_mobile_no" id="rem7" readonly="readonly" size="40" value="<%=r_compmobile_no%>"/><%=r_compmobile_no%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it11k%></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>
<td class="it2" style="text-align: right;">Domain User :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_domain" readonly="readonly" value="<%=a_domain%>" id="du" /><%=a_domain%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_domain" id="rem5" size="40" readonly="readonly" value="<%=r_domain%>"/><%=r_domain%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it5e%></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>
<td class="it2" style="text-align: right;">Access Card/Biometric :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_access_card" readonly="readonly" id="acard" value="<%=a_access_card%>"/><%=a_access_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_access_card" id="rem8" size="40" readonly="readonly" value="<%=r_access_card%>"/><%=r_access_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it8h%></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it2" style="text-align: right;">Shared Folder :</td>
<td > <input type="hidden" name="a_shared_card" readonly="readonly" id="acard" value="<%=a_shared_card%>"/><%=a_shared_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_shared_card" id="rem8" size="40" readonly="readonly" value="<%=r_shared_card%>"/><%=r_shared_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it12l%></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it2" style="text-align: right;">Internet Access / FTP Access :</td>
<td > <input type="hidden" name="a_internet" readonly="readonly" id="acard" value="<%=a_internet%>"/><%=a_internet%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_internet" id="rem8" size="40" readonly="readonly" value="<%=r_internet%>"/><%=r_internet%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it13m%></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>
<td class="it2" style="text-align: right;">Newins Id :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_newins" readonly="readonly" value="<%=a_newins%>" id="nid" maxlength="100" /><%=a_newins%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_newins" id="rem4" size="40" readonly="readonly" value="<%=r_newins%>"/><%=r_newins%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it4d%></td>
</tr>

<tr>
<td class="it1" align="center">9</td>
<td class="it2" style="text-align: right;">NEXAS\SAP ID :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_nexas" id="asset1" readonly="readonly" value="<%=a_nexas%>" /><%=a_nexas%></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="hidden" name="r_nexas" id="rem8" size="40" maxlength="44" readonly="readonly" value="<%=r_nexas%>"/><%=r_nexas%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it10jnexas%></td>
</tr>

<tr>
<td class="it1" align="center">10  </td>
<td class="it2" style="text-align: right;">GS-NET :</td>
<td > <input type="hidden" name="a_gsnet" readonly="readonly" value="<%=a_gsnet%>" id="asset1"/><%=a_gsnet%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_gsnet" id="rem8" size="40" readonly="readonly" value="<%=r_gsnet%>"/><%=r_gsnet%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it14n%></td>
</tr>

<tr>
<td class="it1" align="center">11  </td>
<td class="it2" style="text-align: right;">Internal Application :</td>
<td > <input type="hidden" name="a_internal" readonly="readonly" value="<%=a_internal%>" id="asset1"/><%=a_internal%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_internal" id="rem8" size="40" readonly="readonly" value="<%=r_internal%>"/><%=r_internal%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it15o%></td>
</tr>

<tr>
<td class="it1" align="center">12  </td>
<td class="it2" style="text-align: right;">DSC Dongle Received :</td>
<td > <input type="hidden" name="a_dsc" readonly="readonly" value="<%=a_dsc%>" id="asset1"/><%=a_dsc%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_dsc" id="rem8" size="40" readonly="readonly" value="<%=r_dsc%>"/><%=r_dsc%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it16p%></td>
</tr>

<tr>
<td class="it1" align="center">13  </td>
<td class="it2" style="text-align: right;">VPN :</td>
<td > <input type="hidden" name="a_vpn" readonly="readonly" value="<%=vpn%>" id="asset1"/><%=vpn%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_vpn" id="rem8" size="40" readonly="readonly" value="<%=rvpn%>"/><%=rvpn%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it17q%></td>
</tr>

<tr>
<td class="it1" align="center">14  </td>
<td class="it2" style="text-align: right;">Hard Disk/Pen Drive :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_drive" readonly="readonly" id="hp" value="<%=a_drive%>"/><%=a_drive%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_drive" id="rem8" size="40" readonly="readonly" value="<%=r_drive%>"/><%=r_drive%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it9i%></td>
</tr>

<tr>
<td class="it1" align="center">15 </td>
<td class="it2" style="text-align: right;">Any Other Asset :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="a_other_asset" readonly="readonly" value="<%=a_other_asset%>" id="asset1"/><%=a_other_asset%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_other_asset" id="rem8" size="40" readonly="readonly" value="<%=r_other_asset%>"/><%=r_other_asset%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it10j%></td>
</tr>

<tr>
<td class="it1" align="center">16  </td>
<td class="it2" style="text-align: right;">NEx-GLOW :</td>
<td > <input type="hidden" name="a_glow" readonly="readonly" value="<%=a_glow%>" id="asset1"/><%=r_glow%></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="hidden" name="r_glow" id="rem8" size="40" readonly="readonly" value="<%=r_glow%>"/><%=r_glow%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it19s%></td>
</tr>

<tr>
<td class="it1" align="center">17</td>
<td class="it2" style="text-align: right;">Airline / Liner Login :</td>
<td class="it2" style="text-align:left;"> <input type="hidden" name="airLin" id="airLin" readonly="readonly" maxlength="24" value="<%=airLin%>"/><%=airLin%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><input type="hidden" name="r_airLin" id="r_airLin" size="40" maxlength="44" readonly="readonly" value="<%=rairLin%>"/><%=rairLin%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=itrairLin%></td>
</tr>

<tr>
<td class="it1" align="center">18</td>
<td class="it2" style="text-align: right;width:23%;">Sophos & Manage Engine Access :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="hidden" name="sophos" id="sophos" readonly="readonly" maxlength="24" value="<%=sophos%>"/><%=sophos%></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="hidden" name="r_sophos" id="r_sophos" size="40" maxlength="44" readonly="readonly" value="<%=rsophos%>"/><%=rsophos%></td>
<td class="it2">Remarks :</td>
<td class="it2"><%=itrsophos%></td>
</tr>

<tr>
<td class="it1" align="center">19</td>
<td class="it2" style="text-align: right;width:23%;">Fortinet VPN Access :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="hidden" name="forti" id="forti" readonly="readonly" maxlength="24" value="<%=forti%>"/><%=forti%></td>
<td class="it2">Remarks :</td>
<td class="it2"><input type="hidden" name="r_forti" id="r_forti" size="40" maxlength="44" readonly="readonly" value="<%=rforti%>"/><%=rforti%></td>
<td class="it2">Remarks :</td>
<td class="it2"><%=itrforti%></td>
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

<br />
<table width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
	<!-- 	<td></td> -->
	  </tr>
	  <%
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  rs1 = st1.executeQuery("select form1_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),mail from form1_it_clearance_item WHERE form1_no='"+req+"' order by id ASC"); 
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
		//   System.out.println("The sseecccoonndd mr_master ");
		
		   if(rs1.getString("mail")!=null)
		   {
		    m =  rs1.getString("mail").trim();
		   }
		  // System.out.println("m value "+m);
		 //  System.out.println("req value "+req);
		 //  System.out.println("emp d value "+empD);
		   //var url="ResendMail?mail="+mail+","+form1_no+","+empD+"";  
		//   System.out.println("---------------------------------------");
		//   System.out.println("mail value "+mail);
		//   System.out.println("form1_no value "+form1_no);
		 //  System.out.println("empD d value "+empD);
		 System.out.println("M VaLUES :"+m);
		 System.out.println("FORM VaLUES :"+form1_no);
		 System.out.println("empD VaLUES :"+empD);
		 System.out.println("SessionName VaLUES :"+SessionName);
		 %>
	   <tr>
	   
		<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
		<input id="idStatus" type="hidden" value="<%=statusD%>"/>
		</td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
		<%-- <td bgcolor="white" width="100"><font size="2" color="black"><input id="idaa" readonly="readonly" size="10" value="<%=statusD%>"/> </font></td> --%>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=statusD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
		<%-- <td bgcolor="white" width="30"><input type="button" id="idaa2" style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=m%>','<%=form1_no%>','<%=SessionName%>','<%=email_id%>');" /></td> --%>
		<%-- <td bgcolor="white" width="30"><input type="button" id="idaa2" style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=email_id%>','<%=form1_no%>','<%=m%>','<%=SessionName%>');" /></td> --%>
		
	
	  </tr>
	  <%} %>
</table>
</br>                                                           
</td>
</tr>
</table>
 <table style="margin-left: auto;margin-right: auto;" ><tr>
<td style="font-size:1" id="hiderow">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='ITclearanceSelectAdmin.jsp?msg=1'"/> -->
<a  href="javascript:history.back()">BACK</a>
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
<td id="hiderow"><input type="button" id="btnShowSimple" value="HELP" /></td>
</tr>
</table>
</center>
<br /><br /><br />
</div>
<div id="dialog" class="web_dialog">
<table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
 <tr>
<td class="web_dialog_title"><center>APPROVAL ROUTINE</center></td>
<td class="web_dialog_title align_right"><a href="#" id="btnClose">Close</a>
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
<label>HR/Admin (Local)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>RO</label>
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
<label>HR/Admin (HO)</label>
<br />
<br />
<br />
</div>
</form>	
</body>
</html>