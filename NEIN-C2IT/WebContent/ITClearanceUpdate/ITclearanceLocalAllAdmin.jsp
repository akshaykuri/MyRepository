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
<%@ include file="../banner.jsp" %>
<%@ include file="../../../Session/NormalAdminSessionInSide2.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<title>Check List</title>
	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/Calendar.js"></script>
	<style type="text/css">
    @media print {
    #printbtn {
        display :  none;
    }
    }
</style>
<script type="text/javascript">
function validate()
	{
	//alert("Here...");
	var d1 = document.form.sentToName;
	if (d1.value=="")
	   {
	   alert("Please Enter sent to HO HR Admin name !");
	   d1.focus();
	   return false;
	   }
	else
	   return true;
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
 
</head>
<body onload="checkForm()">
<form  name="form" method="post"  action="ITClearnceReprtSendBack.jsp">
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
email_id = (String) session.getAttribute("Nmail");
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
String it1a=null,it2b=null,it3c=null,it4d=null,it5e=null,it6f=null,it7g=null,it8h=null,it9i=null,it10j=null,it11k=null,it12l=null,it13m=null,it14n=null,it15o=null,it16p=null,it17q=null,it18r=null,it19s=null,a_compmobile_no=null,r_compmobile_no=null;
String a_nexas=null,r_nexas=null,it10jnexas=null,airLin="",rairLin="",itrairLin="";
String sophos = null, rsophos = null;
String forti = null, rforti = null;
String a_shared_card=null,r_shared_card=null,a_internet=null,r_internet=null,a_gsnet=null,r_gsnet=null,a_internal=null,r_internal=null,a_dsc=null,r_dsc=null,a_glow=null,r_glow=null,vpn=null,rvpn=null;
String rduty="",rkeyJob="",rnoticePeriod="";
//String req = request.getParameter("req2");

String req = request.getParameter("formNo");
System.out.println("wat is the getting value 2 ***************************************************:"+req); 
cn100 = con.getConnection2();
st100=cn100.createStatement();
//rs100 = st100.executeQuery("select * from form1_it_clearance WHERE form1_no='"+req+"'");
rs100 = st100.executeQuery("select form1_no,f_date,idextend,branch,depart,full_name,emp_code,designation,r_officer,DATE_FORMAT(d_resignation,'%d/%m/%Y') as d_resignation_format,DATE_FORMAT(d_reliving,'%d/%m/%Y') as d_reliving_format ,a_model,a_data_card,a_email,a_newins,a_domain,a_mobile_model,a_mobile_no,a_access_card,a_drive,a_other_asset,a_remarks,notServed,grade,requestOption,r_model,r_data_card,r_email,r_newins,r_domain,r_mobile_model,r_mobile_no,r_access_card,r_drive,r_other_asset,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,a_document_hr,r_document_hr,a_co_car_hr,r_co_car_hr,a_calculator_hr,r_calculator_hr,a_conn_mobile_hr,r_conn_mobile_hr,a_mobile_handset_hr,r_mobile_handset_hr,a_id_card_hr,r_id_card_hr,a_work_key_hr,r_work_key_hr,a_any_other_hr,r_any_other_hr,a_leave_card_hr,r_leave_card_hr,a_resignation_letter_hr,r_resignation_letter_hr,a_identity_card_hr,r_identity_card_hr,a_model_info,r_model_info,a_document_ac,r_document_ac,DATE_FORMAT(d_new_relieved_request,'%d/%m/%Y') as d_new_relieved_request_format,DATE_FORMAT(d_new_reliving_co,'%d/%m/%Y') as d_new_reliving_co_format,it1a,it2b,it3c,it4d,it5e,it6f,it7g,it8h,it9i,it10j,it10jnexas,a_nexas,r_nexas,rduty,rkeyJob,rnoticePeriod,airLin,rairLin,itrairLin,it11k,it12l,it13m,it14n,it15o,it16p,it17q,it18r,it19s,vpn,rvpn,a_compmobile_no,r_compmobile_no,a_shared_card,r_shared_card,a_internet,r_internet,a_gsnet,r_gsnet,a_internal,r_internal,a_dsc,r_dsc,a_nexglow,r_nexglow,a_sophos,r_sophos,a_forti,r_forti from form1_it_clearance WHERE form1_no='"+req+"'");
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
	 d_resignation = rs100.getString("d_resignation_format");
	 d_reliving = rs100.getString("d_reliving_format");
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
	 
	 
	 a_nexas = rs100.getString("a_nexas");
	 r_nexas = rs100.getString("r_nexas");
	 it10jnexas = rs100.getString("it10jnexas");
	 

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
     
     rduty = rs100.getString("rduty");
     rkeyJob= rs100.getString("rkeyJob");
     rnoticePeriod=rs100.getString("rnoticePeriod");
     
     airLin = rs100.getString("airLin");
     rairLin= rs100.getString("rairLin");
     forti = rs100.getString("a_forti");
     rforti= rs100.getString("r_forti");
     sophos = rs100.getString("a_sophos");
     rsophos= rs100.getString("r_sophos");
     itrairLin=rs100.getString("itrairLin")==null?"":rs100.getString("itrairLin");
	 
}
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>

