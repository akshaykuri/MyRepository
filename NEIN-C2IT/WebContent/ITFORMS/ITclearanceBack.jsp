<%@page import="CON2.DbUtil"%>
<%@page import="CON2.MailMessageITclearance"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.text.resources.FormatData"%>
<jsp:useBean id="dateFormat" class="CON2.DateFormat"/>
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<jsp:useBean id = "timeDiff" class="CON2.TimeDifferenceForm" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id = "postMail" class="CON2.PostMail" /> 
<html>
<head>
</head>
<%! 
MailMessageITclearance mailMessage = new MailMessageITclearance();
Connection conn = null, conn1 = null,cn2=null; 
Statement st= null, st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,st7=null,st8=null,st9=null,st11=null;
ResultSet rs = null;
String message = null;
%>
<%
cn2 = con.getConnection2();
st2 = cn2.createStatement();
%>
<%
String form_no = request.getParameter("form1_no");
String f_date = request.getParameter("f_date");
String subDept = request.getParameter("subDept");
String branch = request.getParameter("branch");
String depart = request.getParameter("depart");
String Nname = request.getParameter("full_name");
String full_name= Nname.toUpperCase();

String emp_code = request.getParameter("emp_code");
String designation = request.getParameter("designation");
String r_officer = request.getParameter("r_officer");
String req2 = request.getParameter("d_resignation");
String req3 = request.getParameter("d_reliving");

//lap/desk
String a_model = request.getParameter("a_model");
String r_model = request.getParameter("r_model");
//password
String a_model_info=request.getParameter("a_model_info");
String r_model_info=request.getParameter("r_model_info");
//datacard
String a_data_card = request.getParameter("a_data_card");
String r_data_card = request.getParameter("r_data_card");
//email
String a_email = request.getParameter("a_email");
String r_email = request.getParameter("r_email");
//makemodel
String a_mobile_model = request.getParameter("a_mobile_model");
String r_mobile_model = request.getParameter("r_mobile_model");
//intune
String a_mobile_no = request.getParameter("a_mobile_no");
String r_mobile_no = request.getParameter("r_mobile_no");
//comp prov
String a_compmobile_no = request.getParameter("a_compmobile_no");
String r_compmobile_no = request.getParameter("r_compmobile_no");
//domain
String a_domain = request.getParameter("a_domain");
String r_domain = request.getParameter("r_domain");
//bio
String a_access_card = request.getParameter("a_access_card");
String r_access_card = request.getParameter("r_access_card");
//shared
String a_shared_card = request.getParameter("a_shared_card");
String r_shared_card = request.getParameter("r_shared_card");
//internet
String a_internet = request.getParameter("a_internet");
String r_internet = request.getParameter("r_internet");
//newins
String a_newins = request.getParameter("a_newins");
String r_newins = request.getParameter("r_newins");
//nexas
String a_nexas = request.getParameter("a_nexas");
String r_nexas = request.getParameter("r_nexas");
//gsnet
String a_gsnet = request.getParameter("a_gsnet");
String r_gsnet = request.getParameter("r_gsnet");
//internal
String a_internal = request.getParameter("a_internal");
String r_internal = request.getParameter("r_internal");
//dsc
String a_dsc = request.getParameter("a_dsc");
String r_dsc = request.getParameter("r_dsc");
//VPN
String vpn = request.getParameter("vpn");
String r_vpn = request.getParameter("r_vpn");
//harddisk
String a_drive = request.getParameter("a_drive");
String r_drive = request.getParameter("r_drive");
//other asset
String a_other_asset = request.getParameter("a_other_asset");
String r_other_asset = request.getParameter("r_other_asset");
//glow
String a_nexglow = request.getParameter("a_nexglow");
String r_nexglow = request.getParameter("r_nexglow");
//airline
String airLin=request.getParameter("airLin");
String r_airLin=request.getParameter("r_airLin");
//sophos
String a_sophos=request.getParameter("sophos");
String r_sophos=request.getParameter("r_sophos");
//sophos
String a_forti=request.getParameter("forti");
String r_forti=request.getParameter("r_forti");
//remarks
String a_remarks = request.getParameter("a_remarks");
String r_remarks = request.getParameter("r_remarks");

