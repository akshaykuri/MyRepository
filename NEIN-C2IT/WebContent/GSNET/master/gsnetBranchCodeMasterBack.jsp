<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.ResourceBundle"%>
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
	response.sendRedirect("adminlink.jsp?msg="+msgg);
}
</script>


</head>
<body>
<%

	//System.out.println("here.....");
	Connection conn = null,conn1 = null;

	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
	PreparedStatement  psmt3 = null;
	String newidvalue = null,newidvalue1 = null;
	String[] item;
	String rde11=null,msg=null,allopt1="";
	int l = 0;
	int j = 0, i = 0,m;
	try 
	    {
		Class.forName(driver).newInstance();
	      conn = DriverManager.getConnection(url+dbName,userName,password); 
		Statement stmt = conn.createStatement();
		String bcode= request.getParameter("bcode");
		psmt3 = conn.prepareStatement("insert into gsnetbranchcodemaster(branchcode) values(?);");
	    psmt3.setString(1, bcode);  
	    j = psmt3.executeUpdate();
		msg="inserted__successfully............";
		}catch (Exception e)
		        {
		    	e.printStackTrace();
		    	}
		 finally 
		        {
		    	conn.close();
		    	}
		 response.sendRedirect("gsnetBranchCodeMaster.jsp?msg="+msg);
%>
</body>
</html>