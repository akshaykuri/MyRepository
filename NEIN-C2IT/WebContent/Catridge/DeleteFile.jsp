<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@page import="CON2.Connection2"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String catridge_id = request.getParameter("catridge_id");
 int id = Integer.parseInt(request.getParameter("id"));
 
 try
 {      Connection con = null;
	    Connection2 dbConn = new Connection2();
	    con = dbConn.getConnection2();
	    Statement st=null;
	    ResultSet rs=null;     
	       
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from catridge_invoicefiles where id="+id+"");           
	 response.sendRedirect("EditCatridgeDetails.jsp?catridge_id="+catridge_id);
 %>
 
 <%} catch (SQLException ex) {
    ex.printStackTrace();
}	

finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>