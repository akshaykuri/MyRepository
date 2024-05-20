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
	 int i=st.executeUpdate("delete from linktype_master where link_id="+id+"");           
	 response.sendRedirect("DisplayLinkTypeMaster.jsp");
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>