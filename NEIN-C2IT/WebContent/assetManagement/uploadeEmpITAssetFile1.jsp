<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.csv.CSVFormat"%>
<%@page import="org.apache.commons.csv.CSVParser"%>
<%@page import="org.apache.commons.csv.CSVPrinter"%>
<%@page import="org.apache.commons.csv.CSVRecord"%>

<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	if (session == null || session.getAttribute("city") == null
			|| session.getAttribute("Nname") == null) {

		String
		msgg = null;
		msgg = "Session__Time__out \\n Login__In__Again ";
		response.sendRedirect("loginho.jsp?msg=" + msgg);
	}
</script>

<body>
	<%
		/* File file=null ;
		String msg="User_Asset_Items_inserted_Sucessfully ... ";
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		ServletContext context = pageContext.getServletContext();
		List<File> collectionOfAttachments = new ArrayList<File>();
		// String filePath = "D:\\neinSoft\\files\\C2IT\\UploadITAsset\\";

		// Verify the content type
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {
			   DiskFileItemFactory factory = new DiskFileItemFactory();
		      // maximum size that will be stored in memory
		      factory.setSizeThreshold(maxMemSize);
		      // Location to save data that is larger than maxMemSize.
		      factory.setRepository(new File("c:\\temp"));
		      // Create a new file upload handler
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      // maximum file size to be uploaded.
		      upload.setSizeMax( maxFileSize );
		      try { 
		    	         // Parse the request to get file items.
		    	         List fileItems = upload.parseRequest(request);
		    	         // Process the uploaded file items
		    	         Iterator i = fileItems.iterator();
		    	         while ( i.hasNext () ) {
		    	            FileItem fi = (FileItem)i.next();
		    	            if ( !fi.isFormField () ) {
		    	               // Get the uploaded file parameters
		    	               String fieldName = fi.getFieldName();
		    	               String fileName = fi.getName();
		    	               boolean isInMemory = fi.isInMemory();
		    	               long sizeInBytes = fi.getSize();
		    	               // Write the file
		    	               if( fileName.lastIndexOf("\\") >= 0 ) {
		    	                  file = new File( fileName + fileName.substring( fileName.lastIndexOf("\\"))) ;
		    	               } else {
		    	                  file = new File( fileName + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
		    	               }
		    	               fi.write( file ) ;
		    	               collectionOfAttachments.add(file);
		    	               //System.out.println(file +":"+ file);
		    	              }
		    	    	}
		    	} catch(IOException ex) {
				         System.out.println(ex);
					      }
		    	  } */
		File file = null;
		String msg = "User_Asset_Items_Inserted_Sucessfully ... ";
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		List<File> collectionOfAttachments = new ArrayList<File>();
		ServletContext context = pageContext.getServletContext();
		//String filePath = "D:\\neinSoft\\files\\C2IT\\UploadAssetItem\\";
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("c:\\temp"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxFileSize);
			try {
				// Parse the request to get file items.
				List fileItems = upload.parseRequest(request);

				// Process the uploaded file items
				Iterator i = fileItems.iterator();

				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						// Get the uploaded file parameters
						String fieldName = fi.getFieldName();
						String fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// Write the file
						if (fileName.lastIndexOf("\\") >= 0) {
							file = new File(fileName.substring(fileName
									.lastIndexOf("\\")));
						} else {
							file = new File(fileName.substring(fileName
									.lastIndexOf("\\") + 1));
						}
						fi.write(file);
						collectionOfAttachments.add(file);
						//					System.out.println(file + ":" + file);
					}
				}
			} catch (Exception ex) {
				System.out.println(ex);
			}
		}
		CSVFormat format = CSVFormat.DEFAULT.withHeader(new String[] {
				"SLNO", "EMPCODE", 
				"ASSIGNED_BY","ASSIGN_DATE",

				"MOBILE", "MOB_MODEL_NO", "MOB_SL_NO",
				"MOB_EMAIL_ACCESS", "MOBILE_DOI", "MOBILE_REMARKS_GIVING",
				"LAPTOP_DESKTOP", "ASSET_TYPE", "ASSET_NO", "ASSET_DOI",
				"ASSET_REMARKS", "DATA_CARD",

				"DATA_IMEI", "DATA_ISP", "DATA_CARD_TYPE",

				"DATA_CARD_NO", "DATA_CARD_DOI", "DATA_CARD_REMARKS",
				"NEWIN", "NEWIN_OPERATOR_CODE", "NEWIN_PASSWORD",
				"NEWIN_DOI", "NEWINS_REMARKS-GIVING",

				"NEWIN_LEVEL",

				"DOMAIN", "DOMAIN_USER_NAME", "DOMAIN_PASSWORD",
				"DOMAIN_DOI", "DOMAIN_REMARKS_GIVING", "ACCESS_CARD",
				"ACCESS_CARD_TYPE", "ACCESS_CARD_DOI",
				"ACCESS_CARD_REMARKS_GIVING", "PENDRIVE", 
				
				"PD_MODEL_NO","PD_SERIAL_NO","PD_SIZE",
				
				
				"PD_CAPACITY","PD_DOI", "PD_REMARKS_GIVING", "EMAIL", "EMAIL_ID",
				"EMAIL_PWD", "EMAIL_DOI", "EMAIL_REMARKS_GIVING",
				"OTHER_IT_ASSET", "OTHER_IT_ASSET_DESCRIPTION",

				"SHARED", "SHARED_PATH", "SHARED_DOI", "SHARED_REMARKS",

				"APPLICATION", "APPLICATION_NAMES", "APPLICATION_DOI",
				"APPLICATION_REMARKS",

				"OTHER_IT_ASSETS_DOI", "OTHER_IT_ASSET_REMARKS_GIVING",
				"DSC_DONGLE", "DSC_PASS", "DSC_CIN_NUMBER",
				"DSC_PIN_NUMBER", "DSC_REMARKS_GIVING", "DSC_DOI" });

		/* java.util.Calendar now = java.util.Calendar.getInstance();
		int date1 = now.get(Calendar.YEAR);
		int date2 = now.get(Calendar.YEAR) - 1;
		String year = "" + date2 + "-" + date1;
		
		//	System.out.println("Current Year is : " + year);
		
		Object object = request.getSession().getAttribute("sessionManagement");
		
		String empId =(String)session.getAttribute("empid");
		
		//		System.out.println("empId"+empId);
		
		java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd-MM-yyyy");
		
		String rootPath = "D:\\neinSoft\\files\\C2IT\\UploadUserAsset";
		
		String date = dateFormat.format(new Date());
		
		File attachment = new File(rootPath+File.separator+date+File.separator+empId);
		attachment.mkdirs();
		//attachment.mkdirs();
		String fileName = null;
		 */
		java.util.Calendar now = java.util.Calendar.getInstance();

		int date1 = now.get(Calendar.YEAR);
		int date2 = now.get(Calendar.YEAR) - 1;

		String year = "" + date2 + "-" + date1;
		System.out.println("Current Year is : " + year);

		String empId = (String) session.getAttribute("empid");
		java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat(
				"dd-MM-yyyy");
		String rootPath = "E:\\neinSoft\\files\\C2IT\\UploadUserAsset";
		String date = dateFormat.format(new Date());

		File attachment = new File(rootPath + File.separator + date
				+ File.separator + empId);
		attachment.mkdirs();
		attachment.mkdirs();
		String fileName = null;

		/*
			List<String> files = new ArrayList<String>();
		try{
		
			for(File file1 :collectionOfAttachments){
			FileInputStream fileInputStream = new FileInputStream(file1);
			fileName = attachment.getAbsolutePath() + File.separator + file1.getName();
			FileWriter fileWriter = new FileWriter(new File(fileName));
		//		System.out.println("FileName :"+fileName);
			CSVPrinter printer = new CSVPrinter(fileWriter, format);
			FileReader reader = new FileReader(file1);
			CSVParser csvParser = new CSVParser(reader, format);
			List<CSVRecord> records = csvParser.getRecords(); */
		List<String> files = new ArrayList<String>();
		try {
			for (File file1 : collectionOfAttachments) {
				FileInputStream fileInputStream = new FileInputStream(file1);
				fileName = attachment.getAbsolutePath() + File.separator
						+ file1.getName();
				FileWriter fileWriter = new FileWriter(new File(fileName));
				System.out.println("FileName :" + fileName);
				CSVPrinter printer = new CSVPrinter(fileWriter, format);
				FileReader reader = new FileReader(file1);
				CSVParser csvParser = new CSVParser(reader, format);
				List<CSVRecord> records = csvParser.getRecords();
				for (CSVRecord record : records) {
					if (record.getRecordNumber() > 1) {
						printer.printRecord(
								record.get("SLNO"),
								record.get("EMPCODE"),
								
								record.get("ASSIGNED_BY"),record.get("ASSIGN_DATE"),
								
								record.get("MOBILE"),
								record.get("MOB_MODEL_NO"),
								record.get("MOB_SL_NO"),
								record.get("MOB_EMAIL_ACCESS"),
								record.get("MOBILE_DOI"),
								record.get("MOBILE_REMARKS_GIVING"),
								record.get("LAPTOP_DESKTOP"),
								record.get("ASSET_TYPE"),
								record.get("ASSET_NO"),
								record.get("ASSET_DOI"),
								record.get("ASSET_REMARKS"),
								record.get("DATA_CARD"),
								record.get("DATA_CARD_NO"),
								record.get("DATA_CARD_DOI"),

								record.get("DATA_IMEI"),
								record.get("DATA_ISP"),
								record.get("DATA_CARD_TYPE"),

								record.get("DATA_CARD_REMARKS"),
								record.get("NEWIN"),
								record.get("NEWIN_OPERATOR_CODE"),
								record.get("NEWIN_PASSWORD"),
								record.get("NEWIN_DOI"),
								record.get("NEWINS_REMARKS-GIVING"),

								record.get("NEWIN_LEVEL"),

								record.get("DOMAIN"),
								record.get("DOMAIN_USER_NAME"),
								record.get("DOMAIN_PASSWORD"),
								record.get("DOMAIN_DOI"),
								record.get("DOMAIN_REMARKS_GIVING"),
								record.get("ACCESS_CARD"),
								record.get("ACCESS_CARD_TYPE"),
								record.get("ACCESS_CARD_DOI"),
								record.get("ACCESS_CARD_REMARKS_GIVING"),
								record.get("PENDRIVE"),
							
								record.get("PD_MODEL_NO"),
								record.get("PD_SERIAL_NO"),
								record.get("PD_SIZE"),
								
								record.get("PD_CAPACITY"),
								record.get("PD_DOI"),
								record.get("PD_REMARKS_GIVING"),
								record.get("EMAIL"),
								record.get("EMAIL_ID"),
								record.get("EMAIL_PWD"),
								record.get("EMAIL_DOI"),
								record.get("EMAIL_REMARKS_GIVING"),

								record.get("SHARED"),
								record.get("SHARED_PATH"),
								record.get("SHARED_DOI"),
								record.get("SHARED_REMARKS"),

								record.get("APPLICATION"),
								record.get("APPLICATION_NAMES"),
								record.get("APPLICATION_DOI"),
								record.get("APPLICATION_REMARKS"),

								record.get("OTHER_IT_ASSET"),
								record.get("OTHER_IT_ASSET_DESCRIPTION"),
								record.get("OTHER_IT_ASSETS_DOI"),
								record.get("OTHER_IT_ASSET_REMARKS_GIVING"),
								record.get("DSC_DONGLE"),
								record.get("DSC_CIN_NUMBER"),
								record.get("DSC_PIN_NUMBER"),

								record.get("DSC_PASS"),

								record.get("DSC_REMARKS_GIVING"),
								record.get("DSC_DOI"));
					}
				}
				fileWriter.flush();
				fileWriter.close();
				printer.close();
				files.add((fileName));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		//System.out.println("Root Name :" + fileName);// /First time it shows
		try {
			// details from HRMS
			String EmpId = null;
			String EmpName = null;
			String dept = null;
			String ro = null;
			String empdesg = null;
			String empbranch = null;
			String empsubbranch = null;
			String empmob = null;
			String empemailid = null;

			
			// details need to fetch from file 

			String statusIT = null;
			String atype = null;
			String ano = null;
			String asdoi = null;
			String aconf = null;
			String asremarks = null;

			String statusEmail = null;
			String emailid = null;
			String epass = null;
			String edoi = null;
			String idfile = null;
			String eremarks = null;

			String statusNewins = null;
			String nopcode = null;
			String npass = null;
			String ndoi = null;
			String nremarks = null;
			String level = null;

			String statusDSC = null;
			String dscpin = null;
			String dsccin = null;
			String ddoi = null;
			String dscpass = null;
			String dremarks = null;

			String statusDomain = null;
			String douname = null;
			String dopass = null;
			String dodoi = null;
			String doremarks = null;

			String statusDC = null;
			String dcardno = null;
			String ddoi1 = null;
			String imei = null;
			String isp = null;
			String dcardtype = null;
			String dremarks1 = null;

			String statusAcBio = null;
			String acard = null;
			String adoi = null;
			String ABType = null;
			String aremarks = null;

			String AssignedByName = null;
			String DateOfAssigned = null;
			
			String UpdatedBy = null;
			String updatedDate = null;
			String status = null;
			String id = null;

			String statusMob = null;
			String mobModelNo = null;
			String mobSerialNo = null;
			String mobDOI = null;
			String emailAccess = null;
			String mobRemarks = null;

			String statusHD = null;
			String hardModNo = null;
			String hardSerNo = null;
			String hardDOI = null;
			String cap = null;
			String capType = null;
			String hardRemarks = null;

			String statusShFol = null;
			String shpath = null;
			String scpathdoi = null;
			String schpathrem = null;

			String statusApCre = null;
			String apcr = null;
			String apcrdoi = null;
			String apcrrem = null;

			String statusOth = null;
			String otherDesc = null;
			String otherDOI = null;
			String otherRemarks = null;

			FileReader reader = new FileReader(new File(fileName));
			CSVParser csvParser = new CSVParser(reader, format);
			List<CSVRecord> records = csvParser.getRecords();
			for (CSVRecord record : records) {
				if (record.getRecordNumber() > 1) {

					EmpId = record.get("EMPCODE");
					//System.out.println("Record Reading one by one ");
					Connection conn = null, conn2 = null;
					ResultSet rs = null, rs1 = null, rs2 = null, rs3 = null;
					String url = "jdbc:mysql://localhost:3306/";
					String dbName = "csdb";
					String dbName2 = "leavemanagement";
					String driver = "com.mysql.jdbc.Driver";
					String userName = "root";
					String password = "";
					 AssignedByName = record.get("ASSIGNED_BY");
					 DateOfAssigned = record.get("ASSIGN_DATE");
					
					PreparedStatement prs2 = null, psmt1 = null, psmt2 = null, psmt3 = null, psmt4 = null, prs3 = null, prs4 = null, prbran = null;

					//	System.out.println("Record :"+record.get("SLNO")+"  :  "+""+record.get("EMPCODE")+":"+record.get("MOBILE" )+""+record.get("MOB_MODEL_NO")+":"+record.get("MOB_SL_NO")+":"+record.get("MOB_EMAIL_ACCESS")+":"+record.get("MOBILE_DOI")+":"+record.get("MOBILE_REMARKS_GIVING")+":"+record.get("LAPTOP_DESKTOP")+":"+record.get("ASSET_TYPE")+":"+record.get("ASSET_DOI")+":"+record.get("ASSET_REMARKS")+":"+record.get("DATA_CARD")+":"+record.get("DATA_CARD_NO")+":"+	record.get("DATA_CARD_DOI")+":"+record.get("DATA_CARD_REMARKS")+":"+record.get("NEWIN")+":"+record.get("NEWIN_OPERATOR_CODE")+":"+record.get("NEWIN_PASSWORD")+":"+record.get("NEWIN_DOI")+":"+record.get("NEWINS_REMARKS-GIVING")+":"+record.get("DOMAIN")+":"+record.get("DOMAIN_USER_NAME")+":"+record.get("DOMAIN_PASSWORD")+":"+record.get("DOMAIN_DOI")+":"+record.get("DOMAIN_REMARKS_GIVING")+":"+record.get("ACCESS_CARD")+":"+record.get("ACCESS_CARD_TYPE")+":"+record.get("ACCESS_CARD_DOI")+":"+record.get("ACCESS_CARD_REMARKS_GIVING")+":"+record.get("PENDRIVE")+":"+record.get("PD_CAPACITY")+":"+record.get("PD_DOI")+":"+record.get("PD_REMARKS_GIVING")+":"+record.get("EMAIL")+":"+record.get("EMAIL_ID")+":"+record.get("EMAIL_PWD")+":"+record.get("EMAIL_DOI")+":"+record.get("EMAIL_REMARKS_GIVING")+":"+record.get("OTHER_IT_ASSET")+":"+record.get("OTHER_IT_ASSET_DESCRIPTION")+":"+record.get("OTHER_IT_ASSETS_DOI")+":"+record.get("OTHER_IT_ASSET_REMARKS_GIVING")+":"+record.get("DSC_DONGLE")+":"+record.get("DSC_CIN_NUMBER")+":"+record.get("DSC_PIN_NUMBER")+":"+record.get("DSC_REMARKS_GIVING")+":"+record.get("DSC_DOI"));;
					//	String EmpId=null,EmpName=null,emailid=null,epass=null,edoi=null,eremarks=null,nopcode=null,npass=null,ndoi=null,nremarks=null,dscpin=null,dsccin=null,ddoi=null,dremarks=null,douname=null,dopass=null,dodoi=null,doremarks=null,dcardno=null,ddoi1=null,dremarks1=null,acard=null,adoi=null,aremarks=null,AssignedByName=null,DateOfAssigned=null,UpdatedBy=null,updatedDate=null,idfile=null,level=null,dscpass=null,imei=null,isp=null,dcardtype=null,ABType=null,dept=null,ro=null,empdesg=null,empbranch=null,empsubbranch=null,empmob=null,empemailid=null,mobModelNo=null,mobSerialNo=null,obDOI=null,emailAccess=null,mobRemarks=null,hardModNo=null,hardSerNo=null,	hardDOI=null,cap=null,capType=null,hardRemarks=null,otherDesc=null,otherDOI=null,otherRemarks=null,status=null,id=null,atype=null,ano=null,asdoi=null,aconf=null,asremarks=null,shpath=null,scpathdoi=null,schpathrem=null,apcr=null,apcrdoi=null,apcrrem=null,statusIT=null,statusEmail=null,statusNewins=null,statusDSC=null,statusDomain=null,statusDC=null,statusAcBio=null,statusMob=null,statusHD=null,statusShFol=null,statusApCre=null,statusOth=null;
					try {
						Class.forName("com.mysql.jdbc.Driver")
								.newInstance();
						conn = DriverManager.getConnection(url + dbName,
								userName, password);
						psmt1 = conn
								.prepareStatement("SELECT * from assignotherassetemp where EmpId=?");
						psmt1.setInt(1, Integer.parseInt(EmpId));
						rs1 = psmt1.executeQuery();
						if (rs1.next()) {
							msg = msg + "__Alerady_asset_assigned_For_"
									+ EmpId;
						}// end of first if 
						else {
						//	System.out.println("I am in side the else");
							conn2 = DriverManager.getConnection(url
									+ dbName2, userName, password);
							Statement stmt2 = conn2.createStatement();
							//to get details form the leavemanagement db
							psmt2 = conn2
									.prepareStatement("SELECT u.*,b.b_name,d.department_name FROM `user` u Inner join branch_master b on u.branch_id=b.id Inner join department d on d.department_id=u.department_id  WHERE u.`emp_id`=?");
							psmt2.setInt(1, Integer.parseInt(EmpId));
							rs2 = psmt2.executeQuery();
							if (rs2.next()) {
							//	System.out
							//			.println("Inside User Details from HRMS ");
								EmpId = rs2.getString("emp_id");
								EmpName = rs2.getString("full_name");
								dept = rs2.getString("department_name");
								ro = "";
								empdesg = "";
								empbranch = rs2.getString("b_name");
								empsubbranch = rs2.getString("branch_id");
								empmob = rs2.getString("mobile_number");
								empemailid = rs2.getString("email");
								//////////////////// 

								//System.out.println(" laptop :"
							//			+ record.get("LAPTOP_DESKTOP"));
								if (record.get("LAPTOP_DESKTOP").equals("yes")) {
								//	System.out.println("Laptop :");
									statusIT = "1";
									atype = record.get("ASSET_TYPE");
									ano = record.get("ASSET_NO");
									asdoi = record.get("ASSET_DOI");
									aconf = "";//NEED TO DO CONFIG
									asremarks = record.get("ASSET_REMARKS");
								}
								else{
									statusIT = "0";
									atype = "";//record.get("ASSET_TYPE");
									ano = "";//record.get("ASSET_NO");
									asdoi ="";// record.get("ASSET_DOI");
									aconf = "";//NEED TO DO CONFIG
									asremarks ="";// record.get("ASSET_REMARKS");
								}
								if(record.get("PENDRIVE").equals("yes"))
								{
									 statusHD = "1";
									 hardModNo =record.get("PD_MODEL_NO");
									 hardSerNo = record.get("PD_SERIAL_NO");
									 hardDOI = record.get("PD_DOI");
									 cap = record.get("PD_SIZE");
									 capType = record.get("PD_CAPACITY");
									 hardRemarks = record.get("PD_REMARKS_GIVING");
								}
								
								else{
									 statusHD = "0";
									 hardModNo = "";
									 hardSerNo = "";
									 hardDOI = "";
									 cap = "";
									 capType = "";
									 hardRemarks = "";
								}
								
								//System.out.println(" mobile :"
								//		+ record.get("MOBILE"));
								if (record.get("MOBILE") .equals("yes")) {
							//		System.out.println("Mobile :");
									statusMob = "1";
									mobModelNo = record.get("MOB_MODEL_NO");
									mobSerialNo = record.get("MOB_SL_NO");
									mobDOI = record.get("MOBILE_DOI");
									emailAccess = record
											.get("MOB_EMAIL_ACCESS");
									mobRemarks = record
											.get("MOBILE_REMARKS_GIVING");
								}
								else{
									statusMob = "0";
									mobModelNo = "";//record.get("MOB_MODEL_NO");
									mobSerialNo ="";// record.get("MOB_SL_NO");
									mobDOI = "";//record.get("MOBILE_DOI");
									emailAccess = "";//record.get("MOB_EMAIL_ACCESS");
									mobRemarks ="";// record
									
								}
							//	System.out.println(" data card :"
								//		+ record.get("DATA_CARD"));
								if (record.get("DATA_CARD") .equals("yes")) {
								//	System.out.println("DAta card :");
									statusDC = "1";
									dcardno = record.get("DATA_CARD_NO");
									ddoi1 = record.get("DATA_CARD_DOI");
									imei = record.get("DATA_IMEI");
									isp = record.get("DATA_ISP");
									dcardtype = record
											.get("DATA_CARD_TYPE");
									dremarks1 = record
											.get("DATA_CARD_REMARKS");
								}
								else
								{
									dcardno = "";//record.get("DATA_CARD_NO");
									ddoi1 = "";//record.get("DATA_CARD_DOI");
									imei = "";//record.get("DATA_IMEI");
									isp = "";//record.get("DATA_ISP");
									dcardtype = "";//
									dremarks1 = "";//
								}
								System.out.println(" newin :"
										+ record.get("NEWIN"));
								if (record.get("NEWIN") .equals("yes")) {
								//	System.out.println("Newins :");
									statusNewins = "1";
									nopcode = record
											.get("NEWIN_OPERATOR_CODE");
									npass = record.get("NEWIN_PASSWORD");
									ndoi = record.get("NEWIN_DOI");
									nremarks = record
											.get("NEWINS_REMARKS-GIVING");
									level = record.get("NEWIN_LEVEL");
								}
								else
								{
									nopcode = "";//
									npass = "";//record.get("NEWIN_PASSWORD");
									ndoi = "";//record.get("NEWIN_DOI");
									nremarks = "";//
									level = "";//record.get("NEWIN_LEVEL");
								}
							//	System.out.println(" domain :"
								//		+ record.get("DOMAIN"));
								if (record.get("DOMAIN") .equals("yes")) {
									//System.out.println("Domain :");
									statusDomain = "1";
									douname = record
											.get("DOMAIN_USER_NAME");
									dopass = record.get("DOMAIN_PASSWORD");
									dodoi = record.get("DOMAIN_DOI");
									doremarks = record
											.get("DOMAIN_REMARKS_GIVING");
								}
								else{
									douname = "";//
									dopass = "";//record.get("DOMAIN_PASSWORD");
									dodoi = "";//record.get("DOMAIN_DOI");
									doremarks = "";//record
										}
								//System.out.println(" access  card :"
							//			+ record.get("ACCESS_CARD"));
								if (record.get("ACCESS_CARD") .equals("yes")) {
								///	System.out.println("Access card :");
									statusAcBio = "1";
									acard = record.get("ACCESS_CARD_TYPE");
									adoi = record.get("ACCESS_CARD_DOI");
									ABType = "";//need to check
									aremarks = record
											.get("ACCESS_CARD_REMARKS_GIVING");
								}
								else{
									acard = "";//record.get("ACCESS_CARD_TYPE");
									adoi = "";//record.get("ACCESS_CARD_DOI");
									ABType = "";//need to check
									aremarks ="";// record
									
								}
								//System.out.println(" Email :"
									//	+ record.get("EMAIL"));
								if (record.get("EMAIL") .equals("yes")) {
								//	System.out.println("Email :");
									statusEmail = "1";
									emailid = record.get("EMAIL_ID");
									epass = record.get("EMAIL_PWD");
									edoi = record.get("EMAIL_DOI");
									idfile = "";//need to check
									eremarks = record
											.get("EMAIL_REMARKS_GIVING");
								}
								else{
									emailid = "";//record.get("EMAIL_ID");
									epass = "";//record.get("EMAIL_PWD");
									edoi = "";//record.get("EMAIL_DOI");
									idfile ="";//need to check
									eremarks ="";// record
								}
							//	System.out.println(" DSC :"
							//			+ record.get("DSC_DONGLE"));
								if (record.get("DSC_DONGLE") .equals("yes")) {
								//	System.out.println("DSC :");
									statusDSC = "1";
									dscpin = record.get("DSC_PIN_NUMBER");
									dsccin = record.get("DSC_CIN_NUMBER");
									ddoi = record.get("DSC_DOI");
									dscpass = record.get("DSC_PASS");
									dremarks = record
											.get("DSC_REMARKS_GIVING");
								}
								else{
									dscpin ="";// record.get("DSC_PIN_NUMBER");
									dsccin ="";// record.get("DSC_CIN_NUMBER");
									ddoi = "";//record.get("DSC_DOI");
									dscpass ="";// record.get("DSC_PASS");
									dremarks = "";//record
									
								}
								///System.out.println(" shared :"
								//		+ record.get("SHARED"));
								if (record.get("SHARED") .equals("yes")) {
									System.out.println("Folder :");
									statusShFol = "1";
									shpath = record.get("SHARED_PATH");
									scpathdoi = record.get("SHARED_DOI");
									schpathrem = record
											.get("SHARED_REMARKS");
								}
								else
								{
									shpath ="";//record.get("SHARED_PATH");
									scpathdoi = "";//record.get("SHARED_DOI");
									schpathrem = "";//record
									
								}
								//System.out.println(" application :"
								//		+ record.get("APPLICATION"));
								if (record.get("APPLICATION") .equals("yes")) {
								//	System.out.println("Application :");
									statusApCre = "1";
									apcr = record.get("APPLICATION_NAMES");
									apcrdoi = record.get("APPLICATION_DOI");
									apcrrem = record
											.get("APPLICATION_REMARKS");
								}
								else
								{
									apcr ="";// record.get("APPLICATION_NAMES");
									apcrdoi ="";// record.get("APPLICATION_DOI");
									apcrrem = "";//record
								}
							//	System.out.println(" other asset :"
							//			+ record.get("OTHER_IT_ASSET"));
								if (record.get("OTHER_IT_ASSET") .equals("yes")) {
								//	System.out.println("other asset :");
									statusOth = "1";
									otherDesc = record
											.get("OTHER_IT_ASSET_DESCRIPTION");
									otherDOI = record
											.get("OTHER_IT_ASSETS_DOI");
									otherRemarks = record
											.get("OTHER_IT_ASSET_REMARKS_GIVING");
								}
								else
								{
									otherDesc = "";
									otherDOI = "";
									otherRemarks ="";
								}
						
								
								psmt3 = conn
										.prepareStatement("INSERT INTO `assignotherassetemp`(`EmpId`, `EmpName`, `emailid`, `epass`, `edoi`, `eremarks`, `nopcode`, `npass`, `ndoi`, `nremarks`, `dscpin`, `dsccin`, `ddoi`, `dremarks`, `douname`, `dopass`, `dodoi`, `doremarks`, `dcardno`, `ddoi1`, `dremarks1`, `acard`, `adoi`, `AssignedByName`, `DateOfAssigned`, `UpdatedBy`, `updatedDate`, `idfile`, `level`, `dscpass`, `imei`, `isp`, `dcardtype`, `ABType`, `dept`, `ro`, `empdesg`, `empbranch`, `empsubbranch`, `empmob`, `empemailid`, `mobModelNo`, `mobSerialNo`, `mobDOI`, `emailAccess`, `mobRemarks`, `hardModNo`, `hardSerNo`, `hardDOI`, `cap`, `capType`, `hardRemarks`, `otherDesc`, `otherDOI`, `otherRemarks`, `status`,  `atype`, `ano`, `asdoi`, `aconf`, `asremarks`, `shpath`, `scpathdoi`, `schpathrem`, `apcr`, `apcrdoi`, `apcrrem`, `statusIT`, `statusEmail`, `statusNewins`, `statusDSC`, `statusDomain`, `statusDC`, `statusAcBio`, `statusMob`, `statusHD`, `statusShFol`, `statusApCre`, `statusOth`, `aremarks`) VALUES	(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

								psmt3.setInt(1, Integer.parseInt(EmpId));
								psmt3.setString(2, EmpName);
								psmt3.setString(3, emailid);
								psmt3.setString(4, epass);
								psmt3.setString(5, edoi);
								psmt3.setString(6, eremarks);
								psmt3.setString(7, nopcode);
								psmt3.setString(8, npass);
								psmt3.setString(9, ndoi);
								psmt3.setString(10, nremarks);
								psmt3.setString(11, dscpin);
								psmt3.setString(12, dsccin);
								psmt3.setString(13, ddoi);
								psmt3.setString(14, dremarks);
								psmt3.setString(15, douname);
								psmt3.setString(16, dopass);
								psmt3.setString(17, dodoi);
								psmt3.setString(18, doremarks);
								psmt3.setString(19, dcardno);
								psmt3.setString(20, ddoi1);
								psmt3.setString(21, dremarks1);
								psmt3.setString(22, acard);
								psmt3.setString(23, adoi);
								psmt3.setString(24, AssignedByName);
								psmt3.setString(25, DateOfAssigned);
								psmt3.setString(26, UpdatedBy);
								psmt3.setString(27, updatedDate);
								psmt3.setString(28, idfile);
								psmt3.setString(29, level);
								psmt3.setString(30, dscpass);
								psmt3.setString(31, imei);
								psmt3.setString(32, isp);
								psmt3.setString(33, dcardtype);
								psmt3.setString(34, ABType);
								psmt3.setString(35, dept);
								psmt3.setString(36, ro);
								psmt3.setString(37, empdesg);
								psmt3.setString(38, empbranch);
								psmt3.setString(39, empsubbranch);
								psmt3.setString(40, empmob);
								psmt3.setString(41, empemailid);
								psmt3.setString(42, mobModelNo);
								psmt3.setString(43, mobSerialNo);
								psmt3.setString(44, mobDOI);
								psmt3.setString(45, emailAccess);
								psmt3.setString(46, mobRemarks);
								psmt3.setString(47, hardModNo);
								psmt3.setString(48, hardSerNo);
								psmt3.setString(49, hardDOI);
								psmt3.setString(50, cap);
								psmt3.setString(51, capType);
								psmt3.setString(52, hardRemarks);
								psmt3.setString(53, otherDesc);
								psmt3.setString(54, otherDOI);
								psmt3.setString(55, otherRemarks);
								psmt3.setInt(56, 1);
								//psmt3.setString(57,id); 
								psmt3.setString(57, atype);
								psmt3.setString(58, ano);
								psmt3.setString(59, asdoi);
								psmt3.setString(60, aconf);
								psmt3.setString(61, asremarks);
								psmt3.setString(62, shpath);
								psmt3.setString(63, scpathdoi);
								psmt3.setString(64, schpathrem);
								psmt3.setString(65, apcr);
								psmt3.setString(66, apcrdoi);
								psmt3.setString(67, apcrrem);
								if (statusIT == null) {
									//	psmt3.setInt(68,Integer.parseInt("0")); 
									psmt3.setInt(68, 0);

								} else {
									//	psmt3.setInt(68,Integer.parseInt(statusIT)); 
									psmt3.setInt(68, 1);

								}
								if (statusEmail == null) {
									//psmt3.setInt(69,Integer.parseInt("0")); 
									psmt3.setInt(69, 0);
								} else {
									//psmt3.setInt(69,Integer.parseInt(statusEmail)); 
									psmt3.setInt(69, 1);
								}
								if (statusNewins == null) {
									//psmt3.setInt(70,Integer.parseInt("0")); 
									psmt3.setInt(70, 0);
								} else {
									//smt3.setInt(70,Integer.parseInt(statusNewins)); 
									psmt3.setInt(70, 1);
								}
								if (statusDSC == null) {
									//	psmt3.setInt(71,Integer.parseInt("0")); 
									psmt3.setInt(71, 0);
								} else {
									//psmt3.setInt(71,Integer.parseInt(statusDSC)); 
									psmt3.setInt(71, 1);
								}
								if (statusDomain == null) {
									//psmt3.setInt(72,Integer.parseInt("0"));
									psmt3.setInt(72, 0);
								} else {
									//psmt3.setInt(72,Integer.parseInt(statusDomain)); 
									psmt3.setInt(72, 1);
								}
								if (statusDC == null) {
									psmt3.setInt(73, 0);

								} else {
									psmt3.setInt(73, 1);

								}
								if (statusAcBio == null) {
									psmt3.setInt(74, 0);

								} else {
									psmt3.setInt(74, 1);

								}
								if (statusMob == null) {
									psmt3.setInt(75, 0);

								} else {
									psmt3.setInt(75, 1);

								}
								if (statusHD == null) {
									psmt3.setInt(76, 0);

								} else {
									psmt3.setInt(76, 1);

								}
								if (statusShFol == null) {
									psmt3.setInt(77, 0);

								} else {
									psmt3.setInt(77, 1);

								}
								if (statusApCre == null) {
									psmt3.setInt(78, 0);

								} else {
									psmt3.setInt(78, 1);

								}
								if (statusOth == null) {
									psmt3.setInt(79, 0);

								} else {
									psmt3.setInt(79, 1);

								}
								psmt3.setString(80, aremarks);
								psmt3.execute();
								/////////////////
							} else {
								msg = msg
										+ "__Employee_not created_in_hrms_:_"
										+ EmpId;
							}

						}// end of first else
					} catch (Exception e) {
						System.out.println("Error in Inserting :" + e);
					}
				}//record if
			}//records for loop
			response.sendRedirect("uploadEmpITAssetFile.jsp?msg=" + msg);
		} catch (IOException e) {
			System.out.println("Do Nothing Here");
		}
	%>
</body>
</html>