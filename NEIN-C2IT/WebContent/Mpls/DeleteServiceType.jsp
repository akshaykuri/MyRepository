<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@page import="CON2.Connection2" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 Connection con =null;
 Connection2 dbConn = new Connection2();
 con = dbConn.getConnection2(); 
 Statement st=null;
 try
 {          
	           
	  st=con.createStatement();           
	  int i=st.executeUpdate("delete from servicetype_master where id="+id+"");           
	  response.sendRedirect("DisplayServiceType.jsp");
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>