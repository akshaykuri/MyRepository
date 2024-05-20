<%@page import="java.sql.*"%>
<%@ page import="CON2.Connection2" %>
<%
	String id=request.getParameter("id");
	String groupName=request.getParameter("groupName");
	
	Connection con = null; 
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();
	int i=0;
	try
	{
		 
		Statement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		String msg=null;
		
		String query1 = "select groupName from ispoutageemailgroup_master where groupName='"+groupName+"'";
		st1 = con.createStatement();
			rs1 = st1.executeQuery(query1);
			if(!rs1.next())
			     { 
			     st1=con.createStatement();
				 i=st1.executeUpdate("update ispoutageemailgroup_master set groupName='"+groupName+"' where id='"+id+"'");
				 msg = "GROUP__NAME__Updated__SUCCESSFULLY";
			     }
			else{
				msg = " GROUP__NAME__ALLREADY__EXIT ";
			}
			response.sendRedirect("DispalyOutageEmailGroup.jsp?msg=" +msg);
	}
	catch(Exception e)
	{
		System.out.println(e);
	}%>

