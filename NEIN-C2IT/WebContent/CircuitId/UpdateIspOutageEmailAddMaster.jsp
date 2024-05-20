<%@page import="java.sql.*"%>
<%@ page import="CON2.Connection2" %>
<%
	String id=request.getParameter("id");
	String empName=request.getParameter("empName");
	String empEmail=request.getParameter("empEmail");
	
	Connection con = null; 
	Connection2 dbConn = new Connection2();
	con = dbConn.getConnection2();
	int i=0;
	try
	{
		 
				Statement st=null,st1=null;
				ResultSet rs=null,rs1=null;
				String msg=null;
		
		 
			     st1=con.createStatement();
				 i=st1.executeUpdate("update ispoutageemailadd_master set empName='"+empName+"',empEmail='"+empEmail+"' where id='"+id+"'");
				if(i != 0){	
					  msg = "GROUP__Details__Updated__SUCCESSFULLY";
				}
				else{
					msg = " GROUP__Details__ALLREADY__EXIT ";
				}
			   response.sendRedirect("DisplayISPOutageEmailAddMaster.jsp?msg="+msg);
	}
	catch(Exception e)
	{
		System.out.println(e);
	}%>

