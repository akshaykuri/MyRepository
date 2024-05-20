<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String name=request.getParameter("name");
Connection conn=null;
Statement st=null;

try
{
	

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");

	st=conn.createStatement();
	st.executeUpdate("update about_master set name='"+name+"' where id='"+num+"'");
	response.sendRedirect("DisplayFeedback.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
finally{
			DbUtil.closeDBResources(null,st,conn);

			}
%>

