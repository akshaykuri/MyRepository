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
<%@page import="CON2.ConnectionLMS" %> 
<%@page import="CON2.CurrentTime" %>
<%@ include file="../../banner.jsp" %>
<%@ include file="../../../Session/NormalAdminSessionInSide2.jsp"%>
<jsp:useBean id = "con" class="CON2.Connection2" />
<jsp:useBean id = "conhrms" class="CON2.ConnectionLMS" />
<jsp:useBean id = "currentTime" class="CON2.CurrentTime" />
<jsp:useBean id ="c2ITUtil1" class="CON2.C2ITUtils" />
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
  	<link rel='stylesheet' type='text/css' href='../css/style2.css' />
	<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../css/Calender.css" title="style" />
    <script language="javascript"   type="text/javascript" src="../js/onSubmitWait.js"></script>
	<script language="javascript"   type="text/javascript" src="../js/jquery.1.11.1.min.js" ></script>
	<script language="javascript"   type="text/javascript" src="../js/cal.js"></script>
	
	<link rel="stylesheet" href="../css/dynamicTableDesign.css"> <!-- dynamic table design -->
    <script language="javascript"   type="text/javascript" src="../js/jquery-1.5.1.min.js"></script> <!-- this is for dynamic table -->
    <script language="javascript"   type="text/javascript" src="../js/jquery-1.12.4.js"></script> <!-- this is for dynamic table -->
 
 <style type="text/css">
     @media print {
    #printbtn {
        display :  none;
     }
    }
</style>

<style>
.dynatable .prototype {
	display:none;
	} 
	</style>

<%int p =0;%>
 <script>
 		var id =0;
		$(document).ready(function() {
			// Add button functionality
			 
	        //approverDesg,approverName,appStatus,appRemarks,appDate
			$("table.dynatable button.add").click(function() {
				id++;
				//alert("ID :"+id);
				var master = $(this).parents("table.dynatable");
			  // Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "");
				prot.find(".id").attr("value",id);
				//alert(id);
				prot.find(".approverDesg").attr("id","approverDesg"+id);
				prot.find(".approverName").attr("id","approverName"+id);
				prot.find(".appStatus").attr("id","appStatus"+id);
				prot.find(".appRemarks").attr("id","appRemarks"+id);
				prot.find(".appDate").attr("id","appDate"+id);
				master.find("tbody").append(prot);
		});
			// Remove button functionality
			$.noConflict();   // here i am using two jquery one for dynamic table and one for calander so remoce button conflicting jquery so use noconflict method for resolve this..
			$("table.dynatable button.remove").live("click", function() {//alert(id);
				$(this).parents("tr").remove();
				id--;
				
			});
		});
	</script>











<script type="text/javascript">

function clearField(idddd)
	{
	//alert("id ::"+idddd);
	document.getElementById(idddd).value="";
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
   }
	
function validatefield()
    {
	var  p;
	//alert(id);
	if(id!=0)
	     {
		 
	     for(p = 1; p <=id; p++)
	       {
		   var pe = 'approverDesg'+p.toString();
		   var ac = 'approverName'+p.toString();
		   var crt = 'appStatus'+p.toString();
		   var crl = 'appRemarks'+p.toString();
		   var noOfAp = 'appDate'+p.toString();
		  
		   var pe1 = document.getElementById(pe).value;
		   var ac1=document.getElementById(ac).value;
		   var crt1 = document.getElementById(crt).value;
		   var crl1=document.getElementById(crl).value;
		   var noOfAp1=document.getElementById(noOfAp).value;
		   
		   
		   
	       if(pe1=="")
		    	 {
		    	 alert("Please Select Approver Designation...");
		    	 return false;
		    	 }
	       else if(ac1=="")
	    	     {
	    	     alert("Please Enter Approver Name...");
	    	     return false;
	    	     }
	       else if(crt1=="")
	    	     {
	    	     alert("Please Select Approver Status..");
	    	     return false;
	    	     }
	       else if(crl1=="")
	    	     {
	    	     alert("Please Enter approver remarks...");
	    	     return false;
	    	     }
	       else if(noOfAp1=="")
  	             {
  	             alert("Please Select Approved Date...");
  	             return false;
  	             }
	       }
		}
 }
	
