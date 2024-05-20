<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String msg=null;
 Connection con =null;
 Statement st=null;
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
 //System.out.println("iddddd   assign  "+id);
 try
 {          
	 Class.forName(driver).newInstance();
     con = DriverManager.getConnection(url+dbName,userName,password); 
	  st=con.createStatement();           
	 int i=st.executeUpdate("delete from handling_master where id="+id+"");           
	// response.sendRedirect("DisplayAssignedLocation.jsp");
	 msg = "SUB__LOCATION__DELETED__SUCCESSFULLY ";
		response.sendRedirect("createadmin.jsp?msg=" +msg);
 
		} catch (SQLException ex) {
		    ex.printStackTrace();
		}	


		finally{
					DbUtil.closeDBResources(null,st,con);

					}
 %>