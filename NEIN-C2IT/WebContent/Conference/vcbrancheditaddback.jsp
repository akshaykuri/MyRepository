<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Map" %>
<%@ page import = "java.util.ResourceBundle" %>
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
	//System.out.println("here.....");
	Connection conn = null,conn1 = null;
	ResultSet rs = null,rs1 = null,rs2 = null,rs242=null;
	
	ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");

	PreparedStatement prs2 = null, psmt2 = null, psmt3 = null, psmt4=null,prs3=null,prs4=null,prbran = null;
	String newidvalue = null,newidvalue1 = null;
	String[] item;
	String rde11=null,msg=null;
	int l = 0;
	int p=0;
	String new_id = null;
	int j = 0, i = 0;
	int incre = 0,incre1 = 0;
	int id = 0,id1 = 0;
	String id2=null;
	try 
	    {
		Class.forName(driver).newInstance();
		conn= DriverManager.getConnection(url+dbName,userName,password);
		Statement stmt = conn.createStatement();
		
		String booking_no=request.getParameter("id");
		System.out.println("bookingggggggggg----------- :"+booking_no);
		
		 String vcbranch[]=request.getParameterValues("vcbranch");
	        p = vcbranch.length;
	        
       String query1=null;
			
       for(int m=1; m < p; m++)
		{
			System.out.println("in for loop vcbchhhhhhhhhhhhhhh");
			//System.out.println("in for looopppppp vcbhhhhhhhhhh----: "+aList[m]);
			
			query1="insert into vcbranch_add(Booking_no,vcbranch)values(?,?)";
			
			psmt4 = conn.prepareStatement(query1);
		 	psmt4.setString(1,booking_no);
			psmt4.setString(2,vcbranch[m]);
			psmt4.executeUpdate();
		}
			 msg = "vcbranch added";
			
		   response.sendRedirect("DisplayVcbranch.jsp?id="+booking_no); 
		
		}
		catch (Exception e)
		        {
		    	e.printStackTrace();
		    	}
		 finally 
		        {
		    	conn.close();
		    	}
%>
</body>
</html>