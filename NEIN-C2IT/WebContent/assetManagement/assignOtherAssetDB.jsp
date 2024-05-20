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
		System.out.println("-------- Assign Other Asset DB --------");
		int stIT=0,stEmail=0,stNew=0,stDSC=0,stDom=0,stDC=0,stAC=0,stMob=0,stHD=0,stShF=0,stApC=0,stOth=0,stLotus=0,stFtp=0;   
	    Date date = new Date();
	    SimpleDateFormat ft = new SimpleDateFormat ("dd-MMM-YYYY");
	    String str = ft.format(date);
	    Connection conn = null;
		ResultSet rs = null,rs1 = null,rs2=null;
		Statement st2=null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "csdb";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "";
		
		Connection assetCon = null;
		PreparedStatement assetprs=null,assetprs1=null;
		ResultSet assetrs = null,assetrs1 = null;
		String AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetType`=? AND `AssetNo`=?";
		String AssetSearchQuery1="";
		String Assetatype=null,Assetasdoi=null,Assetaconf=null,Assetasremarks=null;
		PreparedStatement prs1=null,prs2 = null,prs3=null,prs12=null;
	
		int j = 0, i = 0;
		
		//System.out.println("User Asset Detils:");
		
		String empid = request.getParameter("empId");
		String empname = request.getParameter("empName");
		String empdesg = request.getParameter("empDesg");
		String empbranch = request.getParameter("empBranch");
		
		
		
		
		 if(empbranch.equals("HEAD OFFICE"))
	        {
	        	 empbranch = "Head Office";
	        }
	        if(empbranch.equals("BANGALORE"))
	        {
	        	empbranch = "Bangalore Icon Office";
	        }
	        if(empbranch.equals("AHEMDABAD"))
	        {
	        	empbranch = "Ahmedabad Branch Office";
	        }
	        if(empbranch.equals("MUMBAI"))
	        {
	        	empbranch = "Mumbai Branch Office";
	        }
	        if(empbranch.equals("KOLKATA"))
	        {
	        	empbranch = "Kolkata Branch Office";
	        }
	        if(empbranch.equals("COIMBATORE"))
	        {
	        	empbranch = "Coimbatore Branch Office";
	        }
	        if(empbranch.equals("COCHIN"))
	        {
	        	empbranch = "Cochin Branch Office";
	        }
	        if(empbranch.equals("DELHI"))
	        {
	        	empbranch = "Delhi Branch Office";
	        }
	        if(empbranch.equals("HYDERABAD"))
	        {
	        	empbranch = "Hyderabad Branch Office";
	        }
	        
	        if(empbranch.equals("CHENNAI"))
	        {
	        	empbranch = "Chennai Branch Office";
	        }
	        
	        if(empbranch.equals("NEEMRANA"))
	        {
	        	empbranch = "Neemrana Logistics Center";
	        }
	        
	        if(empbranch.equals("PUNE"))
	        {
	        	empbranch = "Pune Branch Office";
	        }
	        
	        if(empbranch.equals("RGMO"))
	        {
	        	empbranch = "RGMO";
	        }
	        if(empbranch.equals("JAIPUR"))
	        {
	        	empbranch = "Jaipur WH";
	        }
	         if(empbranch.equals("CHANDIGARH"))
	        {
	        	empbranch = "Chandigarh(CHD)";
	        }
	        
	        if(empbranch.equals("LUCKNOW"))
	        {
	        	empbranch = "Lucknow WH";
	        }
	        if(empbranch.equals("MOHALI"))
	        {
	        	empbranch = "Mohali WH";
	        }
	        if(empbranch.equals("DEHRADUN"))
	        {
	        	empbranch = "Deharadun";
	        }
	        if(empbranch.equals("JAMMU"))
	        {
	        	empbranch = "Jammu WH";
	        }
	        
	        if(empbranch.equals("INDORE"))
	        {
	        	empbranch = "Indore Office";
	        }
	        
	        if(empbranch.equals("KPCT"))
	        {
	        	empbranch = "KPCT";
	        }
	         if(empbranch.equals("DELHI WH"))
	        {
	        	empbranch = "Delhi Branch Office";
	        }
	        if(empbranch.equals("VISHAKHAPATNAM"))
	        {
	        	empbranch = "Vishakhapatnam Branch Office";
	        }
		
		
		String empsbranch = request.getParameter("empSubBranch");
		String empmob = request.getParameter("empMobNo");
		String empmail = request.getParameter("empEID");
		String empdept = request.getParameter("empDept");
		String empro = request.getParameter("empRo");
		
		//System.out.println(empid+" :: "+empname+" :: "+empdesg+" :: "+empbranch+" :: "+empsbranch+" :: "+empmob+" :: "+empmail+" :: "+empdept+" :: "+empro);
		
		String emailid = request.getParameter("emailid");
		String pass = request.getParameter("pass");
		String doi2 = request.getParameter("doi2");
		String remarks2 = request.getParameter("remarks2");
		String idfile = request.getParameter("idfile");
		
		//System.out.println("Email Details:" +emailid+" :: "+ pass +" :: "+ doi2 +" :: "+remarks2 +" :: "+idfile);
		
		String opcode = request.getParameter("opcode");
		String pass1 = request.getParameter("pass1");
		String doi3 = request.getParameter("doi3");
		String level = request.getParameter("level");
		String remarks3 = request.getParameter("remarks3");
		
		//System.out.println("NEwins Details:" +opcode+" :: "+ pass1 +" :: "+ doi3 +" :: "+remarks3 +" :: "+level);
		
		
		String dscpin = request.getParameter("dscpin");
		String dsccin = request.getParameter("dsccin");
		String doi4 = request.getParameter("doi4");
		String remarks4 = request.getParameter("remarks4");
		String dscpass = request.getParameter("dscpass");
		
		//System.out.println("dsc Details:" +dscpin+" :: "+ dsccin +" :: "+ doi4 +" :: "+remarks4 +" :: "+dscpass);
		
		String uname = request.getParameter("uname");
		String pass3 = request.getParameter("pass3");
		String doi5 = request.getParameter("doi5");
		String remarks5 = request.getParameter("remarks5");         
		
		//System.out.println("Domain ::"+uname+" :: "+  pass3+" :: "+ doi5+" :: "+ remarks5 );
		
		
		
		// idfile,level,dscpass,imei,isp,dctype,type
		String dcardno = request.getParameter("dcardno");
		String doi1 = request.getParameter("doi1");
		String remarks1 = request.getParameter("remarks1");
		String imei = request.getParameter("imei");
		String isp = request.getParameter("isp");
		String dctype = request.getParameter("dctype");
		
	//	System.out.println("Datacard Details :: "+ dcardno +" :: "+ doi1 +" :: "+ remarks1+" :: "+  imei +" :: "+  isp +" :: "+ dctype);
		
		String card = request.getParameter("card");
		String doi6 = request.getParameter("doi6");
		String remarks6 = request.getParameter("remarks6");
		String type = request.getParameter("type");
		
	//	System.out.println("Biometric ::"+ card  +" :: "+ doi6  +" :: "+ type  +" :: "+  remarks6);
		
		////////////////////////////////////////////
	
		
		String mobaType=request.getParameter("mobAType");
	
		if(mobaType.equals("Select"))
		{
			mobaType="";
		}
		String mano="";
		
		mano=request.getParameter("mano1");
		
		if(mano.equals(null)){
			mano="";
		}
	
		
		String mobModno = request.getParameter("mobMod");
		String mobSerNo = request.getParameter("mobSer");
		String mobDOI = request.getParameter("doiMob");
		String emailAC = request.getParameter("emailMob");  
		String mobRemarks = request.getParameter("remarks7");
		
		String mobileNumber=request.getParameter("mobileNo");
		String mobSIM=request.getParameter("mobSIM");
		String mobProvider=request.getParameter("mobileNumComp");
		
	//	System.out.println(" Mobile Handset ::"+ mobileNumber+" :: "+  mobSIM +" :: "+ mobProvider +" :: "+mobModno +" :: "+  mobSerNo  +" :: "+ mobDOI  +" :: "+ emailAC  +" :: "+ mobRemarks);
		
		String hdaType=request.getParameter("harddiscAType");
		
		if(hdaType.equals("Select"))
		{
			hdaType="";
		}
		
		String hano="";
		hano=request.getParameter("hano1");
		
		if(hano.equals("")||hano.equals(null)){
			hano="";
		}
		
		String hardModNo = request.getParameter("hardMod");
		String hardSerNo = request.getParameter("hardSer");
		String harDOI = request.getParameter("doiHard");
	    String hardCap = request.getParameter("hardCap");
		String hardCapType = request.getParameter("hardType");
		String hardRemarks = request.getParameter("remarks8");
		
	//	System.out.println("HardDisc / PenDrive :: "+hardModNo+" :: "+ hardSerNo+" :: "+ harDOI+" :: "+ hardCap +" :: "+hardCapType +" :: "+hardRemarks);
		
		String otherDesc = request.getParameter("otherAsset");
		String otherDOI = request.getParameter("doiOther");
		String otherRemarks = request.getParameter("remarks9");
		
	//	System.out.println("Other Asset Details :: "+otherDesc+" :: "+ otherDOI +" :: "+ otherRemarks);
		////////////////////////////////////////////////////////
	
		// new fields added  here to get the details
		
		
		String lotusModel=request.getParameter("lotusMod");	
		String lotusOwner=request.getParameter("lotusOwner");
		String lotusIP=request.getParameter("lotusIP");
		
	//	System.out.println("Lotus :: "+lotusModel +" :: "+lotusOwner +" :: "+lotusIP);
		
		String ftpAddress =request.getParameter("ftpAddress");
		String ftpDOI=request.getParameter("doiFtp");
		String ftpRemarks1=request.getParameter("remarksFtp");
		
//		System.out.println("Ftp :: "+ftpAddress +" :: "+ftpDOI +" :: "+ftpRemarks1);
	
		
		 	String hardCap1 = request.getParameter("shaFO");
			String hardCapType1 = request.getParameter("doishaFO");
			String hardRemarks1 = request.getParameter("remarksshaFO");
			
			String otherDesc1 = request.getParameter("appCre");
			String otherDOI1 = request.getParameter("doiappCre");
			String otherRemarks1 = request.getParameter("remarksappCre");
		
		/////////////////////////////////////////////////
		
		
		String assetName1 = request.getParameter("assetName");  
		String assetNumber = request.getParameter("assetno");
		String assetDoi = request.getParameter("doiasset");
		String assetConfig = request.getParameter("assetconf");
		String assetRemarks = request.getParameter("remarksasset");
	
		/////////////////////////	
		
		String ano1=null , hano1=null,mano1=null;
		String asgby = (String)session.getAttribute("Nname");
		String asgemp=(String)session.getAttribute("empid");
	
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url + dbName, userName,password);
		Statement st = conn.createStatement();
				
		String query = "select EmpId,ano,atype,asdoi,aconf,asremarks,mano,hano from assignotherassetemp where EmpId='"+empid+"'";
		st = conn.createStatement();
		rs = st.executeQuery(query);
		String msg=null;
		try{
			if(rs.next())
			   {
				   System.out.println("----- Inside Other Asset Search ----------- ");
				   
				   ano1=rs.getString(2);
				   Assetatype=rs.getString(3);
				   Assetasdoi=rs.getString(4);
				   Assetaconf=rs.getString(5);
				   Assetasremarks=rs.getString(6);
				   
				   mano1=rs.getString(7);
				   hano1=rs.getString(8);
				   
				   System.out.println(hdaType+"mano1 :: Hano1"+mano1+" :: "+hano1);
				   
				   if(hdaType.equals("") && !hano1.equals(""))
				   {
					 //  System.out.println("aaaaaaaaa1 ");
					   prs2 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+hano1+"'");
				        prs2.executeUpdate();   
				        
				        
				   }
				   if(mobaType.equals("")&& !mano1.equals(""))
				   {
					 //  System.out.println("aaaaaaaaa1 ");
					   prs2 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+mano1+"'");
				        prs2.executeUpdate();   
				   }
				   
				   
				   if(!assetName1.equals("Select") && !assetNumber.equals("Select"))
				   {
					   if(!assetName1.equals("Select"))
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
						    System.out.println("Herer.............111111...............");
					   
						    prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+assetNumber+"'");
					        prs2.executeUpdate();   
					        
					        
					        prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+assetNumber+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'         ,matype='"+mobaType+"',mano='"+mano+"',hatype='"+hdaType+"',hano='"+hano+"'	            where EmpId='"+empid+"'  ");
					        prs1.executeUpdate();
						    
					        String query21 = "select * from asset_trans where (New_Asset_No='"+assetNumber+"' AND curAID=1) ";
						    st2 = conn.createStatement();
						    	  rs2 = st2.executeQuery(query21);
						    	  if(rs2.next())
						    	      {
							    		  prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+assetNumber+"' AND curAID=1");
								          prs12.executeUpdate();
								      } 
					   
				   }
				   else if(!assetName1.equals("Select") && assetNumber.equals("Select"))
				   {
					   if(!assetName1.equals("Select") && !ano1.equals("-1")&& !ano1.equals(""))
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
						    System.out.println("Herer.............222222 V..............");
				        	
						    /* prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
					        prs3.executeUpdate(); */
				        	
					         prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+ano1+"'");
					        prs2.executeUpdate();                                                                                                    																																																																																																																																																						
					        
					        prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"',    atype='"+assetName1+"',ano='"+ano1+"',asdoi='"+Assetasdoi+"',aconf='"+Assetaconf+"', asremarks='"+Assetasremarks+"',	             shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'       ,matype='"+mobaType+"',mano='"+mano+"',hatype='"+hdaType+"',hano='"+hano+"'	    where EmpId='"+empid+"'  ");
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
				   else if(assetName1.equals("Select") && assetNumber.equals("Select"))
				   {

					   prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
				        prs3.executeUpdate();
				        
					   if(!ano1.equals("-1")&& !ano1.equals(""))
					   {
						    prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
					        prs3.executeUpdate(); 
						      stIT=0;
						      assetName1="";
						      ano1="";
						      Assetasdoi="";
						      Assetaconf="";
						      Assetasremarks="";
						      	 
					   }
					   else
					   {
						   prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
					        prs3.executeUpdate(); 
						      stIT=0;
						      assetName1="";
						      ano1="";
						      Assetasdoi="";
						      Assetaconf="";
						      Assetasremarks="";
						   
					   }
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
						    System.out.println("Herer.............33333 V..............");
				        	
						 /*    prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
					        prs3.executeUpdate(); */
				        	
					        /* prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+assetNumber+"'");
					        prs2.executeUpdate();  */                                                                                                  																																																																																																																																																						
					        
					        prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"',    atype='"+assetName1+"',ano='"+ano1+"',asdoi='"+Assetasdoi+"',aconf='"+Assetaconf+"', asremarks='"+Assetasremarks+"',	             shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'           ,matype='"+mobaType+"',mano='"+mano+"',hatype='"+hdaType+"',hano='"+hano+"'	          where EmpId='"+empid+"'  ");
					        prs1.executeUpdate();
						    
					       /*  String query21 = "select * from asset_trans where (New_Asset_No='"+ano1+"' AND curAID=1) ";
						    st2 = conn.createStatement();
						    	  rs2 = st2.executeQuery(query21);
						    	  if(rs2.next())
						    	      {
							    		  prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+ano1+"' AND curAID=1");
								          prs12.executeUpdate();
								      } 
					    */
					   
				   }
				   else
				   {

					   prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
				        prs3.executeUpdate();
				        
					   if(!ano1.equals("-1")&& !ano1.equals(""))
					   {
						      stIT=0;
						      assetName1="";
						      ano1="";
						      Assetasdoi="";
						      Assetaconf="";
						      Assetasremarks="";
						      	 
					   }
					   if(assetName1.equals("Select") && assetNumber.equals("Select"))
					   {
						   prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
					        prs3.executeUpdate(); 
						  	  stIT=0;
						      assetName1="";
						      ano1="";
						      Assetasdoi="";
						      Assetaconf="";
						      Assetasremarks="";
					   }
					   
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
						    System.out.println("Herer.............4444 V..............");
						prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"',    atype='"+assetName1+"',ano='"+ano1+"',asdoi='"+Assetasdoi+"',aconf='"+Assetaconf+"', asremarks='"+Assetasremarks+"',	             shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'            ,matype='"+mobaType+"',mano='"+mano+"',hatype='"+hdaType+"',hano='"+hano+"'	         where EmpId='"+empid+"'  ");
				        prs1.executeUpdate();
				  
				   }
				   
				   /* if(!Assetatype.equals("Select") && !assetNumber.equals("Select"))
				      {
					    if(!assetName1.equals("Select"))
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
					    System.out.println("Herer.............111111...............");
			        	
					    prs3 = conn.prepareStatement("update asset_item set assignStatus='0' where Asset_No='"+ano1+"'");
				        prs3.executeUpdate();
			        	
				        prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+assetNumber+"'");
				        prs2.executeUpdate();                                                                                                   																																																																																																																																																						
				        
				        prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+assetNumber+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
				        prs1.executeUpdate();
					    
				        String query21 = "select * from asset_trans where (New_Asset_No='"+assetNumber+"' AND curAID=1) ";
					    st2 = conn.createStatement();
					    	  rs2 = st2.executeQuery(query21);
					    	  if(rs2.next())
					    	      {
						    		  prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+assetNumber+"' AND curAID=1");
							          prs12.executeUpdate();
							      } 
					    	 if(ano1.equals(""))
						         {
								     if(!assetName1.equals("Select"))
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
							         System.out.println("Herer...........44444444444.................");
				        	         prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+assetNumber+"'");
						             prs2.executeUpdate();
						             //prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+assetNumber+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"'         ,                   statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'    where EmpId='"+empid+"'");
						             prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+assetNumber+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
						             prs1.executeUpdate();
						             
						             String query211 = "select * from asset_trans where (New_Asset_No='"+assetNumber+"' AND curAID=1) ";
						    	     st2 = conn.createStatement();
							    	 rs2 = st2.executeQuery(query211);
							    	 if(rs2.next())
							    	        {
								    	       prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+assetNumber+"' AND curAID=1");
									           prs12.executeUpdate();
									         } 
				                 }
					    	  
					    	  //////////////////////////////////////////////////////////
					    	 /// insert the data to user assigne table
					    	  
					    	  
					      } */
				   
				   
				  /*  if(!ano1.equals("") && ano1.equals("Select")&&!ano1.equals("-1"))
			          {
					  if(!assetName1.equals("Select"))
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
						  
     	            System.out.println("Herer.........2222222222...................");
					   // prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+ano1+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"'  ,                   statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'  where EmpId='"+empid+"'");
					    prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+assetNumber+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
					    prs1.executeUpdate();
			            String query21 = "select * from asset_trans where (New_Asset_No='"+ano1+"' AND curAID=1) ";
				    	st2 = conn.createStatement();
				    	rs2 = st2.executeQuery(query21);
				    	if(rs2.next())
				    	    {
					    	    prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+ano1+"' AND curAID=1");
						        prs12.executeUpdate();
						    } 
		            } */

	  	 			
			   /* if(!ano1.equals("")&&ano1.equals("Select"))
			          {
					  if(!assetName1.equals("Select"))
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
					  System.out.println("Herer........33333333333...................");
     	           prs1 = conn.prepareStatement("update assignotherassetemp set EmpName='"+empname+"',emailid='"+emailid+"',epass='"+pass+"',edoi='"+doi2+"',eremarks='"+remarks2+"',nopcode='"+opcode+"',npass='"+pass1+"',ndoi='"+doi3+"',nremarks='"+remarks3+"',dscpin='"+dscpin+"',dsccin='"+dsccin+"',ddoi='"+doi4+"',dremarks='"+remarks4+"',douname='"+uname+"',dopass='"+pass3+"',dodoi='"+doi5+"',doremarks='"+remarks5+"',dcardno='"+dcardno+"',ddoi1='"+doi1+"',dremarks1='"+remarks1+"',acard='"+card+"',adoi='"+doi6+"',aremarks='"+remarks6+"',UpdatedBy='"+asgby+"',updatedDate='"+str+"',         idfile='"+idfile+"',level='"+level+"',dscpass='"+dscpass+"',imei='"+imei+"',isp='"+isp+"',dcardtype='"+dctype+"',ABType='"+type+"',              mobModelNo='"+mobModno+"',mobSerialNo='"+mobSerNo+"',mobDOI='"+mobDOI+"',emailAccess='"+emailAC+"',mobRemarks='"+mobRemarks+"',mobileNo='"+mobileNumber+"',SIMno='"+mobSIM+"',SIMProvided='"+mobProvider+"',lotusMod='"+lotusModel+"',lotusOwner='"+lotusOwner+"',lotusIP='"+lotusIP+"',ftpAddress='"+ftpAddress+"',ftpDOI='"+ftpDOI+"',	ftpRemarks='"+ftpRemarks1+"',hardModNo='"+hardModNo+"',hardSerNo='"+hardSerNo+"',hardDOI='"+harDOI+"',cap='"+hardCap+"',capType='"+hardCapType+"',hardRemarks='"+hardRemarks+"',otherDesc='"+otherDesc+"',otherDOI='"+otherDOI+"',otherRemarks='"+otherRemarks+"', atype='"+assetName1+"',ano='"+assetNumber+"',asdoi='"+assetDoi+"',aconf='"+assetConfig+"',asremarks='"+assetRemarks+"',shpath='"+hardCap1+"',scpathdoi='"+hardCapType1+"',schpathrem='"+hardRemarks1+"',apcr='"+otherDesc1+"',apcrdoi='"+otherDOI1+"',apcrrem='"+otherRemarks1+"',                         statusIT='"+stIT+"',statusEmail='"+stEmail+"',statusNewins='"+stNew+"',statusDSC='"+stDSC+"',statusDomain='"+stDom+"',statusDC='"+stDC+"',statusAcBio='"+stAC+"',statusMob='"+stMob+"',statusHD='"+stHD+"',statusShFol='"+stShF+"',statusApCre='"+stApC+"',statusOth='"+stOth+"'                   where EmpId='"+empid+"'  ");
     	          prs1.executeUpdate();
		         
			          } */

     	 		/* String assetName1 = request.getParameter("assetName");  
     	 		String assetNumber = request.getParameter("assetno");
     	 		String assetDoi = request.getParameter("doiasset");
     	 		String assetConfig = request.getParameter("assetconf");
     	 		String assetRemarks = request.getParameter("remarksasset"); */
     	          
     	         if((!assetName1.equals(""))&&(!ano1.equals("Select")))
			      {
			 		 System.out.println("----- Inserting Laptop or desktop to Assigned table  ----------- "+empid);
			 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
			 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
					 assetprs=assetCon.prepareStatement(AssetSearchQuery);
					 assetprs.setInt(1, new Integer(empid));
					 assetprs.setString(2,Assetatype);
					 assetprs.setString(3,ano1);
					 assetrs = assetprs.executeQuery();
					 if(!assetrs.next())
					   {
					  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
						 assetprs1.setInt(1, new Integer(empid));
						 assetprs1.setString(2, empname);
						 assetprs1.setString(3, empdesg);
						 assetprs1.setString(4, empbranch);
						 assetprs1.setString(5,empmob);
						 assetprs1.setString(6,empmail);
						 assetprs1.setString(7,"IT");
						 assetprs1.setString(8,Assetatype);
						 assetprs1.setString(9,ano1);
						 assetprs1.setString(10,Assetasdoi);
						 assetprs1.setString(11,asgby);
						 assetprs1.setString(12,asgemp);
						 assetprs1.setString(13,"USER");
						 assetprs1.setString(14,Assetasremarks);
						 assetprs1.setInt(15,1);
						 assetprs1.setString(16,Assetaconf);
					     assetprs1.execute();
					     
					     	 prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+ano1+"'");
					        prs2.executeUpdate();   
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
	    	  
				   
				   if(!emailid.equals(""))
				   {
					
					 		 System.out.println("----- Inserting Email ID  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,"Email ID");
							 assetprs.setString(3,emailid);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,"Email ID");
								 assetprs1.setString(9,emailid);
								 assetprs1.setString(10,doi2);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,remarks2);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							   }
					      
					   
				   }
				  
				   if(!opcode.equals(""))
				   {
						 System.out.println("----- Inserting NEWINS  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,"NEWINS ID");
							 assetprs.setString(3,opcode);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,"NEWINS ID");
								 assetprs1.setString(9,opcode);
								 assetprs1.setString(10,doi3);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,remarks2);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							   }
					      
					   
				   }
				   if(!dscpin.equals(""))
				   {
					  		 System.out.println("----- Inserting DSC  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,"DSC");
							 assetprs.setString(3,dscpin);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,"DSC");
								 assetprs1.setString(9,dscpin);
								 assetprs1.setString(10,doi4);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,remarks2);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							   }
					      
					   
				   }
				   if(!uname.equals(""))
				   {
					   		 System.out.println("----- Inserting Domin  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,"DOMAIN");
							 assetprs.setString(3,uname);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,"DOMAIN");
								 assetprs1.setString(9,uname);
								 assetprs1.setString(10,doi5);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,remarks5);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							   }
					      
					   
				   }
				   if(!dcardno.equals(""))
				   {
				
						
					   		 System.out.println("----- Inserting Data card  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,"DATA CARD");
							 assetprs.setString(3,dcardno);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,"DATA CARD");
								 assetprs1.setString(9,dcardno);
								 assetprs1.setString(10,doi1);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,remarks1);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							     
							     
							   }
					      
					   
				   }
				   if(!card.equals(""))
				   {
							 System.out.println("----- Inserting access card  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,"ACCESS CARD");
							 assetprs.setString(3,dcardno);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,"ACCESS CARD");
								 assetprs1.setString(9,card);
								 assetprs1.setString(10,doi6);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,remarks6);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							   }
					      
					   
				   }
				   if(!mobModno.equals(""))
				   {
						   String mobAssetNo=request.getParameter("mobAssetNo");
						   System.out.println("----- Inserting Mobile Details  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,mobaType);
							 assetprs.setString(3,mano);
							 assetrs = assetprs.executeQuery();
							 
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
								 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,mobaType);
								 assetprs1.setString(9,mano);
								 assetprs1.setString(10,mobDOI);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,mobRemarks);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							     
							     prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+mano+"'");
							        prs2.executeUpdate();   
							        String query21 = "select * from asset_trans where (New_Asset_No='"+mano+"' AND curAID=1) ";
								    st2 = conn.createStatement();
								    	  rs2 = st2.executeQuery(query21);
								    	  if(rs2.next())
								    	      {
									    		  prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+mano+"' AND curAID=1");
										          prs12.executeUpdate();
										      } 
							     
							   }
					      
					   
				   }
				   if(!hardModNo.equals(""))
				   {
						   
						   System.out.println("----- Inserting Hard Disc card  ----------- "+empid);
					 		 AssetSearchQuery="SELECT * FROM `assignassetemp` WHERE `EmpId`=? AND `AssetName`=? AND `AssetNo`=?";
					 		 assetCon = DriverManager.getConnection(url + dbName, userName,password);
							 assetprs=assetCon.prepareStatement(AssetSearchQuery);
							 assetprs.setInt(1, new Integer(empid));
							 assetprs.setString(2,hdaType);
							 assetprs.setString(3,hardSerNo);
							 assetrs = assetprs.executeQuery();
							 if(!assetrs.next())
							   {
							  	 AssetSearchQuery1="INSERT INTO `assignassetemp`(`EmpId`, `EmpName`, `EmpDesig`, `EmpBranch`, `MobNo`, `EmailID`,`AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignedByEmpId`, `AssignFor`, `Remarks`, `transferStatus`, `ConfigField`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						 		 assetprs1=assetCon.prepareStatement(AssetSearchQuery1);
						
						 		 
						 		 
						 		 assetprs1.setInt(1, new Integer(empid));
								 assetprs1.setString(2, empname);
								 assetprs1.setString(3, empdesg);
								 assetprs1.setString(4, empbranch);
								 assetprs1.setString(5,empmob);
								 assetprs1.setString(6,empmail);
								 assetprs1.setString(7,"IT");
								 assetprs1.setString(8,hdaType);
								 assetprs1.setString(9,hano);
								 assetprs1.setString(10,harDOI);
								 assetprs1.setString(11,asgby);
								 assetprs1.setString(12,asgemp);
								 assetprs1.setString(13,"USER");
								 assetprs1.setString(14,hardRemarks);
								 assetprs1.setInt(15,1);
								 assetprs1.setString(16,"");
							     assetprs1.execute();
							   }
							 
							 prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+hano+"'");
						        prs2.executeUpdate();   
						        String query21 = "select * from asset_trans where (New_Asset_No='"+hano+"' AND curAID=1) ";
							    st2 = conn.createStatement();
							    	  rs2 = st2.executeQuery(query21);
							    	  if(rs2.next())
							    	      {
								    		  prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+hano+"' AND curAID=1");
									          prs12.executeUpdate();
									      } 
						   
						   
					      
					   
				   }
				   
				   msg = "UPDATED__SUCCESSFULLY";
				   
				
				
				
			   }
			else
			{
				//////////// Here first time asset allocation to user...       
				if(assetName1.equals("Select")){
		    		  assetName1="";
		    		  assetNumber="";}
		    	else
		    	     {stIT=1;}
				
				
				
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
		    
		    	prs2 = conn.prepareStatement("insert into assignotherassetemp(EmpId,EmpName,emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,AssignedByName,DateOfAssigned,idfile,level,dscpass,imei,isp,dcardtype,ABType,dept,ro,empdesg,empbranch,empsubbranch,empmob,empemailid,mobModelNo,mobSerialNo,mobDOI,emailAccess,mobRemarks,hardModNo,hardSerNo,hardDOI,cap,capType,hardRemarks,otherDesc,otherDOI,otherRemarks,status,atype,ano,asdoi,aconf,asremarks,shpath,scpathdoi,schpathrem,apcr,apcrdoi,apcrrem,   statusIT,statusEmail,statusNewins, statusDSC, statusDomain, statusDC, statusAcBio, statusMob, statusHD, statusShFol, statusApCre, statusOth, mobileNo, SIMno, SIMProvided, lotusMod, lotusOwner, lotusIP, ftpAddress, ftpDOI, ftpRemarks,  matype,mano,hatype,hano) values(?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+asgby+"','"+str+"',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',?,?,?,?,?,?,?,?,?,?,?,    ?,?,?,?,?,?,?,?,?,?,?,?,  ?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    	//prs2 = conn.prepareStatement("INSERT INTO assignotherassetemp(EmpId,EmpName,emailid,epass,edoi,eremarks,nopcode,npass,ndoi,nremarks,dscpin,dsccin,ddoi,dremarks,douname,dopass,dodoi,doremarks,dcardno,ddoi1,dremarks1,acard,adoi,aremarks,AssignedByName,DateOfAssigned,idfile,level,dscpass,imei,isp,dcardtype,ABType,dept,ro,empdesg,empbranch,empsubbranch,empmob,empemailid,mobModelNo,mobSerialNo,mobDOI,emailAccess,mobRemarks,hardModNo,hardSerNo,hardDOI,cap,capType,hardRemarks,otherDesc,otherDOI,otherRemarks,status,atype,ano,asdoi,aconf,asremarks,shpath,scpathdoi,schpathrem,apcr,apcrdoi,apcrrem,   statusIT,statusEmail,statusNewins, statusDSC, statusDomain, statusDC, statusAcBio, statusMob, statusHD, statusShFol, statusApCre, statusOth, mobileNo, SIMno, SIMProvided, lotusMod, lotusOwner, lotusIP, ftpAddress, ftpDOI, ftpRemarks, matype,mano,hatype,hano) VALUES (?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+asgby+"','"+str+"',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',?,?,?,?,?,?,?,?,?,?,?,    ?,?,?,?,?,?,?,?,?,?,?,?,  ?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
		        
		        
		        /* here we need to  insert the branch name according to branch _ master   */
		        
		        
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
		        
		        prs2.setString(53, assetName1);
		        prs2.setString(54, assetNumber);
		       
		        prs2.setString(55, assetDoi);
		        prs2.setString(56, assetConfig);
		        prs2.setString(57, assetRemarks);
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
		        
		        prs2.setString(85,mobaType);
		        prs2.setString(86,mano);
		        prs2.setString(87,hdaType);
		        prs2.setString(88,hano);
		 	    i=prs2.executeUpdate();
		 	  
		 	    
		 	   String query21 = "select * from asset_trans where (New_Asset_No='"+assetNumber+"' AND curAID=1) ";
	    	   st2 = conn.createStatement();
	    	   rs2 = st2.executeQuery(query21);
	    	   if(rs2.next())
	    	      {
	    	  	     prs12 = conn.prepareStatement("update asset_trans set toUser='"+empname+"' where New_Asset_No='"+assetNumber+"' AND curAID=1");
		      		 prs12.executeUpdate();
			       } 
		 	    
		 	   prs2 = conn.prepareStatement("update asset_item set assignStatus='1' where Asset_No='"+assetNumber+"'");
	           prs2.executeUpdate();
		 	    
	 	    msg = "INSERTED__SUCCESSFULLY";
     	  }
	 
			if (i!=0)
			  { 
			 	 response.sendRedirect("assignOtherAsset.jsp?msg=" +msg);
			  }
			else
			 {      
			 	response.sendRedirect("assignOtherAsset.jsp?msg=" +msg); 
			 }
			
		}
		catch(Exception e){
			System.out.println("Error inside Asset Allocation :: "+e);
		}
		 finally 
		        {
		    		conn.close();
		    	}
%>
</body>
</html>