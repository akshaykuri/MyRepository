<%-- <%@page import="CON2.DbUtil"%> --%>
<%@ page import="java.sql.*" %>
<%@page import="CON2.Connection2"%>
 <%
 int id = Integer.parseInt(request.getParameter("id"));
 
 try
 {      Connection con = null;
	    Connection2 dbConn = new Connection2();
	    con = dbConn.getConnection2();
	    Statement st=null;
	    ResultSet rs=null;     
	        
	    st=con.createStatement();           
	    int i=st.executeUpdate("delete from consumptionreportmaster where id="+id+"");           
	    response.sendRedirect("DisplayConsumptionReportMaster.jsp");
   } catch (SQLException ex) {
    ex.printStackTrace();
}	

finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>