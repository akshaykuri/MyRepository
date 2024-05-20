<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ResourceBundle" %>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String id1= request.getParameter("id1");
 Connection con =null;
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
 String userName = dbProperties.getString("csdb.username");
 String password = dbProperties.getString("csdb.password");
 String url = dbProperties.getString("csdb.url");
 String driver = dbProperties.getString("csdb.driverName");
 String dbName = dbProperties.getString("csdb.dbName");
 Statement st=null,st1=null,st2=null;
 try
 {          
	 Class.forName(driver).newInstance();
	 con= DriverManager.getConnection(url+dbName,userName,password);       
	  st=con.createStatement();           
	 int i=st.executeUpdate("update software_details set status='Inactive' where license_no='"+id1+"'");
	 // st1=con.createStatement(); 
	 int j=st.executeUpdate("update software_details_multiple set status='Inactive' where license_no='"+id1+"'");
	// st2=con.createStatement(); 
	 int k=st.executeUpdate("update software_amc_invoice set status='Inactive' where license_no='"+id1+"'"); 
	 response.sendRedirect("SoftwareDetailsDisplay.jsp?licenseno="+id1);
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>