package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailMessageApplicationFormUserEmail {
	String driver;
	Date gdate = null;

//String form2_no="NEIN/CS/APP-FORM/10-1";

public String getMailMessageAppFormEmail(String form)
{
	//form=form2_no;
	StringBuffer stringBuffer = new StringBuffer();
	Connection con=null;
	PreparedStatement pst=null,pst2=null,pst3=null,pst4=null,pst22=null;   
	ResultSet resultSet=null,rs2=null,rs3=null,rs4=null,rs22=null;
	try{
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();

	pst= con.prepareStatement("SELECT applicationNo,applicationDate FROM neinapplicationform where applicationNo=?");
	pst.setString(1,form);
		
	resultSet = pst.executeQuery();
	System.out.println("before while");
	while(resultSet.next()){		
	gdate = resultSet.getDate(2);
	}
	stringBuffer.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
	"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
    "<head>"+
    "<jsp:useBean id =con class=CON2.Connection2 />"+
    "<center>"+
    " "+
	"____________________________________________________________________________________________________________________"+
	"<table border=\"0\" align=\"center\" width=\"80%\"><tr><td>"+
	"<center>"+
	"<label><font color=\"black\"><u><b>APPLICATION FORM</b></u></font></label> <br />"+
	"</center></td></tr></table>"+
	"<br><br>");

String branch=null,depart=null,full_name=null,emp_code=null,designation=null,r_officer=null,scopeOfWork=null,requestBy=null,requestOption=null,emp_type=null,emp_contract_type=null,requested_branch=null,requestFor=null;
pst2 = con.prepareStatement("select * from neinapplicationform nein left outer join branch_master_main br on br.m_b_no=nein.requested_branch where applicationNo=?");
	pst2.setString(1, form);
	rs2 = pst2.executeQuery();
	while(rs2.next()){
	branch 				= rs2.getString("branch");
	depart 				= rs2.getString("department");
	full_name 			= rs2.getString("full_name");
	emp_code 			= rs2.getString("employee_code");
	designation 		= rs2.getString("designation");
	r_officer 			= rs2.getString("report_officer");
	scopeOfWork 		= rs2.getString("scope_Of_Work");
	requestBy 			= rs2.getString("requested_By");
	emp_type 			= rs2.getString("emp_type");
	emp_contract_type 	= rs2.getString("emp_contract_type");
	requestOption 		= rs2.getString("request_type");
	requested_branch 	= rs2.getString("m_b_name");
	requestFor 			= rs2.getString("requestFor");
	}
	
String domain="",empType="",mailRequest="",compProvMobile="",makeModel="",mobIntune="",mobNo="",imei1="",imei2="",domRemarks="",compProvSimNumber="",compProvSimCard="";

pst22 = con.prepareStatement("select * from neinapplicationform_requestfor where app_no=?");
	pst22.setString(1, form);
	rs22 = pst22.executeQuery();
	while(rs22.next()){
		domain 			= rs22.getString("emailDomain");
		empType 		= rs22.getString("employeeType");
		mailRequest 	= rs22.getString("reqMailID");
		compProvMobile 	= rs22.getString("CompanyProvMobile");
		makeModel 		= rs22.getString("makeAndModel");
		compProvSimCard	= rs22.getString("compProvSimCard");
		compProvSimNumber= rs22.getString("compProvSimNumber");
		mobIntune 		= rs22.getString("mobIntune");
		mobNo 			= rs22.getString("mobileNo");
		imei1 			= rs22.getString("imei1");
		imei2 			= rs22.getString("imei2");
		domRemarks 		= rs22.getString("emailRemarks");
	}

	if(!emp_contract_type.equalsIgnoreCase("Contract")){
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"2\" bgcolor=\"grey\" align=\"center\"><b>FORM NUMBER</b></td>"+
	"<td colspan=\"2\" align=\"center\"><b>"+form+"</b></td>"+
	"</tr>"+
							        		  
	"<tr>"+
	"<td>Employee Code</td>"+
	"<td bgcolor=\"white\">"+emp_code+"</td>"+
	"<td>Full Name</td>"+
	"<td bgcolor=\"white\">"+full_name+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Branch</td>"+
	"<td bgcolor=\"white\">"+branch+"</td>"+
	"<td>Department</td>"+
	"<td bgcolor=\"white\">"+depart+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td>Designation</td>"+
	"<td bgcolor=\"white\">"+designation+"</td>"+
	"<td>Reporting Officer</td>"+
	"<td bgcolor=\"white\">"+r_officer+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Scope Of Work</td>"+
	"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
	"<td>Requested By</td>"+
	"<td bgcolor=\"white\">"+requestBy+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Employee Type</td>"+
	"<td bgcolor=\"white\">"+emp_type+"</td>"+
	"<td>Employee Contract Type</td>"+
	"<td bgcolor=\"white\">"+emp_contract_type+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Request Type</td>"+
	"<td bgcolor=\"white\">"+requestOption+"</td>"+
	"<td>Requested Branch</td>"+
	"<td bgcolor=\"white\">"+requested_branch+"</td>"+
	"</tr>"+
	"</table>");
	
	}else{

	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"2\" bgcolor=\"grey\" align=\"center\"><b>FORM NUMBER</b></td>"+
	"<td colspan=\"2\" align=\"center\"><b>"+form+"</b></td>"+
	"</tr>"+
							        		  
	"<tr>"+
	"<td>Employee Name</td>"+
	"<td bgcolor=\"white\">"+full_name+"</td>"+
	"<td>Branch</td>"+
	"<td bgcolor=\"white\">"+branch+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Department</td>"+
	"<td bgcolor=\"white\">"+depart+"</td> "+
	"<td>Designation</td>"+
	"<td bgcolor=\"white\">"+designation+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Reporting Officer</td>"+
	"<td bgcolor=\"white\">"+r_officer+"</td>"+
	"<td>Scope Of Work</td>"+
	"<td bgcolor=\"white\">"+scopeOfWork+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Requested By</td>"+
	"<td bgcolor=\"white\">"+requestBy+"</td>"+
	"<td>Employee Contract Type</td>"+
	"<td bgcolor=\"white\">"+emp_contract_type+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Request Type</td>"+
	"<td bgcolor=\"white\">"+requestOption+"</td>"+
	"<td>Requested Branch</td>"+
	"<td bgcolor=\"white\">"+requested_branch+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Request For</td>"+
	"<td colspan=\"3\" bgcolor=\"white\">"+requestFor.substring(0, requestFor.length())+"</td>"+
	"</tr>"+
	"</table>"+
	"<label><center> <font color=\"black\"><u><b>Requester Details</b></u></font></center> </label> "+
	"<br />");
	}
	
	stringBuffer.append("<label><center> <font color=\"black\"><u><b>Requester Details</b></u></font></center> </label> "+
	"<br />");
	
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+	
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><font size=\"4\"><b>Email ID</b></font></td>"+
	"</tr>"+
	"<tr>"+
	"<td>Email Domain Code</td>"+
	"<td bgcolor=\"white\">"+domain+"</td>"+
	"<td>Employee Type</td>"+
	"<td bgcolor=\"white\">"+empType+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td>Requested E-Mail ID</td>"+
	"<td bgcolor=\"white\">"+mailRequest+"</td>"+
	"</tr>");
	if(compProvMobile.equalsIgnoreCase("Yes")) {		
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Company Provided Mobile</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+compProvMobile+"</td>"+
	"<td colspan=\"1\">Mobile Make and Model</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+makeModel+"</td>"+
	"</tr>");
	}else{
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Company Provided Mobile</td>"+
	"<td colspan=\"3\" bgcolor=\"white\">"+compProvMobile+"</td>"+
	"</tr>");
	}
	
	if(compProvSimCard.equalsIgnoreCase("Yes")) {		
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Company Provided SIM Card</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+compProvSimCard+"</td>");
	stringBuffer.append("<td colspan=\"1\">SIM Card Mobile Number</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+compProvSimNumber+"</td>"+
	"</tr>");
	}else{
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Company Provided SIM Card</td>"+
	"<td colspan=\"3\" bgcolor=\"white\">"+compProvSimCard+"</td>"+	
	"</tr>");
	}

	if(mobIntune.equalsIgnoreCase("Yes")) {
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Mobile Access (Intune)</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+mobIntune+"</td>");
	stringBuffer.append("<td colspan=\"1\">Mobile No.</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+mobNo+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td colspan=\"4\" align=\"center\">IMEI No. ('s)</td>"+
	"</tr>"+
	"<tr>"+	
	"<td colspan=\"1\">IMEI No 1</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+imei1+"</td>"+
	"<td colspan=\"1\">IMEI No 2</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+imei2+"</td>"+
	"</tr>");
	}else{
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Mobile Access (Intune)</td>"+
	"<td colspan=\"3\" bgcolor=\"white\">"+mobIntune+"</td>"+
	"</tr>");
	}
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Remarks.</td>"+
	"<td colspan=\"3\" bgcolor=\"white\">"+domRemarks+"</td>"+
	"</tr>"+
	"</table>");

	stringBuffer.append("<label><center> <font color=\"black\"><u><b>ApprovalRoutine</b></u></font></center> </label> "+
	"<br />");
	
	stringBuffer.append("<table width=\"80%\" border=\"1\" align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">NAME</font></td>"+
	"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DESIGNATION</font></td>"+
	"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">STATUS</font></td>"+
	"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">REMARKS</font></td>"+
	"<td bgcolor=\"grey\" width=\"120\" align=\"center\"><font size=\"2\" color=\"black\">DATE</font></td>"+
	"</tr>");
	
	String desgD=null,empD=null,statusD=null,remarksD=null,f_dateD=null;
	 pst3 = con.prepareStatement("select form2_no,desg,emp,status,remarks,DATE_FORMAT(f_date,'%d/%m/%Y') as f_date from neinapplicationform_item WHERE form2_no=? AND desg <> 'none' ORDER BY item_id ASC");
     pst3.setString(1,form);
   
     rs3 = pst3.executeQuery();
	  while(rs3.next())
	  {
		   desgD= rs3.getString("desg");
		   empD= rs3.getString("emp");
		   statusD= rs3.getString("status");
		   remarksD= rs3.getString("remarks");
		   f_dateD= rs3.getString("f_date");
	
		
    stringBuffer.append("<tr>"+
 		   "<td><font size=\"2\" color=\"black\">"+empD+"</font></td>"+
 		   "<td><font size=\"2\" color=\"black\">"+desgD+"</font></td>");
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
 stringBuffer.append("<td><font size=\"2\" color=\"black\">"+remarksD+"</font></td>"+
 		   "<td><font size=\"2\" color=\"black\">"+f_dateD+"</font></td>"+
 		   "</tr>");     
	  }
	
	
	stringBuffer.append("</table>"+	
	"<br>"+
	"<br>"+
	"</head>"+
	"</html>"+	
	"<center>"+
	" "+
	"____________________________________________________________________________________________________________________"+
	"<br><br>");
	}
	catch (Exception e) {
	// TODO: handle exception
	System.out.println("catch   ---");
	e.printStackTrace();
	System.out.println("here====>"+e.toString());
	}
	finally{
	DbUtil.closeDBResources(null,pst,con);
	DbUtil.closeDBResources(rs2,pst2,null);
	DbUtil.closeDBResources(rs3,pst3,null);
	DbUtil.closeDBResources(rs4,pst4,null);
	}
	return stringBuffer.toString();	
	}
}
