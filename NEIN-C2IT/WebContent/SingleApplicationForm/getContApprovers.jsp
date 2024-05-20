<%@ page import="java.sql.*,java.util.ResourceBundle"%>
<%
Connection cn5 = null;
ResourceBundle dbProperties = ResourceBundle.getBundle("leavemanagement");
String userName = dbProperties.getString("leavemanagement.username");
String password = dbProperties.getString("leavemanagement.password");
String url = dbProperties.getString("leavemanagement.url");
String driver = dbProperties.getString("leavemanagement.driverName");
String dbName = dbProperties.getString("leavemanagement.dbName");
Class.forName(driver).newInstance();
cn5 = DriverManager.getConnection(url+dbName,userName,password);
Statement stcsdb = cn5.createStatement();
String s=request.getParameter("depid");
String s1=request.getParameter("brn");
try{
ResultSet rscsdb = stcsdb.executeQuery("SELECT DISTINCT concat_ws(',',role_code,u.full_name,email,emp_id,'0') as full,concat(concat_ws(' ( ',u.full_name,email),' )') as half FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id where u.employee_status='yes' and u.department_id='"+s+"' and u.branch_id='"+s1+"'");
while(rscsdb.next()){
out.println(rscsdb.getString("full")+"|"+rscsdb.getString("half")+"$");
}
}catch(Exception e){
System.out.println(e);
}finally{
cn5.close();
}
%>