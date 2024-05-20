<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	System.out.println("---------------------It Asset Disposal DB ----------------------- ");
	String DDate1=null;
	String assetBranch1=null;
	String assetDept1=null;
	String assetAssignedUser1=null;
	String assetDisposalNo1=null;
	String assetNoDisposal1=null;
	String assetInitiatedBy1=null;
	String IntiatedDept1=null;
	String assetSerialNo1=null;
	String assetModelNo1=null;
	String disposalPONO1=null;
	String disposalPONODate1=null;
	String disposalPONOAmount1=null;
	String disposalAssetType1=null;
	String disposalDescription1=null;
	String disposalReason1=null;
	String disposalDate1=null;
	String disposalConsidaration1=null;
	String disposalInitiatedBY11=null;
	String disposalApporvedBY1=null;
	String disposalRemarks1=null;
	String disposalAccountRemarks1=null;

	DDate1=request.getParameter("DDate");
 	assetBranch1=request.getParameter("assetBranch"); 
	assetDept1=request.getParameter("assetDept"); 
	assetAssignedUser1=request.getParameter("assetAssignedUser");
	assetDisposalNo1=request.getParameter("assetDisposalNo"); ;
	assetNoDisposal1=request.getParameter("assetNoDisposal"); 
	assetInitiatedBy1=request.getParameter("assetInitiatedBy"); 
	IntiatedDept1=request.getParameter("IntiatedDept"); 
	assetSerialNo1=request.getParameter("assetSerialNo"); 
	assetModelNo1=request.getParameter("assetModelNo"); 
	disposalPONO1=request.getParameter("disposalPONO"); 
	disposalPONODate1=request.getParameter("disposalPONODate"); 
	disposalPONOAmount1=request.getParameter("disposalPONOAmount"); 
	disposalAssetType1=request.getParameter("disposalAssetType"); 
	disposalDescription1=request.getParameter("disposalDescription"); 
	disposalReason1=request.getParameter("disposalReason"); 
	disposalDate1=request.getParameter("disposalDate"); 
	disposalConsidaration1=request.getParameter("disposalConsidaration"); 
	disposalInitiatedBY11=request.getParameter("disposalInitiatedBY1");
	disposalApporvedBY1=request.getParameter("disposalApporvedBY"); 
	disposalRemarks1=request.getParameter("disposalRemarks");
	disposalAccountRemarks1=request.getParameter("disposalAccountRemarks");
 	
 	System.out.println("Disposal DEtails"+DDate1+" :: "+assetBranch1+" :: "+assetDept1+" :: "	+assetAssignedUser1+" :: "+assetDisposalNo1+" :: "+assetNoDisposal1+" :: "+assetInitiatedBy1+" :: "+IntiatedDept1+" :: "+assetSerialNo1+" :: "+assetModelNo1+" :: "	+disposalPONO1+" :: "+disposalPONODate1+" :: "+disposalPONOAmount1+" :: "	+disposalAssetType1+" :: "+disposalDescription1+" :: "+disposalReason1+" :: "+disposalDate1+" :: "+disposalConsidaration1+" :: "	+disposalInitiatedBY11+" :: "+disposalApporvedBY1+" :: "+disposalRemarks1+" :: "+disposalAccountRemarks1);
	
 //	System.out.println("------------- Asset Disposal DB----------------");
	Connection conn = null,conn1 = null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	Statement st = null,st1 = null;
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	String msg=null;
	PreparedStatement psmt=null, psmt1=null;
	
	int l = 0;
	int j = 0, i = 0;
	int incre = 0,incre1 = 0;
	int id = 100,id1 = 100;
	
	try {
 		Class.forName(driver).newInstance();
 		conn = DriverManager.getConnection(url + dbName, userName,password);
 		String query="INSERT INTO `asset_disposal`(	`asset_disposal_no`,`asset_number_disposal`, `disposal_date`, `disposal_consideration`,`reason_for_disposal`,`disposal_initiated_by`,`disposal_approved_by`,	`disposal_remarks`, `ho_accounts`) VALUES (?,?,?,?,?,?,?,?,?)";			
				
 				psmt = conn.prepareStatement(query);
 				psmt.setString(1, assetDisposalNo1);
				psmt.setString(2, assetNoDisposal1);  
				psmt.setString(3, disposalDate1);  
				psmt.setString(4,disposalConsidaration1);
				psmt.setString(5, disposalReason1);
				psmt.setString(6, disposalInitiatedBY11);
				psmt.setString(7, disposalApporvedBY1);
				psmt.setString(8, disposalRemarks1);
				psmt.setString(9, disposalAccountRemarks1);
				i=psmt.executeUpdate();
				System.out.println("i ::"+i);
				
				String query1="UPDATE `asset_item` SET `Scrap`=1 where `Asset_No`=?";			
				 psmt1=conn.prepareStatement(query1);
				 psmt1.setString(1, assetNoDisposal1); 
				 
				 j=psmt1.executeUpdate();
				 System.out.println("j ::"+j);
				//Session__Time__Out \\n __ __ Login__Again"
			    msg = "Invetory-data-inserted-successfully::";
		        response.sendRedirect("ITAssetDisposalForm.jsp?msg="+msg);
				
			}
 			catch (SQLException ex1) {
 		 		ex1.printStackTrace();
 		 	} 
 	 finally {
 		conn.close();
 	}
	

%>



</body>
</html>