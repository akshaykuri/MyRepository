<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="CON2.DbUtil"%>
<html xmlns="https://www.w3.org/1999/xhtml">
<%@page language="java"%> 
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %> 
<%@page import = "java.text.DateFormat" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "net.sf.jasperreports.view.*" %>
<%@page import = "net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="CON2.Connection2" %> 
<%@page import="CON2.CurrentTime" %>
<%@page import="java.util.ResourceBundle"%>
<%@ include file="../../banner.jsp" %>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='../../css/style2.css' />
	<script src="https://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<script language="javascript"   type="text/javascript" src="../../js/jquery.1.11.1.min.js" ></script>
<script language="javascript"   type="text/javascript" src="../../js/jquery-1.5.1.min.js" ></script>
	<!-- Help Page pop up starts  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->
		<script type="text/javascript">

$(document).ready(function() {
$('.check').click(function(){
    $("#text").val('');
    $(".check").each(function(){
        if($(this).prop('checked')){
            
            $("#text").val($("#text").val()+$(this).val()+">");
        }
    });
});
});
</script>
<script type="text/javascript">
function OtherAdmin()
{
alert("here");	
document.form.action="NewinsLocalAdminBack.jsp";
document.form.method="post";
document.form.submit();
}
function ITManager()
{alert("here111");	
document.form.action="NewinsLocalAdminBackITmanagerHO.jsp";
document.form.method="post";
document.form.submit();
}
function NonITManager()
{alert("here222");	
document.form.action="NewinsLocalAdminBackNonITmanagerHO.jsp";
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
<script type="text/javascript">
	
	 function remarks()
	 {
	 	//NonitRemarks	
	 	var d1 = document.form.NonitRemarks;
	 	var d2 = document.form.level;
	 	var d3 = document.form.CheckValues;
	 	
		if ((d3.value==null)||(d3.value=="NULL")||(d3.value==""))
	 	{
	 	 alert("Select Programs to be Addeded and Blocked !");
	 	         d3.focus();
	 	 return false;
	 	 }
		
	 	if ((d2.value==null)||(d2.value=="NULL")||(d2.value==""))
	 	{
	 	 alert("Enter the Level...........!");
	 	         d2.focus();
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
function cancel()
{
   close();
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
 alert("Mail Will Be Sent To HR/ADMIN (Head Office)");
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
//function resendMail(mail,form7_no,email_id,name)
function resendMail(email_id,form7_no,mail,name)
  		 {
	if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){
           alet("Creating html http object");    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){    
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="../../ResendMailNewins?mail="+email_id+","+form7_no+","+mail+","+name+"";  
                          // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                           //url +="?mail="+mailId;   
                              xmlHttp.onreadystatechange = mailStateChange;  
                          //   alert("before sending mail");
                                  xmlHttp.open("POST", url, true); 
                                  
                               //   alert("MAIL SENT");
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
<body>
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="NewinsAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null;
String req=null;
String empD=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
String SessionnewinsUser=null;
%>
<%
SessionName = (String) session.getAttribute("Nname");
Sessiondesg = (String) session.getAttribute("desg");
Sessioncity = (String) session.getAttribute("city");
Sessionb_no = (String) session.getAttribute("b_no");
admin =  (String) session.getAttribute("admin");
SessionnewinsUser = (String) session.getAttribute("newinsUser");
//String nammeeeee = session.getAttribute("Nname").toString();
//String desgggg = session.getAttribute("desg").toString();
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("SessionnewinsUser ----------------------------------------------------"+SessionnewinsUser);
System.out.println("Name Number :"+SessionName);
System.out.println("desg Number :"+Sessiondesg);
System.out.println("city Number :"+Sessioncity);
System.out.println("Branch Number :"+Sessionb_no);
System.out.println("admin Number :"+admin);
System.out.println("email_id Number :"+email_id);
System.out.println("------------------------------------");
Connection cn5 = null,cn11=null,cn111=null; 
Statement st5 = null,st11=null,st111=null; 
ResultSet rs5 = null,rs11=null,rs111=null; 
PreparedStatement psmt=null,psmt2=null;PreparedStatement psmtHR=null;PreparedStatement psmt5=null,psmt6=null;
Connection cn022 = null,cn021=null;
Statement st022 = null,st021=null; 
ResultSet rs022 = null,rs021=null;
try{
%>

<%//form1_it_clearance
 //String form1_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,d_resignation=null,d_reliving=null;
//String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
//String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;

//form2_domain
String form7_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;
String ipAddress=null,ComName=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null,empno=null,requBranchCode=null;
String deleteremarks=null;
String req = request.getParameter("req");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form7_newins WHERE form7_no='"+req+"'"); 
while(rs100.next())
{
	    form7_no = rs100.getString("form7_no");
	    f_date = rs100.getString("f_date");
	    idextend = rs100.getString("idextend");
        empno= rs100.getString("empid");
	    branch = rs100.getString("branch");
	    depart = rs100.getString("depart");
	    full_name = rs100.getString("full_name");
	    designation = rs100.getString("designation");
	    scopeOfWork = rs100.getString("scopeOfWork");
	    emp_code = rs100.getString("emp_code");
	    reporting_officer = rs100.getString("reporting_officer");
	    requestOption = rs100.getString("requestOption");
	    requestBy = rs100.getString("requestBy");
	    remarks = rs100.getString("remarks");
	    deleteremarks = rs100.getString("deleteremarks");
	    requBranchCode = rs100.getString("requBranchCode");

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
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<textarea id="hiderow" name="theName" rows="1" cols="30" readonly="readonly" style="color:BLUE value:WELCOME; visibility:hidden; display:none;"></textarea>
<br /><br /><div id="page-wrap">
<center>
<table width="907"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td ><center><font size="3">
		<b><label>
		NEWINS FROM </label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=SessionName%>" />
		<input type="hidden" name="i_desg" value="<%=Sessiondesg%>" />
		<input type="hidden" name="i_city" value="<%=Sessioncity%>" />
		<input type="hidden" name="i_b_no" value="<%=Sessionb_no%>" />
		<input type="hidden" name="i_admin" value="<%=admin%>" />
		<input type="hidden" name="i_email_id" value="<%=email_id%>" />
		<input type="hidden" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="hidden" name="r_remarks" value="extra_value"/>
		<input type="hidden" name="form7_no" value="<%=form7_no%>" />
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


%>	 
		
	<table width="895">
	<!-- <tr>
	<td ><font size="3">
		<b><center><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label> </center>
		</b></font></td>
	</tr> -->
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >NAME:</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=SessionName%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >DESIGNATION :</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=Sessiondesg%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; " bgcolor="grey" >FORM NO :</td>
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=form7_no%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
&nbsp;&nbsp;&nbsp; 
<td  style="text-align: right;">Emp No. :</td>
<td style="text-align:left;"><input type="text" name="empno" id="idempno" size="31" value="<%=empno%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" size="31" value="<%=full_name%>" readonly="readonly"/></td>
</tr>
<tr>
<td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/>
				</td> 

</tr>

<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" size="31" value="<%=designation%>" readonly="readonly"/></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" size="31" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>


</tr>
<tr>
<td  style="text-align: right;">Requested Operator Code:</td>
<td style="text-align:left;">

<input type="text"    name="d_resignation" size="31" value="<%=emp_code%>" readonly="readonly"  readonly="readonly" />

</td>
<td  style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="31" value="<%=scopeOfWork%>" readonly="readonly"/></td>


</tr>

<tr>
<td  style="text-align: right;">Requested Branch Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" size="31" value="<%=requBranchCode%>" readonly="readonly"/></td>
<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"    name="d_reliving"  size="31" value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
	
		</td> 					        
</tr>
<tr>

<td align="right">Type Of Request  :</td>
<td  colspan="3"> 
     <input style="" type ="text" name = "requestOption" size="31" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
   
</tr>
<%if(requestOption.equals("Change")) { %>
<tr>
<td align="right">If Changed  :</td>
<td  colspan="3"> <%=deleteremarks%></td>
   
</tr>
<%} %>
</table>
<br>


<br />
<table width="895" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>RESND</b></font></td>
	  </tr>
	  <%
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  rs1 = st1.executeQuery("select form7_no,desg,emp,status,remarks,f_date,mail from form7_newins_item WHERE form7_no='"+req+"' ORDER BY id ASC"); 
	  while(rs1.next())
	  {
		  String form7_noD= rs1.getString("form7_no");
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
		<td bgcolor="white" width="100"><font size="2" color="black"><%=statusD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=remarksD%></font></td>
		<td bgcolor="white" width="100"><font size="2" color="black"><%=f_dateD%></font></td>
		
	 <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=email_id%>','<%=form7_no%>','<%=m%>','<%=SessionName%>');" /></td> 
		<!--  <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="return resendMail();" /></td> -->
	  </tr>
	  <%} %>
</table>
<% 

cn5 = con.getConnection2();
st5 = cn5.createStatement();

String ITdesg="",ITbno="",ITName="",ITmail="";
//Select Nmail,Nname,post,b_no,newinsUser from login WHERE newinsUser='Yes' AND b_no='90' AND post LIKE '%GENERAL%'
/* psmt = cn2.prepareStatement("SELECT post,b_no,Nname,Nmail FROM login WHERE b_no=? AND post=?");
psmt.setString(1,"90");
psmt.setString(2,"SR.MANAGER IT"); */
psmt = cn2.prepareStatement("Select Nmail,Nname,post,b_no,newinsUser from login WHERE newinsUser='No' AND b_no='90' AND Nno='77' ");
ResultSet itmang = psmt.executeQuery();
while(itmang.next())
{
	 ITmail = itmang.getString(1);
	 ITName = itmang.getString(2);
	 ITdesg = itmang.getString(3);
	 ITbno = itmang.getString(4);
	 
}
System.out.println("Name e-----------------ITmail--------- query : "+ITmail);
System.out.println("Name e-----------------ITName--------- query : "+ITName);
System.out.println("Name e-------------------------- query : "+ITdesg);
System.out.println("Name ------------------------sessoin   : "+Sessiondesg);
System.out.println("branch no ---------------------------  : "+ITbno);
System.out.println("b_no ------------------------session   : "+Sessionb_no);


cn111 = con.getConnection2();
st111=cn111.createStatement();

String HRadminFromQuery = null,HRadminNameFromQuery=null;
String NonITdesg=null,NonITbno=null,NewinsUser=null;
String hr = "HR/ADMIN";
//rs111 = st111.executeQuery("select Nmail,Nname,post,b_no,newinsUser from login WHERE newinsUser='Yes' AND b_no='90'");
rs111 = st111.executeQuery("select Nmail,Nname,Npost,branch_no,newinsUser from  formuser_master WHERE newinsUser='Yes' AND branch_no='90'");
//psmtHR = cn11.prepareStatement("select Nmail from login WHERE b_no LIKE 'HR%'");
//psmtHR.setString(1,"90");
//rs111 = psmtHR.executeQuery();
while(rs111.next())
{
	  HRadminFromQuery = rs111.getString(1);
	  HRadminNameFromQuery = rs111.getString(2);
	  NonITdesg = rs111.getString(3);
	  NonITbno = rs111.getString(4);
	//  NewinsUser = rs111.getString(5);
}
/* System.out.println("HRadminFromQuery: "+HRadminFromQuery);
System.out.println("HRadminNameFromQuery : "+HRadminNameFromQuery);

System.out.println("NNON IT B NO : "+NonITbno);
System.out.println("NNON IT DESG  : "+NonITdesg); */
//System.out.println("NNON IT NewinsUser : "+NewinsUser);
%> 
	<input type="hidden" name="ITdesg" value="<%=ITdesg%>"/>
		<input type="hidden" name="ITName" value="<%=ITName%>"/>
			<input type="hidden" name="ITmail" value="<%=ITmail%>"/>



<input type="hidden" name="HRadminFromQuery" value="<%=HRadminFromQuery%>"/>
		<input type="hidden" name="HRadminNameFromQuery" value="<%=HRadminNameFromQuery%>"/>
		<input type="hidden" name="NonITdesg" value="<%=NonITdesg%>"/>
<%String flag = c2ITUtil1.getAuthorizedNameNewins(form7_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString()); %>
<%
System.out.println("FLAG value --------------------- : "+flag);

System.out.println("FLAG value -----------ITbno---------- : "+ITbno);
System.out.println("FLAG value ------------ITdesg--------- : "+ITdesg);

System.out.println("FLAG value -----------SessionnewinsUser---------- : "+SessionnewinsUser);



	if((ITbno.equals(session.getAttribute("b_no")) && (ITdesg.equals(session.getAttribute("desg")))) && (flag=="false"))
	        {
			System.out.println("FLAG value ------------1111--------- : "+flag);
			String ProgAllowed=null,ProgBlocked=null;
			
			psmt5 = cn2.prepareStatement("SELECT form7_no,desg,name,progAllowed FROM form7_allowed WHERE form7_no=?");
			psmt5.setString(1,form7_no);
			ResultSet rsp = psmt5.executeQuery();
			
			
			psmt6 = cn2.prepareStatement("SELECT form7_no,progBlocked FROM form7_blocked WHERE form7_no=?");
			psmt6.setString(1,form7_no);
			ResultSet rsb = psmt6.executeQuery();
			%>

		 <table  border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
		   <tr><td bgcolor="grey"><font size="2" color="black"><u>HO Finance & A/C:</u></font></td></tr>
		   <tr>
				<td><font size="2" color="black"><b>Program To be Blocked</b></font></td>
				<%while(rsb.next())
				     { ProgBlocked = rsb.getString("progBlocked"); %>
				  <td bgcolor="#F0F0F0"><%=ProgBlocked%></td>
				<%} %>
		   </tr>
		   <tr>
			   <td><font size="2" color="black"><b>Program To be Allowed</b></font></td>
				<%while(rsp.next())
				    { ProgAllowed = rsp.getString("progAllowed"); %>
			    	<td bgcolor="#F0F0F0"><%=ProgAllowed%></td>
				<%} %>
		   </tr>
		</table>

		<table id="it" bgcolor="grey">
		     <tr><td id="ita">IT Dept Use Only</td></tr>
		</table>

		<table id="table3" bgcolor="grey">
			<tr>
				<td class="it2" style="text-align: right;width:23%;"> Operator Code:</td>
				<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITdcode" id="code" maxlength="65" /></td>
			</tr>
		
			<tr>
				<td class="it2" style="text-align: right;width:23%;">Password :</td>
				<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITdpassword" id="pwd" maxlength="65"></td>
		    </tr>
			<tr>
				<td class="it2" style="text-align: right;width:23%;">Level :</td>
				<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITdlevel" id="cud" maxlength="65"></td>
			</tr>
		    <tr>
				<td class="it2" style="text-align: right;width:23%;"> Remarks :</td>
				<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITdremark" id="rem" size="60" maxlength="500"></td>
			</tr>
		</table>
		<br />
		<b>Send To:</b>
      	<%
		  cn11 = con.getConnection2();
		  st11=cn11.createStatement();
		  
		  rs11 = st11.executeQuery("select form7_no,desg,emp,status,remarks,f_date,mail from form7_newins_item WHERE form7_no='"+req+"' ORDER BY id ASC"); 
		  while(rs11.next())
		  {
		  String NAME = rs11.getString("emp");	  
		  String Mailing=rs11.getString("mail");
		  %>
	   	   <input type="checkbox" name="mailingCheck" value="<%=Mailing%>"/><%=NAME%>  -  <%=Mailing%>
	 	  <%} %>
			<input type="checkbox" name="HRadminFromQuery" value="<%=HRadminFromQuery%>"/>HR/ADMIN HO  -   <%=HRadminFromQuery%>
			<input type="hidden" name="HRadminNameFromQuery" value="<%=HRadminNameFromQuery%>"/>
			<input type="hidden" name="NonITdesg" value="<%=NonITdesg%>"/>

		<br />
      <%}
	else if( (SessionnewinsUser.equals("Yes"))){
       System.out.println("FLAG value ---------------22222------ : "+flag);
        %>	
<table width="100%" border="1" bgcolor="white">
	<tr>
	    <td align="center" bgcolor="grey" colspan="10"><font size=2 >HO-FINANCE & A/C's<font color=red>*</font></font></td>
	</tr>
    <tr>
       <td align="left" bgcolor="grey"><font size=2 >ACCESS RIGHTS<font color=red>*</font></font></td>
    </tr>
    <tr>
       <td align="left" bgcolor="grey"><font size=2 >Programs to be blocked<font color=red>*</font></font></td>
    </tr>
  <%
	cn022 = con.getConnection2();
	st022=cn022.createStatement();
	rs022 = st022.executeQuery("select pro_name from newins_programs ORDER BY pro_name Asc");
	cn021 = con.getConnection2();
	st021=cn021.createStatement();
	rs021 = st021.executeQuery("select pro_name from newins_programs ORDER BY pro_name Asc");
    int count=0,count2=0;
    ArrayList<String> pro_nameBlocked = new ArrayList<String>();
    ArrayList<String> pro_nameAllowed = new ArrayList<String>();
    while(rs022.next())
        { 
	    pro_nameBlocked.add(rs022.getString("pro_name"));
        } 
    while(rs021.next())
        { 
	    pro_nameAllowed.add(rs021.getString("pro_name"));
	    }
   int column = 0,column2=0;
   for(int row=0;row<pro_nameBlocked.size();row+=10)
		{
		%> 
       <tr>
		  <% for(column=0;column<10;column++){
		  if(row+column<pro_nameBlocked.size())
		     {
			 String temp = pro_nameBlocked.get(row+column);
		     %>
       <td bgcolor="lightgrey">
  		<INPUT  size="30" width="30" TYPE=CHECKBOX NAME="progBlocked" class="check" onclick="return makeitup();" value="<%=pro_nameBlocked.get(row+column)%>" /><%=pro_nameBlocked.get(row+column) %></td>
       <%
       }
  }
   %>
  </tr>
  <%} %>
  
  <tr>
     <td align="left" bgcolor="grey"><font size=2 >Programs to be Allowed<font color=red>*</font></font></td>
  </tr>
  
   <% for(int row2=0;row2<pro_nameAllowed.size();row2+=10)
	  {
	  %> 
	   <tr>
	   <% for(column2=0;column2<10;column2++){
	   if(row2+column2<pro_nameAllowed.size())
	     {
	 	 String temp2 = pro_nameAllowed.get(row2+column2);
	     %>
	     <td bgcolor="lightgrey">
	   		<INPUT  size="30" width="30" TYPE=CHECKBOX NAME="progAllowed" class="check" onclick="return makeitup();" value="<%=pro_nameAllowed.get(row2+column2)%>" /><%=pro_nameAllowed.get(row2+column2) %></td>
	   <%
	   }
	   }
      %>
	   </tr>
	   <%} %>
	   <tr>
	   <td align="left" bgcolor="grey"><font size=2 >Level<font color=red>*</font> </font></td>
	     <td align="left" bgcolor="grey"><input type="text" name="level" size="7" maxlength="10" value=""/>
	     <input type="hidden" name="CheckValues" value="" id="text" /> 
	     </td>
	     
	   </tr>
	   <tr>
	   <td colspan="10" bgcolor="lightgrey">REMARKS:
	   <textarea rows="2" name="NonitRemarks" cols="150" maxlength="400"></textarea>
	   </td>
	   </tr>
	   
</table>
	
<%} else{
	System.out.println("FLAG value ---------------3333333------ : "+flag);%>
    <table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
     <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
     <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
     <input type="hidden" value="<%= session.getAttribute("form7_no") %>" id="idmrId"/>
     <input type="hidden" id="idstatus" value="<%= flag %>" />
     <tr>
      <td align="left">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Approved" onclick="return(showTR());"/>Approved 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradio" id="idmrapproved" value="Not Approved" onclick="return(hideTR());" />Not Approved
    </td>
    
   
  </tr>  
  <tr style="visibility: hidden;display: none;" id="idApproved" >
   <td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="higherAuthority" id="idIT" onclick="hideHigherTR();" />Send To Higher Authority 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="directApprove" id="idmNon" onclick="showHigherTR();"/>Direct Approve
       
       
       
   
    
       </td>
  </tr>
  <tr style="visibility: hidden;display: none;" id="idApprovedd" >
   <td>
  <select name="desg" onchange="showEmp(this.value)" class="a" style="font-size : 8pt">      
                       <option value="none" class="a">Select</option>
                          
                          <% 
                          ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
                      	String userName = dbProperties.getString("csdb.username");
                      	String password = dbProperties.getString("csdb.password");
                      	String url = dbProperties.getString("csdb.url");
                      	String driver = dbProperties.getString("csdb.driverName");
                      	String dbName = dbProperties.getString("csdb.dbName");
                      	
                          
                      	 Class.forName(driver).newInstance();
                         cn5 = DriverManager.getConnection(url+dbName,userName,password); 
                          st5 = cn5.createStatement();  
                          //rs5 = st5.executeQuery("Select * from desg");
                          //SELECT * FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO)
                          rs5 = st5.executeQuery("SELECT DISTINCT desg.DESIGNATION FROM desg JOIN emp ON(desg.DESG_NO=emp.DESG_NO)");
                          while(rs5.next()){     %>     
                          
                           <option class="a" value="<%=rs5.getString("DESIGNATION")%>"><%=rs5.getString("DESIGNATION")%></option> 
                                  <% }     %>   
                                     </select>     
                                        <br>    
                                            <div id='emp' class="a">      
                                              <select name="emp" style="font-size : 8pt">   
                                                   <option value='-1'></option>  
                                                         </select>   
                                                            </div> 
                                                         
      <br />                                                 
  <label style="float: left;" id="idMailLabel"></label>  
       <input type="hidden" name="mail1" id="idMailValue" value="" />
         </td>
  </tr>
<!--   <tr style="visibility: hidden;display: none;" id="idApproved1" >
   <td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Itradio" value="IT" id="idIT" />IT 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Itradio" value="NON" id="idmNon" />NON IT
   </td>
  </tr> -->
 <!--   <tr style="visibility: hidden;display: none;" id="idPwd1">
  <td>
  <label>Generate Password</label>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="passwrd" value="IT" id="idIT" />YES
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="passwrd" value="IT" id="idIT" />NO
  </td>
  </tr> -->
  <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="120"></textarea></div></td>
  </tr>
  
 
 </table>
<%} %>
 
</br>
                                                                
   </td>
		
	</tr>
</table> 
<!--  <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='NewinsSelectAdmin.jsp?msg=1'"/> </td>
      <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td>
    <td>  <INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate();" /></td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	<td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
   	</tr>
 
</table> --> 	
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
<!--       <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td> -->
<%
System.out.println("NAME FOR SUBMIT : "+SessionName);
if((ITbno.equals(session.getAttribute("b_no")) && ITdesg.equals(session.getAttribute("desg"))))
 {%>
    <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value=" IT SUBMIT" name=button1 onclick="return ITManager();" /></td>
    <%} 
else if((NonITbno != null) && (NonITbno.equals(session.getAttribute("b_no")) && NonITdesg.equals(session.getAttribute("desg"))))
{%>
   <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value=" NON IT SUBMIT" name=button1 onclick="return(remarks() && NonITManager());" /></td>
   <%}
    else{%>
    <td>  <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT11" name=button1 onclick="return OtherAdmin();" /></td>
    <%} %>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	
  <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	
     <td style="font-size:1">&nbsp;&nbsp;<!-- <input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='NewinsSelectAdmin.jsp?msg=1'"/>  -->
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
	DbUtil.closeDBResources(rs100,st100,cn100);
	DbUtil.closeDBResources(rs022,st022,cn022);
	DbUtil.closeDBResources(rs021,st021,cn021);
	DbUtil.closeDBResources(rs11,st11,cn11);
	DbUtil.closeDBResources(rs100,st100,cn100);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt5,null);
	DbUtil.closeDBResources(null,psmt6,null);
	DbUtil.closeDBResources(null,psmtHR,null);
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
<label>VP</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>IT(HO)</label>
<br />
<label  style="font-size: 30px;">&#x21d3;</label>
<br />
<label>HO(Finance/Accounts) - 1 & 2 Approval</label>
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