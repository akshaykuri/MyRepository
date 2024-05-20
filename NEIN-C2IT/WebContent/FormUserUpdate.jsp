<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
String num=request.getParameter("id");
ResourceBundle dbProperties = ResourceBundle.getBundle("csdb");
String userName = dbProperties.getString("csdb.username");
String password = dbProperties.getString("csdb.password");
String url = dbProperties.getString("csdb.url");
String driver = dbProperties.getString("csdb.driverName");
String dbName = dbProperties.getString("csdb.dbName");
//int num=Integer.parseInt(ide);
String idb=request.getParameter("idd");
String Nnameb=request.getParameter("Nname");
String Npwdb=request.getParameter("Npwd");
String emp_no=request.getParameter("emp_no");
String Naddrb=request.getParameter("Naddr");
String Ncontactb=request.getParameter("Ncontact");
String Npostb=request.getParameter("Npost");
String DESG_NO = request.getParameter("DESG_NO");
String NpostingCo=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");
String DEPT_NAME = request.getParameter("DEPT_NAME");
String subDept = request.getParameter("subDept");
Connection conn = null;
Statement st=null,st2=null;
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 

	st=conn.createStatement();
	st2=conn.createStatement();
	st.executeUpdate("update formUser_master set idd='"+idb+"',Nname='"+Nnameb+"',Npwd='"+Npwdb+"',Naddr='"+Naddrb+"',Ncontact='"+Ncontactb+"',Npost='"+Npostb+"',DESG_NO='"+DESG_NO+"',NpostingCo='"+NpostingCo+"',Nmail='"+Nmail+"',deptName='"+DEPT_NAME+"',subDept='"+subDept+"',EMP_NO='"+emp_no+"' where id='"+num+"'");
	st2.executeUpdate("update emp set EMP_NAME='"+Nnameb+"',DESIGNATION='"+Npostb+"',DESG_NO='"+DESG_NO+"',MAIL_ID='"+Nmail+"',e_city='"+NpostingCo+"',EMP_NO='"+emp_no+"' where EMP_NAME='"+Nnameb+"'");
	
	//st2.executeUpdate("update emp set MAIL_ID='"+Nmail+"' where EMP_NAME='"+Nnameb+"'");
	
	response.sendRedirect("DisplayFormUser.jsp?msg=1");

} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
	DbUtil.closeDBResources(null,st,conn);
	DbUtil.closeDBResources(null,st2,null);

			}%>

