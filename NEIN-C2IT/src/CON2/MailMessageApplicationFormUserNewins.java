package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


//@WebServlet("/MailMessageApplicationFormUserNewins")
public class MailMessageApplicationFormUserNewins {
	String driver;
	Date gdate = null;

//String form2_no="NEIN/CS/APP-FORM/10-1";

public String getMailMessageAppFormNewins(String form)
{
	//form=form2_no;
	StringBuffer stringBuffer = new StringBuffer();
	Connection con=null;
	PreparedStatement pst=null,pst2=null,pst3=null,pst4=null;   
	ResultSet resultSet=null,rs2=null,rs3=null,rs4=null;
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
rs4 = pst2.executeQuery();
	while(rs4.next()){
	branch = rs4.getString("branch");
	depart = rs4.getString("department");
	full_name = rs4.getString("full_name");
	emp_code = rs4.getString("employee_code");
	designation = rs4.getString("designation");
	r_officer = rs4.getString("report_officer");
	scopeOfWork = rs4.getString("scope_Of_Work");
	requestBy = rs4.getString("requested_By");
	emp_type = rs4.getString("emp_type");
	emp_contract_type = rs4.getString("emp_contract_type");
	requestOption = rs4.getString("request_type");
	requested_branch = rs4.getString("m_b_name");
	requestFor = rs4.getString("requestFor");
	}
	
String newinBranch="",newinOP="",newinReq="",newinRem="",nexComCode="",nexCostName="",nexCostCode="",nexOPRange="",nexReq="",nexOptiMenu="",nexRem="",gsnetBC="",gsnetdiv="",gsnetpri="",gsnetuser="",gsnetRem="",glowProject="",glowWarehouse="",glowRemarks="";
pst4 = con.prepareStatement("select newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,case when nexasReqType='HOAcUser' then 'HO Acounting User' when nexasReqType='BRAcUser' then 'Branch Acounting User' when nexasReqType='ITUser' then 'IT User' when nexasReqType='RepoDispOnly' then 'Report display only User' end as nexasReqType,nexasOptionalMenu,nexasRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,glowProject,glowWarehouse,glowRemarks from neinapplicationform_requestfor where app_no=?");
pst4.setString(1, form);
rs2 = pst4.executeQuery();
	while(rs2.next()){
		newinBranch 	= rs2.getString("newinsBranchCode");
		newinOP 		= rs2.getString("newinsOpCode");
		newinReq 		= rs2.getString("newinsRequest");
		newinRem 		= rs2.getString("newinsRemarks");
		nexComCode 		= rs2.getString("nexasCompCode");
		nexCostName 	= rs2.getString("nexasCCName");
		nexCostCode 	= rs2.getString("nexasCCCode");
		nexOPRange 		= rs2.getString("nexasOPRange");
		nexReq	 		= rs2.getString("nexasReqType");
		nexOptiMenu 	= rs2.getString("nexasOptionalMenu");
		nexRem 			= rs2.getString("nexasRemarks");
		gsnetBC 		= rs2.getString("gsnetBranchCode");
		gsnetdiv 		= rs2.getString("gsnetDivName");
		gsnetpri 		= rs2.getString("gsnetPrimaryDiv");
		gsnetuser 		= rs2.getString("gsnetUserRole");
		gsnetRem 		= rs2.getString("gsnetRemarks");
		glowProject		= rs2.getString("glowProject");
		glowWarehouse	= rs2.getString("glowWarehouse");
		glowRemarks		= rs2.getString("glowRemarks");
	}
	
String nexOptiMenu1 = "";

if(nexOptiMenu.contains("paymentProp")) {
	nexOptiMenu1+= "Payment Proposal"+", ";
}if(nexOptiMenu.contains("paymentAppr")) {
	nexOptiMenu1+= "Payment Approval"+", ";	
}if(nexOptiMenu.contains("openCloseSch")) {
	nexOptiMenu1+= "Open/Close Schedule"+", ";
}if(nexOptiMenu.contains("voidCheq")) {
	nexOptiMenu1+= "Void Cheque"+", ";
}if(nexOptiMenu.contains("issueCheq")) {
	nexOptiMenu1+= "Issue Cheque"+", ";
}if(nexOptiMenu.contains("taxRepo")) {
	nexOptiMenu1+= "Tax Report"+", ";
}if(nexOptiMenu.contains("ExchangRateMa")) {
	nexOptiMenu1+= "Exchange Rate Maintainance"+", ";
}if(nexOptiMenu.contains("offsetAc")) {
	nexOptiMenu1+= "Offset Account"+", ";
}if(nexOptiMenu.contains("addfreeMaster")) {
	nexOptiMenu1+= "Addfree master Maintainance"+", ";
}if(nexOptiMenu.contains("paymentOpeBranch")) {
	nexOptiMenu1+= "Payment operation of branch"+", ";
}if(nexOptiMenu.contains("batchInput")) {
	nexOptiMenu1+= "Batch Input"+", ";
}if(nexOptiMenu.contains("SEPABACS")) {
	nexOptiMenu1+= "SEPA.BACS data Download"+", ";
}

if(!nexOptiMenu1.equals("")) {	
	nexOptiMenu1 = nexOptiMenu1.substring(0,nexOptiMenu1.length()-2);
}
if(!newinBranch.equals("")) {
	newinBranch	 = newinBranch.substring(0, newinBranch.length()-1);
}
if(!requestFor.equals("")) {
	requestFor = requestFor.substring(0, requestFor.length());
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

	if(requestFor.contains("NEWINS")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NEWINS</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Requested Branch Code</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinBranch+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Requested NEWIN's ID / Operator Code</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinOP+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Request </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinReq+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinRem+"</td> "+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("NExAS")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NExAS</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Company Code</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexComCode+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Cost Center Name</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexCostName+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Cost Center Code </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexCostCode+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Operation range </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexOPRange+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Request Type </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexReq+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Optional menu </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexOptiMenu1+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexRem+"</td> "+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("GS-NET")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>GS-NET</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Requested GSNET Branch Code</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetBC+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Requested Division Name</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetdiv+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Requested Primary Division </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetpri+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Requested User Role </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetuser+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetRem+"</td> "+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("NEx-GLOW")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NEx-GLOW</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Project</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+glowProject+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Ware-House</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+glowWarehouse+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+glowRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
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