</script>

<script>
function chkSpace(){
	try{
		
//	it dept rems
	document.getElementById("Iremarks1").value	=	document.getElementById("Iremarks1").value.trim();
	document.getElementById("Mremarks1").value	=	document.getElementById("Mremarks1").value.trim();
	document.getElementById("Iremarks20").value	=	document.getElementById("Iremarks20").value.trim();
	document.getElementById("Mremarks20").value	=	document.getElementById("Mremarks20").value.trim();
	document.getElementById("Iremarks2").value	=	document.getElementById("Iremarks2").value.trim();
	document.getElementById("Mremarks2").value	=	document.getElementById("Mremarks2").value.trim();
	document.getElementById("Iremarks3").value	=	document.getElementById("Iremarks3").value.trim();
	document.getElementById("Mremarks3").value	=	document.getElementById("Mremarks3").value.trim();
	document.getElementById("Iremarks6").value	=	document.getElementById("Iremarks6").value.trim();
	document.getElementById("Mremarks6").value	=	document.getElementById("Mremarks6").value.trim();
	document.getElementById("Iremarks7").value	=	document.getElementById("Iremarks7").value.trim();
	document.getElementById("Mremarks7").value	=	document.getElementById("Mremarks7").value.trim();
	document.getElementById("Iremarks12").value	=	document.getElementById("Iremarks12").value.trim();
	document.getElementById("Mremarks12").value	=	document.getElementById("Mremarks12").value.trim();
	document.getElementById("Iremarks5").value	=	document.getElementById("Iremarks5").value.trim();
	document.getElementById("Mremarks5").value	=	document.getElementById("Mremarks5").value.trim();
	document.getElementById("Iremarks8").value	=	document.getElementById("Iremarks8").value.trim();
	document.getElementById("Mremarks8").value	=	document.getElementById("Mremarks8").value.trim();
	document.getElementById("Iremarks13").value	=	document.getElementById("Iremarks13").value.trim();
	document.getElementById("Mremarks13").value	=	document.getElementById("Mremarks13").value.trim();
	document.getElementById("Iremarks14").value	=	document.getElementById("Iremarks14").value.trim();
	document.getElementById("Mremarks14").value	=	document.getElementById("Mremarks14").value.trim();
	document.getElementById("Iremarks4").value	=	document.getElementById("Iremarks4").value.trim();
	document.getElementById("Mremarks4").value	=	document.getElementById("Mremarks4").value.trim();
	document.getElementById("Iremarks10").value	=	document.getElementById("Iremarks10").value.trim();
	document.getElementById("Mremarks10").value	=	document.getElementById("Mremarks10").value.trim();
	document.getElementById("Iremarks15").value	=	document.getElementById("Iremarks15").value.trim();
	document.getElementById("Mremarks15").value	=	document.getElementById("Mremarks15").value.trim();
	document.getElementById("Iremarks16").value	=	document.getElementById("Iremarks16").value.trim();
	document.getElementById("Mremarks16").value	=	document.getElementById("Mremarks16").value.trim();
	document.getElementById("Iremarks17").value	=	document.getElementById("Iremarks17").value.trim();
	document.getElementById("Mremarks17").value	=	document.getElementById("Mremarks17").value.trim();
	document.getElementById("Iremarks18").value	=	document.getElementById("Iremarks18").value.trim();
	document.getElementById("Mremarks18").value	=	document.getElementById("Mremarks18").value.trim();
	document.getElementById("Iremarks9").value	=	document.getElementById("Iremarks9").value.trim();
	document.getElementById("Mremarks9").value	=	document.getElementById("Mremarks9").value.trim();
	document.getElementById("Iremarks11").value	=	document.getElementById("Iremarks11").value.trim();
	document.getElementById("Mremarks11").value	=	document.getElementById("Mremarks11").value.trim();
	document.getElementById("Iremarks19").value	=	document.getElementById("Iremarks19").value.trim();
	document.getElementById("Mremarks19").value	=	document.getElementById("Mremarks19").value.trim();
	document.getElementById("rairLin").value	=	document.getElementById("rairLin").value.trim();
	document.getElementById("itrairLin").value	=	document.getElementById("itrairLin").value.trim();
	document.getElementById("rsophos").value	=	document.getElementById("rsophos").value.trim();
	document.getElementById("itrsophos").value	=	document.getElementById("itrsophos").value.trim();
	document.getElementById("rforti").value	=	document.getElementById("rforti").value.trim();
	document.getElementById("itrforti").value	=	document.getElementById("itrforti").value.trim();
//approver remarks
	var idr = document.form.idRem;
	for(var z=0;z<idr.length;z++){
		document.getElementById("aRemarks"+idr[z].value).value=(document.getElementById("aRemarks"+idr[z].value).value).trim();
	}
	}catch(err){
		alert(err);
	}
}
</script>

