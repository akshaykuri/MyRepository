<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%String empid=request.getParameter("EMP_NO"); 
String buffer="<div id='resultFromAjax2' style='display:none;'>";  
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
Connection conn=null;
Statement stmt=null;
ResultSet rs =null;
try{ 
	Class.forName(driverl).newInstance();
    conn = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
    stmt = conn.createStatement(); 
 stmt = conn.createStatement();  
//ResultSet rs = stmt.executeQuery("Select * from emp where DESIGNATION='"+no+"' ");  
 //rs = stmt.executeQuery("SELECT DISTINCT EMP_NAME FROM emp INNER JOIN assigned_master a ON(emp.EMP_NAME=a.Locname) WHERE Locpost='"+no+"' ORDER BY EMP_NAME");
 //rs = stmt.executeQuery("SELECT DISTINCT Nname FROM nentryho WHERE Npost='"+no+"' ORDER BY Nname ASC");
// rs = stmt.executeQuery("SELECT DISTINCT Locname FROM assigned_master WHERE assignedLocation='"+no+"' ORDER BY Locname ASC");
// shows all system admins accept the persons are in leave of any type.
 rs = stmt.executeQuery("SELECT DISTINCT u.user_name,rr.role_code,b.branch_name, d.department_name, m3.user_name AS manager_name,u.email,u.mobile_number,u.emp_id FROM user u Inner Join user_role ur on ur.user_id=u.user_id INNER JOIN reporting_officers m1 ON m1.user_id = u.user_id INNER JOIN role rr ON ur.role_id =rr.role_id INNER JOIN branchmaster b ON b.branch_id = u.branch_id INNER JOIN department d ON d.department_id = u.department_id INNER JOIN user m3 ON m3.user_id = m1.manager_id INNER JOIN user m4 ON m4.user_id = m1.manager2_id WHERE ( m1.emp_id ='" + empid + "' ) AND u.employee_status = 'yes' ");

	 while(rs.next())
     { 
      buffer = buffer + "<input type='text' id='p1' value='"+rs.getString(1)+"'>";
      buffer = buffer + "<input type='text' id='p2' value='"+rs.getString(2)+"'>";
      buffer = buffer + "<input type='text' id='p3' value='"+rs.getString(3)+"'>";
      buffer = buffer + "<input type='text' id='p4' value='"+rs.getString(4)+"'>";
      buffer = buffer + "<input type='text' id='p5' value='"+rs.getString(5)+"'>";
      buffer = buffer + "<input type='text' id='p6' value='"+rs.getString(6)+"'>";
      buffer = buffer + "<input type='text' id='p7' value='"+rs.getString(7)+"'>";
      buffer = buffer + "<input type='text' id='p8' value='"+rs.getString(8)+"'>";
     }
	 buffer=buffer+"</div>";
response.getWriter().println(buffer); 

} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,conn);

			} %>