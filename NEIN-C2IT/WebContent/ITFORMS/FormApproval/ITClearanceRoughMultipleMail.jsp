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
	<link rel="shortcut icon" type="image/x-icon" href="../../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../css/Calender.css" title="style" />
<script language="javascript"   type="text/javascript" src="../../js/Calendar.js"></script>

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
                       }       var url="../selEmpForms.jsp";  
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
                       }       var url="../selectMailId.jsp";  
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
                       }       var url="ResendMail?mail="+mail+","+form1_no+","+empD+"";  
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
<body>
<!-- <body onload="start()" onunload="stop()"> -->
<form  name="form" method="post"  action="ITclearanceRoughAdminBack.jsp">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null;
String req=null;
String empD=null;
%>
<%
Name = (String) session.getAttribute("Nname");
desg = (String) session.getAttribute("desg");
city = (String) session.getAttribute("city");
b_no = (String) session.getAttribute("m_b_no");
admin =  (String) session.getAttribute("admin");
email_id = (String) session.getAttribute("Nmail");
System.out.println("-------------------------------------");
System.out.println("Name Number :"+Name);
System.out.println("desg Number :"+desg);
System.out.println("city Number :"+city);
System.out.println("Branch Number :"+b_no);
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
String req = request.getParameter("req");
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
<table width="101%"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td ><center><font size="3">
		<b><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label>
		</b></font></center> 
		<input type="text" name="i_name" value="<%=Name%>" />
		<input type="text" name="i_desg" value="<%=desg%>" />
		<input type="text" name="i_city" value="<%=city%>" />
		<input type="text" name="i_b_no" value="<%=b_no%>" />
		<input type="text" name="i_admin" value="<%=admin%>" />
		<input type="text" name="i_email_id" value="<%=email_id%>" />
		<input type="text" name="f_date" value="<%= po_date.format(new java.util.Date())%>"/>
		<input type="text" name="r_remarks" value="extra_value"/>
		<input name="form1_no" value="<%=form1_no%>" />
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
	 <br />
<%



cn2 = con.getConnection2();
st2=cn2.createStatement();
rs2 = st2.executeQuery("select dept_name from department_master ORDER BY dept_name Asc"); 

cn4 = con.getConnection2();
st4=cn4.createStatement();
rs4 = st4.executeQuery("select DESIGNATION from desg ORDER BY DESIGNATION Asc"); 


%>	 
		
	<table width="900">
	<!-- <tr>
	<td ><font size="3">
		<b><center><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label> </center>
		</b></font></td>
	</tr> -->
	
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" size="31" readonly="readonly"/> </td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/>
 
					</td> 
</tr>
<tr>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
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
<td style="text-align:left;">

<input type="text"  style="width: 6em"  name="d_resignation" value="<%=notServed%>" readonly="readonly"  readonly="readonly" />
days
</td>
</tr>
</table>
<br>


<label><center> <font color="black"><u><b>IT ASSET PROVIDED</b></u></font></center> </label> 
<table id="table3">
<tr>

<td class="it1" align="center">1  </td>


<td class="it2" style="text-align: right;width:23%;"> Laptop/Desktop Model :</td>
<td class="it2"  style="text-align:left;width:25%;"> <input type="text" name="a_model" readonly="readonly" id="mod" maxlength="100" value="<%=a_model%>"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_model" id="rem1" size="60" readonly="readonly" value="<%=r_model%>"/></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>


<td class="it2" style="text-align: right;width:23%;">Data Card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_datacard" readonly="readonly" value="<%=a_data_card%>" id="dc" maxlength="100" /></td>


<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_datacard" id="rem2" size="60" readonly="readonly" value="<%=r_data_card%>"/></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>



<td class="it2" style="text-align: right;width:23%;">Email Id :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_email" id="eid" readonly="readonly" value="<%=a_email%>" maxlength="100" /></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_email" id="rem3" size="60" readonly="readonly" value="<%=r_email%>" /></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>



<td class="it2" style="text-align: right;width:23%;">Newins Id :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_newins" readonly="readonly" value="<%=a_newins%>" id="nid" maxlength="100" /></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_newins" id="rem4" size="60" readonly="readonly" value="<%=r_newins%>"/></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>



<td class="it2" style="text-align: right;width:23%;">Domain User :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_domain" readonly="readonly" value="<%=a_domain%>" id="du" /></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_domain" id="rem5" size="60" readonly="readonly" value="<%=r_domain%>"/></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>



<td class="it2" style="text-align: right;width:23%;">Mobile Phone Model :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="number" name="a_mobile_model" readonly="readonly" id="mpd" value="<%=a_mobile_model%>"/></td>

<td class="it2">Remarks :</td>
<td class="it2"><input type="text" name="r_mobile_model" id="rem6" size="60" readonly="readonly" value="<%=r_mobile_model%>"/></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>



<td class="it2" style="text-align: right;width:23%;">Mobile No :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" readonly="readonly" name="a_mobile_no" id="mno" value="<%=a_mobile_no%>"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_mobile_no" id="rem7" readonly="readonly" size="60" value="<%=r_mobile_no%>"/></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>