</head>
<body onload="chkSpace();checkForm();">
<form  name="form" method="post"  action="ITclearanceFormUpdateBack.jsp" onsubmit="return validatefield();">
<%!String Name=null,desg=null,city=null,b_no=null,email_id=null,Initiator=null,admin=null;
Connection cn1 = null,cn2=null,cn3=null,cn4=null,cn100=null,cnhrms=null;
Statement st1= null,st2=null,st3=null,st4=null,st100=null,sthrms=null; 
ResultSet rs1 = null,rs2=null,rs3=null,rs4=null,rs100=null,rshrms=null;
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
String it1a=null,it2b=null,it3c=null,it4d=null,it5e=null,it6f=null,it7g=null,it8h=null,it9i=null,it10j=null,it11k=null,it12l=null,it13m=null,it14n=null,it15o=null,it16p=null,it17q=null,it18r=null,it19s=null;
String a_nexas=null,r_nexas=null,it10jnexas=null,rairLin=null,itrairLin=null;
String sophos=null,rsophos=null,itrsophos=null;
String forti=null,rforti=null,itrforti=null;
String a_shared_card=null,r_shared_card=null,a_internet=null,r_internet=null,a_gsnet=null,r_gsnet=null,a_internal=null,r_internal=null,a_dsc=null,r_dsc=null,a_glow=null,r_glow=null,vpn=null,rvpn=null,a_compmobile_no=null,r_compmobile_no=null;

String req = request.getParameter("formNo");
System.out.println("wat is the getting value 2 ***************************************************:"+req); 
cn100 = con.getConnection2();
st100=cn100.createStatement();
rs100 = st100.executeQuery("select form1_no,f_date,idextend,branch,depart,full_name,emp_code,designation,r_officer,DATE_FORMAT(d_resignation,'%d/%m/%Y') as d_resignation_format,DATE_FORMAT(d_reliving,'%d/%m/%Y') as d_reliving_format ,a_model,a_data_card,a_email,a_newins,a_domain,a_mobile_model,a_mobile_no,a_access_card,a_drive,a_other_asset,a_remarks,notServed,grade,requestOption,r_model,r_data_card,r_email,r_newins,r_domain,r_mobile_model,r_mobile_no,r_access_card,r_drive,r_other_asset,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,a_document_hr,r_document_hr,a_co_car_hr,r_co_car_hr,a_calculator_hr,r_calculator_hr,a_conn_mobile_hr,r_conn_mobile_hr,a_mobile_handset_hr,r_mobile_handset_hr,a_id_card_hr,r_id_card_hr,a_work_key_hr,r_work_key_hr,a_any_other_hr,r_any_other_hr,a_leave_card_hr,r_leave_card_hr,a_resignation_letter_hr,r_resignation_letter_hr,a_identity_card_hr,r_identity_card_hr,a_model_info,r_model_info,a_document_ac,r_document_ac,DATE_FORMAT(d_new_relieved_request,'%d/%m/%Y') as d_new_relieved_request_format,DATE_FORMAT(d_new_reliving_co,'%d/%m/%Y') as d_new_reliving_co_format,it1a,it2b,it3c,it4d,it5e,it6f,it7g,it8h,it9i,it10j,it10jnexas,a_nexas,r_nexas,rairLin,itrairLin,it11k,it12l,it13m,it14n,it15o,it16p,it17q,it18r,it19s,vpn,rvpn,a_compmobile_no,r_compmobile_no,a_shared_card,r_shared_card,a_internet,r_internet,a_gsnet,r_gsnet,a_internal,r_internal,a_dsc,r_dsc,a_nexglow,r_nexglow,a_sophos,r_sophos,a_forti,r_forti,itrsophos,itrforti from form1_it_clearance WHERE form1_no='"+req+"'");
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
     
     rairLin= rs100.getString("rairLin");
     itrairLin= rs100.getString("itrairLin")==null?"":rs100.getString("itrairLin");

     sophos= rs100.getString("a_sophos")==null?"":rs100.getString("a_sophos");
     rsophos= rs100.getString("r_sophos")==null?"":rs100.getString("r_sophos");
     itrsophos= rs100.getString("itrsophos")==null?"":rs100.getString("itrsophos");
     forti= rs100.getString("a_forti")==null?"":rs100.getString("a_forti");
     rforti= rs100.getString("r_forti")==null?"":rs100.getString("r_forti");
     itrforti= rs100.getString("itrforti")==null?"":rs100.getString("itrforti");
     }

