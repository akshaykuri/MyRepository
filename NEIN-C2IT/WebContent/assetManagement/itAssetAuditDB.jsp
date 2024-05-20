<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.io.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.ValueArray"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@page language="java"%> 

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>
</head>
<body>
 <%
	System.out.println("-------------  IT Asset Audit DB -----------------");
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy ");
	Date date = new Date();
	//System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43
	
	
	PreparedStatement psmt1 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
	Connection conn1 = null,conn2 = null,conn3 = null,conn4 = null;
	ResultSet rs1 = null,rs2 = null,rs3 = null,rs4=null;

	String path=null;
	String InvBy =(String)session.getAttribute("Nname");
	String path1=null;
	String auditDocument=null,OtherScan=null;

	ArrayList<String> AssetTypes=new ArrayList<String>();
	ArrayList<String> AssetNos=new ArrayList<String>();
	ArrayList<String> AssetNames=new ArrayList<String>();
	ArrayList<String> AuditDates=new ArrayList<String>();
	ArrayList<String> AuditDones=new ArrayList<String>();
	ArrayList<String> AuditRemarks=new ArrayList<String>();
	ArrayList<String> AuditBarCodeRemarks=new ArrayList<String>();
	ArrayList<String> AuditBarCodeReprintRemarks=new ArrayList<String>();
	
	
	ArrayList<String> fileName=new ArrayList<String>();
	ArrayList<String> filenameList = new ArrayList<String>();
	
 	int scanCount=0;
 	String rde11=null,msg=null;
	
 	int l = 0;
	int j = 0, i = 0;
	int incre = 0,incre1 = 0;
	int id = 100,id1 = 100;

	String itemName ="";
	try 
	    {
		 int count=0;
	 	 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 if (!isMultipart)
		 {
		 }
		 else
		 {
			 FileItemFactory factory = new DiskFileItemFactory();
			 ServletFileUpload upload = new ServletFileUpload(factory);
			 List items = null;
			 try
			 	{
		 			items = upload.parseRequest(request);
		 		}
		 	 catch (FileUploadException e)
			 	{
		 			e.getMessage();
			 	}
		    Iterator itr = items.iterator();
		    String aa=null;
		    while(itr.hasNext())
		    {
		   	    FileItem item = (FileItem) itr.next();
		    	if (item.isFormField())
			    {
		       		String name = item.getFieldName();
		 			String value = item.getString();
		 			aa=null;
		 			if(name.equals("auditAstType")&&(!name.equals("Select"))&&(!name.equals(" ")))
	 				{
			 			 aa=value;
			 			 AssetTypes.add(aa);
			 		     System.out.println("Asset type : "+aa);
	 				}
		 			aa=null;
		 			if(name.equals("auditassetno")&&(!name.equals("Select"))&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
		 				aa=value;
		 				AssetNos.add(aa);
		 			    System.out.println("Asset No : "+aa);
					}
		 			aa=null;
		 			if(name.equals("auditAssetName")&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
			 			 aa=value;
			 			 AssetNames.add(aa);
			 			 System.out.println("Asset name : "+aa);
	 				}
		 			aa=null;
		 			if(name.equals("doaudit")&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
			 			 aa=value;
			 			 AuditDates.add(aa);
			 			 System.out.println("Asset date : "+aa);
	 				}
		 			aa=null;
		 			if(name.equals("idauditdone")&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
		 				aa=value;
		 				AuditDones.add(aa);
		 				System.out.println("Asset Done by :"+aa);
		 	 			
	 				}
		 			aa=null;
		 			if(name.equals("idremarks")&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
		 				aa=value;
		 				AuditRemarks.add(aa);
		 				System.out.println("Asset remarks : "+aa);
		 	 			
	 				}
		 			if(name.equals("idbarcoderemarks")&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
		 				aa=value;
		 				AuditBarCodeRemarks.add(aa);
		 				System.out.println("Bar code  remarks : "+aa);
		 	 			
	 				}
		 			else if(name.equals("idbarcoderemarks")&&(name.equals("")||name.equals(" ")))
		 			{
		 				aa="Yes";
		 				AuditBarCodeRemarks.add(aa);
		 				System.out.println("Bar code  remarks : "+aa);
			 	 		
		 			}
		 			if(name.equals("idbarcodereprintremarks")&&(!name.equals(""))&&(!name.equals(" ")))
	 				{
		 				aa=value;
		 				AuditBarCodeReprintRemarks.add(aa);
		 				System.out.println("Bar Code Reprint remarks : "+aa);
		 	 		}
		 			else if(name.equals("idbarcodereprintremarks")&&(name.equals("")||name.equals(" "))){
		 				aa="No";
		 				AuditBarCodeReprintRemarks.add(aa);
		 				System.out.println("Bar Code Reprint remarks : "+aa);
					}
		 		}
		    	else
				 {
		    		 try
			
		    		 {	
						 System.out.println(" In Side file");
						 itemName = item.getName();
						 System.out.println("  itemName "+ itemName );
						 
						 if((itemName.equals(null)||itemName.equals("")) ){
							 itemName="NA";
						 }
						 File savedFile = new File("D:/neinSoft/files/C2IT/AudiDocument/Audit");
						 System.out.println("  itemName "+ savedFile );
						 
						 if(!savedFile.exists()) 
						 {
							  System.out.println("Make directory");
							  savedFile.mkdirs();
							  savedFile.setWritable(true);
							  System.out.println("savedFile ::"+savedFile);
						 }
						 File  insertFile = new File("D:/neinSoft/files/C2IT/AudiDocument/Audit/"+itemName);
						 path1="D:/neinSoft/files/C2IT/AudiDocument/Audit/"+itemName;
						 System.out.println("insertFile 111:::"+insertFile+" ::::: "+path1);
						 item.write(insertFile);
						 System.out.println("insertFile 222:::"+insertFile+" ::::: "+path1);
						 filenameList.add(path1);
					 }
					 catch (Exception e)
						 {
						  out.println("Error"+e.getMessage());
						 }
				 }// end of els if 
			}// end of while 
			String AssetType=null;
			String AssetNo=null;
			String AssetName=null;
			String AuditDate=null;
			String AuditRemark=null;	
			String AuditDoneby=null;
			String BarCodeRemarks=null;
			String BarCodeReprintRemarks=null;
		//	System.out.println(" record counts ");
			int k=1;
			int count1=AuditRemarks.size();
		//		System.out.println("SISISI ::: "+count1);
			for (k=1;k<count1;k++)
			  {
	//			System.out.println(" Audit Reord "+ k +" added ");
				
				AssetType=AssetTypes.get(k);
				AssetNo=AssetNos.get(k);
				AssetName=AssetNames.get(k);
				AuditDate=AuditDates.get(k);
			 	AuditRemark=AuditRemarks.get(k);
			    AuditDoneby=AuditDones.get(k);
				BarCodeRemarks=AuditBarCodeRemarks.get(k);
				if(BarCodeRemarks==null)
				{
					BarCodeRemarks="Yes";
				}
				BarCodeReprintRemarks=AuditBarCodeReprintRemarks.get(k);
				if(BarCodeReprintRemarks == null )
				{
					BarCodeReprintRemarks="No";
				}
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn1 = DriverManager.getConnection(url + dbName, userName,password);
				psmt1 = conn1.prepareStatement("SELECT * FROM asset_audit WHERE Asset_No = ? and Audit_Date = ?;");
				psmt1.setString(1,AssetNo);
				psmt1.setString(2,AuditDate);
				rs1 = psmt1.executeQuery();
				if(!rs1.next())
		   		 {
					psmt2 = conn1.prepareStatement("INSERT INTO `asset_audit`( `Asset_No`, `Audit_Done`, `Audit_Date`, `Audit_Remarks`, `Audit_Status`, `audit_document`, `other_document`,`barcoderemarks`,`barcodereprintremarks`) VALUES (?,?,?,?,?,?,?,?,?);");
					psmt2.setString(1,AssetNo);
					psmt2.setString(2,AuditDoneby);
					psmt2.setString(3,AuditDate);
					psmt2.setString(4,AuditRemark);
					psmt2.setInt(5,1);
					psmt2.setString(6,filenameList.get(0));
					psmt2.setString(7,filenameList.get(1));
					psmt2.setString(8,BarCodeRemarks);
					psmt2.setString(9,BarCodeReprintRemarks);
					
		   		 	psmt2.execute();
		   		 }
			//	System.out.println(" Audit Detials 1: "+AssetType+" ::: 2 " + AssetNo + " :::: 3" + AssetName + "  ::: 4 "+ AuditDate + " ::: 5 " + AuditDoneby + " ::: 6 " +AuditRemark + " : :: : "+BarCodeRemarks +" ::: "+ BarCodeReprintRemarks);
				AssetType=null;
				AssetNo=null;
				AssetName=null;
				AuditDate=null;
			 	AuditRemark=null;
			    AuditDoneby=null;
			
				
			  }
		   // System.out.println("Files1 :::"+filenameList.get(0)+" :: "+filenameList.get(1));
		 	}//else
		    msg = "Audit-data-inserted-successfully::";
	        response.sendRedirect("itAssetAudit.jsp?msg="+msg);
		 }//// first try block
		 catch (Exception e){
			 System.out.println(" Error in audit insert Creation ");
			 e.printStackTrace();
		 }
		 
		 %>
</body>
</html>


