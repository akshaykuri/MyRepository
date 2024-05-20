<%@page import="java.sql.*"%>
<%@page import="CON2.Connection2"%>
<%
String cid=request.getParameter("cid");
String Catridge=request.getParameter("Catridge");
String printername=request.getParameter("printername");
String Cost=request.getParameter("Cost");

int i=0;
try
{
	/* Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", ""); */
	Connection conn = null;
	Connection2 dbConn = new Connection2();
	conn = dbConn.getConnection2();
	Statement st=null;
	ResultSet rs=null; 
		
     st=conn.createStatement();
	 i=st.executeUpdate("UPDATE `catridge_master` SET `catridge_model`='"+Catridge+"',`cost`='"+Cost+"',`printer_name`='"+printername+"' WHERE catridge_id='"+cid+"'");
	 response.sendRedirect("DisplayCatridgeMaster.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

