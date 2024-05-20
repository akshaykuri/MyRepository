<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="CON2.Connection2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html><%@page import="java.sql.*"%>
<%
String link_id=request.getParameter("lid");
String linktype=request.getParameter("linktype");
Connection conn = null;
Connection2 dbConn = new Connection2();
conn = dbConn.getConnection2();
int i=0;
try
{
	
	
	Statement st=null,st1=null;
	ResultSet rs=null;
	
 st1=conn.createStatement();
	 i=st1.executeUpdate("update linktype_master set linktype='"+linktype+"' where link_id='"+link_id+"'");
	 response.sendRedirect("DisplayLinkTypeMaster.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