System.out.println(rairLin);
%>
<%java.text.DateFormat po_date = new SimpleDateFormat("dd/MM/yyyy"); %>
<br /><br />
<center>
<table width="1000" border="1" align="center" style="border-color: white;">
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
<table width="1000"  cellspacing="0" cellpadding="0" bgcolor="grey" align="center">
	<tr>
		<td style="height: 40px;"><center><font size="3">
		<b><label>
		IT CLEARANCE CHECK SHEET FOR RESIGNED EMPLOYEE</label>
		</b></font></center>  </td></tr>
</table>
<table width="1000"  cellspacing="0" cellpadding="0" bgcolor="lightgrey">
	<tr>
		<td>
<%
String b_no=null;
b_no = (String) session.getAttribute("b_no");
System.out.println("b_no :"+b_no);
%>

		
<table width="985">
  <tr>
	<td align="center" bgcolor="grey" colspan="4"><b>
	<%=form1_no%></b>
	<input type="hidden"  name="formNo" value="<%=form1_no%>" readonly="readonly"/>
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
	<td style="text-align:left;"><input name="branch" value="<%=branch%>" readonly="readonly"/> </td>
	<td  style="text-align: right;width: 175px;">Department :</td>
	<td style="text-align:left;"><input name="depart" value="<%=depart%>" readonly="readonly"/></td> 
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
<table id="table3a" align="center" width="985" align="center">
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
   <td class="it2"   ><input type="text" name="r_identity_card_hr" id="rem5" size="40" maxlength="44" value="<%=a_document_hr%>" readonly="readonly"  onfocus="myFunctionHR();"/></td>
</tr>
</table>
<br>
<label><center> <font color="black"><u><b>ONLY FOR A / C DEPT. </b></u></font></center> </label> 
<br>
<table id="table3a" align="center" width="985" align="center">
<tr>
  <td class="it1" align="center" style="width:3%;"> 1   </td>
  <td class="it2" style="text-align: right;width:24%;"> Accounts - Advance / Imprest Balance:</td>
  <td class="it2"  style="text-align:left;width:25%;"><input type="text" name="acValue" id="acValue" size="40"  value="<%=a_document_ac%>" /></td>
  <td width="8%">Remarks :</td>
  <td class="it2"   ><input type="text" name="acRemarks" id="acRemarks" size="40"  value="<%=r_document_ac%>" /></td>
