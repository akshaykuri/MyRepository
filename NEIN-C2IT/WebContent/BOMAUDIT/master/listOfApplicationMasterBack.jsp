<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Connection cn = null;
Statement st = null,st2=null;
ResultSet rs = null,rs2=null;
try{
	cn = con.getConnection2();
	st=cn.createStatement();
	st2=cn.createStatement();
	String app_name	=	request.getParameter("app_name");
	String app_desc	=	request.getParameter("app_desc");
	String empNo	=	(String) session.getAttribute("EmpNo");

	String msg = null;
	PreparedStatement psmt1=null;
	rs = st2.executeQuery("select app_name from listOfApplications where app_name='"+app_name+"'");
	if(rs.next()){
		msg = app_name+"'__ALREADY__EXISTS";
	}else{
		psmt1 = cn.prepareStatement("insert into listOfApplications(app_name,app_desc,addedBy,addedOn) values(?,?,?,current_timestamp())");
		psmt1.setString(1,app_name);
		psmt1.setString(2,app_desc);
		psmt1.setString(3,empNo);
		int i = psmt1.executeUpdate();
		msg = "SAVED__SUCCESSFULLY";
	}
	response.sendRedirect("listOfApplicationMaster.jsp?msg=" +msg);
}catch(SQLException ex){
    ex.printStackTrace();
}finally{
	DbUtil.closeDBResources(rs,st,cn);
	DbUtil.closeDBResources(rs2,st2,null);
}%>