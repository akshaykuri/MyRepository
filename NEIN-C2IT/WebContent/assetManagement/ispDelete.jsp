<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 Connection con =null;
 Statement st=null;
 try
 {          
	 Class.forName("com.mysql.jdbc.Driver");           
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from isp_provider where id="+id+"");           
	 response.sendRedirect("DisplayISP.jsp");
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>