</tr>
</table>
<br>
<label><center> <font color="black"><u><b>IT ASSET PROVIDED</b></u></font></center> </label> 
<br>
<table id="table3" width="985">
<tr>
	<td bgcolor="grey">Sl No.</td>
	<td bgcolor="grey" colspan="2" align="center" width="32%">ITEM NAMES</td>
	<td bgcolor="grey" colspan="2" align="center" width="34%">INITIATOR REMARKS</td>
	<td bgcolor="grey" colspan="2" align="center" width="34%">IT MANAGER REMARKS</td>
</tr>
<tr>
   <td class="it1" align="center">1  </td>
   <td style="text-align: right;" width="17%"> Laptop/Desktop Model :</td>
   <td width="16%"><%=a_model%></td>
   <td width="8%">Remarks :</td>
   <td width="26%">
   <textarea  id="Iremarks1" name="Iremarks1" rows="4" cols="30" style="text-align:left;">
		        <%=r_model%>
    </textarea>
    </td>
    <td width="8%">Remarks :</td>
    <td width="25%"  >
    <textarea  id="Mremarks1" name="Mremarks1" rows="4" cols="30" style="text-align:left;">
		        <%=it1a%>
	</textarea>
    </td>
</tr>
<tr>
   <td class="it1" align="center">1a  </td>
   <td style="text-align: right;" width="17%"> Password Info passed on to :</td>
   <td width="16%"><%=a_model_info%></td>
   <td width="8%">Remarks :</td>
   <td width="26%">
   <textarea  id="Iremarks20" name="Iremarks20" rows="4" cols="30" style="text-align:left;">
		        <%=r_model_info%>
    </textarea>
    </td>
    <td width="8%">Remarks :</td>
    <td width="25%"  >
    <textarea  id="Mremarks20" name="Mremarks20" rows="4" cols="30" style="text-align:left;">
		        <%=it18r%>
	</textarea>
    </td>
</tr>
<tr>
   <td class="it1" align="center">2  </td>
   <td class="it2" style="text-align: right;" width="17%">Data Card :</td>
   <td width="16%"><%=a_data_card%></td>
   <td width="8%">Remarks :</td>
   <td width="26%">
   <textarea  id="Iremarks2" name="Iremarks2" rows="4" cols="30">
		       <%=r_data_card%>
   </textarea>
   </td>
   <td width="8%">Remarks :</td>
   <td width="25%"  >
   <textarea  id="Mremarks2" name="Mremarks2" rows="4" cols="30">
		       <%=it2b%>
   </textarea>
   </td>
</tr>
<tr>
   <td class="it1" align="center">3  </td>
   <td class="it2" style="text-align: right;width:15%;">Email Id :</td>
   <td ><%=a_email%></td>
   <td class="it2">Remarks :</td>
   <td> 
   <textarea  id="Iremarks3" name="Iremarks3" rows="4" cols="30">
		      <%=r_email%>
   </textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks3" name="Mremarks3" rows="4" cols="30">
		       <%=it3c%>
   </textarea>
   </td>
</tr>

<tr>
   <td class="it1" align="center">3a  </td>
   <td class="it2" style="text-align: right;width:15%;">Mobile Phone Model :</td>
   <td > <%=a_mobile_model%></td>
   <td class="it2">Remarks :</td>
   <td>
    <textarea  id="Iremarks6" name="Iremarks6" rows="4" cols="30">
		     <%=r_mobile_model%>
	</textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks6" name="Mremarks6" rows="4" cols="30">
		     <%=it6f%>
   </textarea>
   </td>
</tr>

<tr>
   <td class="it1" align="center">3b  </td>
   <td class="it2" style="text-align: right;width:15%;">Mobile No (Intune) :</td>
   <td ><%=a_mobile_no%></td>
   <td class="it2">Remarks :</td>
   <td >
   <textarea  id="Iremarks7" name="Iremarks7" rows="4" cols="30">
		     <%=r_mobile_no%>
   </textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks7" name="Mremarks7" rows="4" cols="30">
		    <%=it7g%>
   </textarea>
   </td>
</tr>

