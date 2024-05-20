<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String msg=null;
 //System.out.println("iddddd   assign  "+id);
 Connection con=null;
 Statement st=null;
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
	
 try
 {          
	 Class.forName(driver).newInstance();
     con = DriverManager.getConnection(url+dbName,userName,password);        
	 st=con.createStatement();           
	 int i=st.executeUpdate("delete from neinnewinsblocked where b_id="+id+"");           
	// response.sendRedirect("DisplayAssignedLocation.jsp");
	 msg = "Assigned__Programs__Deleted__Successfully";
		//response.sendRedirect("NewinsAdmin.jsp?msg=" +msg);
	 response.sendRedirect("PopUpPage.jsp?form_no=" +msg);
 
 }		catch (Exception e) {
		 System.out.println(e);
	}
	finally{
		DbUtil.closeDBResources(null,st,con);

		}	
 %>