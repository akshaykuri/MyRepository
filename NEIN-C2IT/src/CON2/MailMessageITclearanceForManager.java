package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageITclearanceForManager {
String driver;
Date gdate = null;
public String getMailMessage(String form1_no)
{
StringBuffer stringBuffer = new StringBuffer();
Connection con = null;
PreparedStatement pst = null,pst2=null,pst3=null,pst4=null;   
ResultSet resultSet = null,rs = null,rs2 = null,rs3=null,rs4=null;
try{ 
Connection2 dbConn = new Connection2();
con = dbConn.getConnection2();
pst= con.prepareStatement("SELECT form1_no,f_date FROM form1_it_clearance where form1_no=?");
pst.setString(1,form1_no);
resultSet = pst.executeQuery();
System.out.println("before while");
if(resultSet.next()){
gdate = resultSet.getDate(2);
}
	    
stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
"<head >"+
"<jsp:useBean id =con class=CON2.Connection2 />"+
"<center>"+
" "+
"__________________________________________________________________________________________________________________________________________________"+
"<table border=\"0\" align=\"center\" width=\"80%\"><tr><td>"+
"<center>"+
"<label><font color=\"black\"><u><b>Outstanding Dues & Handover Report</b></u></font></label> <br />"+
"</center></td></tr></table>"+
"<br><br>");

String a_document_hr=null,r_document_hr=null,a_co_car_hr=null,r_co_car_hr=null,a_calculator_hr=null,r_calculator_hr=null,a_conn_mobile_hr=null,r_conn_mobile_hr=null,a_mobile_handset_hr=null,r_mobile_handset_hr=null;
String a_id_card_hr=null,r_id_card_hr=null,a_work_key_hr=null,r_work_key_hr=null,a_any_other_hr=null,r_any_other_hr=null,a_leave_card_hr=null,r_leave_card_hr=null,a_resignation_letter_hr=null,r_resignation_letter_hr=null,a_identity_card_hr=null,r_identity_card_hr=null;
String a_model_info=null,r_model_info=null,a_document_ac=null,r_document_ac=null,d_new_relieved_request=null,d_new_reliving_co=null; 

pst2 = con.prepareStatement("select form1_no,f_date,idextend,branch,depart,full_name,emp_code,designation,r_officer,DATE_FORMAT(d_resignation,'%d/%m/%Y'),DATE_FORMAT(d_reliving,'%d/%m/%Y'),a_model,a_data_card,a_email,a_newins,a_domain,a_mobile_model,a_mobile_no,a_access_card,a_drive,a_other_asset,a_remarks,notServed,grade,requestOption,r_model,r_data_card,r_email,r_newins,r_domain,r_mobile_model,r_mobile_no,r_access_card,r_drive,r_other_asset,i_name,i_desg,i_city,i_b_no,i_admin,i_email_id,desg,emp,mail,a_document_hr,r_document_hr,a_co_car_hr,r_co_car_hr,a_calculator_hr,r_calculator_hr,a_conn_mobile_hr,r_conn_mobile_hr,a_mobile_handset_hr,r_mobile_handset_hr,a_id_card_hr,r_id_card_hr,a_work_key_hr,r_work_key_hr,a_any_other_hr,r_any_other_hr,a_leave_card_hr,r_leave_card_hr,a_resignation_letter_hr,r_resignation_letter_hr,a_identity_card_hr,r_identity_card_hr,a_model_info,r_model_info,a_document_ac,r_document_ac,DATE_FORMAT(d_new_relieved_request,'%d/%m/%Y') as d_new_relieved_request_Format ,DATE_FORMAT(d_new_reliving_co,'%d/%m/%Y') as d_new_reliving_co_Format,ifnull(it1a,'') as it1a,ifnull(it2b,'') as it2b,ifnull(it3c,'') as it3c,ifnull(it4d,'') as it4d,ifnull(it5e,'') as it5e,ifnull(it6f,'') as it6f,ifnull(it7g,'') as it7g,ifnull(it8h,'') as it8h,ifnull(it9i,'') as it9i,ifnull(it10j,'') as it10j,a_nexas,r_nexas,ifnull(it10jnexas,'') as it10jnexas,airLin,rairLin,ifnull(itrairLin,'') as itrairLin,a_compmobile_no,r_compmobile_no,a_shared_card,r_shared_card,a_internet,r_internet,a_gsnet,r_gsnet,a_internal,r_internal,a_nexglow,r_nexglow,vpn,rvpn,a_dsc,r_dsc,ifnull(it11k,'') as it11k,ifnull(it12l,'') as it12l,ifnull(it13m,'') as it13m,ifnull(it14n,'') as it14n,ifnull(it15o,'') as it15o,ifnull(it16p,'') as it16p,ifnull(it17q,'') as it17q,ifnull(it18r,'') as it18r,ifnull(it19s,'') as it19s from form1_it_clearance where form1_no=?");
pst2.setString(1, form1_no);
rs2 = pst2.executeQuery();
if(rs2.next()){
String branch = rs2.getString(4);
String depart = rs2.getString(5);
String full_name = rs2.getString(6);
String emp_code = rs2.getString(7);
String designation = rs2.getString(8);
String r_officer = rs2.getString(9);
String d_resignation = rs2.getString(10);
String d_reliving = rs2.getString(11);
String a_model = rs2.getString(12);
String a_data_card = rs2.getString(13);
String a_email = rs2.getString(14);
String a_newins = rs2.getString(15);
String a_domain = rs2.getString(16);
String a_mobile_model = rs2.getString(17);
String a_mobile_no = rs2.getString(18);
String a_access_card = rs2.getString(19);
String a_drive = rs2.getString(20);
String a_other_asset = rs2.getString("a_other_asset");

String notServed = rs2.getString("notServed");
String grade = rs2.getString("grade");
String requestOption =rs2.getString("requestOption");

String r_model = rs2.getString("r_model");
String r_data_card = rs2.getString("r_data_card");
String r_email = rs2.getString("r_email");
String r_newins = rs2.getString("r_newins");
String r_domain = rs2.getString("r_domain");
String r_mobile_model = rs2.getString("r_mobile_model");
String r_mobile_no = rs2.getString("r_mobile_no");
String r_access_card = rs2.getString("r_access_card");
String r_drive = rs2.getString("r_drive");
String r_other_asset = rs2.getString("r_other_asset");

String a_nexas = rs2.getString("a_nexas");
String r_nexas = rs2.getString("r_nexas");
 //r_remarks = rs2.getString("r_remarks");

a_document_hr = rs2.getString("a_document_hr");
r_document_hr= rs2.getString("r_document_hr");
a_co_car_hr= rs2.getString("a_co_car_hr");
r_co_car_hr= rs2.getString("r_co_car_hr");
a_calculator_hr= rs2.getString("a_calculator_hr");
r_calculator_hr= rs2.getString("r_calculator_hr");
a_conn_mobile_hr= rs2.getString("a_conn_mobile_hr");
r_conn_mobile_hr= rs2.getString("r_conn_mobile_hr");
a_mobile_handset_hr= rs2.getString("a_mobile_handset_hr");
r_mobile_handset_hr= rs2.getString("r_mobile_handset_hr");
a_id_card_hr= rs2.getString("a_id_card_hr");
r_id_card_hr= rs2.getString("r_id_card_hr");
a_work_key_hr= rs2.getString("a_work_key_hr");
r_work_key_hr= rs2.getString("r_work_key_hr");
a_any_other_hr= rs2.getString("a_any_other_hr");
r_any_other_hr= rs2.getString("r_any_other_hr");
a_leave_card_hr= rs2.getString("a_leave_card_hr");
r_leave_card_hr= rs2.getString("r_leave_card_hr");
a_resignation_letter_hr= rs2.getString("a_resignation_letter_hr");
r_resignation_letter_hr= rs2.getString("r_resignation_letter_hr");
a_identity_card_hr= rs2.getString("a_identity_card_hr");
r_identity_card_hr= rs2.getString("r_identity_card_hr");
a_model_info= rs2.getString("a_model_info");
r_model_info= rs2.getString("r_model_info");
a_document_ac= rs2.getString("a_document_ac");
r_document_ac= rs2.getString("r_document_ac");
d_new_relieved_request= rs2.getString("d_new_relieved_request_Format");
d_new_reliving_co = rs2.getString("d_new_reliving_co_Format");

String a_compmobile_no = rs2.getString("a_compmobile_no");
String r_compmobile_no = rs2.getString("r_compmobile_no");
String a_shared_card = rs2.getString("a_shared_card");
String r_shared_card = rs2.getString("r_shared_card");
String a_internet = rs2.getString("a_internet");
String r_internet = rs2.getString("r_internet");
String a_gsnet = rs2.getString("a_gsnet");
String r_gsnet = rs2.getString("r_gsnet");
String a_internal = rs2.getString("a_internal");
String r_internal = rs2.getString("r_internal");
String a_nexglow = rs2.getString("a_nexglow");
String r_nexglow = rs2.getString("r_nexglow");
String vpn = rs2.getString("vpn");
String r_vpn = rs2.getString("rvpn");
String a_dsc = rs2.getString("a_dsc");
String r_dsc = rs2.getString("r_dsc");

String it1a = rs2.getString("it1a");
String it2b = rs2.getString("it2b");
String it3c = rs2.getString("it3c");
String it4d = rs2.getString("it4d");
String it5e = rs2.getString("it5e");
String it6f = rs2.getString("it6f");
String it7g = rs2.getString("it7g");
String it8h = rs2.getString("it8h");
String it9i = rs2.getString("it9i");
String it10j = rs2.getString("it10j");
String it10jnexas = rs2.getString("it10jnexas");
String airLin = rs2.getString("airLin");
String rairLin = rs2.getString("rairLin");
String itrairLin = rs2.getString("itrairLin");
String it11k = rs2.getString("it11k");
String it12l = rs2.getString("it12l");
String it13m = rs2.getString("it13m");
String it14n = rs2.getString("it14n");
String it15o = rs2.getString("it15o");
String it16p = rs2.getString("it16p");
String it17q = rs2.getString("it17q");
String it18r = rs2.getString("it18r");
String it19s = rs2.getString("it19s");

stringBuffer.append(

"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+

"<tr>"+
"<td  style=\"text-align: right;width: 215px; \" bgcolor=\"grey\" >FORM NUMBER :</td>"+
"<td style=\"text-align:center;\" bgcolor=\"white\" colspan=\"3\"><b>"+form1_no+"</b></td>"+
"</tr>"+

"<tr>"+
"<td  style=\"text-align: right;\">Employee Code :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+emp_code+"</td>"+
"<td  style=\"text-align: right;\">Full Name :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+full_name+"</td>"+
"</tr>"+

"<tr>"+
"<td  style=\"text-align: right;\"  >Branch :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+branch+"</td>"+
"<td  style=\"text-align: right;width: 175px;\">Department :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+depart+""+
"</td> "+
"</tr>"+

"<tr>"+
"<td  style=\"text-align: right;\">Designation :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+designation+"</td>"+
"<td  style=\"text-align: right;\">Reporting Officer  :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+r_officer+"</td>"+
"</tr>"+

"<tr>"+
"<td  style=\"text-align: right;\">Date Of Resignation :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+d_resignation+""+
"</td>"+
"<td  style=\"text-align: right;\">Date Of Relieving :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+d_reliving+""+
"</td>"+ 					        
"</tr>"+

"<tr>"+
"<td style=\"text-align: right;\">Date Of Relieving requested by the employee :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+d_new_relieved_request+""+
"</td>"+
"<td style=\"text-align: right;\">Date Of Relieving as per co. policy:</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+d_new_reliving_co+""+
"</td>"+ 					        
"</tr>"+

"<tr>"+
"<td style=\"text-align: right;\">Status Of Employement :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+requestOption+""+
"</td>"+
"<td style=\"text-align: right;\">Grade :</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+grade+""+
"</td>"+ 					        
"</tr>"+

"<tr>"+
"<td  style=\"text-align: right;\">Not Served:</td>"+
"<td style=\"text-align:left;\" bgcolor=\"white\">"+notServed+""+
"</td>"+
"</tr>"+
"</table>"+
"<br>"+

"<label><center> <font color=\"black\"><u><b>HR DEPARTMENT </b></u></font></center> </label> "+
"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
"<tr>"+
"<td class=\"it1\" align=\"center\">1  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\"> All document taken overby :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_document_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_document_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">2  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Company Car:</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_co_car_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_co_car_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">3  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Calculator :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_calculator_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_calculator_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">4  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Connection Surrendered :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_conn_mobile_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+r_conn_mobile_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">5  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Mobile handset :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_mobile_handset_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_mobile_handset_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">6  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">ID card :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_id_card_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\">"+r_id_card_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">7  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Workstation keys:</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_work_key_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_work_key_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">8  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Any other:</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_any_other_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_any_other_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">9  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Leave card enclosed :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_leave_card_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_leave_card_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">10  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Resignation letter enclosed :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_resignation_letter_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+r_resignation_letter_hr+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">11  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Identity card enclosed :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_identity_card_hr+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+r_identity_card_hr+"</td>"+
"</tr>"+
"</table>"+
"<br />"+
"<br>"+
"<br>"+

"<label><center> <font color=\"black\"><u><b>ACCOUNT DEPARTMENT</b></u></font></center> </label> "+
"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
"<tr>"+
"<td class=\"it1\" align=\"center\">1  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\"> Account - Advance imprest balance :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_document_ac+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_document_ac+"</td>"+
"</tr>"+
"</table>"+
"<br />"+

"<label><center> <font color=\"black\"><u><b>IT ASSET PROVIDED</b></u></font></center> </label> "+
"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
"<tr>"+
"<td class=\"it1\" align=\"center\">Sl No.  </td>"+
"<td class=\"it2\" align=\"center\"  colspan=\"2\" > ITEM NAMES</td>"+
"<td class=\"it2\" colspan=\"2\" align=\"center\">INITIATOR REMARKS </td>"+
"<td class=\"it2\" colspan=\"2\" align=\"center\">IT MANAGER REMARKS</td>"+
"</tr>"+
"<tr>"+

"<td class=\"it1\" align=\"center\">1  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\"> Laptop/Desktop Model :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_model+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_model+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it1a+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">1 a </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\"> Password info passed on to :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_model_info+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_model_info+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it18r+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">2  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Data Card :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_data_card+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_data_card+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it2b+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">3  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Email Id :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_email+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_email+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it3c+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">3 a  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Mobile Phone Model :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_mobile_model+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\">"+r_mobile_model+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it6f+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">3 b  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Mobile No (Intune) :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_mobile_no+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_mobile_no+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it7g+"</td>"+
"</tr>"+
"<tr>"+
"<td class=\"it1\" align=\"center\">3 c </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Mobile Number (Company Provided SIM) :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_compmobile_no+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_compmobile_no+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it11k+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">4  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Domain User :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_domain+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_domain+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it5e+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">5  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Access Card/Biometric :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_access_card+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_access_card+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it8h+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">6  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Shared Folder :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_shared_card+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_shared_card+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it12l+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">7  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Internet Access / FTP Access :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_internet+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_internet+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it13m+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">8  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Newins Id :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_newins+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+r_newins+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it4d+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">9  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">NExAS/SAP ID :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_nexas+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_nexas+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it10jnexas+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">10  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">GS-NET :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_gsnet+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_gsnet+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it14n+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">11  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Internal Application :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_internal+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_internal+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it15o+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">12  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">DSC Dongle Received :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_dsc+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_dsc+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it16p+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">13  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">VPN :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+vpn+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_vpn+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it17q+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">14  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Hard Disk/Pen Drive :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+a_drive+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+r_drive+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+it9i+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">15  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Any Other Asset :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_other_asset+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+r_other_asset+"</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+it10j+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">16  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">NEx-GLOW :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\"> "+a_nexglow+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+r_nexglow+"</td>"+
"<td class=\"it2\"  bgcolor=\"white\" >"+it19s+"</td>"+
"</tr>"+

"<tr>"+
"<td class=\"it1\" align=\"center\">17  </td>"+
"<td class=\"it2\" style=\"text-align: right;width:23%;\">Airline / Liner Login :</td>"+
"<td class=\"it2\" bgcolor=\"white\" style=\"text-align:left;width:25%;\">"+airLin+"</td>"+
"<td class=\"it2\">Remarks :</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+rairLin+"</td>"+
"<td class=\"it2\" bgcolor=\"white\"  >"+itrairLin+"</td>"+
"</tr>"+

"</table>"+
"<br />"+
"<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
"<tr>"+
"<td height=\"20\" bgcolor=\"grey\" width=\"120\" align=center><font size=\"2\" color=\"black\"><b>NAME</b></font></td>"+
"<td bgcolor=\"grey\" width=\"120\" align=center><font size=\"2\" color=\"black\"><b>DESIGNATION</b></font></td>"+
"<td bgcolor=\"grey\" width=\"120\" align=center><font size=\"2\" color=\"black\"><b>STATUS</b></font></td>"+
"<td bgcolor=\"grey\" width=\"120\" align=center><font size=\"2\" color=\"black\"><b>REMARKS</b></font></td>"+
"<td bgcolor=\"grey\" width=\"120\" align=center><font size=\"2\" color=\"black\"><b>DATE</b></font></td>"+
"</tr>");
		
pst3 = con.prepareStatement("select form1_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y'),mail from form1_it_clearance_item WHERE form1_no=? AND desg <> 'none' ORDER BY id ASC");
pst3.setString(1, form1_no);
rs3 = pst3.executeQuery();
while(rs3.next())
{
String desgD= rs3.getString(2);
String empD= rs3.getString(3);
String statusD= rs3.getString(4);
String remarksD= rs3.getString(5);
String f_dateD= rs3.getString(6);

stringBuffer.append("<tr>"+
"<td bgcolor=\"white\" width=\"100\"><font size=\"2\" color=\"black\">"+empD+"</font></td>"+
"<td bgcolor=\"white\" width=\"100\"><font size=\"2\" color=\"black\">"+desgD+"</font></td>");
if(statusD.equals("Approved")){	
stringBuffer.append("<td bgcolor=\"green\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
}
else if(statusD.equals("Not Approved")){	
stringBuffer.append("<td bgcolor=\"red\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
}
else if(statusD.equals("Pending")){	
stringBuffer.append("<td bgcolor=\"orange\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
}
else{
stringBuffer.append("<td bgcolor=\"yellow\" width=\"100\"><font size=\"2\" color=\"black\">"+statusD+"</font></td>");
}
stringBuffer.append("<td bgcolor=\"white\" width=\"100\"><font size=\"2\" color=\"black\">"+remarksD+"</font></td>"+
"<td bgcolor=\"white\" width=\"100\"><font size=\"2\" color=\"black\">"+f_dateD+"</font></td>"+
"</tr>");     
}
stringBuffer.append("</table>"+
"</br>"); 

stringBuffer.append("<br>"+
"<br>"+
"__________________________________________________________________________________________________________________________________________________"+
"<br><br>"+
"</center><br><br>"+
"</head>"+
"</html>");   	
}
}
catch (Exception e) {
// TODO: handle exception

System.out.println("catch   ---");
e.printStackTrace();

System.out.println(e.toString());
}finally{
DbUtil.closeDBResources(null,pst,con);
DbUtil.closeDBResources(rs2,pst2,null);
DbUtil.closeDBResources(rs3,pst3,null);
DbUtil.closeDBResources(rs4,pst4,null);


}
//stringBuffer.delete(0, stringBuffer.length());
//stringBuffer.setLength(0);
//stringBuffer.setLength(1);
return stringBuffer.toString();	
}
}
