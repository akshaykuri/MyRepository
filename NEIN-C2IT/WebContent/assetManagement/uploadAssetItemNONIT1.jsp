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
		File file = null;
	System.out.println("------------- NONIT uploadAssetItem1  -----------------");
		String msg="Asset_Items_inserted_Sucessfully ... ";
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
				"SLNO",
				"PONO",
				"INVOICE_NO",
				"ASSET_NO",
				"ASSET_TYPE",
				"BRANCH",
				"BRANCH_NAME",
				"WARANTY",
				"WAREXP",
				"EMPID",
				"ASSIGSTATUS",
				"SCRAP",
				"MAINTANANCE",
				"ASSIGNED_FOR",
				"ASSIGNED_BRANCH",
				"REMARKS",
				"CONFIG_STATUS",
				"CONFIG_FIELD",
				"ASSET_NAME"});

	
		java.util.Calendar now = java.util.Calendar.getInstance();
		
		int date1 = now.get(Calendar.YEAR);
		int date2 = now.get(Calendar.YEAR) - 1;
		
		String year = "" + date2 + "-" + date1;
		System.out.println("Current Year is : " + year);
	
		String empId = (String) session.getAttribute("empid");
		java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat(	"dd-MM-yyyy");
		String rootPath = "D:\\neinSoft\\files\\C2IT\\UploadAssetItem";
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
						printer.printRecord(record.get("SLNO"),record.get("PONO"),record.get("INVOICE_NO"),record.get("ASSET_NO"),record.get("ASSET_TYPE"),record.get("BRANCH"),record.get("BRANCH_NAME"),record.get("WARANTY"),record.get("WAREXP"),record.get("EMPID"),record.get("ASSIGSTATUS"),record.get("SCRAP"),record.get("MAINTANANCE"),record.get("ASSIGNED_FOR"),record.get("ASSIGNED_BRANCH"),record.get("REMARKS"),record.get("CONFIG_STATUS"),record.get("CONFIG_FIELD"),record.get("ASSET_NAME"));
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
					if (record.getRecordNumber() > 1)
					{
			//			System.out.println(" "+record.get("SLNO")+ " : "+record.get("PONO")+ " : "+record.get("ASSET_TYPE")+ " : "+record.get("BRANCH")+ " : "+record.get("BRANCH_NAME")+ " : "+record.get("WARANTY")+ " : "+record.get("WAREXP")+ " : "+record.get("EMPID")+ " : "+record.get("ASSIGSTATUS")+ " : "+record.get("SCRAP")+ " : "+record.get("MAINTANANCE")+ " : "+record.get("ASSIGNED_FOR")+ " : "+record.get("ASSIGNED_BRANCH")+ " : "+record.get("REMARKS")+ " : "+record.get("CONFIG_STATUS")+ " : "+record.get("CONFIG_FIELD")+ " : "+record.get("ASSET_NAME"));
					 	Connection conn = null,conn1 = null;
						ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
						String url = "jdbc:mysql://localhost:3306/";
						String dbName = "csdb";
						String driver = "com.mysql.jdbc.Driver";
						String userName = "root";
						String password = "";
						PreparedStatement prs2 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
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
								
								String pono = record.get("PONO");//request.getParameter("abc4");
								String invoice=record.get("INVOICE_NO");
								String asset_no=record.get("ASSET_NO");
								String assetType = record.get("ASSET_TYPE");//request.getParameter("idPoDate");
								String Branch_code=record.get("BRANCH");//request.getParameter("abc3");
								String branch_name = record.get("BRANCH_NAME");//request.getParameter("abc5");
								String waranty = record.get("WARANTY");//request.getParameter("idInvDate");
								String waranty_exp = record.get("WAREXP");//request.getParameter("abc9");
								String remarks = record.get("REMARKS");//request.getParameter("abc6");
								String assetName =record.get("ASSET_NAME");// request.getParameter("abc8");
								String inventory_no=null;
								
								psmt3=conn.prepareStatement("SELECT * FROM `asset_inventory` WHERE `PoNo`=? OR `InvNo`=?");
								psmt3.setString(1, pono);
								psmt3.setString(2, invoice);
								rs1=psmt3.executeQuery();
								if(rs1.next())
								{
									inventory_no=rs1.getString(2);
								//  System.out.println("Inventory  value " + inventory_no);
									psmt2= conn.prepareStatement("INSERT INTO `asset_item`(`Inventory_No`,`Asset_No`, `AssetType`,`Branch`, `BranchName`, `Waranty`, `WarExpDate`,`Remarks`,`assetname`) VALUES (?,?,?,?,?,?,?,?,?)");
									psmt2.setString(1, inventory_no);
									psmt2.setString(2, asset_no);
									psmt2.setString(3, assetType);
									psmt2.setString(4, Branch_code);
									psmt2.setString(5, branch_name);
									psmt2.setString(6, waranty);
									psmt2.setString(7, waranty_exp);
									psmt2.setString(8,remarks);
									psmt2.setString(9,assetName);
									psmt2.execute();
								}
								else{
									msg = msg + "__Inventory_Not_Exist_:_" + pono;
								}
					}catch(Exception e)	{
		 				System.out.println("Error in Inserting :"+e);
		   			 	} 
					}
				}
			response.sendRedirect("uploadAssetItemNONIT.jsp?msg=" +msg);
			}catch (Exception e) {
				System.out.println("Do Nothing Here");
				}
	
%>
</body>
</html>