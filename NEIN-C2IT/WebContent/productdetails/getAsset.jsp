<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@ page import = "java.util.ResourceBundle" %>
<%
System.out.println("in asset item page");

String AssetType=request.getParameter("AssetType");

String Branch=request.getParameter("Branch");


String buffer=" <select name='assetno' required style='font-size: 11px;width: 142px;overflow: auto;height: 20px'> "+
"<option value='-1'>Select</option>";  
Connection con=null;
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
Statement stmt=null;
ResultSet rs=null;
try{ Class.forName(driver).newInstance();
con= DriverManager.getConnection(url+dbName,userName,password);  
 stmt = con.createStatement(); 
 
// rs = stmt.executeQuery("SELECT `Asset_No` FROM `asset_item` WHERE `AssetType`='"+AssetType+"' AND `Branch`='"+Branch+"'");
 if(Branch.equals("40"))
		 {
	 rs = stmt.executeQuery("SELECT `Asset_No` FROM `asset_item` WHERE `AssetType`='"+AssetType+"' AND `Branch` IN('40','41','42','43','52')");
		 }
 else if(Branch.equals("10"))
 {
	 rs = stmt.executeQuery("SELECT `Asset_No` FROM `asset_item` WHERE `AssetType`='"+AssetType+"' AND `Branch` IN('10','44','54')");
		 
 }
 else if(Branch.equals("20"))
 {
	 rs = stmt.executeQuery("SELECT `Asset_No` FROM `asset_item` WHERE `AssetType`='"+AssetType+"' AND `Branch` IN('20','21','25','22','24','28','23','27','26','88')");
		 
 }
 else if(Branch.equals("30"))
 {
	 rs = stmt.executeQuery("SELECT `Asset_No` FROM `asset_item` WHERE `AssetType`='"+AssetType+"' AND `Branch` IN('30','31','53','32')");
		 
 }
 else
 {
	 rs = stmt.executeQuery("SELECT `Asset_No` FROM `asset_item` WHERE `AssetType`='"+AssetType+"' AND `Branch`='"+Branch+"'");	 
 }
while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString("Asset_No")+"'>"+rs.getString("Asset_No")+"</option>"; 
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 
}catch (Exception e) { System.out.println(e); }
finally{
	DbUtil.closeDBResources(rs,stmt,con);
	
} %>