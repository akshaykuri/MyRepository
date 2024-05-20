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
<%//System.out.println("here.....");
	Connection conn = null,conn1 = null;
	System.out.println("-------------  NONOIT Asm Inv With Out Po -----------------");
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	PreparedStatement prs2 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
	String newidvalue = null,newidvalue1 = null;
	//String[] item;
	
	ArrayList<String> AssetNames=new ArrayList<String>();
	ArrayList<String> AssetNos=new ArrayList<String>();
	ArrayList<String> AssetTypes=new ArrayList<String>();
	ArrayList<String> AssetBranch=new ArrayList<String>();
	ArrayList<String> AssetWaranty=new ArrayList<String>();
	ArrayList<String> AssetWarExps=new ArrayList<String>();
	ArrayList<String> AssetRemarksList=new ArrayList<String>();
 	String MrScan=null,PoScan=null,InvScan=null,OtherScan=null;
 	ArrayList<String> fileName=new ArrayList<String>();
 	String path1=null;

 	int scanCount=0;
	
 	String rde11=null,msg=null;
	
 	int l = 0;
	int j = 0, i = 0;
	int incre = 0,incre1 = 0;
	int id = 100,id1 = 100;
	
	
	
	String pono = null;//request.getParameter("abc4");
	String podate =null;// request.getParameter("idPoDate");
	String invetoryDate=null;//request.getParameter("abc3");
	String invoiceNo = null;//request.getParameter("abc5");
	String invoiceDate = null;//request.getParameter("idInvDate");
	String invoiceAmount = null;//request.getParameter("abc9");
	String vendorName =null;// request.getParameter("abc6");
	String vendorAddress = null;//request.getParameter("abc8");
	String vendorMobile = null;//request.getParameter("abc7");
    String ccount=null;//request.getParameter("count");
	 String itemName ="";
	 ArrayList<String> filenameList = new ArrayList<String>();
	 String path=null;
	 String InvBy =(String)session.getAttribute("Nname");
	
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
		 			if(name.equals("abc3"))
	 				{
		 				invetoryDate=value;
					}
		 			if(name.equals("abc4"))
	 				{
		 				pono=value;
					}
	 		
		    		if(name.equals("abc5"))
	 				{
		 				invoiceNo=value;
					}
		    		if(name.equals("abc6"))
	 				{
		 				vendorName=value;
					}
		 		    if(name.equals("abc7"))
	 				{
		 		    	vendorMobile=value;
					}
		 			if(name.equals("abc8"))
	 				{
		 				vendorAddress=value;
					}
		 			if(name.equals("abc9"))
	 				{
		 				invoiceAmount=value;
					}
		 			if(name.equals("idInvDate"))
	 				{
		 				invoiceDate=value;
					}
		 			if(name.equals("idPoDate"))
	 				{
		 				podate=value;
					}
		 		    if(name.equals("count"))
	 				{
						ccount=value;
						count=Integer.parseInt(ccount);
					}
		 		  
		 			aa=null;
		 			if(name.equals("assetName"))
	 				{
		 				aa=value;
		 			 AssetNames.add(aa);
					}
		 			aa=null;
		 			if(name.equals("assetNo"))
	 				{
		 				aa=value;
		 			 AssetNos.add(aa);
					}
		 			aa=null;
		 			if(name.equals("astType"))
	 				{
		 				aa=value;
		 			 AssetTypes.add(aa);
					}
		 			aa=null;
		 			if(name.equals("branchName"))
	 				{
		 				aa=value;
		 			 AssetBranch.add(aa);
					}
		 			
		 			aa=null;
		 			if(name.equals("war"))
	 				{
		 				aa=value;
		 			 AssetWaranty.add(aa);
					}
		 			aa=null;
		 			if(name.equals("warExp"))
	 				{
		 				aa=value;
		 				AssetWarExps.add(aa);
					}
		 			aa=null;
		 			if(name.equals("idremarks"))
	 				{
		 				aa=value;
		 				AssetRemarksList.add(aa);
					}
		 			
				}
		    	else
				 {
		    		
						 try
						 {	
								 itemName = item.getName();
								 if((itemName.equals(null)||itemName.equals("")) ){
									 itemName="NA";
								 }
								 filenameList.add(itemName);
							
								 File savedFile = new File("E:/neinSoft/files/C2IT/UploadAssetInventory/ScannedFiles//"+pono);
								 
								 //path="E:/neinSoft/files/C2IT/Catridge/"+empid+"/"+monthOfPayment+"/"+Cartridge;
								
								 if(!savedFile.exists()) 
								 {
								//  System.out.println("Make directory");
								  savedFile.mkdirs();
								  savedFile.setWritable(true);
								 // System.out.println("savedFile ::"+savedFile);
								 }
								 
								 File  insertFile = new File("E:/neinSoft/files/C2IT/UploadAssetInventory/ScannedFiles/"+pono+"/"+itemName);
								  path1="E:/neinSoft/files/C2IT/UploadAssetInventory/ScannedFiles/"+pono+"/";
								 item.write(insertFile);
								// System.out.println("insertFile :::"+insertFile);
						 }
						 catch (Exception e)
						 {
						  out.println("Error"+e.getMessage());
						 }
						 
				 }// end of els if 
				
		    }// end of while 
			
		
			String Branch=null;
			String AssetType=null;
			String AssetNo=null;
			String AssetExpYear=null;
			String AssetExpDate=null;
			String AssetRemarks=null;
			String AssetName=null;
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url + dbName, userName,password);
			Statement stmt = conn.createStatement();
			if(pono==null)
			{	pono="Not PO"; }
			if(podate==null){ podate="No Date";	}
			prs3 = conn.prepareStatement("select * from asset_inventory where(InvNo='" + invoiceNo + "'); ");
			rs1 = prs3.executeQuery();
			if(rs1.next())
	   		 {%> 
	            <script language="javascript"> //Java Script alert message 
	            alert("Your INVOICE no allready inserted ..");
	            window.history.back();
	            </script>
			<%}
			else
			{
				prs2 = conn.prepareStatement("select max(idextend) as idd from asset_inventory ");
				rs = prs2.executeQuery();
				if (rs.next())
			    {
					int rde = rs.getInt("idd");
			//		System.out.println("idextend :" + rde);
					if (rde == 0)
				   	{
					id = 100;
				   }
					else
				   {
					id = rs.getInt(1);
				   }
					try{
							incre = id + 1;
							newidvalue = "NEIN/INV-" + incre;
						//	System.out.println("NewID  value " + newidvalue);
							psmt2 = conn.prepareStatement("insert into asset_inventory(idextend,Inventory_No,InventoryDate,PoNo,PoDate,InvNo,InvDate,InvAmount,VName,VMobNo,VAddress,InventoryDoneBy,mr_scan,po_scan,inv_scan,other_scan) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							psmt2.setInt(1, incre);
							
						//	System.out.println("incre"+incre);
							psmt2.setString(2, newidvalue);
						//	System.out.println("newidvalue"+newidvalue);
							psmt2.setString(3,invetoryDate);
						//	System.out.println("invetoryDate"+invetoryDate);
							psmt2.setString(4, pono);
					//		System.out.println("pono"+pono);
							psmt2.setString(5, podate);
						//	System.out.println("podate"+podate);
							psmt2.setString(6, invoiceNo);
					//		System.out.println("invoiceNo"+invoiceNo);
							psmt2.setString(7, invoiceDate);
						//	System.out.println("invoiceDate"+invoiceDate);
							psmt2.setInt(8, new Integer(invoiceAmount));
							psmt2.setString(9, vendorName);
					//		System.out.println("vendorName"+vendorName);
							psmt2.setString(10,vendorMobile);
							//System.out.println("vendorMobile"+vendorMobile);
							psmt2.setString(11, vendorAddress);
						//	System.out.println("vendorAddress"+vendorAddress);
							psmt2.setString(12, InvBy);
						//	System.out.println("InvBy"+InvBy);
							psmt2.setString(13, path1+filenameList.get(0));
					//		System.out.println("path1:"+path1+filenameList.get(0));
							psmt2.setString(14, path1+filenameList.get(1));
						//	System.out.println("path2:"+path1+filenameList.get(1));
							psmt2.setString(15, path1+filenameList.get(2));
						//	System.out.println("path3:"+path1+filenameList.get(2));
							psmt2.setString(16, path1+filenameList.get(3));
							//System.out.println("path4:"+path1+filenameList.get(3));
							i=psmt2.executeUpdate();
						//	System.out.println("III :::"+i);
						}
						catch(SQLException sql)
						{
							System.out.println("Error inside the  asset inventory :"+sql);
							sql.printStackTrace();
						}
						int k=1;
						int count1=AssetNames.size();
						///	System.out.println("SISISI ::: "+count1);
						for (k=1;k<count1;k++)
					   {
							
						 Branch=AssetBranch.get(k);
						 AssetType=AssetTypes.get(k);
					 	 AssetNo=AssetNos.get(k);
					 	AssetExpYear=AssetWaranty.get(k);
					 	AssetExpDate=AssetWarExps.get(k);
					 	AssetRemarks=AssetRemarksList.get(k);
					 	AssetName=AssetNames.get(k);
					 	System.out.println(" Asset details ::" +AssetName+" :: "+Branch+" :: "+AssetType+" :: "+AssetNo+" :: "+AssetExpYear+" :: "+AssetExpDate+" :: "+AssetRemarks);
				     	try{
					         prbran = conn.prepareStatement("select m_b_name from branch_master_main where m_b_no='"+Branch+"'");
					         rs242 = prbran.executeQuery();
					         if (rs242.next()){
						        rde11 = rs242.getString("m_b_name");
				              }
				//		    System.out.println("branch name : " + rde11);
				        }
				     	catch (SQLException e){
					     	System.out.println("Error inside the  branch :"+e);
					    	e.printStackTrace();
				        }    
				    	psmt3 = conn.prepareStatement("insert into asset_item(idextend,Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,Remarks,assetname) values(?,?,?,?,?,?,?,?,?,?);");
						psmt3.setInt(1, incre1);
						psmt3.setString(2, newidvalue);  // Inventory no
						psmt3.setString(3, AssetNo);  // Asset no
						psmt3.setString(4, AssetType);
						psmt3.setString(5, Branch);
						psmt3.setString(6, rde11);
									
						int years=(Integer.parseInt(AssetExpYear))/12;
						psmt3.setInt(7, new Integer(years));
						psmt3.setString(8, AssetExpDate);
						psmt3.setString(9, AssetRemarks);
						psmt3.setString(10, AssetName);
						j = psmt3.executeUpdate();
						
					//	System.out.println("jjjjjjjjj:::::"+j);
						msg = "Please"+"_\b "+"insert"+" _\b "+"the"+" _\b "+"config"+" _\b "+"field" +" _\b "+ "of"+" _\b "+"New"+" _\b "+"asset";
						//Session__Time__Out \\n __ __ Login__Again"
						msg="Inventory_No _\b:"+newidvalue+" _\b"+"Is"+" _\b"+"Inserted"+"\\n\\n"+msg;
						
					    
						Branch=null;
						AssetType=null;
						AssetNo=null;
						AssetExpYear=null;
						AssetExpDate=null;
						AssetRemarks=null;
						AssetName=null;
					 }//inside for loop
				}//inside the is rs result set

				if (i!=0 && j != 0)
						 {
							response.sendRedirect("AddAssetConfigField.jsp?msg=" +msg);
					     }
				if (i!=0 && j == 0)
				   {
					psmt4 = conn.prepareStatement("delete from asset_inventory where(Inventory_No='" + newidvalue + "');");
					psmt4.executeUpdate();
					String msg1="Data not inserted...";
				    response.sendRedirect("AsmInventoryNONIT.jsp?msg=" +msg1);}
				   }
		
		 /* }//else result set if invoice not prasent 
	 }///else part Multipart
			 */
			 }
		    msg = "Invetory-data-inserted-successfully::";
	        response.sendRedirect("AsmInventoryNONIT.jsp?msg="+msg);
		 }//// first try block
		 catch (Exception e){
			 System.out.println(" error inserting "+e);
			 e.printStackTrace();
		//	 out.println(e.getMessage());
		 }
		 
		 %>
</body>
</html>


