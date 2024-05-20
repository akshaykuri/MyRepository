<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ResourceBundle" %>
 <%
 int id = Integer.parseInt(request.getParameter("id"));
String AssetNo = request.getParameter("id1");
// System.out.println("asset numberrrrr-----"+AssetNo);
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
	 int i=st.executeUpdate("update hardware_details set status='Inactive' where hw_id="+id+"");
	 int j=st.executeUpdate("update hardware_amc_invoice set status='Inactive' where hw_id="+id+"");
	 int k=st.executeUpdate("update hardware_details_multiple set status='Inactive' where hw_id="+id+"");
	
	 response.sendRedirect("HardwareDetailsDisplay.jsp?assetno=" +AssetNo);
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>