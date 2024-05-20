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
String NpostingCo=request.getParameter("NpostingCo");
String Nmail=request.getParameter("Nmail");
String extraDesig = request.getParameter("extraDesig");
String reportingOff = request.getParameter("reportingOff");
Connection conn=null;
Statement st=null,st2=null;
try
{
	

	Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url+dbName,userName,password); 
	
	st=conn.createStatement();
	st2=conn.createStatement();
	st.executeUpdate("update nentryho set idd='"+idb+"',Nname='"+Nnameb+"',Npwd='"+Npwdb+"',Naddr='"+Naddrb+"',Ncontact='"+Ncontactb+"',Npost='"+Npostb+"',NpostingCo='"+NpostingCo+"',Nmail='"+Nmail+"',EMP_NO='"+emp_no+"',extraDesig='"+extraDesig+"',reportingOff='"+reportingOff+"' where id='"+num+"'");
	st2.executeUpdate("update emp set EMP_NAME='"+Nnameb+"',DESIGNATION='"+Npostb+"',MAIL_ID='"+Nmail+"',e_city='"+NpostingCo+"' where EMP_NAME='"+Nnameb+"'");
	
	//st2.executeUpdate("update emp set MAIL_ID='"+Nmail+"' where EMP_NAME='"+Nnameb+"'");
	
	response.sendRedirect("DisplayDelHo.jsp?msg=1");

%>
<%} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(null,st,conn);
			DbUtil.closeDBResources(null,st2,null);
			
			} %>
