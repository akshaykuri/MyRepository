<%@page import="java.sql.*"%>
<%
		System.out.println("-------------  Access Bio Update -----------------");
		String id1=request.getParameter("aid");
		String num=request.getParameter("assetname");
		int i=0;
		try
		{
			Connection conn = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");
			Statement st=null,st1=null;
			ResultSet rs=null;
			st1=conn.createStatement();
			i=st1.executeUpdate("update accessbiotype set type='"+num+"' where id='"+id1+"'");
			response.sendRedirect("DisplayAccesBioType.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
%>