<br /><br />
<center>
 <table width="900" border="1" align="center" style="border-color: white;">
<tr>
<td align="center" style="border-color: white;">
<img src="../images/nip.gif" height="25" width="25" /> 
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
<table width="900"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;"><center><font size="3">
		<b><label>
		Outstanding Dues & Handover Report</label>
		</b></font></center> 
		
		
		
		 </td></tr>
</table>
<table width="900"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
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
		
	<table width="885">

	<tr>
	<td align="center" bgcolor="grey" colspan="4"><b>
	<%=form1_no%></b>
	</td>
	</tr>
<tr>
<td  style="text-align: right;">Employee Code :</td>
<td style="text-align:left;"><input type="text" name="emp_code" id="ecode" value="<%=emp_code%>" readonly="readonly"/></td>
<td  style="text-align: right;">Full Name :</td>
<td style="text-align:left;"><input type="text" name="full_name" id="fname" value="<%=full_name%>" readonly="readonly"/></td>
</tr>
<tr>
&nbsp;&nbsp;&nbsp; <td  style="text-align: right;width: 215px; "  >Branch :</td>
<td style="text-align:left;"><input name="branch" value="<%=branch%>" readonly="readonly"/> 

<input type="hidden" name="formno" value="<%=form1_no%>"/> 

</td>
<td  style="text-align: right;width: 175px;">Department :</td>
<!-- <td style="text-align:left;"><select id="dept"><option value="">Select</option><option>Testing</option></select></td> -->
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
<br>
<label><center> <font color="black"><u><b>ONLY FOR HR DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="885" align="center">
<tr>

<td class="it1" align="center">1  </td>


<td class="it2" style="text-align: right;width:23%;"> All document taken overby:</td>
<td class="it2"  style="text-align:left;width:25%;"> <%=a_document_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_document_hr%></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>


<td class="it2" style="text-align: right;width:23%;">Company Car :</td>
<td class="it2" style="text-align:left;width:25%;"> <%=a_co_car_hr%></td>


<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_co_car_hr%></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>



<td class="it2" style="text-align: right;width:23%;">Calculators :</td>
<td class="it2" style="text-align:left;width:25%;"> <%=a_calculator_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_calculator_hr%></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>



<td class="it2" style="text-align: right;width:23%;"> Connection surrendered :</td>
<td class="it2" style="text-align:left;width:25%;"> <%=a_conn_mobile_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_conn_mobile_hr%></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>



<td class="it2" style="text-align: right;width:23%;">Mobile handset :</td>
<td class="it2" style="text-align:left;width:25%;"><%=a_mobile_handset_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_mobile_handset_hr%></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>



<td class="it2" style="text-align: right;width:23%;">ID card :</td>
<td class="it2" style="text-align:left;width:25%;"><%=a_id_card_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_id_card_hr%></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>



<td class="it2" style="text-align: right;width:23%;">Workstation keys :</td>
<td class="it2" style="text-align:left;width:25%;"> <%=a_work_key_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_work_key_hr%></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>



<td class="it2" style="text-align: right;width:23%;">Any Other:</td>
<td class="it2" style="text-align:left;width:25%;"> <%=a_any_other_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_any_other_hr%></td>
</tr>


<tr>
<td class="it1" align="center">9  </td>



<td class="it2" style="text-align: right;width:23%;"> Leave card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"> <%=a_leave_card_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_leave_card_hr%></td>
</tr>


<tr>
<td class="it1" align="center">10  </td>



<td class="it2" style="text-align: right;width:23%;">Resignation letter enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"><%=a_resignation_letter_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=r_resignation_letter_hr%></td>
</tr>


<tr>
<td class="it1" align="center">11  </td>



<td class="it2" style="text-align: right;width:23%;">Identity card enclosed:</td>
<td class="it2" style="text-align:left;width:25%;"><%=a_identity_card_hr%></td>

<td class="it2">Remarks :</td>
<td class="it2"   ><%=a_document_hr%></td>
</tr>

</table>
<br>

<label><center> <font color="black"><u><b>ONLY FOR A / C DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="885" align="center">
<tr>

<td class="it1" align="center" style="width:3%;"> 1   </td>


<td class="it2" style="text-align: right;width:24%;"> Accounts - Advance / Imprest Balance:</td>
<td class="it2"  style="text-align:left;width:25%;"><%=a_document_ac%></td>

