package CON2;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//@WebServlet("/MailMessageApplicationFormUserSubmission")
public class MailMessageApplicationFormUserSubmission {
	String driver;
	Date gdate = null;

//String form2_no="NEIN/CS/APP-FORM/10-1";

public String getMailMessageAppFormSubmission(String form)
{
	//form=form2_no;
	StringBuffer stringBuffer = new StringBuffer();
	Connection con=null;
	PreparedStatement pst=null,pst2=null,pst3=null,pst4=null,pst44=null;   
	ResultSet resultSet=null,rs2=null,rs3=null,rs4=null,rs44=null;
	try{
	System.out.println("value of MR ID "+form);
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
	"<label><font color=\"black\"><u><b>USER APPLICATION FORM</b></u></font></label> <br />"+
	"</center></td></tr></table>"+
	"<br><br>");
	System.out.println("hhhhhhhhh"+form);
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
	
String domain="",empType="",mailCreated="",mailRequest="",intuneProvided="",compProvMobile="",makeModel="",mobIntune="",mobNo="",imei1="",imei2="",emRemarks="",domRemarks="",bioRemarks="",folderRemarks="",internetReqType="",internetRemarks="",newinBranch="",newinOP="",newinReq="",newinRem="",nexComCode="",nexCostName="",nexCostCode="",nexOPRange="",nexReq="",nexOptiMenu="",nexRem="",gsnetBC="",gsnetdiv="",gsnetpri="",gsnetuser="",gsnetRem="",internalApplication="",internalRemarks="",usbAccessFor="",usbDetails="",usbRemarks="",vpnDomainID="",vpnEmailID="",vpnMPLS="",hardPenRemarks="",otherAssetRemarks="",compProvSimNumber="",compProvSimCard="",glowProject="",glowWarehouse="",glowRemarks="",previousBranchesNewins="",changesNewins="",changesGSNet="",prevBRCodesGSNet="",prevDivGSNet="",prevPDivGSNet="",prevRoleGSNet="",passReset="",chanReqBio="",selBioBranches="";
String domainAccount="",domainPassword="",domainAppRemarks="",bioAppRemarks="",sharedAppRemarks="",internetAPPRemarks="",newinsOPAppCode="",newinsPassword="",newinsLevel="",newinsAccessedBranches="",newinBlocked="",newinAllowed="",newinsAppRemarks="",nexasID="",nexasPassword="",nexasAppRemarks="",gsnetCode="",gsnetPassword="",assignedGsnetBranch="",assignedGsnetDivName="",assignedGsnetPriDiv="",assignedGsnetUserRole="",gsnetAppRemarks="",internalID="",internalPassword="",internalAppRemarks="",usbAppRemarks="",vpnFortiToken="",hardPenAppRemarks="",otherAssetAppRemarks="",emailAppRemarks="",emailPassword="",glowID="",glowPass="",glowAppRemarks="";

pst4 = con.prepareStatement("select emailDomain,group_name,employeeType,mailIDCreated,reqMailID,intuneAccessProvided,CompanyProvMobile,makeAndModel,mobIntune,mobileNo,imei1,imei2,emailRemarks,domainRemarks,bioRemarks,folderRemarks,internetReqType,internetRemarks,newinsBranchCode,newinsOpCode,newinsRequest,newinsRemarks,nexasCompCode,nexasCCName,nexasCCCode,nexasOPRange,case when nexasReqType='HOAcUser' then 'HO Acounting User' when nexasReqType='BRAcUser' then 'Branch Acounting User' when nexasReqType='ITUser' then 'IT User' when nexasReqType='RepoDispOnly' then 'Report display only User' end as nexasReqType ,nexasOptionalMenu,nexasRemarks,gsnetBranchCode,gsnetDivName,gsnetPrimaryDiv,gsnetUserRole,gsnetRemarks,internalApplication,internalRemarks,usbAccessFor,usbDetails,usbRemarks,vpnDomainID,vpnEmailID,vpnMPLS,hardPenRemarks,otherAssetRemarks,domainAccount,domainPassword,domainAppRemarks,bioAppRemarks,sharedAppRemarks,internetAPPRemarks,newinsOPAppCode,newinsPassword,newinsLevel,newinsGroup,newinsAccessedBranches,newinBlocked,newinAllowed,newinsAppRemarks,nexasID,nexasPassword,nexasAppRemarks,gsnetCode,gsnetPassword,assignedGsnetBranch,assignedGsnetDivName,assignedGsnetPriDiv,assignedGsnetUserRole,gsnetAppRemarks,internalID,internalPassword,internalAppRemarks,usbAppRemarks,vpnFortiToken,hardPenAppRemarks,otherAssetAppRemarks,compProvSimCard,compProvSimNumber,emailPassword,emailAppRemarks,passReset,chanReqBio,selBioBranches,glowProject,glowWarehouse,glowRemarks,previousBranchesNewins,changesNewins,changesGSNet,prevBRCodesGSNet,prevDivGSNet,prevPDivGSNet,prevRoleGSNet,glowID,glowPass,glowAppRemarks from neinapplicationform_requestfor where app_no=?");
pst4.setString(1, form);
rs2 = pst4.executeQuery();
	while(rs2.next()){
		//email
		domain 			= rs2.getString("emailDomain");
		//group 			= rs2.getString("group_name");
		empType 		= rs2.getString("employeeType");
		mailRequest 	= rs2.getString("reqMailID");
		compProvMobile 	= rs2.getString("CompanyProvMobile");
		makeModel 		= rs2.getString("makeAndModel");
		compProvSimCard	= rs2.getString("compProvSimCard");
		compProvSimNumber= rs2.getString("compProvSimNumber");
		mobIntune 		= rs2.getString("mobIntune");
		mobNo 			= rs2.getString("mobileNo");
		imei1 			= rs2.getString("imei1");
		imei2 			= rs2.getString("imei2");
		emRemarks 		= rs2.getString("emailRemarks");
		//domain
		domRemarks		= rs2.getString("domainRemarks");
		//biometric
		bioRemarks		= rs2.getString("bioRemarks");
		//folder
		folderRemarks	= rs2.getString("folderRemarks");
		//Internet Access / FTP Access
		internetReqType = rs2.getString("internetReqType");
		internetRemarks = rs2.getString("internetRemarks");
		//newins
		newinBranch 	= rs2.getString("newinsBranchCode");
		newinOP 		= rs2.getString("newinsOpCode");
		newinReq 		= rs2.getString("newinsRequest");
		newinRem 		= rs2.getString("newinsRemarks");
		//nexas
		nexComCode 		= rs2.getString("nexasCompCode");
		nexCostName 	= rs2.getString("nexasCCName");
		nexCostCode 	= rs2.getString("nexasCCCode");
		nexOPRange 		= rs2.getString("nexasOPRange");
		nexReq	 		= rs2.getString("nexasReqType");
		nexOptiMenu 	= rs2.getString("nexasOptionalMenu");
		nexRem 			= rs2.getString("nexasRemarks");
		//gsnet
		gsnetBC 		= rs2.getString("gsnetBranchCode");
		gsnetdiv 		= rs2.getString("gsnetDivName");
		gsnetpri 		= rs2.getString("gsnetPrimaryDiv");
		gsnetuser 		= rs2.getString("gsnetUserRole");
		gsnetRem 		= rs2.getString("gsnetRemarks");
		//Internal
		internalApplication = rs2.getString("internalApplication");
		internalRemarks		= rs2.getString("internalRemarks");
		//usb
		usbAccessFor		= rs2.getString("usbAccessFor");
		usbDetails			= rs2.getString("usbDetails");
		usbRemarks			= rs2.getString("usbRemarks");
		//vpn
		vpnDomainID			= rs2.getString("vpnDomainID");
		vpnEmailID			= rs2.getString("vpnEmailID");
		vpnMPLS				= rs2.getString("vpnMPLS");
		//HardDisk / PenDrive
		hardPenRemarks	= rs2.getString("hardPenRemarks");
		//other asset
		otherAssetRemarks= rs2.getString("otherAssetRemarks");
		//nex-glow
		glowProject			= rs2.getString("glowProject");
		glowWarehouse		= rs2.getString("glowWarehouse");
		glowRemarks			= rs2.getString("glowRemarks");
		//new columns
		passReset						= rs2.getString("passReset")==null?"":rs2.getString("passReset");
		chanReqBio						= rs2.getString("chanReqBio")==null?"":rs2.getString("chanReqBio");
		selBioBranches					= rs2.getString("selBioBranches")==""?"0":rs2.getString("selBioBranches");
		previousBranchesNewins			= rs2.getString("previousBranchesNewins");
		changesNewins					= rs2.getString("changesNewins")==null?"":rs2.getString("changesNewins");
		changesGSNet					= rs2.getString("changesGSNet")==null?"":rs2.getString("changesGSNet");
		prevBRCodesGSNet				= rs2.getString("prevBRCodesGSNet");
		prevDivGSNet					= rs2.getString("prevDivGSNet");
		prevPDivGSNet					= rs2.getString("prevPDivGSNet");
		prevRoleGSNet					= rs2.getString("prevRoleGSNet");
		
		////////////////////////////////////////////////////////it filled details////////////////////////////////////////////////////////
		//email
		mailCreated 				= rs2.getString("mailIDCreated");
		emailPassword				= rs2.getString("emailPassword");
		intuneProvided 				= rs2.getString("intuneAccessProvided");
		emailAppRemarks				= rs2.getString("emailAppRemarks");
		//domain
		domainAccount				= rs2.getString("domainAccount");
		domainPassword				= rs2.getString("domainPassword");
		domainAppRemarks			= rs2.getString("domainAppRemarks");
		//biometric
		bioAppRemarks				= rs2.getString("bioAppRemarks");
		//shared
		sharedAppRemarks			= rs2.getString("sharedAppRemarks");
		//internet
		internetAPPRemarks			= rs2.getString("internetAPPRemarks");
		//newins
		newinsOPAppCode				= rs2.getString("newinsOPAppCode");
		newinsPassword				= rs2.getString("newinsPassword");
		newinsLevel					= rs2.getString("newinsLevel");
		//newinsGroup					= rs2.getString("newinsGroup");
		newinsAccessedBranches		= rs2.getString("newinsAccessedBranches");
		newinBlocked				= rs2.getString("newinBlocked");
		newinAllowed				= rs2.getString("newinAllowed");
		newinsAppRemarks			= rs2.getString("newinsAppRemarks");
		//nexas
		nexasID						= rs2.getString("nexasID");
		nexasPassword				= rs2.getString("nexasPassword");
		nexasAppRemarks				= rs2.getString("nexasAppRemarks");
		//gsnet
		gsnetCode					= rs2.getString("gsnetCode");
		gsnetPassword				= rs2.getString("gsnetPassword");
		assignedGsnetBranch			= rs2.getString("assignedGsnetBranch");
		assignedGsnetDivName		= rs2.getString("assignedGsnetDivName");
		assignedGsnetPriDiv			= rs2.getString("assignedGsnetPriDiv");
		assignedGsnetUserRole		= rs2.getString("assignedGsnetUserRole");
		gsnetAppRemarks				= rs2.getString("gsnetAppRemarks");
		//internal
		internalID					= rs2.getString("internalID");
		internalPassword			= rs2.getString("internalPassword");
		internalAppRemarks			= rs2.getString("internalAppRemarks");
		//usb
		usbAppRemarks				= rs2.getString("usbAppRemarks");
		//vpn
		vpnFortiToken				= rs2.getString("vpnFortiToken");
		//harddisk
		hardPenAppRemarks			= rs2.getString("hardPenAppRemarks");
		//other assets
		otherAssetAppRemarks		= rs2.getString("otherAssetAppRemarks");
		//nex-glow
		glowID						= rs2.getString("glowID");
		glowPass					= rs2.getString("glowPass");
		glowAppRemarks				= rs2.getString("glowAppRemarks");
		

	}
	
	String selBioBranches1="";
	if(!selBioBranches.equalsIgnoreCase("") && !selBioBranches.equalsIgnoreCase(null)) {
	pst44 = con.prepareStatement("select m_b_name from branch_master_main where m_b_no in ("+selBioBranches+") ORDER BY m_b_name Asc");
	rs44 = pst44.executeQuery();
	while(rs44.next()){
		selBioBranches1 += rs44.getString(1)+", ";
	}
	}

	if(!selBioBranches1.equals("")){
		selBioBranches1 = selBioBranches1.substring(0,selBioBranches1.length()-2);
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
	if(!internalApplication.equals("")) {
		internalApplication = internalApplication.substring(0, internalApplication.length()-1);
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
	
	if(requestFor.contains("Email ID")) {
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
	"<td colspan=\"3\" bgcolor=\"white\">"+emRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Domain Account")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Domain Account</b></td>"+
	"</tr>");			
	if(passReset.equalsIgnoreCase("yes")){
	stringBuffer.append("<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password Reset</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+passReset+"</td>"+
	"</tr>");
	}
	stringBuffer.append("<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Domain Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+domRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Biometric / Access Card")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Biometric / Access Card</b></td>"+
	"</tr>");				     
	if(chanReqBio.equalsIgnoreCase("yes")){
	stringBuffer.append("<tr>"+
	"<td colspan=\"1\">Changes Required ?</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+chanReqBio+"</td>"+
	"<td colspan=\"1\">Branch ('s)</td>"+
	"<td colspan=\"1\" bgcolor=\"white\">"+selBioBranches1+"</td>"+
	"</tr>");
	}
	stringBuffer.append("<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Biometric / Access Card Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+bioRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}

	if(requestFor.contains("Shared Folder")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Shared Folder Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Shared Folder Access Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+folderRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Internet Access / FTP Access")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Internet Access / FTP Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Request Type</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internetReqType+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Internet Access / FTP Access Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internetRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("NEWINS")) {
		stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		"<tr>"+
		"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NEWINS</b></td>"+
		"</tr>");		
		if(changesNewins.equalsIgnoreCase("yes")){
		stringBuffer.append("<tr>"+
		"<td colspan=\"1\">Changes Required ?</td>"+
		"<td colspan=\"1\" bgcolor=\"white\">"+changesNewins+"</td>"+
		"<td colspan=\"1\">Previously Selected Branch ('s)</td>"+
		"<td colspan=\"1\" bgcolor=\"white\">"+previousBranchesNewins+"</td>"+
		"</tr>");
		}
		stringBuffer.append("<tr>"+
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
		"</tr>");
		if(!newinReq.equalsIgnoreCase("new")){
		stringBuffer.append("<tr>"+
		"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
		"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinRem+"</td> "+
		"</tr>");
		}
		stringBuffer.append("</table>");
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
		"<tr>");
		stringBuffer.append("<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>GS-NET</b></td>"+
		"</tr>");
		if(changesGSNet.equalsIgnoreCase("yes")){
			stringBuffer.append("<tr>"+
			"<td colspan=\"1\">Changes Required ?</td>"+
			"<td colspan=\"3\" bgcolor=\"white\">"+changesGSNet+"</td>"+
			"</tr>");
			stringBuffer.append("<tr>"+
			"<td colspan=\"1\">Previously Requested Branch Codes</td>"+
			"<td colspan=\"1\" bgcolor=\"white\">"+prevBRCodesGSNet+"</td>"+
			"<td colspan=\"1\">Previously Requested Division Name</td>"+
			"<td colspan=\"1\" bgcolor=\"white\">"+prevDivGSNet+"</td>"+
			"</tr>");
			stringBuffer.append("<tr>"+
			"<td colspan=\"1\">Previously Requested Primary Division</td>"+
			"<td colspan=\"1\" bgcolor=\"white\">"+prevPDivGSNet+"</td>"+
			"<td colspan=\"1\">Previously Requested User Role</td>"+
			"<td colspan=\"1\" bgcolor=\"white\">"+prevRoleGSNet+"</td>"+
			"</tr>");
			}
		stringBuffer.append("<tr>"+
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
	
	if(requestFor.contains("Internal Application")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Internal Application</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Internal Application</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internalApplication+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Internal Application Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internalRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("USB Access")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>USB Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Access For</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+usbAccessFor+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">USB Details</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+usbDetails+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks / Reason</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+usbRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("VPN Access")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>VPN Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Domain ID</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+vpnDomainID+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Email ID</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+vpnEmailID+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">MPLS / NON MPLS</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+vpnMPLS+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("HardDisk / PenDrive")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>HardDisk / PenDrive</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">HardDisk / PenDrive Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+hardPenRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}

	if(requestFor.contains("Any Other Asset")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Any Other Asset</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Any Other Asset Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+otherAssetRemarks+"</td>"+
	"</tr>"+
	"</table>"+
	"<br />"+
	"<br />");
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

	stringBuffer.append("<label><center> <font color=\"black\"><u><b>Details from IT</b></u></font></center> </label> "+
	"<br />");

	if(requestFor.contains("Email ID")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Email ID</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Email-ID Created</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+mailCreated+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+emailPassword+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Intune Access Provided</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+intuneProvided+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+emailAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Domain Account")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Domain Account</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Domain Account</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+domainAccount+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+domainPassword+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+domainAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Biometric / Access Card")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Biometric / Access Card</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Biometric / Access Card Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+bioAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}

	if(requestFor.contains("Shared Folder")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Shared Folder Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Shared Folder Access Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+sharedAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Internet Access / FTP Access")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Internet Access / FTP Access</b></td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Internet Access / FTP Access Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internetAPPRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("NEWINS")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NEWINS</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Operator Code</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinsOPAppCode+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinsPassword+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Level </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinsLevel+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Access Provided to Branche ('s)</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinsAccessedBranches+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Programs Blocked</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinBlocked+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Programs Allowed </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinAllowed+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+newinsAppRemarks+"</td> "+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("NExAS")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NExAS</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">NExAS User ID</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexasID+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexasPassword+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+nexasAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("GS-NET")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>GS-NET</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">User Code</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetCode+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetPassword+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Assigned GSNET Branch Code </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+assignedGsnetBranch+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Assigned Division Name</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+assignedGsnetDivName+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Assigned Primary Division </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+assignedGsnetPriDiv+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Assigned User Role </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+assignedGsnetUserRole+"</td> "+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+gsnetAppRemarks+"</td> "+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("Internal Application")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Internal Application</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">User ID</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internalID+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Password </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internalPassword+"</td>"+
	"</tr>"+
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Internal Application Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+internalAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("USB Access")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>USB Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+usbAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("VPN Access")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>VPN Access</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Forti Token Details </td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+vpnFortiToken+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("HardDisk / PenDrive")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>HardDisk / PenDrive</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">HardDisk / PenDrive Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+hardPenAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}

	if(requestFor.contains("Any Other Asset")) {
	stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
	"<tr>"+
	"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>Any Other Asset</b></td>"+
	"</tr>"+				        		  
	"<tr>"+
	"<td style=\"width:25%;\" colspan=\"1\">Any Other Asset Remarks</td>"+
	"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+otherAssetAppRemarks+"</td>"+
	"</tr>"+
	"</table>");
	}
	
	if(requestFor.contains("NEx-GLOW")) {
		stringBuffer.append("<table width=\"80%\" border=\"1\"  align=\"center\" bgcolor=\"#F0F0F0\" bordercolor=\"grey\">"+
		"<tr>"+
		"<td colspan=\"4\" bgcolor=\"grey\" align=\"center\"><b>NEx-GLOW</b></td>"+
		"</tr>"+				        		  
		"<tr>"+
		"<td style=\"width:25%;\" colspan=\"1\">User ID</td>"+
		"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+glowID+"</td>"+
		"</tr>"+
		"<tr>"+
		"<td style=\"width:25%;\" colspan=\"1\">Password</td>"+
		"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+glowPass+"</td>"+
		"</tr>"+
		"<tr>"+
		"<td style=\"width:25%;\" colspan=\"1\">NEx-GLOW Remarks</td>"+
		"<td style=\"width:75%;\" colspan=\"3\" bgcolor=\"white\">"+glowAppRemarks+"</td>"+
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
	DbUtil.closeDBResources(rs44,pst44,null);
	}
	return stringBuffer.toString();	
	}
}
