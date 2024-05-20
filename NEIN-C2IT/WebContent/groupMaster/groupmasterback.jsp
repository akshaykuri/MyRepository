<%@page import="CON2.DbUtil"%>
<%@page language="java"%> 
<%@page import = "java.sql.*" %> 
<%@page import="CON2.Connection2" %> 
<jsp:useBean id = "con" class="CON2.Connection2" /> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
Connection cn = null; 
Statement st = null,st2=null; 
ResultSet rs = null,rs2=null; 
try{
   cn = con.getConnection2();
   st=cn.createStatement();
   st2=cn.createStatement();
   String gname=request.getParameter("groupname");
   String msg = null;
   rs = st2.executeQuery("select groupName from groupmaster where groupName='"+gname+"'");
   if(rs.next())
      {
  	  //out.println(".........'"+gname+"' IS ALREADY EXIST.......");
	  msg = "GROUP__ALREADY EXIST.......";
      }
  else
      {
      int i=st.executeUpdate("insert into groupmaster(groupName) values('"+gname+"')");
      //out.println("................................\n '"+gname+"' INFORMATION   IS   INSERTED   SUCCESSFULLY.......................");
      msg = "SAVED__SUCCESSFULLY.....";
      }
      response.sendRedirect("groupmaster.jsp?msg=" +msg);
%>
<%

} catch (SQLException ex) {
    // Exception handling stuff
        ex.printStackTrace();
} finally {
	//DbUtil.closeDBResources(rs9,st9,cn9);
	DbUtil.closeDBResources(rs2,st,cn );
	DbUtil.closeDBResources(rs,st2,null);
	
}
%>


