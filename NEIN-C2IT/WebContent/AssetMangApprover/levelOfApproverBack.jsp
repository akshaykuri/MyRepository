<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
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
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "csdb";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	PreparedStatement  psmt3 = null;
	String newidvalue = null,newidvalue1 = null;
	String[] item;
	String rde11=null,msg="";
	int l = 0;
	int j = 0, i = 0;
	try 
	    {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url + dbName, userName,password);
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		
		
		String rmaster1 = request.getParameter("rmaster");
		
		String itnonit = request.getParameter("itnonit");
		String branch = request.getParameter("branch");
		String useroffice = request.getParameter("useroffice");
		System.out.println("Master for "+rmaster1+"  IT/NON IT value " + itnonit);
		System.out.println("Branchvalue " + branch);
		System.out.println("useroffice " + useroffice);
		String lno[] = request.getParameterValues("lno");
		String lname[] = request.getParameterValues("lname");
		l = lno.length;
		System.out.println("Branchvalue L" + l);
		for (int k = 1; k < l; k++)
			   {
			   System.out.println("Branchvalue L no of K" +lno[k]);
			   String query = "SELECT * from mrlevelmaster where (levelno='"+lno[k]+"' and rmaster = '"+rmaster1+"' and itnonit='"+itnonit+"' and branch='"+branch+"' and useroffice='"+useroffice+"')";
			   stmt1 = conn.createStatement();
			   rs = stmt1.executeQuery(query);
			   if(!rs.next())
			       { 
				   psmt3 = conn.prepareStatement("insert into mrlevelmaster(levelno,levelname,itnonit,branch,useroffice,rmaster) values(?,?,?,?,?,?);");
			       psmt3.setString(1, lno[k]);  
			       psmt3.setString(2, lname[k]);
			       psmt3.setString(3, itnonit);
			       psmt3.setString(4, branch);  
			       psmt3.setString(5, useroffice);
			       psmt3.setString(6, rmaster1);
			       j = psmt3.executeUpdate();
			       msg+="level__'"+lno[k]+"'____inserted__successfully..<br>";
			      }
			   else
			      {
				   msg+="level__'"+lno[k]+"'____already__inserted..";
			      }
			   }
		if (j!=0)
		   {
			response.sendRedirect("levelOfApprovar.jsp?msg="+msg);
		   }
		else
		{
			response.sendRedirect("levelOfApprovar.jsp?msg="+msg);
		}
		 }catch (Exception e)
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