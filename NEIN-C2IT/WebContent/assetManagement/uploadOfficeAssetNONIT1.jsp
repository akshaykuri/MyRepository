<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

		String msgg = null;
		msgg = "Session__Time__out \\n Login__In__Again ";
		response.sendRedirect("loginho.jsp?msg=" + msgg);
	}
</script>

<body>
	<%
	System.out.println("------------- NONIT Upload Office Asset1  -----------------");
		File file = null;
		String msg="Office_Asset_Items_Inserted_Sucessfully ... ";
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
								 if( fileName.lastIndexOf("\\") >= 0 ){
				                      file = new File(fileName.substring( fileName.lastIndexOf("\\"))) ;
				                    }else{
				                       file = new File(fileName.substring(fileName.lastIndexOf("\\")+1)) ;
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
				"BRANCH_CODE",
				"BRANCH_PHONE",
				"ASSET_NAME",
				"ASSET_NO",
				"DATE_OF_ASSIGNED",
				"ASSIGNED_BY",
				"ASSIGNED_EMP",
				"REMARKS",
				"ASSIGNED_BRANCH_NAME"});

		java.util.Calendar now = java.util.Calendar.getInstance();
		
		int date1 = now.get(Calendar.YEAR);
		int date2 = now.get(Calendar.YEAR) - 1;
		
		String year = "" + date2 + "-" + date1;
		System.out.println("Current Year is : " + year);
	
		String empId = (String) session.getAttribute("empid");
		java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat(	"dd-MM-yyyy");
		String rootPath = "D:\\neinSoft\\files\\C2IT\\UploadOfficeAssets";
		String date = dateFormat.format(new Date());
		
		File attachment = new File(rootPath+File.separator+date+File.separator+empId);
		attachment.mkdirs();
		attachment.mkdirs();
		String fileName = null;
		List<String> files = new ArrayList<String>();
		try {
			 for(File file1 :collectionOfAttachments){
				FileInputStream fileInputStream = new FileInputStream(file1);
				fileName = attachment.getAbsolutePath() + File.separator + file1.getName();
				FileWriter fileWriter = new FileWriter(new File(fileName));
				System.out.println("FileName :"+fileName);
				CSVPrinter printer = new CSVPrinter(fileWriter, format);
				FileReader reader = new FileReader(file1);
				CSVParser csvParser = new CSVParser(reader, format);
				List<CSVRecord> records = csvParser.getRecords();
				for (CSVRecord record : records) {
					if (record.getRecordNumber() > 1)
					{
						printer.printRecord(
								record.get("BRANCH_CODE"),
								record.get("BRANCH_PHONE"),
								record.get("ASSET_NAME"),
								record.get("ASSET_NO"),
								record.get("DATE_OF_ASSIGNED"),
								record.get("ASSIGNED_BY"),
								record.get("ASSIGNED_EMP"),
								record.get("REMARKS"),
								record.get("ASSIGNED_BRANCH_NAME"));
					}
				}
				fileWriter.flush();
				fileWriter.close();
				printer.close();
				files.add((fileName));
				} 
			 }catch (IOException e) {
					e.printStackTrace();
				}
				System.out.println("Root Name :" + fileName);// /First time it shows
				try {
				
					FileReader reader = new FileReader(new File(fileName));
					CSVParser csvParser = new CSVParser(reader, format);
					List<CSVRecord> records = csvParser.getRecords();
					for (CSVRecord record : records) {
				System.out.println("Inside Record Reading");
					if (record.getRecordNumber() > 1)
					{
						System.out.println("record Reading one by one ");
						Connection conn = null,conn1 = null;
						ResultSet rs = null,
						rs1 = null,
						rs2 = null,
						rs3 = null;
						String url = "jdbc:mysql://localhost:3306/";
						String dbName = "csdb";
						String driver = "com.mysql.jdbc.Driver";
						String userName = "root";
						String password = "";
						PreparedStatement 
						prs2 = null, 
						psmt2 = null, 
						psmt3 = null, 
						psmt4=null,
						prs3=null,
						prs4=null,
						prbran = null;
						String newidvalue = null,newidvalue1 = null;
						String[] item;
						String rde11=null;
						int l = 0;
						int j = 0, i = 0;
						int incre = 0,incre1 = 0;
						int id = 100,id1 = 100;
						try 
						    {
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								conn = DriverManager.getConnection(url + dbName, userName,password);
								Statement stmt = conn.createStatement();
								String Branch_code =	record.get("BRANCH_CODE");
								String Branch_name = null;
								String Branch_address=null;
								String Branch_phone = record.get("BRANCH_PHONE");
								String Asset_type="IT";
								String Asset_name = null;
								String Asset_no = record.get("ASSET_NO");
								String Assigned_date = record.get("DATE_OF_ASSIGNED");
								String Assigned_name = record.get("ASSIGNED_BY");
								String Assigned_emp="NULL";
								String Assigned_fOr="OFFICE";	
								String Remarks = record.get("REMARKS");
								String Assigne_status="1";
								String Asset_config=null;
								String Assigned_branch_name = record.get("ASSIGNED_BRANCH_NAME");
								
								//  TO GET THE BRANCH name and address 
								psmt3=conn.prepareStatement("SELECT `id`, `m_b_name`, `m_b_no`, `m_b_location`, `region` FROM `branch_master_main` WHERE `m_b_no`=?");
								psmt3.setString(1,Branch_code);
								rs1=psmt3.executeQuery();
								
								if(rs1.next())
								{
									System.out.println("Inside Branch details");
									Branch_name=rs1.getString("m_b_name");
									Branch_address=rs1.getString("m_b_location");
									
									psmt2= conn.prepareStatement("select * from asset_item where Asset_No=?");
									psmt2.setString(1,Asset_no);
									rs2=psmt2.executeQuery();
								
									if(rs2.next())
									{
										System.out.println("Inside asset Details");
										Asset_name=rs2.getString("AssetType");
										Asset_config=rs2.getString("ConfigField");
										System.out.println("Asset Details :"+Asset_no+" : "+Asset_name+" : "+Asset_config);
										if(Branch_code.equals(rs2.getString("Branch")))
										{
											if(!(Asset_config == null))
											{
												Assigne_status="1";
												System.out.println("Inside Insert IF");
												psmt3= conn.prepareStatement("INSERT INTO `assignassetoffice`(`BranchCode`, `BranchName`, `BranchPHNo`, `BranchAddress`, `AssetType`, `AssetName`, `AssetNo`, `DateOfAssigned`, `AssignedByName`, `AssignFor`, `Remarks`, `assignStatus`, `ConfigField`, `assignToBranch`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
									
												System.out.println("Record : "+ Branch_code + " : "+ Branch_name+ " : "+Branch_phone+ " : "+Branch_address+ " : "+Asset_type+ " : "+Asset_name+ " : "+Asset_no+ " : "+Assigned_date+ " : "+Assigned_name+ " : "+Assigned_emp+ " : "+Assigned_fOr+ " : "+Remarks+ " : "+Assigne_status+ " : "+Asset_config+ " : "+Assigned_branch_name);
												psmt3.setString(1,Branch_code);
												psmt3.setString(2,Branch_name);
												psmt3.setString(3,Branch_phone);
												psmt3.setString(4,Branch_address);
												psmt3.setString(5,Asset_type);
												psmt3.setString(6,Asset_name);
												psmt3.setString(7,Asset_no);
												psmt3.setString(8,Assigned_date);
												psmt3.setString(9,Assigned_name);
												//psmt3.setString(10,Assigned_emp);
												psmt3.setString(10,Assigned_fOr);
												psmt3.setString(11,Remarks);
												psmt3.setString(12,Assigne_status);
												psmt3.setString(13,Asset_config);
												psmt3.setString(14,Assigned_branch_name);
												psmt3.execute();
												psmt4 = conn.prepareStatement("UPDATE `asset_item` SET `assignStatus`=1 where `Asset_No`=?");
												psmt4.setString(1,Asset_no);
												psmt4.executeUpdate();
												
											}
											else{
												msg=msg+"__Asset_Configuration_not_done_for_:_"+Asset_no;
											}
										}
										else{
											msg=msg+"__Asset_Not_Available_In_given_branch_"+Branch_code;
										}
										 
									}
									else {
										msg=msg+"__Asset_Not_Exist_:_"+Asset_no;
									}
								}
								else{
									msg = msg + "__Branch_Not_Exist_:_" + Branch_code ;
								}
					}catch(Exception e)	{
		 				System.out.println("Error in Inserting :"+e);
		   			 	} 
					}
				}
			response.sendRedirect("uploadOfficeAssetNONIT.jsp?msg=" +msg);
			}catch (Exception e) {
				System.out.println("Do Nothing Here");
				}
	
%>
</body>
</html>