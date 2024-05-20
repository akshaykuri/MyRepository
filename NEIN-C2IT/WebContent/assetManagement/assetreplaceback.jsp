<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//ENhttp://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign other asset</title>
</head>
<script type="text/javascript">
if(session==null||session.getAttribute("city")==null||session.getAttribute("Nname")==null)
{
	
	String msgg=null;
	msgg="Session__Time__out \\n Login__In__Again ";
	response.sendRedirect("loginho.jsp?msg="+msgg);
}
</script>

<body>
<%
		String ano1=null;
		String aType=null;
		String newano1=null;
		String newaType=null;
		String AssignedDate=null;
		String assignRemarks=null;

		
		 ano1=request.getParameter("assetno");
		 aType=request.getParameter("assetName");
		 newano1=request.getParameter("assetno1");
		 newaType=request.getParameter("assetName1");
		 AssignedDate=request.getParameter("doiLink");
		 assignRemarks=request.getParameter("assignRemarks");
		 
		 System.out.println("Asset Details::"+ ano1+aType+newano1+newaType+AssignedDate+assignRemarks);
		 
		 
		String asgby = (String)session.getAttribute("Nname");
		String asgemp =(String)session.getAttribute("empid");
	
		System.out.println(""+asgby+asgemp);
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "csdb";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "";
		Connection con=null;
		PreparedStatement assetprs1=null;
		ResultSet assetrs = null;
		String msg=null;
		String AssetSearchQuery1=null;
		int j = 0, i = 0;
		
	 	Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection(url + dbName, userName,password);
	
				try{
					AssetSearchQuery1 ="INSERT INTO `asset_replace`( `new_asset_no`, `link_to_asset_no`, `date_of_assgin`, `remarks`, `assignedByName`, `assignedByEmp`,`newAssetType`,`oldAssetType`) VALUES (?,?,?,?,?,?,?,?)";
			 		assetprs1=con.prepareStatement(AssetSearchQuery1);
			 		
			 		assetprs1.setString(1, newano1);
			 		assetprs1.setString(2, ano1);
			 		assetprs1.setString(3, AssignedDate);
					assetprs1.setString(4,assignRemarks);
			 		assetprs1.setString(5,asgby);
			 		assetprs1.setString(6,asgemp);
			 		assetprs1.setString(7,newaType);
			 		assetprs1.setString(8,aType);
			 		i=assetprs1.executeUpdate();
			 	 }
				catch(Exception e){
					System.out.println("Error in Asset Replacement");
				}
				msg = "INSERTED__SUCCESSFULLY";
				
				if (i!=0)
				  { 
				 	 response.sendRedirect("assetReplace.jsp?msg=" +msg);
				  }

				
		%>
</body>
		
		</html>