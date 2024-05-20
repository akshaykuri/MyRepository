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
	System.out.println("-------------  asm Inv UPSDB -----------------");
	Connection conn = null,conn1 = null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	Statement st = null,st1 = null;
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	String msg=null;
	String Inventory_no=request.getParameter("inventory_no");
	String Asset_no=request.getParameter("asset_no");
	String Config=request.getParameter("allconf");
	
//	System.out.println(" asset Details :"+Inventory_no+" :: "+Asset_no+" :: "+Config);
	
	String assetType=request.getParameter("upsasset");
	
//	System.out.println("asset type:::"+assetType);
	String upsserila=request.getParameter("upsserial");
	String upsmodel=request.getParameter("upsmodel");
	String upsbrand=request.getParameter("upsbrand");
	int bCount=Integer.parseInt(request.getParameter("batteryCount"));
	
	
	String assetType1=null;//request.getParameter("batteryasset");
	String batteryserila=null;//request.getParameter("batteryserila");
	String batterymodel=null;//request.getParameter("batterymodel");
	String batterybrand=null;//request.getParameter("batterybrand");
	
	System.out.println("ups Details :::: "+assetType+" :: "+upsserila+" :: "+upsmodel+" :: "+upsbrand);
	//System.out.println("Desktop Details :::: "+assetType1+" :: "+moniterserila+" :: "+monitermodel+" :: "+moniterbrand);
	
	
	int l = 0;
	int j = 0, i = 0;
	int incre = 0,incre1 = 0;
	int id = 100,id1 = 100;
	
	try {
 		Class.forName(driver).newInstance();
 		conn = DriverManager.getConnection(url + dbName, userName,password);
 		conn1 = DriverManager.getConnection(url + dbName, userName,password);
 		String updateInventory="UPDATE `asset_item` SET `ConfigAddStatus`=1,ConfigField='"+Config+"' where Inventory_No='"+Inventory_no +"' and Asset_No='"+Asset_no+"'";
		
 		st1=conn1.createStatement();
 		st1.executeUpdate(updateInventory);
 		
 		String query="SELECT * FROM `asset_item` where Inventory_no='"+Inventory_no+"' AND Asset_No='"+Asset_no+"'";
 	//	System.out.println("details ::"+Inventory_no+" :: "+Asset_no);
 		st = conn.createStatement();
 		
 		rs = st.executeQuery(query);
 		while (rs.next()) {
 			
 		//	System.out.println("i ama hejdfs");
 			try
 		
 			{
 				
 				PreparedStatement prs2 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
 				psmt3 = conn.prepareStatement("insert into asset_item(idextend,Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,Remarks,assetname,serial_no,model_no,brand,ConfigAddStatus,ConfigField) values( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
				psmt3.setInt(1, incre1);
				psmt3.setString(2, Inventory_no);  // Inventory no
				psmt3.setString(3, Asset_no);  // Asset no
				psmt3.setString(4, assetType);
				psmt3.setString(5, rs.getString("Branch"));
				psmt3.setString(6, rs.getString("BranchName"));
				psmt3.setInt(7, rs.getInt("Waranty"));
				psmt3.setString(8, rs.getString("WarExpDate"));
				psmt3.setString(9, rs.getString("Remarks"));
				psmt3.setString(10, "UPS");
				psmt3.setString(11, upsserila);
				psmt3.setString(12, upsmodel);
				psmt3.setString(13, upsbrand);
				psmt3.setInt(14,1);
				psmt3.setString(15, Config);
				
				
				i=psmt3.executeUpdate();
				
				assetType1=null;//request.getParameter("batteryasset");
				batteryserila=null;//request.getParameter("batteryserila");
				batterymodel=null;//request.getParameter("batterymodel");
				batterybrand=null;//request.getParameter("batterybrand");
				String a=null,b=null,c=null,d=null;
				
				for (int y=1;y<=bCount;y++)
				{
					a="batteryasset"+y;
					b="batteryserila"+y;
					c="batterymodel"+y;
					d="batterybrand"+y;
					assetType1=request.getParameter(a);
					batteryserila=request.getParameter(b);
					batterymodel=request.getParameter(c);
					batterybrand=request.getParameter(d);
					
	//				System.out.println("Battery Details :::: "+assetType1+" :: "+batteryserila+" :: "+batterymodel+" :: "+batterybrand);
					
				psmt4 = conn.prepareStatement("insert into asset_item(idextend,Inventory_No,Asset_No,AssetType,Branch,BranchName,Waranty,WarExpDate,Remarks,assetname,serial_no,model_no,brand,ConfigAddStatus,ConfigField) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
				psmt4.setInt(1, incre1);
				psmt4.setString(2, Inventory_no);  // Inventory no
				psmt4.setString(3, Asset_no);  // Asset no
				psmt4.setString(4, assetType1);
				psmt4.setString(5, rs.getString("Branch"));
				psmt4.setString(6, rs.getString("BranchName"));
				psmt4.setInt(7, rs.getInt("Waranty"));
				psmt4.setString(8, rs.getString("WarExpDate"));
				psmt4.setString(9, rs.getString("Remarks"));
				psmt4.setString(10, "BATTERY");
				psmt4.setString(11, batteryserila);
				psmt4.setString(12, batterymodel);
				psmt4.setString(13, batterybrand);
				psmt4.setInt(14,1);
				psmt4.setString(15, Config);
				
				msg = "config"+" _\b "+"field" +" _\b "+ "of"+" _\b "+"New"+" _\b "+"asset";
				//Session__Time__Out \\n __ __ Login__Again"
				msg="Inventory_No _\b:"+Inventory_no+" _\b"+"Is"+" _\b"+"Updated Sucessfully "+"\\n\\n"+msg;
				
				j=psmt4.executeUpdate();
		
				assetType1=null;
				batteryserila=null;
				batterymodel=null;
				batterybrand=null;
				
				}
				
				if (i!=0 && j != 0)
				 {
					response.sendRedirect("OtherPage.jsp?msg=" +msg);
			    }
			}
 			catch (SQLException ex1) {
 		 		ex1.printStackTrace();
 		 	}
 			
 		}
 	} catch (SQLException ex1) {
 		ex1.printStackTrace();
 	} finally {
 		conn.close();
 	}
	

%>

</body>
</html>