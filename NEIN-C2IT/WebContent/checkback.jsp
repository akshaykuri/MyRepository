<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="CON2.Connection2" %>
<jsp:useBean id="con" class="CON2.Connection2" />

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection cn=null;
Statement st=null;
ResultSet rs=null;
cn = con.getConnection2();
st=cn.createStatement();
String Npost = request.getParameter("Npost");
String DESG_NO = request.getParameter("DESG_NO");

System.out.println("NPOST  "+Npost);
System.out.println("DESG NO  "+DESG_NO);

//int i = st.executeUpdate("insert into check(Npost,DESG_NO) values ('"+Npost+"','"+DESG_NO+"')");
int j=st.executeUpdate("INSERT into backup_master(backup_name,backup_detail) values('"+Npost+"','"+DESG_NO+"')");


String msg = "'"+Npost+"'__SAVED__SUCCESSFULLY";
out.println("MSG SAVED");
response.sendRedirect("check.jsp");
%>
</body>
</html>