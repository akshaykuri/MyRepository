<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@page import="CON2.Connection2"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 /* Class.forName("com.mysql.jdbc.Driver");           
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");    
 Connection con =null;
 Statement st=null; */
 try
 {      Connection con = null;
	    Connection2 dbConn = new Connection2();
	    con = dbConn.getConnection2();
	    Statement st=null;
	    ResultSet rs=null;     
	        
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from catridge_master where catridge_id="+id+"");           
	 response.sendRedirect("DisplayCatridgeMaster.jsp");
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	

finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>