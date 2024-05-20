<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
session.setMaxInactiveInterval(20*60);
if(session==null||session.getAttribute("Nname")==null||session.getAttribute("Nname")=="null"||session.getAttribute("desg")==null||session.getAttribute("desg")=="null"||session.getAttribute("city")==null||session.getAttribute("admin")==null||session.getAttribute("b_no")==null||session.getAttribute("b_no")=="null")
	//(Sessionb_no.equals("90") && Sessiondesg.equals("IT MANAGER"))	
{	
	String msg=null;
	msg="Session__Time__Out \\n __ __ Login__Again";
	response.sendRedirect("adminlink.jsp?msg="+msg);
	//response.sendRedirect("adminlink.jsp?msg=1");
}
System.out.println("NAME FROM SUPER ADMIN SESSION  : "+session.getAttribute("Nname"));
%>

</html>