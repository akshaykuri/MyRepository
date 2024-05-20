<%-- <%@page import="CON1.DbUtil"%> --%>
<%@page import="java.sql.*"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String name=request.getParameter("name");
String itnonit=request.getParameter("itnonit");
String branch=request.getParameter("branch");
Connection conn=null;
Statement st=null;
ResultSet rs=null;
PreparedStatement psmt=null;
try
{
	

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");

	st=conn.createStatement();
	//st.executeUpdate("update tax_master set name='"+name+"',no='"+no+"' where id='"+num+"'");
	
	psmt = conn.prepareStatement("UPDATE mrlevelmaster SET levelname=?,itnonit=?,branch=? WHERE levelno=?");
	psmt.setString(1,name);
	psmt.setString(2,itnonit);
	psmt.setString(3,branch);
	psmt.setString(4,num);
    int i = psmt.executeUpdate();	
	response.sendRedirect("levelDisp.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}finally{
/* 	DbUtil.closeDBResources(rs,st,conn);
	DbUtil.closeDBResources(null,psmt,null); */

			}
%>

