<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ResourceBundle" %>
 <%
 
 //System.out.println("in delete page");
 String id = request.getParameter("f");
 String id1 = request.getParameter("g");
// int id = Integer.parseInt(request.getParameter("id"));
 //int id1 = Integer.parseInt(request.getParameter("id1"));
 //String id1 = request.getParameter("id1");
 //System.out.println("in delete page-----"+id);
 System.out.println("in delete page--f---"+id);
 System.out.println("in delete page--g---"+id1);
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
	/*  int i=st.executeUpdate("delete from  software_details where sw_id="+id+"");
	 st1=con.createStatement(); 
	 int j=st.executeUpdate("delete from software_details_multiple where sw_id="+id+"");
	 st2=con.createStatement(); */ 
	 int k=st.executeUpdate("delete from hardware_amc_invoice where hwc_id="+id+"");
	 response.sendRedirect("HardwareDetailsEdit.jsp?id="+id1);
	 %><%} catch (SQLException ex) {
		    ex.printStackTrace();
		}	


finally{
			//DbUtil.closeDBResources(null,st,con);

			}%>