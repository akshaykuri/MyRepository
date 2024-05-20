<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 Connection con=null;
 Statement st=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");   
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", ""); 
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from about_master where id="+id+"");           
	 response.sendRedirect("DisplayFeedback.jsp");}catch (Exception e){System.out.println(e);
 }finally{
		DbUtil.closeDBResources(null,st,con);

	}
 %>