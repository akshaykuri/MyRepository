<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//ENhttp://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign other asset</title>
</head>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>

<body>
<%
	System.out.println("---- Inside NONIT Assign Other Asset DB-----");
	int stIT=0,stEmail=0,stNew=0,stDSC=0,stDom=0,stDC=0,stAC=0,stMob=0,stHD=0,stShF=0,stApC=0,stOth=0,stLotus=0,stFtp=0;   
    Date date = new Date();
    // display formatted date
    SimpleDateFormat ft = new SimpleDateFormat ("dd-MMM-YYYY");
    //System.out.printf("%s %td-%<tb-%<tY", "date:", date);
    String str = ft.format(date);
    // System.out.printf("date:", str);
    Connection conn = null;
	ResultSet rs = null,rs1 = null,rs2=null;
	Statement st2=null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	
	PreparedStatement prs1=null,prs2 = null,prs3=null,prs12=null;
	
	int j = 0, i = 0;
	
	//empId,empName,emailid,pass,doi2,remarks2,opcode,pass1,doi3,remarks3,dscpin,dsccin,doi4,remarks4,uname,pass3,doi5,remarks5
    // dcardno, doi1,remarks1,card,doi6,remarks6
    //empDesg,empBranch,empSubBranch,empMobNo,empMobNo,empEID,empDept,empRo
	
    String empid = request.getParameter("empId");
	String empname = request.getParameter("empName");
	String empdesg = request.getParameter("empDesg");
	String empbranch = request.getParameter("empBranch");
	String empsbranch = request.getParameter("empSubBranch");
	String empmob = request.getParameter("empMobNo");
	String empmail = request.getParameter("empEID");
	String empdept = request.getParameter("empDept");
	String empro = request.getParameter("empRo");
	
	
	//empdesg,empbranch,empsbranch,empmob,empmail,empdept,empro
	
	
	String emailid = request.getParameter("emailid");
	String pass = request.getParameter("pass");
	String doi2 = request.getParameter("doi2");
	String remarks2 = request.getParameter("remarks2");
	String idfile = request.getParameter("idfile");
	
	String opcode = request.getParameter("opcode");
	String pass1 = request.getParameter("pass1");
	String doi3 = request.getParameter("doi3");
	String level = request.getParameter("level");
	String remarks3 = request.getParameter("remarks3");
	
	
	String dscpin = request.getParameter("dscpin");
	String dsccin = request.getParameter("dsccin");
	String doi4 = request.getParameter("doi4");
	String remarks4 = request.getParameter("remarks4");
	String dscpass = request.getParameter("dscpass");
	
	String uname = request.getParameter("uname");
	String pass3 = request.getParameter("pass3");
	String doi5 = request.getParameter("doi5");
	String remarks5 = request.getParameter("remarks5");         
	
	
	// idfile,level,dscpass,imei,isp,dctype,type
	String dcardno = request.getParameter("dcardno");
	String doi1 = request.getParameter("doi1");
	String remarks1 = request.getParameter("remarks1");
	String imei = request.getParameter("imei");
	String isp = request.getParameter("isp");
	String dctype = request.getParameter("dctype");
	
	
	
	String card = request.getParameter("card");
	String doi6 = request.getParameter("doi6");
	String remarks6 = request.getParameter("remarks6");
	String type = request.getParameter("type");
	
	
	
	////////////////////////////////////////////
	String mobModno = request.getParameter("mobMod");
	String mobSerNo = request.getParameter("mobSer");
	String mobDOI = request.getParameter("doiMob");
	String emailAC = request.getParameter("emailMob");  
	String mobRemarks = request.getParameter("remarks7");
	
	String hardModNo = request.getParameter("hardMod");
	String hardSerNo = request.getParameter("hardSer");
	String harDOI = request.getParameter("doiHard");
    String hardCap = request.getParameter("hardCap");
	String hardCapType = request.getParameter("hardType");
	String hardRemarks = request.getParameter("remarks8");
	
	String otherDesc = request.getParameter("otherAsset");
	String otherDOI = request.getParameter("doiOther");
	String otherRemarks = request.getParameter("remarks9");
	
	
	////////////////////////////////////////////////////////

	// new fields added  here to get the details
	
	
	String mobileNumber=request.getParameter("mobileNo");
	String mobSIM=request.getParameter("mobSIM");
	String mobProvider=request.getParameter("mobileNumComp");
	String lotusModel=request.getParameter("lotusMod");	
	String lotusOwner=request.getParameter("lotusOwner");
	String lotusIP=request.getParameter("lotusIP");
	String ftpAddress =request.getParameter("ftpAddress");
	String ftpDOI=request.getParameter("doiFtp");
	String ftpRemarks1=request.getParameter("remarksFtp");
	
	System.out.println("INSIDE AssignDB "+ftpRemarks1);
	 
	
	
	System.out.println("details in db :");
	
	System.out.println(""+request.getParameter("mobileNo")+request.getParameter("mobSIM")+request.getParameter("mobileNumComp")+request.getParameter("ftpAddress")+request.getParameter("doiFtp")+
	request.getParameter("remarksFtp")+	request.getParameter("lotusMod")+request.getParameter("lotusOwner")+request.getParameter("lotusIP"));

	/////////////////////////////////////////////////
	
	
	// assetName,idaType,assetno,idano,doiasset,iddoiasset,assetconf,idassetconf,remarksasset,idremarksasset
                      // shaFO,idshaFO,doishaFO,iddoishaFO,remarksshaFO,idremarksshaFO
                      // tryappCre,idappCre,doiappCre,iddoiappCre,remarksappCre,idremarksappCre
	
	String emailAC1 = request.getParameter("assetName");  
	String mobRemarks1 = request.getParameter("assetno");
	String hardModNo1 = request.getParameter("doiasset");
	String hardSerNo1 = request.getParameter("assetconf");
	String harDOI1 = request.getParameter("remarksasset");
	
	
    String hardCap1 = request.getParameter("shaFO");
	String hardCapType1 = request.getParameter("doishaFO");
	String hardRemarks1 = request.getParameter("remarksshaFO");
	
	String otherDesc1 = request.getParameter("appCre");
	String otherDOI1 = request.getParameter("doiappCre");
	String otherRemarks1 = request.getParameter("remarksappCre");
	
		///////////////////////////////////////////
	
	String ano1=null;	
	System.out.println("emp id : " + empid);
	System.out.println("emp name : " + empname);
	//System.out.println("date " + dateofasg);
	String asgby = (String)session.getAttribute("Nname");
	System.out.println("Session name:"+asgby);
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url + dbName, userName,password);
		Statement st = conn.createStatement();
				
		String query = "select EmpId,ano from assignotherassetemp where EmpId='"+empid+"'";
		st = conn.createStatement();
		rs = st.executeQuery(query);
		String msg=null;
		try
		    {
			if(rs.next())
				   {
				   ano1=rs.getString(2);
				   //empid,empname,emailid,pass,doi2,remarks2,opcode,pass1,doi3,remarks3,dscpin,dsccin,
				   //doi4,remarks4,uname,pass3,doi5,remarks5,dcardno,doi1,remarks1,card,doi6,remarks6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               //idfile,level,dscpass,imei,isp,dctype,type,                                                                                                   //mobModno,mobSerNo,mobDOI,emailAC,mobRemarks,hardModNo,hardSerNo,harDOI,hardCap,hardCapType,hardRemarks,otherDesc,otherDOI,otherRemarks                                                                                                                                                                                                                                                  emailAC,mobRemarks,hardModNo,hardSerNo,harDOI,hardCap,hardCapType,hardRemarks,otherDesc,otherDOI,otherRemarks 
				   //System.out.println("ano1............................ :"+ano1);
				   System.out.println("mobremarks1............................ :"+mobRemarks1);
				   if(!mobRemarks1.equals("Select"))
				      {
					  if(!ano1.equals(""))
					      {
				 		  if(!emailAC1.equals("Select"))
				    	     stIT=1;
				    	  if(!emailid.equals(""))
				    		stEmail=1;  
				    	  if(!opcode.equals(""))
				    		stNew=1;  
				    	  if(!dscpin.equals(""))
				    		stDSC=1;  
				    	  if(!uname.equals(""))
				    		stDom=1;  
				    	  if(!dcardno.equals(""))
				    		stDC=1;  
				    	  if(!card.equals(""))
				    		stAC=1;  
				    	  if(!mobModno.equals(""))
				    		stMob=1;  
				    	  if(!hardModNo.equals(""))
				    		stHD=1;  
				    	  if(!hardCap1.equals(""))
				    		stShF=1;  
				    	  if(!otherDesc1.equals("Select"))
				    		stApC=1;  
				    	  if(!otherDesc.equals(""))
				    		stOth=1;  
				    	  if(!lotusModel.equals(""))
				    		  stLotus=1;
				    	  if(!ftpAddress.equals(""))
				    		  stFtp=1;
				    	  
				 	      System.out.println(".............NONIT Assign asset DB...............");
		        	      prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
			              prs3.executeUpdate();
		        	      prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+mobRemarks1+"'");
			              prs2.executeUpdate();                                                                                                   																																																																																																																																																						
			              
			              prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+emailAC1+"',ano='"+mobRemarks1+"',asdoi='"+hardModNo1+"',aconf='"+hardSerNo1+"',asremarks='"+harDOI1+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
			              prs1.executeUpdate();
				          
				          String query21 = "select * from asset_trans where (New_Asset_No='"+mobRemarks1+"' AND curAID=1) ";
				    	  st2 = conn.createStatement();
				    	  rs2 = st2.executeQuery(query21);
				    	  if(rs2.next())
				    	      {
				    		  prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+mobRemarks1+"' AND curAID=1");
					          prs12.executeUpdate();
						      } 
				          
			              }
		             }
				  else if(mobRemarks1.equals("Select"))
				      {
					  if(!ano1.equals(""))
				          {
						  if(!emailAC1.equals("Select"))
					    	   stIT=1;
					    	if(!emailid.equals(""))
					    		stEmail=1;  
					    	if(!opcode.equals(""))
					    		stNew=1;  
					    	if(!dscpin.equals(""))
					    		stDSC=1;  
					    	if(!uname.equals(""))
					    		stDom=1;  
					    	if(!dcardno.equals(""))
					    		stDC=1;  
					    	if(!card.equals(""))
					    		stAC=1;  
					    	if(!mobModno.equals(""))
					    		stMob=1;  
					    	if(!hardModNo.equals(""))
					    		stHD=1;  
					    	if(!hardCap1.equals(""))
					    		stShF=1;  
					    	if(!otherDesc1.equals("Select"))
					    		stApC=1;  
					    	if(!otherDesc.equals(""))
					    		stOth=1;  
							  
	        	            System.out.println("NONIT.........2222222222...................");
						   // prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+emailAC1+"',ano='"+ano1+"',asdoi='"+hardModNo1+"',aconf='"+hardSerNo1+"',asremarks='"+harDOI1+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"'  ,                   statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'  where EmpId='"+empid+"'");
						    prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+emailAC1+"',ano='"+mobRemarks1+"',asdoi='"+hardModNo1+"',aconf='"+hardSerNo1+"',asremarks='"+harDOI1+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
						    prs1.executeUpdate();
				            String query21 = "select * from asset_trans where (New_Asset_No='"+ano1+"' AND curAID=1) ";
					    	st2 = conn.createStatement();
					    	rs2 = st2.executeQuery(query21);
					    	if(rs2.next())
					    	    {
					    	    prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+ano1+"' AND curAID=1");
						        prs12.executeUpdate();
							    } 
			            }
				      }
				  else if(mobRemarks1.equals("Select"))
			          {
					  if(ano1.equals(""))
				          {
						  if(!emailAC1.equals("Select"))
					    	   stIT=1;
					    	if(!emailid.equals(""))
					    		stEmail=1;  
					    	if(!opcode.equals(""))
					    		stNew=1;  
					    	if(!dscpin.equals(""))
					    		stDSC=1;  
					    	if(!uname.equals(""))
					    		stDom=1;  
					    	if(!dcardno.equals(""))
					    		stDC=1;  
					    	if(!card.equals(""))
					    		stAC=1;  
					    	if(!mobModno.equals(""))
					    		stMob=1;  
					    	if(!hardModNo.equals(""))
					    		stHD=1;  
					    	if(!hardCap1.equals(""))
					    		stShF=1;  
					    	if(!otherDesc1.equals("Select"))
					    		stApC=1;  
					    	if(!otherDesc.equals(""))
					    		stOth=1;  
							  
						  System.out.println("NONIT........33333333333...................");
	        	          //prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='',ano='',asdoi='',aconf='',asremarks='',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"'         ,                   statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"' where EmpId='"+empid+"'");
	        	          prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+emailAC1+"',ano='"+mobRemarks1+"',asdoi='"+hardModNo1+"',aconf='"+hardSerNo1+"',asremarks='"+harDOI1+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
	        	          prs1.executeUpdate();
			              
			            /*   String query21 = "select * from asset_trans where (New_Asset_No='"+mobRemarks1+"' AND curAID=1) ";
				    	   st2 = conn.createStatement();
				    	   rs2 = st2.executeQuery(query21);
				    	     if(rs2.next())
				    	           {
				    		       prs12 = conn.prepareStatement("update asset_trans set toUser='' where New_Asset_No='"+mobRemarks1+"' AND curAID=1");
					               prs12.executeUpdate();
						           }  */
		                 }
			          }
				  if(!mobRemarks1.equals("Select"))
			           {
				       if(ano1.equals(""))
				         {
					     if(!emailAC1.equals("Select"))
				    	   stIT=1;
				    	 if(!emailid.equals(""))
				    		stEmail=1;  
				    	 if(!opcode.equals(""))
				    		stNew=1;  
				    	 if(!dscpin.equals(""))
				    		stDSC=1;  
				    	 if(!uname.equals(""))
				    		stDom=1;  
				    	 if(!dcardno.equals(""))
				    		stDC=1;  
				    	 if(!card.equals(""))
				    		stAC=1;  
				    	 if(!mobModno.equals(""))
				    		stMob=1;  
				    	 if(!hardModNo.equals(""))
				    		stHD=1;  
				    	 if(!hardCap1.equals(""))
				    		stShF=1;  
				    	 if(!otherDesc1.equals("Select"))
				    		stApC=1;  
				    	 if(!otherDesc.equals(""))
				    		stOth=1;  
				         System.out.println("NONIT...........44444444444.................");
	        	         prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+mobRemarks1+"'");
			             prs2.executeUpdate();
			             //prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+emailAC1+"',ano='"+mobRemarks1+"',asdoi='"+hardModNo1+"',aconf='"+hardSerNo1+"',asremarks='"+harDOI1+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"'         ,                   statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'    where EmpId='"+empid+"'");
			             prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+emailAC1+"',ano='"+mobRemarks1+"',asdoi='"+hardModNo1+"',aconf='"+hardSerNo1+"',asremarks='"+harDOI1+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
			             prs1.executeUpdate();
			             
			             String query21 = "select * from asset_trans where (New_Asset_No='"+mobRemarks1+"' AND curAID=1) ";
				    	   st2 = conn.createStatement();
				    	   rs2 = st2.executeQuery(query21);
				    	     if(rs2.next())
				    	           {
				    		       prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+mobRemarks1+"' AND curAID=1");
					               prs12.executeUpdate();
						           } 
		                 }
	                }
	                msg = "UPDATED__SUCCESSFULLY";
				   }
			    else
			       {
			    	if(emailAC1.equals("Select"))
			    	     {
			    		  emailAC1="";
			    		  mobRemarks1="";
			    		 }
			    	   else
			    	     {
			    		 stIT=1;
			    	     }
			 	    	/* System.out.println("Herer...........44444444444.111................"+emailAC1);
			    	System.out.println("Herer...........44444444444...222.............."+emailid);
			    	System.out.println("Herer...........44444444444...333.............."+opcode);
			    	System.out.println("Herer...........44444444444.....4444............"+dscpin);
			    	System.out.println("Herer...........44444444444...555.............."+uname);
			    	System.out.println("Herer...........44444444444....666............."+dcardno);
			    	System.out.println("Herer...........44444444444.....777............"+card);
			    	System.out.println("Herer...........44444444444....888............."+mobModno);
			    	System.out.println("Herer...........44444444444....9999............."+hardModNo);
			    	System.out.println("Herer...........44444444444.....10............"+hardCap1);
			    	System.out.println("Herer...........44444444444....11............."+otherDesc1);
			      	System.out.println("Herer...........44444444444...12.............."+otherDesc); */
			    	//System.out.println("Herer...........44444444444....11............."+otherDesc1);
			    	//stIT=0,stEmail=0,stNew=0,stDSC=0,stDom=0,stDC=0,stAC=0,stMob=0,stHD=0,stShF=0,stApC=0,stOth=0;  
			    	if(!emailid.equals(""))
			    		stEmail=1;  
			    	if(!opcode.equals(""))
			    		stNew=1;  
			    	if(!dscpin.equals(""))
			    		stDSC=1;  
			    	if(!uname.equals(""))
			    		stDom=1;  
			    	if(!dcardno.equals(""))
			    		stDC=1;  
			    	if(!card.equals(""))
			    		stAC=1;  
			    	if(!mobModno.equals(""))
			    		stMob=1;  
			    	if(!hardModNo.equals(""))
			    		stHD=1;  
			    	if(!hardCap1.equals(""))
			    		stShF=1;  
			    	if(!otherDesc1.equals("Select"))
			    		stApC=1;  
			    	if(!otherDesc.equals(""))
			    		stOth=1;  
			    
			    	prs2 = conn.prepareStatement("insert into assignotherassetemp(EmpId,EmpName,emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,AssignedByName,DateOfAssigned,idfile,level,dscpass,imei,isp,dcardtype,ABType,dept,ro,empdesg,empbranch,empsubbranch,empmob,empemailid,mobModelNo,mobSerialNo,mobDOI,emailAccess,mobRemarks,hardModNo,hardSerNo,hardDOI,cap,capType,hardRemarks,otherDesc,otherDOI,otherRemarks,status,atype,ano,asdoi,aconf,asremarks,shpath,scpathdoi,schpathrem,apcr,apcrdoi,apcrrem,   statusIT,statusEmail,statusNewins , statusDSC , statusDomain , statusDC , statusAcBio , statusMob , statusHD , statusShFol , statusApCre , statusOth , mobileNo, SIMno, SIMProvided, lotusMod, lotusOwner, lotusIP, ftpAddress, ftpDOI, ftpRemarks) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+asgby+"','"+str+"',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',?,?,?,?,?,?,?,?,?,?,? ,    ?,?,?,?,?,?,?,?,?,?,?,?,  ?,?,?,?,?,?,?,?,?)");
			    	
			    	//prs2 = conn.prepareStatement("INSERT INTO assignotherassetemp(EmpId,EmpName,emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,AssignedByName,DateOfAssigned,idfile,level,dscpass,imei,isp,dcardtype,ABType,dept,ro,empdesg,empbranch,empsubbranch,empmob,empemailid,mobModelNo,mobSerialNo,mobDOI,emailAccess,mobRemarks,hardModNo,hardSerNo,hardDOI,cap,capType,hardRemarks,otherDesc,otherDOI,otherRemarks,status,atype,ano,asdoi,aconf,asremarks,shpath,scpathdoi,schpathrem,apcr,apcrdoi,apcrrem,statusIT, statusEmail, statusNewins, statusDSC, statusDomain, statusDC, statusAcBio, statusMob, statusHD, statusShFol, statusApCre, statusLotus, statusFtp, statusOth) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10],[value-11],[value-12],[value-13],[value-14],[value-15],[value-16],[value-17],[value-18],[value-19],[value-20],[value-21],[value-22],[value-23],[value-24],[value-25],[value-26],[value-27],[value-28],[value-29],[value-30],[value-31],[value-32],[value-33],[value-34],[value-35],[value-36],[value-37],[value-38],[value-39],[value-40],[value-41],[value-42],[value-43],[value-44],[value-45],[value-46],[value-47],[value-48],[value-49],[value-50],[value-51],[value-52],[value-53],[value-54],[value-55],[value-56],[value-57],[value-58],[value-59],[value-60],[value-61],[value-62],[value-63],[value-64],[value-65],[value-66],[value-67],[value-68],[value-69],[value-70],[value-71],[value-72],[value-73],[value-74],[value-75],[value-76],[value-77],[value-78],[value-79],[value-80],[value-81],[value-82],[value-83],[value-84],[value-85],[value-86],[value-87],[value-88],[value-89],[value-90],[value-91],[value-92])
			    			
			    	//prs2 = conn.prepareStatement("insert into assignotherassetemp(EmpId,EmpName,emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,AssignedByName,DateOfAssigned,idfile,level,dscpass,imei,isp,dcardtype,ABType,dept,ro,empdesg,empbranch,empsubbranch,empmob,empemailid,mobModelNo,mobSerialNo,mobDOI,emailAccess,mobRemarks,hardModNo,hardSerNo,hardDOI,cap,capType,hardRemarks,otherDesc,otherDOI,otherRemarks,status,atype,ano,asdoi,aconf,asremarks,shpath,scpathdoi,schpathrem,apcr,apcrdoi,apcrrem) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+asgby+"','"+str+"',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',?,?,?,?,?,?,?,?,?,?,?    )");
			    	 //empid,empname,emailid,pass,doi2,remarks2,opcode,pass1,doi3,remarks3,dscpin,dsccin,
				     //doi4,remarks4,uname,pass3,doi5,remarks5,dcardno,doi1,remarks1,card,doi6,remarks6
		
			    	prs2.setInt(1, new Integer(empid));
			        prs2.setString(2, empname);
			       
			        prs2.setString(3, emailid);
			        prs2.setString(4, pass);
			        prs2.setString(5, doi2);
			        prs2.setString(6, remarks2);
			       
			        prs2.setString(7, opcode);
                    prs2.setString(8, pass1);
			        prs2.setString(9, doi3);
			        prs2.setString(10, remarks3);
			       
			        prs2.setString(11, dscpin);
			        prs2.setString(12,dsccin);
			        prs2.setString(13, doi4);
			        prs2.setString(14, remarks4);
			       
			        prs2.setString(15, uname);
			        prs2.setString(16, pass3);
			        prs2.setString(17, doi5);
			        prs2.setString(18, remarks5);
			        
			        prs2.setString(19, dcardno);
			        prs2.setString(20, doi1);
			        prs2.setString(21, remarks1);
			        
			        prs2.setString(22, card);
			        prs2.setString(23,doi6);
			        prs2.setString(24,remarks6);
			        
			        
			///////////////////////////////////////  
			
			//idfile,level,dscpass,imei,isp,dctype,type,
			//empdept,empro,empdesg,empbranch,empsbranch,empmob,empmail,
			        prs2.setString(25, idfile);
			        prs2.setString(26,level);
			       		        
			        prs2.setString(27, dscpass);
			        prs2.setString(28, imei);
			        prs2.setString(29, isp);
			        prs2.setString(30, dctype);
			        prs2.setString(31, type);
			        prs2.setString(32, empdept);
			        
			        prs2.setString(33, empro);
			        prs2.setString(34, empdesg);
			        prs2.setString(35, empbranch);
			        prs2.setString(36, empsbranch);
			        prs2.setString(37,empmob);
			        prs2.setString(38,empmail);
			        
			        
		////////////////////////////////////////////////	        
//mobModno,mobSerNo,mobDOI,emailAC,mobRemarks,hardModNo,hardSerNo,harDOI,hardCap,hardCapType,hardRemarks,otherDesc,otherDOI,otherRemarks			        
			        prs2.setString(39, mobModno);
			        prs2.setString(40,mobSerNo);
			        prs2.setString(41, mobDOI);
			        prs2.setString(42, emailAC);
			        prs2.setString(43, mobRemarks);
			       
			        prs2.setString(44, hardModNo);
			        prs2.setString(45, hardSerNo);
			        prs2.setString(46, harDOI);
			        prs2.setString(47, hardCap);
			        prs2.setString(48, hardCapType);
			        prs2.setString(49, hardRemarks);
			       
			        prs2.setString(50, otherDesc);
                    prs2.setString(51,otherDOI);
			        prs2.setString(52,otherRemarks);
			        ////////////////////
			        
			        prs2.setString(53, emailAC1);
			        prs2.setString(54, mobRemarks1);
			       
			        prs2.setString(55, hardModNo1);
			        prs2.setString(56, hardSerNo1);
			        prs2.setString(57, harDOI1);
			        prs2.setString(58, hardCap1);
			        prs2.setString(59, hardCapType1);
			        prs2.setString(60, hardRemarks1);
			       
			        prs2.setString(61, otherDesc1);
                    prs2.setString(62,otherDOI1);
			        prs2.setString(63,otherRemarks1);
			   
			        /////////////////////////////
			         prs2.setInt(64, stIT);
			        prs2.setInt(65, stEmail);
			        prs2.setInt(66, stNew);
			        prs2.setInt(67, stDSC);
			        prs2.setInt(68, stDom);
			        prs2.setInt(69, stDC);
			        prs2.setInt(70, stAC);       //stIT,stEmail,stNew,stDSC,stDom,stDC,stAC,stMob,stHD,stShF,stApC,stOth
			        prs2.setInt(71, stMob);
			        prs2.setInt(72, stHD);
			        prs2.setInt(73, stShF);
                    prs2.setInt(74,stApC);
			        prs2.setInt(75,stOth);
			       
			        
		
			        
			        prs2.setString(76,mobileNumber);
                    prs2.setString(77,mobSIM);
			        prs2.setString(78,mobProvider);
			        prs2.setString(79,lotusModel);
                    prs2.setString(80,lotusOwner);
			        prs2.setString(81,lotusIP);
			        prs2.setString(82,ftpAddress);
                    prs2.setString(83,ftpDOI);
			        prs2.setString(84,ftpRemarks1);
			        
			 	    i=prs2.executeUpdate();
			 	  
			 	    
			 	   String query21 = "select * from asset_trans where (New_Asset_No='"+mobRemarks1+"' AND curAID=1) ";
		    	   st2 = conn.createStatement();
		    	   rs2 = st2.executeQuery(query21);
		    	     if(rs2.next())
		    	           {
		    		  	     prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+mobRemarks1+"' AND curAID=1");
			           		 prs12.executeUpdate();
				           } 
			 	    
			 	    
			 	    
			 	   prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+mobRemarks1+"'");
		           prs2.executeUpdate();
		
			 	    
			 	    msg = "INSERTED__SUCCESSFULLY";
			       }
				 
		 if (i!=0)
		      { 
              response.sendRedirect("assignOtherAssetNONIT.jsp?msg=" +msg);
		      }
		 else
		     {      
             response.sendRedirect("assignOtherAssetNONIT.jsp?msg=" +msg); 
		     }
		}catch (Exception e)
		        {
		    	e.printStackTrace();
		    	}
		 finally 
		        {
		    	conn.close();
		    	}
%>
</body>
</html>