//int requestOption= Integer.parseInt(request.getParameter("requestOption"));
String requestOption= request.getParameter("requestOption");
String grade = request.getParameter("grade");

String i_name = request.getParameter("i_name");
String i_desg = request.getParameter("i_desg");
String i_city = request.getParameter("i_city");
String i_b_no = request.getParameter("i_b_no");
String i_admin = request.getParameter("i_admin");
String i_email_id = request.getParameter("i_email_id");
String i_empid = (String) session.getAttribute("EmpNo");

//New changes from here to 
String d_new_relieved_request = request.getParameter("d_new_relieved_request");
String d_new_reliving_co =request.getParameter("d_new_reliving_co");
String a_document_ac=request.getParameter("a_document_ac");
String r_document_ac=request.getParameter("r_document_ac");
String a_document_hr=request.getParameter("a_document_hr");
String r_document_hr=request.getParameter("r_document_hr");
String a_co_car_hr=request.getParameter("a_co_car_hr");
String r_co_car_hr=request.getParameter("r_co_car_hr");
String a_calculator_hr=request.getParameter("a_calculator_hr");
String r_calculator_hr=request.getParameter("r_calculator_hr");
String a_conn_mobile_hr=request.getParameter("a_conn_mobile_hr");
String r_conn_mobile_hr=request.getParameter("r_conn_mobile_hr");
String a_mobile_handset_hr=request.getParameter("a_mobile_handset_hr");
String r_mobile_handset_hr=request.getParameter("r_mobile_handset_hr");
String a_id_card_hr=request.getParameter("a_id_card_hr");
String r_id_card_hr=request.getParameter("r_id_card_hr");
String a_work_key_hr=request.getParameter("a_work_key_hr");
String r_work_key_hr=request.getParameter("r_work_key_hr");
String a_any_other_hr=request.getParameter("a_any_other_hr");
String r_any_other_hr=request.getParameter("r_any_other_hr");
String a_leave_card_hr=request.getParameter("a_leave_card_hr");
String r_leave_card_hr=request.getParameter("r_leave_card_hr");
String a_resignation_letter_hr=request.getParameter("a_resignation_letter_hr");
String r_resignation_letter_hr=request.getParameter("r_resignation_letter_hr");
String a_identity_card_hr=request.getParameter("a_identity_card_hr");
String r_identity_card_hr=request.getParameter("r_identity_card_hr");   
// till here

String mailingCheck = request.getParameter("mailingCheck");