<tr>
   <td class="it1" align="center">3c  </td>
   <td class="it2" style="text-align: right;width:15%;">Mobile No (Company Provided SIM) :</td>
   <td ><%=a_compmobile_no%></td>
   <td class="it2">Remarks :</td>
   <td >
   <textarea  id="Iremarks12" name="Iremarks12" rows="4" cols="30">
		     <%=r_compmobile_no%>
   </textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks12" name="Mremarks12" rows="4" cols="30">
		    <%=it11k%>
   </textarea>
   </td>
</tr>

<tr>
  <td class="it1" align="center">4  </td>
  <td class="it2" style="text-align: right;width:15%;">Domain User :</td>
  <td > <%=a_domain%></td>
  <td class="it2">Remarks :</td>
  <td >
  <textarea  id="Iremarks5" name="Iremarks5" rows="4" cols="30">
		      <%=r_domain%>
  </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   > 
  <textarea  id="Mremarks5" name="Mremarks5" rows="4" cols="30">
		      <%=it5e%>
  </textarea>
  </td>
</tr>

<tr>
   <td class="it1" align="center">5  </td>
   <td class="it2" style="text-align: right;width:15%;">Access Card :</td>
   <td ><%=a_access_card%></td>
   <td class="it2">Remarks :</td>
   <td >
   <textarea  id="Iremarks8" name="Iremarks8" rows="4" cols="30">
		    <%=r_access_card%>
   </textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks8" name="Mremarks8" rows="4" cols="30">
		   <%=it8h%>
   </textarea>
   </td>
</tr>

<tr>
   <td class="it1" align="center">6  </td>
   <td class="it2" style="text-align: right;width:15%;">Shared Folder :</td>
   <td ><%=a_shared_card%></td>
   <td class="it2">Remarks :</td>
   <td >
   <textarea  id="Iremarks13" name="Iremarks13" rows="4" cols="30">
		    <%=r_shared_card%>
   </textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks13" name="Mremarks13" rows="4" cols="30">
		   <%=it12l%>
   </textarea>
   </td>
</tr>

<tr>
   <td class="it1" align="center">7  </td>
   <td class="it2" style="text-align: right;width:15%;">Internet/FTP Access :</td>
   <td ><%=a_internet%></td>
   <td class="it2">Remarks :</td>
   <td >
   <textarea  id="Iremarks14" name="Iremarks14" rows="4" cols="30">
		    <%=r_internet%>
   </textarea>
   </td>
   <td class="it2">Remarks :</td>
   <td class="it2"   >
   <textarea  id="Mremarks14" name="Mremarks14" rows="4" cols="30">
		   <%=it13m%>
   </textarea>
   </td>
</tr>

