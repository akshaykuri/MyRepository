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
		System.out.println("------------- Asm Inv CCTVDB  -----------------");
		//System.out.println("here..... inside asminv");
		Connection conn = null,conn1 = null;
		ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "csdb";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "";
		String Config=request.getParameter("allconf");
		
		System.out.println("Config ::"+Config);
		PreparedStatement prs2 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
		String newidvalue1 = null;
		String MrScan=null,PoScan=null,InvScan=null,OtherScan=null;
		int scanCount=0;
		String rde11=null,msg=null;
				 
		String Inventory_no=request.getParameter("inventory_no");
		String Asset_no=request.getParameter("asset_no");
		
		
		String path1=null;
		int l = 0;
		int j = 0, i = 0;
		int incre = 0,incre1 = 0;
		int id = 100,id1 = 100;
		String pono = request.getParameter("abc4");
		String podate = request.getParameter("idPoDate");
		String invetoryDate= request.getParameter("abc3");
		String invoiceNo = request.getParameter("abc5");
		String invoiceDate = request.getParameter("idInvDate");
		String invoiceAmount = request.getParameter("abc9");
		String vendorName = request.getParameter("abc6");
		String vendorAddress = request.getParameter("abc8");
		String vendorMobile = request.getParameter("abc7");

		//System.out.println("count::"+request.getParameter("cameraCount"));
		int count=Integer.parseInt(request.getParameter("cameraCount"));
		System.out.println(" camara count::"+count);
		String itemName ="";
		ArrayList<String> filenameList = new ArrayList<String>();
		String path=null;
		String InvBy =(String)session.getAttribute("Nname");
		
		try 
	    	{
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(url + dbName, userName,password);
				Statement stmt = conn.createStatement();
				Statement st1 = conn.createStatement();
				
				conn1 = DriverManager.getConnection(url + dbName, userName,password);
		 		String updateInventory="UPDATE `asset_item` SET `ConfigAddStatus`=1,ConfigField='"+Config+"' where Inventory_No='"+Inventory_no +"' and Asset_No='"+Asset_no+"'";
				
		 		st1=conn1.createStatement();
		 		st1.executeUpdate(updateInventory);
							
				String AssetType=request.getParameter("cameraasset");
				String AssetNo=request.getParameter("assetNo1");
				String newidvalue=request.getParameter("inventory_no");
				String AssetName=request.getParameter("cameraasset");
			
				String Branch=null;
				String AssetExpYear=null;
				String AssetExpDate=null;
				String AssetSerial=null;
				String AssetModel=null;
				String AssetBrand=null;
				
				String AssetRemarks=null;
					
				prs3 = conn.prepareStatement("select * from asset_inventory where(PoNo='" +pono + "' && InvNo='" + invoiceNo  + "'); ");
				rs1 = prs3.executeQuery();
				if(!rs1.next())
		 			{%> 
		         			<script language="javascript"> //Java Script alert message 
		           			alert("Your INVOICE not inserted  so please create invetory");
		           			window.history.back();
		          			</script>
					<%}
				
				else{
		    		 String a= "dvrbranchName";
		    		 String b="dvrwar";
		    		 String c="dvridWarExpDate";
		    		 String d="dvrserial";
					 String e="dvrmodel";
					 String f="dvrbrand";
	
					 String assettype1="DVR";
					 
					 System.out.println("DVR ::::::::"+c);
				
					 
					 Branch=request.getParameter(a);
					 
					 AssetExpYear=request.getParameter(b);
					 
					 AssetExpDate=request.getParameter(c);
					 
					 AssetSerial=request.getParameter(d);
					
					 AssetModel=request.getParameter(e);
					 
					 AssetBrand=request.getParameter(f);
					 
					 System.out.println(" Asset Branch:"+Branch);
					 System.out.println(" Asset Exp year"+AssetExpYear);
					 System.out.println(" Asset Exp Date:"+AssetExpDate);
					 System.out.println(" Asset Serial No"+AssetSerial);
					 System.out.println(" Asset Asset Model:"+AssetModel);
					 System.out.println(" Asset Brand:"+AssetBrand);
					 try
					   {
							prbran = conn.prepareStatement("select b_name from branch_master where b_no='"+Branch+"'");
							rs242 = prbran.executeQuery();
							if (rs242.next())
						    {
							 rde11 = rs242.getString("b_name");
						    }
						System.out.println("branch name : " + rde11);
					   }catch (SQLException se ){
						System.out.println("First:");
					   	se.printStackTrace();
					   }    
					   
				    psmt3 = conn.prepareStatement("insert into asset_item(idextend,Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,Remarks,assetname,ConfigField,serial_no,model_no,brand,ConfigAddStatus) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
					psmt3.setInt(1, incre1);
					psmt3.setString(2, newidvalue);  // Inventory no
					psmt3.setString(3, AssetNo);  // Asset no
					psmt3.setString(4, assettype1);
					psmt3.setString(5, Branch);
					psmt3.setString(6, rde11);
					int years=(Integer.parseInt(AssetExpYear))/12;
					System.out.println("integere: :"+years);
					psmt3.setInt(7, new Integer(years));
					psmt3.setString(8, AssetExpDate);
					psmt3.setString(9, AssetExpYear);
					psmt3.setString(10, "DVR");
					psmt3.setString(11,Config);
					psmt3.setString(12, AssetSerial);
					psmt3.setString(13, AssetModel);
					psmt3.setString(14, AssetBrand);
					psmt3.setString(15, "1");
					
					
					j = psmt3.executeUpdate();
					 
						Branch=null;
					    //AssetType=null;
						//AssetNo=null;
						AssetExpYear=null;
						AssetExpDate=null;
						AssetRemarks=null;
					//	AssetName=null;
						AssetSerial=null;
						AssetModel=null;
						AssetBrand=null;
					
				    	for(int r=1;r<=count;r++)
							{
					    		  a= "branchName"+r;
					    		  b="idWar"+r;
					    		  c="idWarExpDate"+r;
					    		  d="cameraserial"+r;
								  e="cameramodel"+r;
								  f="camerabrand"+r;
											 
								 Branch=request.getParameter(a);
								 AssetExpYear=request.getParameter(b);
								 AssetExpDate=request.getParameter(c);
								 AssetSerial=request.getParameter(d);
								 AssetModel=request.getParameter(e);
								 AssetBrand=request.getParameter(f);
								 
								 /* System.out.println("Cameras  "+c);
								 System.out.println(" Asset Details:"+Branch);
								 System.out.println(" Asset Details:"+AssetExpYear);
								 System.out.println(" Asset Details:"+AssetExpDate);
								 System.out.println(" Asset Details:"+AssetSerial);
							 	 System.out.println(" Asset Details:"+AssetModel);
								 System.out.println(" Asset Details:"+AssetBrand);
						  */
								 try
								   {
										prbran = conn.prepareStatement("select b_name from branch_master where b_no='"+Branch+"'");
										rs242 = prbran.executeQuery();
										if (rs242.next())
									    {
										 rde11 = rs242.getString("b_name");
									    }
										System.out.println("branch name : " + rde11);
								   }catch (SQLException se ){
									    	se.printStackTrace();
								   }    
							    psmt3 = conn.prepareStatement("insert into asset_item(idextend,Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,Remarks,assetname,ConfigField,serial_no,model_no,brand,ConfigAddStatus) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
								psmt3.setInt(1, incre1);
								psmt3.setString(2, newidvalue);  // Inventory no
								psmt3.setString(3, AssetNo);  // Asset no
								psmt3.setString(4, AssetType);
								psmt3.setString(5, Branch);
								psmt3.setString(6, rde11);
								 years=(Integer.parseInt(AssetExpYear))/12;
								System.out.println("integere: :"+years);
								psmt3.setInt(7, new Integer(years));
								psmt3.setString(8, AssetExpDate);
								psmt3.setString(9, " ");
								psmt3.setString(10, "CAMERA");
								psmt3.setString(11,Config);
								psmt3.setString(12, AssetSerial);
								psmt3.setString(13, AssetModel);
								psmt3.setString(14, AssetBrand);
								psmt3.setString(15, "1");
								
								j = psmt3.executeUpdate();
									msg = "Please"+"_\b "+"insert"+" _\b "+"the"+" _\b "+"config"+" _\b "+"field" +" _\b "+ "of"+" _\b "+"New"+" _\b "+"asset";
									//Session__Time__Out \\n __ __ Login__Again"
									msg="Inventory_No _\b:"+newidvalue+" _\b"+"Is"+" _\b"+"Inserted"+"\\n\\n"+msg;
									    
								Branch=null;
							//	AssetType=null;
								//AssetNo=null;
								AssetExpYear=null;
								AssetExpDate=null;
								AssetRemarks=null;
							//	AssetName=null;
								AssetSerial=null;
								AssetModel=null;
								AssetBrand=null;
								}
								if (j != 0)
								 {
									response.sendRedirect("AddAssetConfigField.jsp?msg=" +msg);
							     }
								if ( j == 0)
								 {
									psmt4 = conn.prepareStatement("delete from asset_inventory where(Inventory_No='" + newidvalue + "');");
									psmt4.executeUpdate();
									String msg1="Data not inserted...";
								   	response.sendRedirect("AsmInventory.jsp?msg=" +msg1);
								 }
							}				
					 }catch (Exception e) {
						 System.out.println("Second:");
						 e.printStackTrace();}
				    msg = "Invetory-data-inserted-successfully::";
	    //    		response.sendRedirect("AsmInventory.jsp?msg="+msg);
				 
%>
</body>
</html>