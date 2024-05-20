<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ResourceBundle" %>

 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 
 System.out.println("delete id-----"+id);
 
 Connection con =null;
 
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
 String userName = dbProperties.getString("csdb.username");
 String password = dbProperties.getString("csdb.password");
 String url = dbProperties.getString("csdb.url");
 String driver = dbProperties.getString("csdb.driverName");
 String dbName = dbProperties.getString("csdb.dbName");
 
 Statement st=null;
 try
 {          
	 Class.forName(driver).newInstance();
	 con= DriverManager.getConnection(url+dbName,userName,password);         
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from vc_branchmaster where id="+id+"");           
	 response.sendRedirect("DisplayvcBranchMaster.jsp");
 %><%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>