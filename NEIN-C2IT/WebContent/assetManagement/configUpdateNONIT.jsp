<%@page import="java.sql.*"%>
<%
String id1=request.getParameter("aid");
String num=request.getParameter("assetname");
//int num=Integer.parseInt(ide);
String conf=request.getParameter("config");
//String bkLocation=request.getParameter("bkLocation");
String confd = request.getParameter("configdig");
int i=0;
try
{
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb","root", "");
	Statement st=null,st1=null;
	ResultSet rs=null;
	/* String query = "select id from asset_type where item_name='"+num+"'";
	st = conn.createStatement();
	rs = st.executeQuery(query);
	while(rs.next())
	     {
	 	 id= rs.getString(1);
	     }
	System.out.println(id);
 */	
 st1=conn.createStatement();
	 i=st1.executeUpdate("update assetconfgfield set assettype='"+num+"',configname='"+conf+"',configdisc='"+confd+"' where id='"+id1+"'");
	 response.sendRedirect("DisplayConfig.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}%>

