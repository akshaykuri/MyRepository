<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
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
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
	<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script> 
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
<script type="text/javascript">
function OtherAdmin()
{
	
document.form.action="IncidentLogLocalAdminBack.jsp";
document.form.method="post";
document.form.submit();
}

</script>
 <script language="javascript" type="text/javascript">
 function hideBcc()
 {
 document.getElementById('idBcc').style.display="table-row";
 document.getElementById('idBcc').style.visibility="visible";
 }
 function hideBcc2()
 {
 document.getElementById('idBcc').style.hidden="table-row";
 document.getElementById('idBcc').style.visibility="hidden";
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
   var d2 = document.form.CheckValuesBMGM;
   var ff=document.form.aabbcc;
   
   
   var flag=document.form.flag;
   //alert(flag.value);
   var k=1;
   while(k<=flag.value)
	   {
	   var i="idI_viewedByGA"+k;
	   var m=document.getElementById(i);
	  // alert(m.value);
	   //alert(m);
	   if(m.value=="")
		   {
		   alert("Select CCTV footage reviewed by GA Dept status..");
		   return false;
		   }
	   k++;
	   }
  if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	 {
       alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
       document.getElementsByName("mmdradio")[0].focus();
       return false;
    } 
 /*  if (document.getElementsByName("mmdradio")[0].checked)
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
	  } */
 /*  if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[1].checked && !document.getElementsByName("Itradio")[0].checked && !document.getElementsByName("Itradio")[1].checked)
	 {
	        alert("Select IT / NON IT");
		    document.getElementsByName("Itradio")[0].focus();
		    return false;
	  } */
	  if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
		{
		 alert("Select Mail ID !");
		         d2.focus();
		 return false;
		 }
  if ((d1.value==null)||(d1.value=="NULL")||(d1.value==""))
	{
	 alert("Enter Remarks !");
	         d1.focus();
	 return false;
	 }

	  if (!document.getElementsByName("mmdradioBcc")[0].checked && !document.getElementsByName("mmdradioBcc")[1].checked) 
		 {
	       alert("Select Radio Button For Sending Multiple BCC \n Select BCC");
	       document.getElementsByName("mmdradioBcc")[0].focus();
	       return false;
	    }
	  if (document.getElementsByName("mmdradioBcc")[0].checked)
		 {
		  var s1 = document.form.SendBCCmail;
		  if ((s1.value==null)||(s1.value=="NULL")||(s1.value==""))
			{
			 alert("Enter BCC mail Id's with Comma seperators ! \n \n Else \n \n Select 'NO' BCC");
			         s1.focus();
			 return false;
			 }
		  function checkNumber(string)
		     {
		    /*  var numericExpression = ^((\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)\s*[,]{0,1}\s*)+$;
		     if(string.match(numericExpression))  */
		    // var reg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
		     var reg = /^((\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)\s*[,]{0,1}\s*)+$/;
		     if (reg.test(string))
		     {
		      return true;
		     } else {
		     return false;
		        }
		     }
		  if (checkNumber(s1.value)==false){
		        s1.value="";
		        alert("Invalid Mail ID's \n \n Enter valid Email ID!");
		        s1.focus();
		        return false;
		        }
		  }
return true;
   }
</script>
<script language="javascript" type="text/javascript"> 

$(document).ready(function() {
$('.check').click(function(){
    $("#text").val('');
    $(".check").each(function(){
        if($(this).prop('checked')){
            
            $("#text").val($("#text").val()+$(this).val()+"");
        }
    });
});
});
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
	
	/* else{
	     alert("Select Direct Approved Or Higher Authority");
		 document.getElementById('idApproved').style.display="table-row";
	   	 document.getElementById('idApproved').style.visibility="visible";
	 	 document.getElementById('idPwd').style.display="table-row";
		 document.getElementById('idPwd').style.visibility="visible";
		 return true;
	 } */
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
<script  type="text/javascript">

