<%@page import="CON2.DbUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
Object city=null;
city = session.getAttribute("NpostingCo"); 
%>
<%String EMP_NO=request.getParameter("count");

System.out.println("EMP_NO --- :  "+EMP_NO);
String buffer="<select name='r_officer' onchange=\"Mail(this.value)\" ><option value='-1'>Select</option>"; 
Connection con=null;
Statement stmt=null;
ResultSet rs =null;
ResourceBundle dbPropertiesl = ResourceBundle.getBundle("leavemanagement");
String userNamel = dbPropertiesl.getString("leavemanagement.username");
String passwordl = dbPropertiesl.getString("leavemanagement.password");
String urll = dbPropertiesl.getString("leavemanagement.url");
String driverl = dbPropertiesl.getString("leavemanagement.driverName");
String dbNamel = dbPropertiesl.getString("leavemanagement.dbName");
try{ Class.forName(driverl).newInstance();
con = DriverManager.getConnection(urll+dbNamel,userNamel,passwordl); 
 stmt = con.createStatement();  
 rs = stmt.executeQuery("SELECT  e.EMP_NAME,m2.manager2_id, u2.user_name AS manager2_name FROM user u, reporting_officers m2, user u2 JOIN csdb.emp e ON (u2.emp_id = e.EMP_NO) "+
		 "WHERE m2.manager2_id = u2.user_id AND u.user_id = m2.user_id AND u.emp_id = '"+EMP_NO+"' "+
		 "UNION "+
		 "SELECT e.EMP_NAME,m.manager_id, u1.user_name AS manager_name FROM user u, reporting_officers m, user u1 JOIN csdb.emp e ON (u1.emp_id = e.EMP_NO) "+
		 "WHERE m.manager_id = u1.user_id AND u.user_id = m.user_id AND u.emp_id = '"+EMP_NO+"' ");    
//ResultSet rs = stmt.executeQuery("Select DISTINCT e.EMP_NAME from emp where l.post=e.DESIGNATION AND e.DESIGNATION='"+no+"' AND l.city ='"+city2+"' ORDER BY e.EMP_NAME ASC");
//ResultSet rs = stmt.executeQuery("Select DISTINCT EMP_NAME from emp where DESIGNATION='"+no+"' AND e_city ='"+city2+"' ORDER BY EMP_NAME ASC");

while(rs.next()){  
	buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>"; 
	System.out.println("MANAGER we are getting ::: "+rs.getString(1));
	}   
buffer=buffer+"</select>";   
response.getWriter().println(buffer); 


} catch (SQLException ex) {
    ex.printStackTrace();
}	


finally{
			DbUtil.closeDBResources(rs,stmt,con);

			} %>