<tr>
  <td class="it1" align="center">8  </td>
  <td class="it2" style="text-align: right;width:15%;">Newins Id :</td>
  <td ><%=a_newins%></td>
  <td class="it2">Remarks :</td>
  <td >
    <textarea  id="Iremarks4" name="Iremarks4" rows="4" cols="30">
		       <%=r_newins%>
	</textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks4" name="Mremarks4" rows="4" cols="30">
		       <%=it4d%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">9  </td>
  <td class="it2" style="text-align: right;width:15%;">NExAS ID :</td>
  <td ><%=a_nexas%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks10" name="Iremarks10" rows="4" cols="30">
		  <%=r_nexas%>
   </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks10" name="Mremarks10" rows="4" cols="30">
	  <%=it10jnexas%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">10  </td>
  <td class="it2" style="text-align: right;width:15%;">GS-NET :</td>
  <td ><%=a_gsnet%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks15" name="Iremarks15" rows="4" cols="30">
		  <%=r_gsnet%>
   </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks15" name="Mremarks15" rows="4" cols="30">
	  <%=it14n%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">11  </td>
  <td class="it2" style="text-align: right;width:15%;">Internal Application :</td>
  <td ><%=a_internal%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks16" name="Iremarks16" rows="4" cols="30">
		  <%=r_internal%>
   </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks16" name="Mremarks16" rows="4" cols="30">
	  <%=it15o%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">12  </td>
  <td class="it2" style="text-align: right;width:15%;">DSC Dongle Received :</td>
  <td ><%=a_dsc%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks17" name="Iremarks17" rows="4" cols="30">
		  <%=r_dsc%>
   </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks17" name="Mremarks17" rows="4" cols="30">
	  <%=it16p%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">13  </td>
  <td class="it2" style="text-align: right;width:15%;">VPN :</td>
  <td ><%=vpn%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks18" name="Iremarks18" rows="4" cols="30">
		  <%=rvpn%>
   </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks18" name="Mremarks18" rows="4" cols="30">
	  <%=it17q%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">14  </td>
  <td class="it2" style="text-align: right;width:15%;">Hard Disk/Pen Drive :</td>
  <td ><%=a_drive%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks9" name="Iremarks9" rows="4" cols="30">
		  <%=r_drive%>
  </textarea> 
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks9" name="Mremarks9" rows="4" cols="30">
		  <%=it9i%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">15  </td>
  <td class="it2" style="text-align: right;width:15%;">Any Other Asset :</td>
  <td ><%=a_other_asset%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks11" name="Iremarks11" rows="4" cols="30">
		  <%=r_other_asset%>
  </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks11" name="Mremarks11" rows="4" cols="30">
		  <%=it10j%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">16  </td>
  <td class="it2" style="text-align: right;width:15%;">NEx-GLOW :</td>
  <td ><%=a_glow%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="Iremarks19" name="Iremarks19" rows="4" cols="30">
		  <%=r_glow%>
  </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="Mremarks19" name="Mremarks19" rows="4" cols="30">
		  <%=it19s%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">17  </td>
  <td class="it2" style="text-align: right;width:15%;">Airline / Liner Login :</td>
  <td ><%=a_other_asset%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="rairLin" name="rairLin" rows="4" cols="30">
		  <%=rairLin%>
  </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="itrairLin" name="itrairLin" rows="4" cols="30">
		  <%=itrairLin%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">18  </td>
  <td class="it2" style="text-align: right;width:15%;">Sophos & Manage Engine Access :</td>
  <td ><%=sophos%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="rsophos" name="rsophos" rows="4" cols="30">
		  <%=rsophos%>
  </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="itrsophos" name="itrsophos" rows="4" cols="30">
		  <%=itrsophos%>
  </textarea>
  </td>
</tr>

<tr>
  <td class="it1" align="center">19  </td>
  <td class="it2" style="text-align: right;width:15%;">Fortinet VPN Access :</td>
  <td ><%=forti%></td>
  <td class="it2">Remarks :</td>
  <td>
  <textarea  id="rforti" name="rforti" rows="4" cols="30">
		  <%=rforti%>
  </textarea>
  </td>
  <td class="it2">Remarks :</td>
  <td class="it2"   >
  <textarea  id="itrforti" name="itrforti" rows="4" cols="30">
		  <%=itrforti%>
  </textarea>
  </td>
</tr>

</table>
<br />
<table id="tableData" name="tableData" width="985" border="1"  align="center" bgcolor="grey" >
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
	  rs1 = st1.executeQuery("select id,form1_no,desg,emp,status,remarks,f_date,mail from form1_it_clearance_item WHERE form1_no='"+req+"' AND desg <> 'none' ORDER BY id ASC"); 
	  while(rs1.next())
	      {
		  String form1_noD= rs1.getString("form1_no");
		  String id= rs1.getString("id");
		  String desgD= rs1.getString("desg");
		  empD= rs1.getString("emp");
		  String statusD= rs1.getString("status");
		  String remarksD= rs1.getString("remarks");
		  String f_dateD= rs1.getString("f_date");
		  String mailD= rs1.getString("mail");
		 %>
	   <tr>
	     <td class="it2"><font size="2" color="black"><%=empD%></font>
		   <input type="hidden" value="<%=id%>" name="idRem">
		    <input id="idStatus" type="hidden" value="<%=statusD%>"/>
		 </td>
		 <td class="it2" ><font size="2" color="black"><%=desgD%></font></td>
		 <td class="it2" class="fonter">
		             
		              <select name="appStatusS<%=id%>" id="appStatusS<%=id%>"  >
		                  <option selected value="<%=statusD%>" ><%=statusD%></option>
		                  <%if(!statusD.equalsIgnoreCase("Initiator")){%>
	                      <option value="Approved" >Approved</option>
	                      <%}%>
			          </select>
		 
		 
		 </td>
		 <td class="it2">
		     <textarea id="aRemarks<%=id%>" name="aRemarks<%=id%>" rows="4" cols="30" style="text-align:left; overflow:auto; ">
		        <%=remarksD%>
		     </textarea>
		 </td>
		 <td class="it2">
		 <input type="text" name="approverDate<%=id%>" id="approverDate<%=id%>" value="<%=f_dateD%>"  onclick="clearField(this.id);showCalendarControl(this)" /><br>
		 (Format : YYYY-MM-DD)
		  </td>
	  </tr>
	 <%} %>