<td width="8%">Remarks :</td>
<td class="it2"   ><%=r_document_ac%></td>
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
<table id="table3" width="885">
<tr>
<td bgcolor="grey">Sl</td>
<td bgcolor="grey" colspan="2" align="center" width="33%">ITEM NAMES</td>
<td bgcolor="grey" colspan="2" align="center" width="34%">INITIATOR REMARKS</td>
<td bgcolor="grey" colspan="2" align="center" width="33%">IT MANAGER REMARKS</td>


</tr>
<tr>
<td class="it1" align="center">1  </td>
<td style="text-align: right;" width="17%"> Laptop/Desktop Model :</td>
<td width="16%"><%=a_model%></td>
<td width="8%">Remarks :</td>
<td width="26%"><%=r_model%></td>
<td width="8%">Remarks :</td>
<td width="25%"  ><%=it1a%></td>
</tr>

<tr>
<td class="it1" align="center">1a  </td>
<td style="text-align: right;" width="17%"> Password info passed on to :</td>
<td width="16%"><%=a_model_info%></td>
<td width="8%">Remarks :</td>
<td width="26%"><%=r_model_info%></td>
<td width="8%">Remarks :</td>
<td width="25%"  ><%=it18r%></td>
</tr>

<tr>
<td class="it1" align="center">2  </td>
<td class="it2" style="text-align: right;" width="17%">Data Card :</td>
<td width="16%"><%=a_data_card%></td>
<td width="8%">Remarks :</td>
<td width="26%"><%=r_data_card%></td>
<td width="8%">Remarks :</td>
<td width="25%"  ><%=it2b%></td>
</tr>

<tr>
<td class="it1" align="center">3  </td>
<td class="it2" style="text-align: right;width:15%;">Email Id :</td>
<td ><%=a_email%></td>
<td class="it2">Remarks :</td>
<td  ><%=r_email%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it3c%></td>
</tr>

<tr>
<td class="it1" align="center">3a  </td>
<td class="it2" style="text-align: right;width:15%;">Mobile Phone Model :</td>
<td > <%=a_mobile_model%></td>
<td class="it2">Remarks :</td>
<td><%=r_mobile_model%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it6f%></td>
</tr>

<tr>
<td class="it1" align="center">3b  </td>
<td class="it2" style="text-align: right;width:15%;">Mobile No (Intune) :</td>
<td ><%=a_mobile_no%></td>
<td class="it2">Remarks :</td>
<td ><%=r_mobile_no%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it7g%></td>
</tr>

<tr>
<td class="it1" align="center">3c  </td>
<td class="it2" style="text-align: right;width:15%;">Mobile No (Company Provided SIM) :</td>
<td ><%=a_compmobile_no%></td>
<td class="it2">Remarks :</td>
<td ><%=r_compmobile_no%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it11k%></td>
</tr>

<tr>
<td class="it1" align="center">4  </td>
<td class="it2" style="text-align: right;width:15%;">Domain User :</td>
<td > <%=a_domain%></td>
<td class="it2">Remarks :</td>
<td ><%=r_domain%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it5e%></td>
</tr>

<tr>
<td class="it1" align="center">5  </td>
<td class="it2" style="text-align: right;width:15%;">Access Card :</td>
<td ><%=a_access_card%></td>
<td class="it2">Remarks :</td>
<td ><%=r_access_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it8h%></td>
</tr>

<tr>
<td class="it1" align="center">6  </td>
<td class="it2" style="text-align: right;width:15%;">Shared Folder :</td>
<td > <%=a_shared_card%></td>
<td class="it2">Remarks :</td>
<td ><%=r_shared_card%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it12l%></td>
</tr>

<tr>
<td class="it1" align="center">7  </td>
<td class="it2" style="text-align: right;width:15%;">Internet/FTP Access :</td>
<td ><%=a_internet%></td>
<td class="it2">Remarks :</td>
<td ><%=r_internet%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it13m%></td>
</tr>

<tr>
<td class="it1" align="center">8  </td>
<td class="it2" style="text-align: right;width:15%;">Newins Id :</td>
<td ><%=a_newins%></td>
<td class="it2">Remarks :</td>
<td ><%=r_newins%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it4d%></td>
</tr>

<tr>
<td class="it1" align="center">9  </td>
<td class="it2" style="text-align: right;width:15%;">NExAS ID :</td>
<td ><%=a_nexas%></td>
<td class="it2">Remarks :</td>
<td><%=r_nexas%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it10jnexas%></td>
</tr>

<tr>
<td class="it1" align="center">10  </td>
<td class="it2" style="text-align: right;width:15%;">GS-NET :</td>
<td > <%=a_gsnet%></td>
<td class="it2">Remarks :</td>
<td ><%=r_gsnet%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it14n%></td>
</tr>

