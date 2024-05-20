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

		String
		msgg = null;
		msgg = "Session__Time__out \\n Login__In__Again ";
		response.sendRedirect("loginho.jsp?msg=" + msgg);
	}
</script>
<body>
	<%
		File file = null;
		System.out.println("-------------  Upload AssetInvetory 1 -----------------");
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
								//System.out.println(file + ":" + file);
								}
					}
				} catch (Exception ex) {
					System.out.println(ex);
				}
			}
			CSVFormat format = CSVFormat.DEFAULT.withHeader(new String[] {
					"SLNO", "INVENTORY_NO", "INVENTORY_DATE", "PONO",
					"PO_DATE", "INVOICE_NO", "INVOICE_DATE", "INVOICE_AMOUNT",
					"VENDOR_NAME", "VENDOR_MOBILE", "VENDOR_ADDRESS",
					"INVENTORY_DONE" });
			java.util.Calendar now = java.util.Calendar.getInstance();
			int date1 = now.get(Calendar.YEAR);
			int date2 = now.get(Calendar.YEAR) - 1;
			String year = "" + date2 + "-" + date1;
			String empId = (String) session.getAttribute("empid");
			java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd-MM-yyyy");
			String rootPath = "D:\\neinSoft\\files\\C2IT\\UploadAssetInventory";
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
									printer.printRecord(record.get("SLNO"),record.get("INVENTORY_NO"),record.get("INVENTORY_DATE"),record.get("PONO"), record.get("PO_DATE"),record.get("INVOICE_NO"),record.get("INVOICE_DATE"),record.get("INVOICE_AMOUNT"),record.get("VENDOR_NAME"),record.get("VENDOR_MOBILE"),record.get("VENDOR_ADDRESS"),record.get("INVENTORY_DONE"));
							}
							fileWriter.flush();
							fileWriter.close();
							printer.close();
							files.add((fileName));
					 } 
				
				}catch (IOException e) {
						e.printStackTrace();
					}
					//System.out.println("Root Name :" + fileName);// /First time it shows
				try {
						FileReader reader = new FileReader(new File(fileName));
						CSVParser csvParser = new CSVParser(reader, format);
						List<CSVRecord> records = csvParser.getRecords();
						for (CSVRecord record : records) {
						 if (record.getRecordNumber() > 1)
						 {
							//java.text.SimpleDateFormat dateFormatNew = new java.text.SimpleDateFormat("dd-MM-yyyy");
							//Date doi=dateFormatNew.parse(record.get("MOBILE_DOI"));
							//System.out.println(" " + record.get("SLNO") + " : "+ record.get("INVENTORY_NO") + " : "+ record.get("INVENTORY_DATE") + " : "+ record.get("PONO") + " : "+ record.get("PO_DATE") + " : "	+ record.get("INVOICE_NO") + " : "+ record.get("INVOICE_DATE") + " : "+ record.get("INVOICE_AMOUNT") + " : "+ record.get("VENDOR_NAME") + " : "	+ record.get("VENDOR_MOBILE") + " : "+ record.get("VENDOR_ADDRESS") + " : "+ record.get("INVENTORY_DONE"));
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
									String podate = record.get("PO_DATE");//request.getParameter("idPoDate");
									String invetoryDate=record.get("INVENTORY_DATE");//request.getParameter("abc3");
									String invoiceNo = record.get("INVOICE_NO");//request.getParameter("abc5");
									String invoiceDate = record.get("INVOICE_DATE");//request.getParameter("idInvDate");
									String invoiceAmount = record.get("INVOICE_AMOUNT");//request.getParameter("abc9");
									String vendorName = record.get("VENDOR_NAME");//request.getParameter("abc6");
									String vendorAddress =record.get("VENDOR_ADDRESS");// request.getParameter("abc8");
									String vendorMobile =record.get("VENDOR_MOBILE");// request.getParameter("abc7");
									String InvBy =record.get("INVENTORY_DONE" );//(String)session.getAttribute("Nname");
									
									psmt3=conn.prepareStatement("SELECT * FROM `asset_inventory` WHERE `PoNo`=?");
									psmt3.setString(1, pono);
									rs1=psmt3.executeQuery();
									if(rs1.next()&& !(pono.equals("Not PO")))
										{
											msg = msg + "__Pono_Already_Exist_:_" + pono; 
									}
									else{
											prs2 = conn.prepareStatement("select max(idextend) as idd from asset_inventory ");
											rs = prs2.executeQuery();
											if (rs.next())
									   	 	{
												int rde = rs.getInt("idd");
												System.out.println("idextend :" + rde);
												if(rde == 0){
													id = 100;
										  	 	}else{
													id = rs.getInt(1);
										   		}
												incre = id + 1;
												newidvalue = "NEIN/INV-" + incre;
								//					System.out.println("NewID  value " + newidvalue);
												psmt2= conn.prepareStatement("INSERT INTO `asset_inventory`(`idextend`, `Inventory_No`, `InventoryDate`, `PoNo`, `PoDate`, `InvNo`, `InvDate`, `InvAmount`, `VName`, `VMobNo`, `VAddress`, `InventoryDoneBy`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
												psmt2.setInt(1, incre);
												psmt2.setString(2, newidvalue);
												psmt2.setString(3,invetoryDate);
												psmt2.setString(4, pono);
												psmt2.setString(5, podate);
												psmt2.setString(6, invoiceNo);
												psmt2.setString(7, invoiceDate);
												psmt2.setInt(8, new Integer(invoiceAmount));
												psmt2.setString(9, vendorName);
												psmt2.setString(10,vendorMobile);
												psmt2.setString(11, vendorAddress);
												psmt2.setString(12, InvBy);
												psmt2.execute();
											}
											
									}
								}catch(Exception e)	{
				 						System.out.println("Error in Inserting :"+e);
				   				}
							}//if statement
						}//for loop
						response.sendRedirect("uploadAssetInventory.jsp?msg=" +msg);
				}catch (IOException e) {
					System.out.println("Do Nothing Here");
				}
	
%>
</body>
</html>