</table>
</br>
   </td>
</tr>
</table> <br><br>






<table class="dynatable" width="1000" border="1" style="height: 150;" cellspacing="0" cellpadding="0" bgcolor="#f9f7f6" style="border-collapse: collapse;">
        <tr>
          <center><td colspan="7"><font size="4" face="Swiss" id="hiderow">Enter New Approver </font></td></center> 
        </tr>
        
	    <tr>
		     <td width="60" align="center"  height="21" ><button class="add" type='button'>+</button></td>
		     <td><font size="2" face="Swiss" id="hiderow">Sl.No</font></td>
		     <td><font size="2" face="Swiss" id="hiderow">Designation<font color=red>*</font></font></td>
		     <td ><font size="2" face="Swiss" id="hiderow">ApproverName<font color=red>*</font></font></td>
		     <td ><font size="2" face="Swiss" id="hiderow">ApproverStatus<font color=red>*</font></font></td>
		     <td ><font size="2" face="Swiss" id="hiderow">Remarks<font color=red>*</font></font></td>
		     <td ><font size="2" face="Swiss" id="hiderow">ApprovedDate<font color=red>*</font></font></td>
	     </tr>
		 <tr class="prototype">
		           <td width="4" align="center" height="21">
		              <button class="remove" type='button' ><font size="4">-</font></button>
		           </td>
		           <td width="" align="left"  height="21" ><input type="text" id="id1" name="id[]" value="0" size=1 class="id" readonly="readonly" /></td>
		          
		           <td >
		               <select name="approverDesg"  id="approverDesg"   class="approverDesg"   >
	                   <option  value="">SELECT</option>
	                   
	                        <%
							  cnhrms = conhrms.getConnectionlms();
							  sthrms=cnhrms.createStatement();
							  rshrms = sthrms.executeQuery("select role_code from role"); 
							  while(rshrms.next())
							      {
								  String desgD=rshrms.getString("role_code");
								  %>
	                           <option value="<%=desgD%>" ><%=desgD%></option>
			                 <%} %>
			         	
				      </select>
				   </td>
		           <td >
		                   <input type="text" name="approverName"  id="approverName"  class="approverName" value="" /> 
		           </td>
		           <td >
		               <select name="appStatus" id="appStatus"  class="appStatus" >
	                      <option value="Approved" >Approved</option>
			          </select>
				    </td>
		           <td >
		            <input type="text" name="appRemarks"  id="appRemarks"  value=""  class="appRemarks"/>
		           
		           </td>
		             <td>
		              <input type="text" name="appDate" id="appDate"   class="appDate" value=""  onclick="clearField(this.id);showCalendarControl(this)" />
		           </td>
         </tr>
   </table>

<br><br>
<center>
<table id="printbtn" style="margin-left: auto;margin-right: auto;" >
   <tr>
       <td><input type="submit" style="background-color:white;font-weight:bold;color:black;" value="UPDATE" name=button1 /></td>
       <td style="font-size:1">&nbsp;&nbsp;
       <a  href="javascript:history.back()">BACK</a>
       </td>
  </tr>
</table>
</center>
<br/><br/><br/>
</div>
</form>	
</body>

</html>