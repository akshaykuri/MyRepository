<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<jsp:useBean id="con" class="CON2.Connection2"/>

<%
String IPADDRESS 	= request.getRemoteAddr();
System.out.println("IPADDRESS====>"+IPADDRESS);

String emp_no 	= ((String) session.getAttribute("EmpNo")==null?((String) session.getAttribute("emp_no")):(String) session.getAttribute("EmpNo"));
String realname = ((String) session.getAttribute("Nname")==null?((String) session.getAttribute("Nname")):(String) session.getAttribute("Nname"));

PreparedStatement psmt=null;
Connection cn =null;
cn = con.getConnection2();

psmt = cn.prepareStatement("insert into useraudittrial(empID,systemIP,action,date,time,empName) values(?,?,?,current_date(),current_time(),?)");
psmt.setString(1,emp_no);
psmt.setString(2,IPADDRESS);
psmt.setString(3,"Logout");
psmt.setString(4,emp_no+" - "+realname.toUpperCase());
psmt.executeUpdate();

session.invalidate();
response.setHeader("Cache-control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
response.setHeader("Pragma", "no-cache");

String msg = null;
msg = "You__have__been__Successfully__Logged__Out.";
response.sendRedirect("HOME.jsp?msg="+msg);
%>