if((mailingCheck=="null"))
{
	String mss=null;
	mss = "MAIL__ID__DOES__NOT__EXIST";
	response.sendRedirect("ITclearance.jsp?msg="+mss);
}
else{
	
String values[] = mailingCheck.split(",");
String emp = values[0];
String desg = values[1];
String mail = values[2].replaceAll(" ", "");
String empid = values[3];
String levelno = values[4];

String msg=null;
Date result1=null,result2=null,form_date=null;
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

try{
	form_date = new Date(sdf.parse(f_date).getTime());
}
catch (Exception e) {
	e.printStackTrace();
}

String[] dateString = req2.split("-");

if (dateString[1].equals("Jan"))
{
	  dateString[1]="01";
}
if (dateString[1].equals("Feb"))
{
	  dateString[1]="02";
}
if (dateString[1].equals("Mar"))
{
	  dateString[1]="03";
}
if (dateString[1].equals("Apr"))
{
	  dateString[1]="04";
}
if (dateString[1].equals("May"))
{
	  dateString[1]="05";
}
if (dateString[1].equals("Jun"))
{
	  dateString[1]="06";
}
if (dateString[1].equals("Jul"))
{
	  dateString[1]="07";
}
if (dateString[1].equals("Aug"))
{
	  dateString[1]="08";
}
if (dateString[1].equals("Sep"))
{
	  dateString[1]="09";
}
if (dateString[1].equals("Oct"))
{
	  dateString[1]="10";
}
if (dateString[1].equals("Nov"))
{
	  dateString[1]="11";
}
if (dateString[1].equals("Dec"))
{
	  dateString[1]="12";
}

String dateF = dateString[0]+"-"+dateString[1]+"-"+dateString[2];

String[] dateString2 = req3.split("-");

if (dateString2[1].equals("Jan"))
{
	  dateString2[1]="01";
}
if (dateString2[1].equals("Feb"))
{
	  dateString2[1]="02";
}
if (dateString2[1].equals("Mar"))
{
	  dateString2[1]="03";
}
if (dateString2[1].equals("Apr"))
{
	  dateString2[1]="04";
}
if (dateString2[1].equals("May"))
{
	  dateString2[1]="05";
}
if (dateString2[1].equals("Jun"))
{
	  dateString2[1]="06";
}
if (dateString2[1].equals("Jul"))
{
	  dateString2[1]="07";
}
if (dateString2[1].equals("Aug"))
{
	  dateString2[1]="08";
}
if (dateString2[1].equals("Sep"))
{
	  dateString2[1]="09";
}
if (dateString2[1].equals("Oct"))
{
	  dateString2[1]="10";
}
if (dateString2[1].equals("Nov"))
{
	  dateString2[1]="11";
}
if (dateString2[1].equals("Dec"))
{
	  dateString2[1]="12";
}

String dateFF = dateString2[0]+"-"+dateString2[1]+"-"+dateString2[2];

if (requestOption.equals("Probation"))
{
	requestOption="30";
}
if (requestOption.equals("Confirmed"))
{
	requestOption="60";
}
if (requestOption.equals("Trainee"))
{
	requestOption="8";
}
if (requestOption.equals("Contract"))
{
	requestOption="16";
}

String[] dateString3 = d_new_relieved_request.split("-");

if (dateString3[1].equals("Jan"))
{
	  dateString3[1]="01";
}
if (dateString3[1].equals("Feb"))
{
	  dateString3[1]="02";
}
if (dateString3[1].equals("Mar"))
{
	  dateString3[1]="03";
}
if (dateString3[1].equals("Apr"))
{
	  dateString3[1]="04";
}
if (dateString3[1].equals("May"))
{
	  dateString3[1]="05";
}
if (dateString3[1].equals("Jun"))
{
	  dateString3[1]="06";
}
if (dateString3[1].equals("Jul"))
{
	  dateString3[1]="07";
}
if (dateString3[1].equals("Aug"))
{
	  dateString3[1]="08";
}
if (dateString3[1].equals("Sep"))
{
	  dateString3[1]="09";
}
if (dateString3[1].equals("Oct"))
{
	  dateString3[1]="10";
}
if (dateString3[1].equals("Nov"))
{
	  dateString3[1]="11";
}
if (dateString3[1].equals("Dec"))
{
	  dateString3[1]="12";
}

String dateFf = dateString3[0]+"-"+dateString3[1]+"-"+dateString3[2];

String[] dateString4 = d_new_reliving_co.split("-");

if (dateString4[1].equals("Jan"))
{
	  dateString4[1]="01";
}
if (dateString4[1].equals("Feb"))
{
	  dateString4[1]="02";
}
if (dateString4[1].equals("Mar"))
{
	  dateString4[1]="03";
}
if (dateString4[1].equals("Apr"))
{
	  dateString4[1]="04";
}
if (dateString4[1].equals("May"))
{
	  dateString4[1]="05";
}
if (dateString4[1].equals("Jun"))
{
	  dateString4[1]="06";
}
if (dateString4[1].equals("Jul"))
{
	  dateString4[1]="07";
}
if (dateString4[1].equals("Aug"))
{
	  dateString4[1]="08";
}
if (dateString4[1].equals("Sep"))
{
	  dateString4[1]="09";
}
if (dateString4[1].equals("Oct"))
{
	  dateString4[1]="10";
}
if (dateString4[1].equals("Nov"))
{
	  dateString4[1]="11";
}
if (dateString4[1].equals("Dec"))
{
	  dateString4[1]="12";
}

String dateFFff = dateString4[0]+"-"+dateString4[1]+"-"+dateString4[2];

PreparedStatement psmt=null,psmt2=null,psmt3=null;

int dateCalculation=0;

int diffTime = timeDiff.getTimeDifference(dateFF,dateF);
int foo = Integer.parseInt(requestOption);

dateCalculation = foo-diffTime;
if (requestOption.equals("30"))
{
	requestOption="Probationary";
}
if (requestOption.equals("60"))
{
	requestOption="Confirmation";
}

String new_id = null;
int id=0;
String id2=null;
Connection cn_id = null; 
Statement st_id = null; 
ResultSet rs_id = null; 
PreparedStatement psmt1001=null;
PreparedStatement psmt10=null;

try{
psmt1001 = cn2.prepareStatement("SELECT max(idextend) FROM form1_it_clearance WHERE form1_no IN(SELECT form1_no FROM form1_it_clearance LEFT JOIN branch_master b ON(substr(form1_no,12,2)=b.b_no) WHERE b.b_no=? GROUP BY form1_no)");
psmt1001.setString(1,i_b_no);
rs_id = psmt1001.executeQuery();


if(rs_id.next()){
	
	try
	{
		id=rs_id.getInt(1);
		if(id==0)
 			id=1;
		     if(id2==null)
 			 id2="NEIN/CS/IT/"+i_b_no+"-";
             id++;   
             new_id = id2+String.valueOf(id);
	}
	catch(SQLException ex)
	    {
		 new_id = "NEIN/CS/IT/"+i_b_no+"-1";
	    }

}


// REPLACING S_NO TO NEW_ID
int idextend = id;

psmt = cn2.prepareStatement("INSERT INTO form1_it_clearance(form1_no,branch,depart,full_name,emp_code,designation,r_officer,d_resignation,d_reliving,a_model,a_data_card,a_email,a_newins,a_domain,a_mobile_model,a_mobile_no,a_access_card,a_drive,a_other_asset,a_remarks,r_model,r_data_card,r_email,r_newins,r_domain,r_mobile_model,r_mobile_no,r_access_card,r_drive,r_other_asset,f_date,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,idextend,notServed,grade,requestOption,form_name,a_document_hr,r_document_hr,a_co_car_hr,r_co_car_hr,a_calculator_hr,r_calculator_hr,a_conn_mobile_hr,r_conn_mobile_hr,a_mobile_handset_hr,r_mobile_handset_hr,a_id_card_hr,r_id_card_hr,a_work_key_hr,r_work_key_hr,a_any_other_hr,r_any_other_hr,a_leave_card_hr,r_leave_card_hr,a_resignation_letter_hr,r_resignation_letter_hr,a_identity_card_hr,r_identity_card_hr,a_model_info,r_model_info,a_document_ac,r_document_ac,d_new_relieved_request,d_new_reliving_co,NotHRThenEnterINTable,a_nexas,r_nexas,airLin,rairLin,vpn,rvpn,a_compmobile_no,r_compmobile_no,a_shared_card,r_shared_card,a_internet,r_internet,a_gsnet,r_gsnet,a_internal,r_internal,a_nexglow,r_nexglow,a_dsc,r_dsc,a_sophos,r_sophos,a_forti,r_forti) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
psmt.setString(1,new_id);
psmt.setString(2,branch);
psmt.setString(3,depart);
psmt.setString(4,full_name);
psmt.setString(5,emp_code);
psmt.setString(6,designation);
psmt.setString(7,r_officer);
psmt.setString(8,dateF);
psmt.setString(9,dateFF);
psmt.setString(10,a_model);
psmt.setString(11,a_data_card);
psmt.setString(12,a_email);
psmt.setString(13,a_newins);
psmt.setString(14,a_domain);
psmt.setString(15,a_mobile_model);
psmt.setString(16,a_mobile_no);
psmt.setString(17,a_access_card);
psmt.setString(18,a_drive);
psmt.setString(19,a_other_asset);
psmt.setString(20,a_remarks);
psmt.setString(21,r_model);
psmt.setString(22,r_data_card);
psmt.setString(23,r_email);
psmt.setString(24,r_newins);
psmt.setString(25,r_domain);
psmt.setString(26,r_mobile_model);
psmt.setString(27,r_mobile_no);
psmt.setString(28,r_access_card);
psmt.setString(29,r_drive);
psmt.setString(30,r_other_asset);
psmt.setDate(31,form_date);
psmt.setString(32,i_name);
psmt.setString(33,i_desg);
psmt.setString(34,i_city);
psmt.setString(35,i_b_no);
psmt.setString(36,i_admin);
psmt.setString(37,i_email_id);
psmt.setString(38,desg);
psmt.setString(39,emp);
psmt.setString(40,mail);
psmt.setInt(41,idextend);
psmt.setInt(42,dateCalculation);
psmt.setString(43,grade);
psmt.setString(44,requestOption);
psmt.setString(45,"Resigned Employee IT Check List");
psmt.setString(46,a_document_hr);
psmt.setString(47,r_document_hr);
psmt.setString(48,a_co_car_hr);
psmt.setString(49,r_co_car_hr);
psmt.setString(50,a_calculator_hr);
psmt.setString(51,r_calculator_hr);
psmt.setString(52,a_conn_mobile_hr);
psmt.setString(53,r_conn_mobile_hr);
psmt.setString(54,a_mobile_handset_hr);
psmt.setString(55,r_mobile_handset_hr);
psmt.setString(56,a_id_card_hr);
psmt.setString(57,r_id_card_hr);
psmt.setString(58,a_work_key_hr);
psmt.setString(59,r_work_key_hr);
psmt.setString(60,a_any_other_hr);
psmt.setString(61,r_any_other_hr);
psmt.setString(62,a_leave_card_hr);
psmt.setString(63,r_leave_card_hr);
psmt.setString(64,a_resignation_letter_hr);
psmt.setString(65,r_resignation_letter_hr);
psmt.setString(66,a_identity_card_hr);
psmt.setString(67,r_identity_card_hr);
psmt.setString(68,a_model_info);//only for IT 1.a
psmt.setString(69,r_model_info);//only for IT 1.a remarks
psmt.setString(70,a_document_ac);
psmt.setString(71,r_document_ac);
psmt.setString(72,dateFf);//d_new_relieved_request //Two extra dates
psmt.setString(73,dateFFff);//d_new_reliving_co //Two extra dates
psmt.setString(74,"Accounts");//subDept//NotHRThenEnterINTable
psmt.setString(75,a_nexas);//nexas
psmt.setString(76,r_nexas);//nexas remarks  //airLin , r_airLin
psmt.setString(77,airLin);
psmt.setString(78,r_airLin);
//VPN
psmt.setString(79,vpn);
psmt.setString(80,r_vpn);
//sim number
psmt.setString(81,a_compmobile_no);
psmt.setString(82,r_compmobile_no);
//shared
psmt.setString(83,a_shared_card);
psmt.setString(84,r_shared_card);
//internet
psmt.setString(85,a_internet);
psmt.setString(86,r_internet);
//gsnet
psmt.setString(87,a_gsnet);
psmt.setString(88,r_gsnet);
//internal
psmt.setString(89,a_internal);
psmt.setString(90,r_internal);
//glow
psmt.setString(91,a_nexglow);
psmt.setString(92,r_nexglow);
//dsc
psmt.setString(93,a_dsc);
psmt.setString(94,r_dsc);
//sophos
psmt.setString(95,a_sophos);
psmt.setString(96,r_sophos);
//forti
psmt.setString(97,a_forti);
psmt.setString(98,r_forti);

	int i = psmt.executeUpdate();

psmt10 =cn2.prepareStatement("UPDATE form1_it_clearance SET Approval_status=?,Approval_sttatuss=?,Approval_remarks=?,Approval_f_date=?,Approval_emp=?,Approval_desg=?,Approval_empp=?,Approval_desgg=? WHERE form1_no=?");
psmt10.setString(1,"Pending");
psmt10.setString(2,"Pending");
psmt10.setString(3,a_remarks);
psmt10.setDate(4,form_date);
psmt10.setString(5,emp);
psmt10.setString(6,desg);
psmt10.setString(7,i_name);
psmt10.setString(8,i_desg);
psmt10.setString(9,new_id);
	int b = psmt10.executeUpdate(); 

psmt2 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt2.setString(1,new_id);
psmt2.setString(2,i_desg);
psmt2.setString(3,i_name);
psmt2.setString(4,"Initiator");
psmt2.setString(5,a_remarks);
psmt2.setDate(6,form_date);
psmt2.setString(7,i_email_id);
psmt2.setString(8,"over");
psmt2.setString(9,i_empid);
psmt2.setString(10,"00");
	int j = psmt2.executeUpdate();

psmt3 = cn2.prepareStatement("INSERT INTO form1_it_clearance_item(form1_no,desg,emp,status,remarks,f_date,mail,presence,empid,levelno) VALUES(?,?,?,?,?,?,?,?,?,?)");
psmt3.setString(1,new_id);
psmt3.setString(2,desg);
psmt3.setString(3,emp);
psmt3.setString(4,"Pending");
psmt3.setString(5,"Pending");
psmt3.setDate(6,form_date);
psmt3.setString(7,mail);
psmt3.setString(8,"now");
psmt3.setString(9,empid);
psmt3.setString(10,levelno);
	int k = psmt3.executeUpdate();

message = mailMessage.getMailMessage(new_id.trim());
postMail.postMail(i_email_id,i_name,"pass1234",mail,"Outstanding Dues & Handover Report :  " +new_id+ " ",i_name+  " "+  "request you to approve - Outstanding Dues & Handover Report Form. " +new_id+ " <br><br><b><u> Open the following URL</u> </b><br> C2IT LINK -  https://neinsoft.nittsu.co.in:8185/NEIN-C2IT/HOME.jsp  <br> COMMON LINK - https://neinsoft.nittsu.co.in:8185/NEIN  <br><br><br><br>"+message);              
message = null;

msg = "IT__CLEARANCE__Form__SAVED__AND__SENT__SUCCESSFULLY.....";
response.sendRedirect("ITclearance.jsp?msg=" +msg);

}

catch(Exception e){
	System.out.println(e);
}
finally{
	DbUtil.closeDBResources(rs,st1,conn);
	DbUtil.closeDBResources(null,st2,conn1);
	DbUtil.closeDBResources(null,st3,cn2);
	DbUtil.closeDBResources(null,st4,null);
	DbUtil.closeDBResources(null,st5,null);
	DbUtil.closeDBResources(null,st6,null);
	DbUtil.closeDBResources(null,st7,null);
	DbUtil.closeDBResources(null,st8,null);
	DbUtil.closeDBResources(null,st9,null);
	DbUtil.closeDBResources(null,st11,null);
	DbUtil.closeDBResources(null,st_id,null);
	DbUtil.closeDBResources(null,psmt,null);
	DbUtil.closeDBResources(null,psmt1001,null);
	DbUtil.closeDBResources(null,psmt2,null);
	DbUtil.closeDBResources(null,psmt3,null);
  }
}
%>	              