<tr>
<td class="it1" align="center">11  </td>
<td class="it2" style="text-align: right;width:15%;">Internal Application :</td>
<td ><%=a_internal%></td>
<td class="it2">Remarks :</td>
<td ><%=r_internal%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it15o%></td>
</tr>

<tr>
<td class="it1" align="center">12  </td>
<td class="it2" style="text-align: right;width:15%;">DSC Dongle Received :</td>
<td ><%=a_dsc%></td>
<td class="it2">Remarks :</td>
<td ><%=r_dsc%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it16p%></td>
</tr>

<tr>
<td class="it1" align="center">13  </td>
<td class="it2" style="text-align: right;width:15%;">VPN :</td>
<td ><%=vpn%></td>
<td class="it2">Remarks :</td>
<td><%=rvpn%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it17q%></td>
</tr>

<tr>
<td class="it1" align="center">14  </td>
<td class="it2" style="text-align: right;width:15%;">Hard Disk/Pen Drive :</td>
<td ><%=a_drive%></td>
<td class="it2">Remarks :</td>
<td><%=r_drive%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it9i%></td>
</tr>

<tr>
<td class="it1" align="center">15  </td>
<td class="it2" style="text-align: right;width:15%;">Any Other Asset :</td>
<td ><%=a_other_asset%></td>
<td class="it2">Remarks :</td>
<td><%=r_other_asset%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it10j%></td>
</tr>

<tr>
<td class="it1" align="center">16  </td>
<td class="it2" style="text-align: right;width:15%;">NEx-GLOW :</td>
<td ><%=a_glow%></td>
<td class="it2">Remarks :</td>
<td><%=r_glow%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=it19s%></td>
</tr>

<tr>
<td class="it1" align="center">17  </td>
<td class="it2" style="text-align: right;width:15%;">Airline / Liner Login :</td>
<td ><%=airLin%></td>
<td class="it2">Remarks :</td>
<td><%=rairLin%></td>
<td class="it2">Remarks :</td>
<td class="it2"   ><%=itrairLin%></td>
</tr>

<tr>
<td class="it1" align="center">18  </td>
<td class="it2" style="text-align: right;width:15%;">Sophos & Manage Engine Access :</td>
<td ><%=sophos%></td>
<td class="it2">Remarks :</td>
<td><%=rsophos%></td>
<td class="it2">Remarks :</td>
<td class="it2"><%=rsophos%></td>
</tr>

<tr>
<td class="it1" align="center">19  </td>
<td class="it2" style="text-align: right;width:15%;">Fortinet VPN Access :</td>
<td ><%=forti%></td>
<td class="it2">Remarks :</td>
<td><%=rforti%></td>
<td class="it2">Remarks :</td>
<td class="it2"><%=rforti%></td>
</tr>

</table>



<br>

<label><center> <font color="black"><u><b>ONLY FOR REPORTING OFFICER</b></u></font></center> </label> 
<br>
<table id="table4" width="885">
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
<table id="tableData" name="tableData" width="885" border="1"  align="center" bgcolor="#F0F0F0" bordercolor="grey">
       <tr>
		<td height="20" bgcolor="grey" width="120" align=center><font size="2" color="black"><b>NAME</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DESIGNATION</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>STATUS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>REMARKS</b></font></td>
		<td bgcolor="grey" width="120" align=center><font size="2" color="black"><b>DATE</b></font></td>
		
	  </tr>
	  <%
	  cn1 = con.getConnection2();
	  st1=cn1.createStatement();
	  rs1 = st1.executeQuery("select form1_no,desg,emp,status,remarks,f_date,mail from form1_it_clearance_item WHERE form1_no='"+req+"' AND desg <> 'none' ORDER BY id ASC"); 
	  while(rs1.next())
	  {
		  String form1_noD= rs1.getString("form1_no");
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
		
	
	  </tr>
	  <%} %>
</table>

</br>
                                                                
   </td>
		
	</tr>
</table> 





	
 <table id="printbtn"  width="50%" style="margin-left: auto;margin-right: auto;" >
 <tr>
      <td colspan="3">
       <b>Send To HR Admin-HO:</b>
	    <input type="text" value="akshay.kuri@nipponexpress.com" name="sentToName" size="40"/> 
	 </td>
 </tr>
 <tr align="center">
     <td style="font-size:1">&nbsp;&nbsp;
         <a  href="javascript:history.back()">BACK</a>
      </td>
      <td>
          <div id="formsubmitbutton">
          <input type="submit" style="background-color:#2f4377;font-weight:bold;color:black;" value=" SEND" name=button1 onclick="return( validate());" />
          </div>
          <div id="buttonreplacement" style="margin-left:30px; display:none;">
	      <img src="http://www.willmaster.com/images/preload.gif" alt="loading..." />
	      </div> 
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
 	</tr>
 
</table>
</center>
	<br /><br /><br />
	
</div>

</form>	

</body>

</html>