<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String msg=null;
 System.out.println("iddddd   assign  "+id);
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
 try
 {          
	 //Class.forName("com.mysql.jdbc.Driver"); 
	 Class.forName(driver).newInstance();
	 Connection con = DriverManager.getConnection(url+dbName,userName,password); 
    
	//  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csdb", "root", "");          
	 Statement st=con.createStatement();           
	 int i=st.executeUpdate("delete from assigned_master where id="+id+"");           
	// response.sendRedirect("DisplayAssignedLocation.jsp");
	 msg = "DELETED Successfully ";
		response.sendRedirect("createBOMuser.jsp?msg=" +msg);
 
 }catch (Exception e){System.out.println(e);
 }
 %>