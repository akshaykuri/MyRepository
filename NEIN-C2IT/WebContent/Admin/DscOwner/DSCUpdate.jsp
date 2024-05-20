<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");

//int num=Integer.parseInt(ide);
String cin_no=request.getParameter("cin_no");
String emp_code=request.getParameter("emp_code");
String owner_name = request.getParameter("owner_name");
String branch = request.getParameter("branch");
String department = request.getParameter("department");
String scopeWork = request.getParameter("scopeWork");
String Designation = request.getParameter("Designation");
String Rofficer = request.getParameter("Rofficer");
String createdBy = request.getParameter("sessionName");
//String status = request.getParameter("status"); 
Connection conn=null;
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
    conn = DriverManager.getConnection(url+dbName,userName,password); 
	 st=null;
	st=conn.createStatement();
	st.executeUpdate("update  dsc_owner_master set cin_no='"+cin_no+"',emp_code='"+emp_code+"',owner_name='"+owner_name+"',branch='"+branch+"',department='"+department+"',scopeWork='"+scopeWork+"',rofficer='"+Rofficer+"',createdBy='"+createdBy+"',Designation='"+Designation+"' where id='"+num+"'");
	response.sendRedirect("DisplayDSC.jsp");
} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);

			}
%>

