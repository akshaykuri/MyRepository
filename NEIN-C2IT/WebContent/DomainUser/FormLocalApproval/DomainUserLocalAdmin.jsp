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
<%@page import="java.util.ResourceBundle"%>
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
	<link rel="shortcut icon" type="image/x-icon" href="../../images/faviconnnnn.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>
<!-- Help Page pop up starts  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type = "text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../../css/FormsHelp.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../../js/FormsHelp.js"></script>
	<!-- Help Page pop up ends -->


 <script>
 function checkAddress(str)
      {
      var re = /[^\s]+[a-zA-Z ]*[^\s]+[0-9][/][(][)][.]/g; 
      if (re.test(str)) return false;
         return true;
       }
 function checkNumber(string)
      {
      var numericExpression = /^[0-9]+$/;
      if(string.match(numericExpression)) 
          {
          return true;
          }
      else
          {
          return false;
          }
     }
   function validate()
     {//txtmail_msg
     var d1 = document.form.txtmail_msg;
     var d2 = document.form.mail1;
     var sendopt=document.form.senddirect;
     //alert(sendopt.value);
     if (!document.getElementsByName("mmdradio")[0].checked && !document.getElementsByName("mmdradio")[1].checked) 
	      {
          alert("Select Radio Button For Approval Routine \n Can not Proceed Further..");
          document.getElementsByName("mmdradio")[0].focus();
          return false;
          } 
     if(sendopt.value=="senddirect")
    	 {
         if (document.getElementsByName("mmdradio")[0].checked)
	         {
	        if (!document.getElementsByName("higherAuthority")[0].checked && !document.getElementsByName("higherAuthority")[1].checked) 
	  		  {  
		      alert("Select Radio Button \n \n For selecting next  Or Direct approval of Approval Routine \n \n  Else Can not Proceed Further..");
		      document.getElementsByName("higherAuthority")[0].focus();
      		  return false;
	  		  }
	        }
           if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[0].checked && ((d2.value==null)||(d2.value=="NULL")||(d2.value=="")))
    	        {
    	        alert("Select next approver ..");
    	        d2.focus();
       		    return false;
    	        }
           if (document.getElementsByName("mmdradio")[0].checked && document.getElementsByName("higherAuthority")[1].checked )
	           {
        	   
        	   var itname = document.form.ITusername;
        	   var itpwd = document.form.ITpassword;
        	   var itc = document.form.ITcreated; 
        	   var remar = document.form.ITremark;
               if(itname.value==""||itname.value==null)
       		         {
       		         alert("Please Enter User Name ");
       		         itname.focus();
       		         return false;
       		         }
        	   if(itpwd.value==""||itpwd.value==null)
       		         {
       		         alert("Please Enter Password");
       		         itpwd.focus();
       		         return false;
       		         }
        	   if(itc.value==""||itc.value==null)
       		        {
       		        alert("Please Enter Group ");
       		        itc.focus();
       		        return false;
       		        }
        	  if(remar.value==""||remar.value==null)
       			    {
       			    alert("Please Enter Remarks");
       			    remar.focus();
       			    return false;
       			    }
       	   
	           }
    	 }
    // alert(sendopt.value);//createdomain,sendonly
     if(sendopt.value=="sendonly")
	     {
         if (document.getElementsByName("mmdradio")[0].checked && ((d2.value==null)||(d2.value=="NULL")||(d2.value=="")))
	        {
	        alert("Select Next approver Name  ..");
	        d2.focus();
   		    return false;
	        }
	     }
     if(sendopt.value=="createdomain")
        {
    	 if (document.getElementsByName("mmdradio")[0].checked)
           {
  	       var itname = document.form.ITusername;
  	       var itpwd = document.form.ITpassword;
  	       var itc = document.form.ITcreated; 
  	       var remar = document.form.ITremark;
          if(itname.value==""||itname.value==null)
 		         {
 		         alert("Please Enter User Name ");
 		         itname.focus();
 		         return false;
 		         }
  	      if(itpwd.value==""||itpwd.value==null)
 		         {
 		         alert("Please Enter Password");
 		         itpwd.focus();
 		         return false;
 		         }
  	     if(itc.value==""||itc.value==null)
 		        {
 		        alert("Please Enter Group ");
 		        itc.focus();
 		        return false;
 		        }
  	    if(remar.value==""||remar.value==null)
 			    {
 			    alert("Please Enter Remarks");
 			    remar.focus();
 			    return false;
 			    }
 	   
         }
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
function OtherAdmin()
{
	
//document.form.action="DomainUserAdminBack.jsp";
document.form.action="DomainUserAdminLocalBack.jsp";
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
	//idApproved1,idApproved
	//alert("status is  "+status);
	if (status!="true")
	  {
	    alert("you are not authorized person");
	
	    return false;
	  }
	
	else{
	   //  alert("Select Direct Approved Or Higher Authority");
		 /* document.getElementById('idApproved').style.display="table-row";
	   	 document.getElementById('idApproved').style.visibility="visible";
	 	 document.getElementById('idPwd').style.display="table-row";
		 document.getElementById('idPwd').style.visibility="visible"; */
		 document.getElementById('idApproved').style.display = 'block';
		 document.getElementById('idApproved1').style.display="none";
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
	 document.getElementById('idApproved').style.display = 'none';
	 document.getElementById('idApproved1').style.display="block";
 /* document.getElementById('idApproved').style.hidden="table-row";
 document.getElementById('idApproved').style.visibility="hidden";
 document.getElementById('idApproved1').style.hidden="table-row";
 document.getElementById('idApproved1').style.visibility="hidden";
 document.getElementById('idApprovedd').style.hidden="table-row";
 document.getElementById('idApprovedd').style.visibility="hidden"; */
 
 return true;
 
 }
}

function hideHigherTR(val)
    {
	//alert(val);
    document.getElementById('send').style.display = 'block';
    document.getElementById('direct').style.display="none";
    // alert("Select Designation And Name");
    }
 function showHigherTR(val)
    {
	//alert(val);
    document.getElementById('direct').style.display="block";
    document.getElementById('send').style.display="none";
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
 function hideBcc()
 {
	 document.getElementById('idBcc').style.display="table-row";
	 document.getElementById('idBcc').style.visibility="visible";
	 document.getElementById('idBcc2').style.display="table-row";
	 document.getElementById('idBcc2').style.visibility="visible";
 }
 function hideBcc2()
 {
	 document.getElementById('idBcc').style.hidden="table-row";
	 document.getElementById('idBcc').style.visibility="hidden";
	 document.getElementById('idBcc2').style.hidden="table-row";
	 document.getElementById('idBcc2').style.visibility="hidden";
 }
 </script>
  <script language="javascript" type="text/javascript"> 
  
  function sync(val)
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

function resendMail(email_id,form2_no,mail,name)
  		 {
	 if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){
           alet("Creating html http object");    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){    
                    alert("Browser does not support XMLHTTP Request");    
                      return;     
                       }       var url="../../ResendMailDomain?mail="+email_id+","+form1_no+","+mail+","+name+"";  
                          // url +="?mail="+mail+"&&mr_id"+mr_id+""; 
                           //url +="?mail="+mailId;   
                              xmlHttp.onreadystatechange = mailStateChange;  
                            // alert("before sending mail");
                                  xmlHttp.open("POST", url, true); 
                                  
                               //   alert("MAIL SENT");
                                     xmlHttp.send(null);
                                     
                                     alert("MAIL RESENT ");
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
<form  name="form" method="post"  action="DomainUserAdminLocalBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
String Sessiondesg=null,SessionName=null,Sessioncity=null,Sessionb_no=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,stnext=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rsnext=null;
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
Connection cn5 = null,cn11=null; 
Statement st5 = null,st11=null,st12=null; 
ResultSet rs5 = null,rs11=null,rs12=null; 
try{
%>

<%//form1_it_clearance
 //String form1_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,d_resignation=null,d_reliving=null;
//String a_model=null,a_data_card=null,a_email=null,a_newins=null,a_domain=null,a_mobile_model=null,a_mobile_no=null,a_access_card=null,a_drive=null,a_other_asset=null,a_remarks=null;
//String r_model=null,r_data_card=null,r_email=null,r_newins=null,r_domain=null,r_mobile_model=null,r_mobile_no=null,r_access_card=null,r_drive=null,r_other_asset=null,r_remarks=null;

//form2_domain
String form2_no=null,f_date=null,idextend=null,branch=null,depart=null,full_name=null,designation=null,scopeOfWork=null,emp_code=null,reporting_officer=null,requestOption=null,requestBy=null,remarks=null;
String i_name=null,i_desg=null,i_city=null,i_b_no=null,i_admin=null,i_email_id=null,desg=null,emp=null,mail=null;
String req = request.getParameter("req");
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select * from form2_domain WHERE form2_no='"+req+"'"); 
while(rs100.next())
{
	    form2_no = rs100.getString("form2_no");
	    f_date = rs100.getString("f_date");
	    idextend = rs100.getString("idextend");

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
		DOMAIN USER FROM EMPLOYEE</label>
		</b></font></center> 
		<input type="hidden" name="i_name" value="<%=SessionName%>" />
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
<td style="text-align:left;" bgcolor="grey"><input name="branch" value="<%=form2_no%>" size="31" readonly="readonly"/> </td>
</tr>	
<tr>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>

</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/>
 
					</td> 
</tr>


<tr>
<td  style="text-align: right;">Designation :</td>
<td style="text-align:left;"><input name="designation" value="<%=designation%>" readonly="readonly"/></td>

<td  style="text-align: right;">Reporting Officer  :</td>
<td style="text-align:left;"><input type="text" name="r_officer" id="rofficer" value="<%=reporting_officer%>" readonly="readonly"/></td>


</tr>
<tr>
<td  style="text-align: right;">Scope Of Work :</td>
<td style="text-align:left;">

<input type="text"  style="width: 6em"  name="d_resignation" value="<%=scopeOfWork%>" readonly="readonly"  readonly="readonly" />

</td>

<td  style="text-align: right;">Requested By:</td>
<td style="text-align:left;">
<input type="text"  style="width: 6em"  name="d_reliving"  value="<%=requestBy%>" readonly="readonly" readonly="readonly" />
	
		</td> 					        
</tr>
<tr>
<td align="right">Request  :</td>
<td  colspan="3"> 
     <input style="" type ="text" name = "requestOption" readonly="readonly" value ="<%=requestOption%>" id=""/></td>
   
</tr>
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
	  String mailD=null,form2_noD=null;
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  String statusD=null,emp_no=null,levelno=null;
	  rs1 = st1.executeQuery("select form2_no,desg,emp,status,remarks,f_date,mail,empid,levelno from form2_domain_item WHERE form2_no='"+req+"' ORDER BY id ASC"); 
	  while(rs1.next())
	  {
		  form2_noD= rs1.getString("form2_no");
		  String desgD= rs1.getString("desg");
		  empD= rs1.getString("emp");
		  statusD= rs1.getString("status");
		  String remarksD= rs1.getString("remarks");
		  String f_dateD= rs1.getString("f_date");
		  mailD= rs1.getString("mail");
		  String m = "";
		//   System.out.println("The sseecccoonndd mr_master ");
		
		  emp_no= rs1.getString("empid");
		  levelno= rs1.getString("levelno");
		
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
		
	 <%-- <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=m%>','<%=form2_no%>','<%=empD%>');" /></td>  --%>
	 <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=email_id%>','<%=form2_no%>','<%=m%>','<%=SessionName%>');" /></td> 
		<!--  <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="return resendMail();" /></td> -->
	  </tr>
	  <%} %>
</table>

<%String flag = c2ITUtil1.getAuthorizedNameDomain(form2_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),session.getAttribute("EmpNo").toString()); %>

<%-- <%if(desgggg!=null && !nammeeeee.equals("Prasanna Kumar") && !b_no.equals("90") && !desgggg.equals("ASST. GENERAL MANAGER")) {%> --%>
<%-- <%if(Name!=null && !Name.equals("Prasanna Kumar")) {%> --%>



<table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
 
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
  /*    String url = "jdbc:mysql://localhost:3306/";
     String dbName = "leavemanagement";
     String driver = "com.mysql.jdbc.Driver";
     String userName = "root"; 
     String password = ""; */
     String napproval="",nuname=null,ndesg=null,nmailid=null,napproval1="";
     connhrms = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl);  
     Statement nstmt = connhrms.createStatement();  
    
     String maxlevel="";
     
      cn1 = con.getConnection2();
	  st12=cn1.createStatement();
	  
	  
	  String i_b_no1=form2_noD.substring(15,17);
	  
	  
	  
      rs12= st12.executeQuery("SELECT max(levelno) FROM formapproval WHERE branch='"+i_b_no1+"' and formtype='DOMAIN'  ORDER BY levelno ASC");
     if(rs12.next())
         { 
         maxlevel=rs12.getString(1);
         }
     System.out.println("Max Level no :"+maxlevel);
     String allopt="",dirappro="";
     st11 = cn1.createStatement();  
     //rs5 = st5.executeQuery("Select * from desg");emp_no,levelno
       System.out.println("i_b_no  :"+i_b_no1);
     System.out.println("emp_no  :"+emp_no);
    rs11 = st11.executeQuery("SELECT alloptions,directApprove FROM formapproval WHERE branch='"+i_b_no1+"' and empid='"+emp_no+"' and formtype='DOMAIN'");
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
     System.out.println("All option  :"+allopt);
     System.out.println("dirappro  :"+dirappro);
     
     //System.out.println("dirappro  :"+nextlevel);
     /* ////////////////////////// Skeeping level code  ////////////////////////////////// */
      String nextemp="";
      stnext = cn5.createStatement(); 
      rsnext = stnext.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='DOMAIN' ORDER BY levelno ASC");
      if(rsnext.next())
           {
    	   nextemp=rsnext.getString(5);
           }
      if(emp_no.equals(nextemp))
          {
    	  if(!levelno.equals("Creater")) 
    		  nextlevel++;
          }
     /* ////////////////////////// end Skeeping level code  ////////////////////////////////// */
     
       //System.out.println("dirappro  :"+nextlevel);
       //System.out.println("dirappro  :"+levelno);
       //System.out.println("dirappro  :"+maxlevel);
     if(allopt.equals("0") || allopt.equals(""))
           {
    	  if(!levelno.equals(maxlevel) && !dirappro.equals("1"))
	         {
    		 System.out.println("Next  Level no111 :"+nextlevel);
    		 System.out.println("Next  Level no111 :"+i_b_no1);
    	     rs5 = st5.executeQuery("SELECT * FROM formapproval WHERE branch='"+i_b_no1+"' and levelno='"+nextlevel+"' and formtype='DOMAIN' ORDER BY levelno ASC");
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
    		     System.out.println("Next approval :"+napproval); 
               %><input type="hidden" name="senddirect" id="senddirect" value="sendonly" readonly/>
                  <td> 
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
               else
                  {
            	   System.out.println("Direct approve section.............");
            	   String app_name=null,developer_name=null,developer_mail=null,napprovalsw="",napprovalsw1="";
            	   st2=cn2.createStatement();
            	   //rs2 = st2.executeQuery("select app_name,developer_name,developer_mail from software_owner_master WHERE app_name='"+Software+"'");
            	   rs2 = st2.executeQuery("select app_name,developer_name,developer_mail from software_owner_master where app_name='NEIN-P2P'");
            	   if(rs2.next())
            	       {
            	   	   app_name = rs2.getString("app_name");
            	 	   developer_name = rs2.getString("developer_name");
            	 	   developer_mail = rs2.getString("developer_mail");
            	       }
            	   napprovalsw=developer_name+"("+developer_mail+")";
            	   napprovalsw1="1920"+","+developer_name+","+"Manager"+","+developer_mail+","+"Creater";
            	   
            	   
            	   if(!levelno.equals(maxlevel) && dirappro.equals("1"))
            	         {%>
            	         <td>
            	             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="send" id="idIT" onclick="hideHigherTR(this.value);" />Send To HO(IT) 
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="higherAuthority" value="direct" id="idmNon" onclick="showHigherTR(this.value);"/>Direct Approve
                         </td>
            	         
            	         <input type="hidden" name="senddirect" id="senddirect" value="senddirect" readonly/>
            	         
            	         
            	         <td style="display: none;" id="send">Send to HO(IT) for Create Domain<br>
                              <input align="left" type="radio" value="<%=napprovalsw%>" id="iddeptadminP1" onclick="sync(iddeptadminP.value);"/>
                              <input type="text" name="mail11" id="iddeptadminP11" value="<%=napprovalsw%>" size="50" readonly/>
                               <input type="hidden" name="mail12" id="iddeptadminP" value="<%=napprovalsw1%>" size="30"/>
   	                      </td>
            	                       <input type="hidden" name="empid1" id="idempid1" value="" readonly/>
                                       <input type="hidden" name="emp" id="idroname" value="" readonly/> 
                                       <input type="hidden" name="desg" id="idrodesg" value="" readonly/>
                                       <input type="hidden" name="mail1" id="idromail" value="" readonly/>
                                       <input type="hidden" name="levelno" id="idlevelno" value="" readonly/>
                                       
                                       
                           <td style="display: none;" id="direct">Create Domain<br>
            	           <table id="idFinal" align="center" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" >
                               <tr>
                                  <td class="it2" style="text-align: right;width:23%;"> User Name :</td>
                                  <td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITusername" id="uname" maxlength="65" /></td>
                              </tr>
                              <tr>
                                  <td class="it2" style="text-align: right;width:23%;">Password :</td>
                                  <td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITpassword" id="pwd" maxlength="65" /></td>
                             </tr>
                             <tr>
                                      <%
                                      Connection cn0211 = null;
                                      Statement st0211 = null; 
                                      ResultSet rs0211 = null;
                                      cn0211 = con.getConnection2();
                                      st0211=cn0211.createStatement();
                                      rs0211 = st0211.executeQuery("select * from groupmaster ORDER BY groupName Asc");
                                      %>
                                   <td class="it2" style="text-align: right;width:23%;">Created Under Group :</td>
                	               <td>
                                       <select name="ITcreated" id="cud" >
			                              <option value="">Select</option>
			                                 <%while(rs0211.next()){ %>
		                                      <option value="<%=rs0211.getString("groupName")%>"><%=rs0211.getString("groupName")%></option>
		                                      <%} %>
		                               </select>
                                   </td>
                            </tr>
                            <tr>
                                  <td class="it2" style="text-align: right;width:23%;"> Remarks :</td>
                                  <td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITremark" id="rem" size="60" maxlength="500" /></td>
                            </tr>
            	         
            	         
            	          <tr>
                             <td align="left"><b>Send BCC</b>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="Yes" onclick="hideBcc();"/>Yes
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="No" onclick="hideBcc2();" checked="checked"/>No
                              </td>
                           </tr>
            	         <tr style="visibility: hidden;display: none;" id="idBcc">
                           <td align="left">
  	                          <b>Enter Mail ID's with comma:</b></td><td> <input type="text" name="SendBCCmail" size="50" value="" placeholder="abcd.nittsu.co.in,xyz.nittsulogistics.co.in"/>  
                            </td>
                        </tr>   
                   </table></td>       	     
                           
                               <%}else{ System.out.println("User creation section........");%>
                               <input type="hidden" name="senddirect" id="senddirect" value="createdomain" readonly/>
            	         <td>Create Domain<br>
            	           <table id="idFinal" align="center" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey" >
                               <tr>
                                  <td class="it2" style="text-align: right;width:23%;"> User Name :</td>
                                  <td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITusername" id="uname" maxlength="65" /></td>
                              </tr>
                              <tr>
                                  <td class="it2" style="text-align: right;width:23%;">Password :</td>
                                  <td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITpassword" id="pwd" maxlength="65" /></td>
                             </tr>
                             <tr>
                                      <%
                                      Connection cn0211 = null;
                                      Statement st0211 = null; 
                                      ResultSet rs0211 = null;
                                      cn0211 = con.getConnection2();
                                      st0211=cn0211.createStatement();
                                      rs0211 = st0211.executeQuery("select * from groupmaster ORDER BY groupName Asc");
                                      %>
                                   <td class="it2" style="text-align: right;width:23%;">Created Under Group :</td>
                	               <td>
                                       <select name="ITcreated" id="cud" >
			                              <option value="">Select</option>
			                                 <%while(rs0211.next()){ %>
		                                      <option value="<%=rs0211.getString("groupName")%>"><%=rs0211.getString("groupName")%></option>
		                                      <%} %>
		                               </select>
                                   </td>
                            </tr>
                            <tr>
                                  <td class="it2" style="text-align: right;width:23%;"> Remarks :</td>
                                  <td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="ITremark" id="rem" size="60" maxlength="500" /></td>
                            </tr>
            	            <tr>
                             <td align="left"><b>Send BCC</b>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="Yes" onclick="hideBcc();"/>Yes
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="mmdradioBcc" value="No" onclick="hideBcc2();" checked="checked"/>No
                              </td>
                           </tr>
            	         <tr style="visibility: hidden;display: none;" id="idBcc">
                           <td align="left">
  	                          <b>Enter Mail ID's with comma:</b></td><td> <input type="text" name="SendBCCmail" size="50" value="" placeholder="abcd.nittsu.co.in,xyz.nittsulogistics.co.in"/>  
                            </td>
                        </tr>   
                   </table></td>       	         
                  <%} }
              
          }
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
		       // System.out.println("Next approval :"+napproval); 
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
	    <textarea  name="txtmail_msg"  rows="2" cols="150"></textarea></div></td>
  </tr>
  
 
 </table>


</br>
                                                                
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
    <td> <div id="formsubmitbutton"> <input type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return (validate() && ButtonClicked() && OtherAdmin());" />
    </div>
     <div id="buttonreplacement" style="margin-left:30px; display:none;">
	<img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	</div> 
    </td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   
  <td>&nbsp;&nbsp;<!-- <a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a> -->
   	<input type="button" id="btnShowSimple" value="HELP" />
   	</td>
   	<td style="font-size:1">&nbsp;&nbsp;<input type="button" value="Cancel" onclick="cancel();" /></td>
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
    <label style="text-align:center;">HR/Admin (Local)</label>
<br />
<label style="font-size: 30px;">&#x21d3;</label>
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
<label>HO(IT)</label>
<br />

</form>	

</body>

</html>