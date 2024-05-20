<%@page import="CON2.DbUtil"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ResourceBundle"%>
 <%
 ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
	String userName = dbProperties.getString("csdb.username");
	String password = dbProperties.getString("csdb.password");
	String url = dbProperties.getString("csdb.url");
	String driver = dbProperties.getString("csdb.driverName");
	String dbName = dbProperties.getString("csdb.dbName");
 //int id = Integer.parseInt(request.getParameter("id"));
 String id = request.getParameter("id");
 String msg=null;
 Connection con=null;
 Statement st=null;
 try
 {          
	 Class.forName(driver).newInstance();
     con = DriverManager.getConnection(url+dbName,userName,password); 
   st=con.createStatement();           
	 int i=st.executeUpdate("delete from ho_finance_account_master where id="+id+"");         
	 msg="FORM__USER__Details__is__deleted__successfully__From__NEWINS__APPROVER__Master";
	 response.sendRedirect("DisplayUserNewinsAccounts.jsp?msg="+msg);} catch (SQLException ex) {
		    ex.printStackTrace();
	 }	


	 finally{
	 			DbUtil.closeDBResources(null,st,con);

	 			}
 %>