<td class="it2" style="text-align: right;width:23%;">Access Card :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_access_card" readonly="readonly" id="acard" value="<%=a_access_card%>"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_access_card" id="rem8" size="60" readonly="readonly" value="<%=r_access_card%>"/></td>
</tr>

<tr>
<td class="it1" align="center">9  </td>



<td class="it2" style="text-align: right;width:23%;">Hard Disk/Pen Drive :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_drive" readonly="readonly" id="hp" value="<%=a_drive%>"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_drive" id="rem8" size="60" readonly="readonly" value="<%=r_drive%>"/></td>
</tr>


<tr>
<td class="it1" align="center">10  </td>



<td class="it2" style="text-align: right;width:23%;">Any Other Asset :</td>
<td class="it2" style="text-align:left;width:25%;"> <input type="text" name="a_other_asset" readonly="readonly" value="<%=a_other_asset%>" id="asset1"/></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><input type="text" name="r_other_asset" id="rem8" size="60" readonly="readonly" value="<%=r_other_asset%>"/></td>
</tr>
</table>
<br />
<table width="100%" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
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
	  rs1 = st1.executeQuery("select form1_no,desg,emp,status,remarks,f_date,mail from form1_it_clearance_item WHERE form1_no='"+req+"'"); 
	  while(rs1.next())
	  {
		  String form1_noD= rs1.getString("form1_no");
		  String desgD= rs1.getString("desg");
		  String mailing = rs1.getString("mail");
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
		
	 <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="resendMail('<%=m%>','<%=form1_no%>','<%=empD%>');" /></td> 
		<!--  <td><input type="button"  style="size:1" value="RE-SEND MAIL" onclick="return resendMail();" /></td> -->
	  </tr>
	  <tr>
	  <td>
	  
	  <input type="checkbox" name="mailingCheck" value="<%=mailing%>"/><%=mailing%>
	  </td>
	  </tr>
	  <%} %>
</table>
<% 
Connection cn5 = null; 
Statement st5 = null; 
ResultSet rs5 = null; 
cn5 = con.getConnection2();
st5 = cn5.createStatement();

%> 
<%String flag = c2ITUtil1.getAuthorizedName(form1_no,session.getAttribute("Nname").toString(),session.getAttribute("desg").toString(),session.getAttribute("EmpNo").toString()); %>
 <%-- <table align="center" class="dynatable" width="100%" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="lightgrey">
 
 <input type="hidden" value="<%= session.getAttribute("Nname") %>" id="idsession"/>
 <input type="hidden" value="<%= session.getAttribute("desg") %>" id="iddesg"/>
  <input type="hidden" value="<%= session.getAttribute("form1_no") %>" id="idmrId"/>
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
                          
                          <% Class.forName("com.mysql.jdbc.Driver").newInstance();   
                          cn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root","");  
                          st5 = cn5.createStatement();  
                          rs5 = st5.executeQuery("Select * from desg");
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
                                                         
       <label id="idMailLabel"></label>  
       <input type="hidden" name="mail1" id="idMailValue" value="" />
         </td>
  </tr>
  <tr style="visibility: hidden;display: none;" id="idApproved1" >
   <td>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Itradio" value="IT" id="idIT" />IT 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="Itradio" value="NON" id="idmNon" />NON IT
   </td>
  </tr>
 <!--   <tr style="visibility: hidden;display: none;" id="idPwd1">
  <td>
  <label>Generate Password</label>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="passwrd" value="IT" id="idIT" />YES
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align="left" type="radio" name="passwrd" value="IT" id="idIT" />NO
  </td>
  </tr> -->
  <tr  ><td colspan="6">REMARKS:
		<div style="overflow:auto;">
	    <textarea  name="txtmail_msg"  rows="2" cols="150"></textarea></div></td>
  </tr>
  
 
 </table>
 --%>
 
</br>
                                                                
   </td>
		
	</tr>
</table> 
 <table style="margin-left: auto;margin-right: auto;" ><tr>
 
     <td style="font-size:1">&nbsp;&nbsp;<input style="size:1;font-size: 1.1em;" type="button"  value="BACK" onclick="window.location.href='ITclearanceSelectAdmin.jsp'"/> </td>
<!--       <td style="size:1"><input  type="submit" value="SEND" name="save1" id="save1" onclick="return validate();" /></td> -->
    <td>  <INPUT type="submit" style="background-color:#2f4377;font-weight:bold;color:white;" value="SUBMIT" name=button1 onclick="return validate();" /></td>
   	<td style="size:1">&nbsp;&nbsp;<input type="reset"  value="RESET"/></td>
   	<td>&nbsp;&nbsp;<a href="HelpPageCS.jsp" onclick="return popitup('HelpPageCS.jsp')" id="hiderow"><font size=2>HELP</font></a></td>
   	</tr>
 
</table> 	

</center>
	<br /><br /><br />
	
</div>
</form>	

</body>

</html>