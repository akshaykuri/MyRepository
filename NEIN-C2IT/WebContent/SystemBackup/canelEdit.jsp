<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<% 
 String id = request.getParameter("id");
 //System.out.println("sched  ID delete:"+id);
 String empid=id.substring(0,4);
// System.out.println("ID delete:"+empid);
 int l=id.length();
// System.out.println("ID delete:"+l);
 String recid=id.substring(4,l);
 //System.out.println("rec ID delete:"+recid);
	 response.sendRedirect("backupScheduleBack.jsp?Nno=" +empid);
%>