<% 
    String msg[] = request.getQueryString().toString().split("=");
    String disp = msg[1].toString();
    String dispAr[]=disp.split("&");
    disp=dispAr[0].toString();
    disp = disp.replace("%20", "");
    disp = disp.replace("%27", " ");
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
//function resendMail(mail,form6_no,email_id,name)
function resendMail(email_id,form6_no,mail,name)
  		 {
	if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){
           alet("Creating html http object");    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){    
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="../../ResendMailInternetAccess?mail="+email_id+","+form6_no+","+mail+","+name+"";  
                          // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                           //url +="?mail="+mailId;   
                              xmlHttp.onreadystatechange = mailStateChange;  
                           //  alert("before sending mail");
                                  xmlHttp.open("POST", url, true); 
                                  
                                //  alert("MAIL SENT");
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
<form  name="form" method="post"  action="IncidentLogLocalAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cn1f=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,st1f=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rs1f=null;
String req=null;
String empD=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
String form9_no=null,idextend=null,SessionDesg=null,SessionCity=null,SessionCityNo=null,SessionEmail=null,Created_date=null,mailingCheck=null,from_date=null,to_date=null,Approval_f_date=null,Approval_emp=null,Approval_desg=null,Approval_mailId=null,reminder=null,status=null;

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
String SessionCityOnlyForHO = null;
Connection cn5 = null,cn11=null; 
Statement st5 = null,st11=null; 
ResultSet rs5 = null,rs11=null; 
try{
%>

<%//form1_it_clearance
 //String form1_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,d_resignation=null,d_reliving=null;
//String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
//String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;

//form2_domain
/* String form9_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;
String ipAddress=null,ComName=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null; */
String req = request.getParameter("req");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select form9_no,idextend,SessionName,SessionDesg,SessionCity,SessionCityNo,SessionEmail,Created_date,mailingCheck,DATE_FORMAT(from_date,'%d-%m-%Y') as from_dateD,DATE_FORMAT(to_date,'%d-%m-%Y') as to_dateD,Approval_f_date,Approval_emp,Approval_desg,Approval_mailId,reminder,status,SessionCity from  form9_incident_log WHERE form9_no='"+req+"'"); 
while(rs100.next())
{
	    form9_no = rs100.getString("form9_no");
	    Created_date = rs100.getString("Created_date");
	    idextend = rs100.getString("idextend");

	    from_date = rs100.getString("from_dateD");
	    to_date = rs100.getString("to_dateD");
	    SessionCityOnlyForHO = rs100.getString("SessionCity");
	   

	/*  SessionName = rs100.getString("SessionName");
	 SessionDesg = rs100.getString("SessionDesg");
	 SessionCity = rs100.getString("SessionCity");
	 SessionCityNo = rs100.getString("SessionCityNo");
	 
	 SessionEmail = rs100.getString("SessionEmail");


	 Approval_desg = rs100.getString("Approval_desg");
	 Approval_emp = rs100.getString("Approval_emp");
	 Approval_mailId = rs100.getString("Approval_mailId"); */
	
}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy");

String flag1=request.getParameter("fg");
%>

 
<input type="hidden" name="flag1" value="<%=flag1%>" />



<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td height="15px"><center><font size="3">
		<b><label>
		INCIDENT LOG FROM </label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=SessionName%>" readonly="readonly" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" readonly="readonly"/>
		<input type="hidden" name="i_city" value="<%=Sessioncity%>" readonly="readonly"/>
		<input type="hidden" name="i_b_no" value="<%=Sessionb_no%>" readonly="readonly"/>
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form9_no" value="<%=form9_no%>" />
		<%--i_name,i_desg,i_city,i_b_no,i_admin,i_email_id --%>
		</td>
		
	</tr>
</table>
<table width="40%"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
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


%>	 
		
	<table width="100%">
	<!-- <tr>
	<td ><font size="3">
		<b><center><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label> </center>
		</b></font></td>
	</tr> -->
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 25%; " bgcolor="grey" ><b>NAME :</b></td>
<td style="text-align:left;width: 75%;" bgcolor="grey"><input name="branch" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 25%; " bgcolor="grey" ><b>DESIGNATION :</b></td>
<td style="text-align:left;width: 75%;" bgcolor="grey"><input name="branch" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 25%;" bgcolor="grey" ><b>FORM NO :</b></td>
<td style="text-align:left;width: 75%;" bgcolor="grey"><input name="branch" value="<%=form9_no%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<%-- &nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 25%; "  >Branch :</td>
<td style="text-align:left;width: 25%;"><input name="branch" value="<%=SessionCityOnlyForHO%>" size="31" readonly="readonly"/> </td> --%>

<td style="text-align: right;background-color: white" colspan="2">FROM DATE :<font color="black"><b><%=from_date%></b></font> TO  :<font color="black"><b><%=to_date%></b></font></td>
</tr>



</table>
<br>
<table id="tableData" name="tableData" width="100%" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td bgcolor="grey" width="20" align=center><font size="2" color="black"><b>Date</b></font></td>
		<td bgcolor="grey" width="20" align=center><font size="2" color="black"><b>Time</b></font></td>
	    <td bgcolor="grey" width="20" align=center><font size="2" color="black"><b>Location Name</b></font></td>
		
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Viewed By</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Incident Status</b></font></td>
	   <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>View File</b></font></td>
		
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>Remarks</b></font></td>
        <td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>CCTV footage Reviewed By IT Dept</b></font></td>
		<td bgcolor="grey" width="10" align=center><font size="2" color="black"><b>CCTV footage reviewed by GA Dept</b></font></td>

	  </tr>
	  <%int k=0;
	  cn1f = con.getConnection2();
	  st1f=cn1f.createStatement();
	  rs1f = st1f.executeQuery("select form9_no,I_date,I_time,I_Location,I_viewedBy,Incident_Reported,I_Remarks,Created_Date,viewedByIT,id,CONCAT(form9_no,'/',incidentlogFile) as incidentlogFile from form9_incident_item WHERE form9_no='"+req+"' ORDER BY id ASC"); 
	  while(rs1f.next())
	  { k++;
		  String form9_noD= rs1f.getString("form9_no");
		  String I_date= rs1f.getString("I_date");
		  String I_time= rs1f.getString("I_time");
		  String I_Location= rs1f.getString("I_Location");

		  String I_viewedBy= rs1f.getString("I_viewedBy");
		  String I_Remarks= rs1f.getString("I_Remarks");
		  String Incident_Reported = rs1f.getString("Incident_Reported");
		  String viewedByIT = rs1f.getString("viewedByIT");
		  if(viewedByIT==null)viewedByIT="";
	  	  int id = rs1f.getInt("id");
		  String incFile = "E:/neinSoft/C2IT/IncidentLog/"+rs1f.getString("incidentlogFile");

		 %>
	   <tr>
	   
		<td bgcolor="white" width="130px" align="center"><font size="2" color="black"><%=I_date%></font></td>
		<td bgcolor="white" width="100px" align="center"><font size="2" color="black"><%=I_time%></font></td>
	    <td bgcolor="white" width="200px" align="left"><font size="2" color="black"><%=I_Location%></font></td>
		

		<td bgcolor="white" width="120" align="center"><font size="2" color="black"><%=I_viewedBy%></font></td>
		<td bgcolor="white" width="200px" align="left"><font size="2" color="black"><%=Incident_Reported%></font></td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><a href="../../download6.jsp?f=<%=incFile%>">View File</a></font></td>	    
		
		<td bgcolor="white" width="120" align="center"><font size="2" color="black"><%=I_Remarks%></font></td>
		<td bgcolor="white" width="100" align="center"><font size="2" color="black"><%=viewedByIT%></font></td>
		    <td bgcolor="white" width="10"><font size="2" color="black"></font>
		                <select  name="I_viewedByGA<%=k%>" id="idI_viewedByGA<%=k%>" style="width:100px;">
					        <option value="" style="background: lightgrey;" >Select</option>
					 	    <option value="Yes">Yes</option> 
					 	    <option value="No">No</option> 
					    </select>
	                   </td>
	               
       <input type="hidden" value="<%=id%>" name="id<%=k%>" id="idid<%=k%>"></input>
	  </tr>
	  <%} %>
	  <input type="hidden" value="<%=k%>" name="flag" id="idflag"></input>
</table>

<br />
<table id="tableData" name="tableData" width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="20" align="center"><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="20" align="center"><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>RESEND</b></font></td>
	  </tr>
	  <%
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  rs1 = st1.executeQuery("select form9_no,desg,emp,status,remarks,f_date,mail from form9_incident_log_item WHERE form9_no='"+req+"' ORDER BY id ASC"); 
	  while(rs1.next())
	  {
		  String form9_noD= rs1.getString("form9_no");
		  String desgD= rs1.getString("desg");
		  empD= rs1.getString("emp");
		  String statusD= rs1.getString("status");
		  String remarksD= rs1.getString("remarks");
		  String f_dateD= rs1.getString("f_date");
		  String mailD= rs1.getString("mail");
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
		 %>
	   <tr>
	   
		<td bgcolor="white" width="100"><font size="2" color="black"><%=empD%></font>
		<input id="idStatus" type="hidden" value="<%=statusD%>"/>
		</td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=desgD%></font></td>
	<td bgcolor="white" width="100" class="fonter"><%=statusD%></td>
	
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
		
	 <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=email_id%>','<%=form9_no%>','<%=m%>','<%=SessionName%>');" /></td> 
		<!--  <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="return resendMail();" /></td> -->
	  </tr>
	  <%} %>
</table>
 
<%String flag = c2ITUtil1.getAuthorizedNameIncident(form9_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString()); %>
<%
System.out.println("FLAG value --------------------- : "+flag);
%>
 <table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
 
 <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
 <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
  <input type="hidden" value="<%= session.getAttribute("form9_no") %>" id="idmrId"/>
<input type="hidden" id="idstatus" value="<%= flag %>" />

  
  <tr>
    <td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Incident reported" />Incident reported 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="No Incident reported"  />No Incident reported
       
    </td>
    
   
  </tr>  
  <%//Only for HO these changes: %>
  <%if(SessionCityOnlyForHO!=null && SessionCityOnlyForHO.equals("HEAD OFFICE - 90")) {%>
    <tr>
  <td>
  <b>
  Send To:</b>
		<%
		cn11 = con.getConnection2();
		  st11=cn11.createStatement();
		  
		  rs11 = st11.executeQuery("SELECT Nname,post,Nmail,city FROM login WHERE (Nno LIKE '%1665%') AND b_no='"+Sessionb_no+"'  ORDER BY Nname ASC"); 
		  while(rs11.next())
		  {
			  
			  String Mailing = null;
			    String name = rs11.getString("Nname");
				String desg = rs11.getString("post");
				String mail = rs11.getString("Nmail");
				Mailing = name +","+desg +","+mail;
		%>
		
		
		<input type="radio" class="check" name="mailingCheck" value="<%=Mailing%>"/><%=name%>-<%=mail %>
		
		
		
		<%} %>
		<input type="hidden" readonly="readonly" name="CheckValuesBMGM" id="text" value="NULL"/> 
		
  </td>
  </tr>
  <%}else{ %>
  <%-- <tr>
<td align="left" width="" colspan="2">
		<b>Send To:</b>
		<%
		cn11 = con.getConnection2();
		  st11=cn11.createStatement();
		  
		  rs11 = st11.executeQuery("select DISTINCT emp,form9_no,desg,status,remarks,f_date,mail from form9_incident_log_item WHERE form9_no='"+req+"' ORDER BY id ASC"); 
		  while(rs11.next())
		  {
			  
		  String Mailing=rs11.getString("mail");
		%>
		
		
		<input type="checkbox" class="check" name="mailingCheck" value="<%=Mailing%>"/><%=Mailing%>
		
		
		
		<%} %>
		<!-- <br />
		<b>Send BCC :</b> <input type="text" name="SendBCCmail" size="50" value="NULL"/>  
		<br /> -->
		  <tr> --%>
		  <tr>
  <td>
  <b>Send To IT-HO:</b>
		<%
		cn11 = con.getConnection2();
		  st11=cn11.createStatement();
		  
		  rs11 = st11.executeQuery("SELECT DISTINCT Nname,post,Nmail,city FROM login WHERE (Nno LIKE '%1665%')  ORDER BY Nname ASC"); 
		  while(rs11.next())
		  {
			  
			  String Mailing1 = null;
			    String name1 = rs11.getString("Nname");
				String desg1 = rs11.getString("post");
				String mail1 = rs11.getString("Nmail");
				Mailing1 = name1 +","+desg1+","+mail1;
		%>
		
		
		<input type="radio" class="check" name="mailingCheckToIT" value="<%=Mailing1%>"/><%=name1%>-<%=mail1 %>
		
		
		
		<%} %>
			<input type="hidden" readonly="readonly" name="CheckValuesToIT" id="text" value="NULL"/> 
		<br />
  </td>
  </tr>
  <%} %>
  <!-- <tr>
    <td align="left"><b>Send BCC</b>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="Yes" onclick="hideBcc();"/>Yes
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="No" onclick="hideBcc2();" checked="checked"/>No
      
    </td>
  </tr>
  <tr style="visibility: hidden;display: none;" id="idBcc">
   <td align="left">

		<b>Enter Mail ID's with comma:</b> <input type="text" name="SendBCCmail" size="50" value="" placeholder="abcd.nittsu.co.in,xyz.nittsulogistics.co.in"/>  
	
		</td>
  </tr> -->

  <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="120"></textarea></div></td>
  </tr>
  
 
 </table>


</br>
                                                                
   </td>
		
	</tr>
</table> 
 <!-- <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='InternetAccessSelectAdmin.jsp?msg=1'"/> </td>
      <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td>
    <td>  <INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate();" /></td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	<td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
   	</tr>
 
</table>  -->	
<table style="margin-left: auto;margin-right: auto;" ><tr>
 
     
<!--       <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td> -->


    <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return(validate() && OtherAdmin());" /></td>
   
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	
  <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="AR" />
   	</td>
   	    <td>
      <a href="../IncidentLogHelp.jsp" onclick="return popitup('../IncidentLogHelp.jsp')" id="hiderow"><font size=2>HELP ?</font></a></td>
   	<td style="font-size:1">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='InternetAccessSelectAdmin.jsp?msg=1'"/> -->
     <a href="javascript:history.back()">BACK</a>
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
<label>GM/BM</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>

<br />
<label>IT(HO)</label>

<br />
<br />
<br />
</div>
</form>	

</body>

</html>